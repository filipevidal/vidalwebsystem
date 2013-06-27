<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Contato</title>
        <style type="text/css">
        </style>
    </head>
    <body>
        <form name="Incluir_Contato" action="Incluir_Contato" method="POST">
            <h1>Por Favor, informe os dados do contato</h1>
            <br><br>
            Nome do Contato - <input type="text" name="Nome" value="" size="50" />
            <br>
            Endereço do Contato - <input type="text" name="Endereco" value="" size="50" />
            <br>
            Telefone do Contato - <input type="text" name="Telefone" value="" size="50" />
            <br>
            E-mail do Contato - <input type="text" name="E-mail" value="" size="50" />
            <br>
            <input type="submit" value="Incluir Contato" name="Incluir " />
        </form>
    </body>
</html>
