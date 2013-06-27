

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Excluindo usuário e voltando a página Inicial
    session.invalidate();
    response.sendRedirect("Inicio.jsp");
%>
