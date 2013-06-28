<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%
    // Por padrão o usuário não está logado
    Boolean esta_logado = false;

    // Verificando se existe informação de login na sessão
    String session_usuario_logado = (String) session.getAttribute("usuario_logado");
    Long session_data_hora_login = (Long) session.getAttribute("data_hora_login");
    Boolean session_login_ativo = (Boolean) session.getAttribute("login_ativo");

    if (session_usuario_logado != null && session_data_hora_login != null && session_login_ativo == true)
        esta_logado = true;
%>
<%
    String mensagem_erro = null;
    
    String web_metodo = request.getMethod();
    String nome_incluir = request.getParameter("Nome");
    String endereco_incluir = request.getParameter("Endereco");
    String telefone_incluir = request.getParameter("Telefone");
    String email_incluir = request.getParameter("E_mail");

    if (esta_logado && web_metodo == "POST" && nome_incluir != null && endereco_incluir != null && telefone_incluir != null && email_incluir != null) {
        
        try {
            nome_incluir = java.net.URLDecoder.decode(nome_incluir,"utf-8");
            endereco_incluir = java.net.URLDecoder.decode(endereco_incluir,"utf-8");
            telefone_incluir = java.net.URLDecoder.decode(telefone_incluir,"utf-8");
            email_incluir = java.net.URLDecoder.decode(email_incluir,"utf-8");
        
            try {
                Integer telefone_numero = Integer.parseInt(telefone_incluir);
            }
            catch(Exception e) {
                throw new Exception("O telefone deve ser um número");
            }

            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Trabalho", "administrador", "administrador");
            
            Statement stm = conn.createStatement();
            stm.execute("INSERT INTO APP.AGENDA(NOME,TELEFONE,ENDERECO,E_MAIL) VALUES('" + nome_incluir + "'," + telefone_incluir + ",'" + endereco_incluir + "','" + email_incluir + "')");
            response.sendRedirect("Inicio.jsp");
        }
        catch(ClassNotFoundException e) {
            mensagem_erro = "Erro de driver: " + e.getMessage();
        }
        catch(SQLException e) {
            mensagem_erro = "Erro de banco de dados: " + e.getMessage();
        }
        catch(Exception e) {
            mensagem_erro = "Erro desconhecido: " + e.getMessage();
        }
    }else
    if (!esta_logado){
        // Usuário não está logado
        response.sendRedirect("Inicio.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Contato</title>
        <style type="text/css">
            body {background-image: url("fundo.png"); }
        </style>
    </head>
    <body>
        <a href="Inicio.jsp">Voltar ao Início</a>
        <hr>
        <form name="Incluir_Contato" action="Incluir.jsp" method="POST">
            <h1>Por Favor, informe os dados do contato que deseja incluir</h1>
            <br><br>
            <%
            if(mensagem_erro != null) {
            %>
            <span style="border:solid 1px #fff; background:red;font-size:14pt;color:#fff;padding:10px;margin:5px;"><%=mensagem_erro%></span>
            <br><br>
            <%
            }
            %>
            Nome do Contato: 
            <br>
            <input type="text" name="Nome" value="" size="50" />
            <br>
            Endereço do Contato: 
            <br>
            <input type="text" name="Endereco" value="" size="50" />
            <br>
            Telefone do Contato: 
            <br>
            <input type="text" name="Telefone" value="" size="50" />
            <br>
            E-mail do Contato: 
            <br>
            <input type="text" name="E_mail" value="" size="50" />
            <br>
            <input type="submit" value="Incluir Contato" name="Incluir " />
        </form>
    </body>
</html>
