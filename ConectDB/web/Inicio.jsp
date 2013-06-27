<form name="Inicio" action="Inicio" method="POST">
</form>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <style type="text/css">
            <!-- body {background-color: #66ff99; }
            h2{background-color: #33ff00; }
            h3{background-color: #33cc00; }
            h4{background-color: #339900; }
            h5{background-color: #006600; }
            p{background-color: #003333; }    
                
        </style>
    </head>
    <body>
        <br><br><br><br><br>
        <center>
        <h1>Bem vindo à sua Agenda Digital</h1>
       Selecione o que deseja fazer:
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
        </center>
    </body>
</html>
