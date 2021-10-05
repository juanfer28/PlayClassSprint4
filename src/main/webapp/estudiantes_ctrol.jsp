<%-- 
    Document   : juguetes_ctrl
    Created on : 14/09/2021, 7:13:43 a. m.
    Author     : Cielo Juliana
--%>
<%@page import="logica.LogicaEstudiante"%>
<%@page import="logica.Estudiante"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("txtId"));
            String nombre = request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String email = request.getParameter("txtEmail");
            int telefono = Integer.parseInt(request.getParameter("txtTelefono"));
            int curso = Integer.parseInt(request.getParameter("selCurso"));
            String fecha = request.getParameter("dtpFechainicio");
            String accion = request.getParameter("btnSubmit");
            Estudiante e = null;
            if (accion.equals("nuevo")) {
                e = new Estudiante(nombre, apellido, email, telefono, fecha, curso);
            }
            else if (accion.equals("editar")){
                e = new Estudiante( id, nombre, apellido, email, telefono, fecha, curso);
            }
            LogicaEstudiante logicaEstudiante = new LogicaEstudiante();
            boolean guardado = logicaEstudiante.guardarEstudiante(e);
            if (guardado == true) {
                out.println("Juguete guardado exitosamente");
            } else {
                out.println("Información de juguete no se guardó.");
            }
        %>
        <a href="06registrarEstudiante.jsp"><button type="submit" class="btn btn-primary" id="btnSubmit">Volver a la lista</button></a>
    </body>
</html>

