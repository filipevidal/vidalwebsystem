<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        // Por padrão o usuário não está logado
        Boolean esta_logado = false;
        
        // Verificando se existe informação de login na sessão
        String session_usuario_logado = (String) session.getAttribute("usuario_logado");
        Long session_data_hora_login = (Long) session.getAttribute("data_hora_login");
        Boolean session_login_ativo = (Boolean) session.getAttribute("login_ativo");
        
        
        if (session_usuario_logado != null && session_data_hora_login != null && session_login_ativo == true)
            esta_logado = true;
        
        // Por padrão nenhum item de menu foi solicitado
        Boolean solicitou_menu = false;
        String opcao_menu = null;
        
        // Verificando se algum item de menu foi selecionado
        if (request.getMethod() == "POST" && request.getParameter("Operacao") != null) {
            solicitou_menu = true;
            opcao_menu = request.getParameter("Operacao");
        }
        
        
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <style type="text/css">
            body {background-image: url("fundo.png"); }
        </style>
    </head>
    <body>
        <br><br>
        <center>
            <br><br>
        <%
        // Só apresenta o conteúdo abaixo se o usuário estiver
        // logado no sistema
        if(esta_logado)
        {    
        %>
        <form name="Inicio" action="Inicio.jsp" method="POST">
            <h1>Bem vindo à sua Agenda Digital</h1>
            <p>Você está logado como <b><%=session_usuario_logado%></b> (<a href="Logout.jsp">SAIR</a>)</p>
            <h2>Lista de Contatos</h2>
            <br>
            <table border="1" width="800" cellspacing="10" cellpadding="2">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Endereço</th>
                        <th>Telefone</th>
                        <th>E-mail</th>
                        <th colspan="2">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><a href="Editar.jsp">Editar</a></td>
                        <td><a href="Logout.jsp">Excluir</a></td>
                        
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><a href="Editar.jsp">Editar</a></td>
                        <td><a href="Logout.jsp">Excluir</a></td>
                        
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><a href="Editar.jsp">Editar</a></td>
                        <td><a href="Excluir.jsp">Excluir</a></td>
                        
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><a href="Editar.jsp">Editar</a></td>
                        <td><a href="Logout.jsp">Excluir</a></td>
                        
                    </tr>
                </tbody>
            </table>
            <center><input type="submit" value="Incluir Novo Contato" name="Incluir" /></center>
            <br>
            
        </form>
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
