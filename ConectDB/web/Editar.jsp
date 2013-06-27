<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
// Por padrão o usuário não está logado
Boolean esta_logado = false;

// Verificando se existe informação de login na sessão
String session_usuario_logado = (String) session.getAttribute("usuario_logado");
Long session_data_hora_login = (Long) session.getAttribute("data_hora_login");
Boolean session_login_ativo = (Boolean) session.getAttribute("login_ativo");

if (session_usuario_logado != null && session_data_hora_login != null && session_login_ativo == true)
    esta_logado = true;

if (!esta_logado)
    response.sendRedirect("Inicio.jsp");
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
            <input type="text" name="E-mail" value="" size="50" />
            <br>
            <input type="submit" value="Editar Contato" name="Excluir " />
        </form>
    </body>
</html>

