<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        String metodo_form = request.getMethod();
        String usuario_form = request.getParameter("Usuario");
        String senha_form = request.getParameter("Senha");
        Boolean tentou_logar = false;
        String mensagem_erro = null;
        
        // Verificando se o usuário digitou usuário e senha para tentar
        // logar no sistema
        if (metodo_form == "POST" && usuario_form != null && senha_form != null)
        {
            tentou_logar = true;
        
            if (usuario_form.equals("erlimar") && senha_form.equals("123456")) {
                
                // Salvamos dados na sessão, informando que o usuário logou
                session.setAttribute("usuario_logado", usuario_form);
                session.setAttribute("data_hora_login", System.nanoTime());
                session.setAttribute("login_ativo", true);
                
                // Redirecionamos o usuário para a página de Início
                response.sendRedirect("Inicio.jsp");
            }else{
                mensagem_erro = "Usuário/Senha inválidos!";
            }
        }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style type="text/css">
            .mensagemerro {
                border: solid 1px darkred;
                padding: 5px;
                margin: 5px;
                background-color: salmon;
                color: red;
                font-size:12pt;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <center>
        <form name="Login" action="Login.jsp" method="POST">
            Bem Vindo
            <br>
            <br>
            <%
            // Se o usuário tentou logar e não obteve sucesso, uma mensagem
            // será exibida para o mesmo.
            if(tentou_logar && mensagem_erro != null) {
            %>
            <span class="mensagemerro"><%=mensagem_erro%></span>
            <br>
            <br>
            <%
            }
            %>
            <input type="text" name="Usuario" value="" size="20" />
            <br>
            <input type="password" name="Senha" value="" size="20" />
            <br>
            <input type="submit" value="Entrar" name="Entrar" />
            <input type="reset" value="Limpar" name="Limpar" />
            <br>
            <input type="submit" value="Incluir novo usuário" name="Novo" />
        </form>
        </center>
    </body>
</html>
