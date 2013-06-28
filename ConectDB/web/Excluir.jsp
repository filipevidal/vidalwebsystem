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
    String web_metodo = request.getMethod();
    String nome_excluir = request.getParameter("NomeParaExcluir");

    if (esta_logado && web_metodo == "GET" && nome_excluir != null) {
        
        nome_excluir = java.net.URLDecoder.decode(nome_excluir, "utf-8");
        
        String mensagem_erro = null;
            
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Trabalho", "administrador", "administrador");
            
            Statement stm = conn.createStatement();
            stm.execute("DELETE FROM APP.AGENDA WHERE NOME = '" + nome_excluir + "'");
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
    }else{
        // Usuário não está logado
        response.sendRedirect("Inicio.jsp");
    }
%>