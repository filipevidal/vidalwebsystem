<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
    <head>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <style type="text/css">
            body {background-image: url("fundo.png"); }
        </style>
        <script type="text/javascript">
            
            function ConfirmaExcluir(nome) {
                if (confirm("Tem certeza de que deseja excluir esse registro?")) {
                    window.location = "Excluir.jsp?NomeParaExcluir=" + nome;
                }
            }
        </script>
    </head>
    <body>
        <br><br>
        <center>
            <br><br>
        <%
        // Só apresenta o conteúdo abaixo se o usuário estiver
        // logado no sistema
        if(esta_logado)
        {    
        %>
        <form name="Inicio" action="Inicio.jsp" method="POST">
            <h1>Bem vindo à sua Agenda Digital</h1>
            <p>Você está logado como <b><%=session_usuario_logado%></b> (<a href="Logout.jsp">SAIR</a>)</p>
            <h2>Lista de Contatos</h2>
            <br>
            <table border="1" width="800" cellspacing="10" cellpadding="2">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Endereço</th>
                        <th>Telefone</th>
                        <th>E-mail</th>
                        <th colspan="2">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    String mensagem_erro = null;
                    
                    try {
                        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Trabalho", "administrador", "administrador");

                        Statement stm = conn.createStatement();

                        ResultSet rs = stm.executeQuery("select * from APP.AGENDA order by NOME");

                        while (rs.next()) {
                            String nome = rs.getString("NOME");
                            String endereco = rs.getString("ENDERECO");
                            String telefone = rs.getString("TELEFONE");
                            String email = rs.getString("E_MAIL");
                            String nome_url = java.net.URLEncoder.encode(nome,"utf-8");
                    %>
                    <tr>
                        <td><%=nome%></td>
                        <td><%=endereco%></td>
                        <td><%=telefone%></td>
                        <td><%=email%></td>
                        <td><a href="Editar.jsp?NomeParaEditar=<%=nome_url%>">Editar</a></td>
                        <td><a href="javascript:ConfirmaExcluir('<%=nome_url%>');">Excluir</a></td>
                    </tr>
                    <%
                        }
                        // Fim dos registros
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
                    
                    if (mensagem_erro != null) {
                    %>
                    <tr>
                        <td colspan="6" style="background-color:red; color:black; font-weight: bold;text-align: center;font-size:14pt;"><%=mensagem_erro%></td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
                <center><a href='Incluir.jsp'>Incluir Novo contato</a></center>
            <br>
            
        </form>
        <%
        // Se o usuário não estiver logado, será apresentada a mensagem
        // abaixo e um link para ele ir a página de login
        }else{
        %>
        <h1>Esta é uma área restrita e você não está logado!</h1>
        <p>Para efetuar o login <a href="Login.jsp">clique aqui</a>!</p>
        <% } %>
        </center>
    </body>
</html>
