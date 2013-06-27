<form name="Inicio" action="Inicio" method="POST">
</form>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        // Por padrão o usuário não está logado
        Boolean esta_logado = false;
        String session_usuario_logado = (String) session.getAttribute("usuario_logado");
        Long session_data_hora_login = (Long) session.getAttribute("data_hora_login");
        Boolean session_login_ativo = (Boolean) session.getAttribute("login_ativo");
        
        if (session_usuario_logado != null && session_data_hora_login != null && session_login_ativo == true)
            esta_logado = true;
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <style type="text/css">
            body {background-color: #66ff99; }
            h2{background-color: #33ff00; }
            h3{background-color: #33cc00; }
            h4{background-color: #339900; }
            h5{background-color: #006600; }
            /*p{background-color: #003333; }*/
                
        </style>
    </head>
    <body>
        <br><br><br><br><br>
        <center>
            <br><br>
        <%
        // Só apresenta o conteúdo abaixo se o usuário estiver
        // logado no sistema
        if(esta_logado)
        {    
        %>
        <h1>Bem vindo à sua Agenda Digital</h1>
        <p>Você está logado como <b><%=session_usuario_logado%></b> (<a href="Logout.jsp">SAIR</a>)</p>
        <p>Selecione o que deseja fazer:</p>
        <br>
        <select name="Operação">
           <option>Visualizar Agenda</option>
           <option>Incluir Contato</option>
           <option>Editar Contato</option>
           <option>Excluir Contato</option>
        </select>
        <br>
        <input type="submit" value="Ir" name="Executar" />
        <input type="reset" value="Limpar" name="Limpar" />
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
