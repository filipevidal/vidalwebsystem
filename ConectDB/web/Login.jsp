<form name="Login" action="Login" method="POST">
</form>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style type="text/css">
            <!-- body {background-image: url("fundo_login.png"); }  
        </style>
    </head>
    <body>
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <center>
        Bem Vindo
        <br>    
        Informe seu Usuário e senha
        <br>
        <input type="text" name="Usuário" value="Nome de Usuário" size="20" />
        <br>
        <input type="password" name="Senha" value="" size="20" />
        <br>
        <input type="submit" value="Entrar" name="Entrar" />
        <input type="reset" value="Limpar" name="Limpar" />
        <br>
        <input type="submit" value="Incluir novo usuário" name="Novo" />
        </center>
    </body>
</html>
