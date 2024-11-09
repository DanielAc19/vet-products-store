<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Producto</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body style="background: url(https://fondosmil.com/fondo/457.png);">
        <!--Navbar-->
        <nav class="navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="#">
                <img src="logo.png" width="80" height="80" class="d-inline-block align-top" alt="">
            <p class="navbar-brand" style="font-size: 2rem;">Veterinaria Vidas Peludas</p>
            <a class="btn btn-outline-light my-2 my-sm-0" href="index.jsp">
                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-house" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                    <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
                </svg>
            </a>
        </nav><br>
        <div class="container bg-white border my-5 p-4" style="border-radius: 10px;">
            <%
                //Inicializar driver
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs = null;            
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection(
                            "jdbc:mysql://localhost/ExamenFinal?user=root&password=");        
                    sta = cnx.createStatement();
                } catch (Exception e){out.print(e+"");}
            %>
            <!--Formulario-->
            <form action="">
                <div class="form-group">
                    <!--Título-->
                    <div class="row mr-1">
                        <h1 class="col">Nuevo Producto</h1>
                        <button type="submit" name="btnGrabar" class="btn btn-primary col-1">
                            <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-upload" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
                            </svg>
                            Guardar
                        </button>
                    </div>
                    <label for="codigoProducto" style="margin-top: 30px">Código del Producto:</label>
                    <input type="text" required name="txtcodigoProducto" id="codigoProducto" class="form-control">
                    <label for="nombreProducto" style="margin-top: 20px">Nombre del Producto</label>
                    <input type="text" required name="txtnombreProducto" id="nombreProducto" class="form-control">
                    <label for="precioProducto" style="margin-top: 20px">Precio del Producto</label>
                    <input type="text" required name="txtprecioProducto" id="precioProducto" class="form-control">
                    <label for="cantidadProducto" style="margin-top: 20px">Cantidad de Producto</label>
                    <input type="text" required name="txtcantidadProducto" id="cantidadProducto" class="form-control">
                    <label for="fechaVencimiento" style="margin-top: 20px">Fecha de Vencimiento</label>
                    <input type="text" required name="txtfechaVencimiento" id="fechaVencimiento" class="form-control">
                </div>
            </form>     
            <%
                //Obtener Valores
                if (request.getParameter("btnGrabar") != null) {  
                    String codigo = request.getParameter("txtcodigoProducto");
                    String nombre = request.getParameter("txtnombreProducto");
                    String precio = request.getParameter("txtprecioProducto");
                    String cantidad = request.getParameter("txtcantidadProducto");
                    String vencimiento = request.getParameter("txtfechaVencimiento");
                    try {
                        //Añadir a base de datos
                        sta.executeUpdate("insert into productos values('"+codigo+"','"+nombre+"','"+precio+"','"+cantidad+"','"+vencimiento+"')");
                        request.getRequestDispatcher("producto_listado.jsp").forward(request, response);
                        sta.close();
                        rs.close();
                        cnx.close();
                    } catch (Exception e) {out.print(e+"");}
                }
            %>
        </div>
    </body>
</html>