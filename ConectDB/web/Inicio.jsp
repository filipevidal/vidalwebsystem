<form name="Inicio" action="Inicio" method="POST">
</form>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <style type="text/css">
            <!-- body {background-image: url("fundo.png"); }
                
                
        </style>
    </head>
    <body>
        <br><br><br><br><br>
        <center>
        <h1>Bem vindo à sua Agenda Digital</h1>
       Selecione o que deseja fazer:
       <br>
       <select name="Operação">
           <option>Visualizar Contatos</option>
           <option>Incluir Contato</option>
           <option>Editar Contato</option>
           <option>Excluir Contato</option>
       </select>
       <br>
       <input type="submit" value="Executar" name="Executar" />
       
        </center>
    </body>
</html>
