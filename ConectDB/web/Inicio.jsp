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
        
        // Somente se o usuário estiver logado é que as opções de menu são
        // verificadas
        if (esta_logado && solicitou_menu && opcao_menu != null) {

            if (opcao_menu.equals("VisualizarContatos"))
                response.sendRedirect("Visualizar.jsp");
            
            else if (opcao_menu.equals("IncluirContato"))
                response.sendRedirect("Incluir.jsp");

            else if (opcao_menu.equals("EditarContato"))
                response.sendRedirect("Editar.jsp");

            else if (opcao_menu.equals("ExcluirContato"))
                response.sendRedirect("Excluir.jsp");
            
        }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <style type="text/css">
            body {background-image: url("fundo.png"); }
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
        <form name="Inicio" action="Inicio.jsp" method="POST">
            <h1>Bem vindo à sua Agenda Digital</h1>
            <p>Você está logado como <b><%=session_usuario_logado%></b> (<a href="Logout.jsp">SAIR</a>)</p>
            <p>Selecione o que deseja fazer:</p>
            <br>
            <select name="Operacao">
               <option value="VisualizarContatos">Visualizar Contatos</option>
               <option value="IncluirContato">Incluir Contato</option>
               <option value="EditarContato">Editar Contato</option>
               <option value="ExcluirContato">Excluir Contato</option>
            </select>
            <br>
            <input type="submit" value="Executar" name="Executar" />
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
