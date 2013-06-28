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
    String nome_chave = request.getParameter("NomeParaEditar");
    String nome_alterar = request.getParameter("Nome");
    String endereco_alterar = request.getParameter("Endereco");
    String telefone_alterar = request.getParameter("Telefone");
    String email_alterar = request.getParameter("E_mail");

    String nome_atual = null;
    String endereco_atual = null;
    String telefone_atual = null;
    String email_atual = null;

    if (esta_logado && web_metodo == "POST" && nome_alterar != null && endereco_alterar != null && telefone_alterar != null && email_alterar != null) {
        
        try {
            nome_alterar = java.net.URLDecoder.decode(nome_alterar,"utf-8");
            endereco_alterar = java.net.URLDecoder.decode(endereco_alterar,"utf-8");
            telefone_alterar = java.net.URLDecoder.decode(telefone_alterar,"utf-8");
            email_alterar = java.net.URLDecoder.decode(email_alterar,"utf-8");
        
            try {
                Integer telefone_numero = Integer.parseInt(telefone_alterar);
            }
            catch(Exception e) {
                throw new Exception("O telefone deve ser um número");
            }

            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Trabalho", "administrador", "administrador");
            
            Statement stm = conn.createStatement();
            stm.execute("UPDATE APP.AGENDA SET NOME = '" + nome_alterar + "', TELEFONE = " + telefone_alterar + ", ENDERECO = '" + endereco_alterar + "', E_MAIL = '" + email_alterar + "' WHERE NOME = '" + nome_chave + "'");
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
    if (nome_chave != null) {
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Trabalho", "administrador", "administrador");
            
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM APP.AGENDA WHERE NOME = '" + nome_chave + "'");
            
            if (rs.next()) {
                nome_atual = rs.getString("NOME");
                telefone_atual = rs.getString("TELEFONE");
                endereco_atual = rs.getString("ENDERECO");
                email_atual = rs.getString("E_MAIL");
            }
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
    }
    if (!esta_logado){
        // Usuário não está logado
        response.sendRedirect("Inicio.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Contato</title>
        <style type="text/css">
            body {background-image: url("fundo.png"); }
        </style>
    </head>
    <body>
        <a href="Inicio.jsp">Voltar ao Início</a>
        <hr>
        <form name="Editar_Contato" action="Editar.jsp" method="POST">
            <h1>Por Favor, informe os dados que deseja alterar no contato </h1>
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
            <input type="hidden" name="NomeParaEditar" value="<%=nome_chave%>"/>
            <input type="text" name="Nome" value="<%=nome_atual%>" size="50" />
            <br>
            Endereço do Contato: 
            <br>
            <input type="text" name="Endereco" value="<%=endereco_atual%>" size="50" />
            <br>
            Telefone do Contato: 
            <br>
            <input type="text" name="Telefone" value="<%=telefone_atual%>" size="50" />
            <br>
            E-mail do Contato: 
            <br>
            <input type="text" name="E_mail" value="<%=email_atual%>" size="50" />
            <br>
            <input type="submit" value="Editar Contato" name="Excluir " />
        </form>
    </body>
</html>

