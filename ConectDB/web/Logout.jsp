<%-- 
    Document   : Logout
    Created on : 27/06/2013, 01:48:44
    Author     : erlimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Efetuando logout e voltando a página de login
    session.invalidate();
    response.sendRedirect("Inicio.jsp");
%>
