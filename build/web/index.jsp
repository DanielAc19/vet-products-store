<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vidas Peludas</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body style="background: url(https://www.logaster.com.es/blog/wp-content/uploads/sites/4/2019/01/4-min.jpg)">
        <!--Navbar-->
        <nav class="navbar navbar-dark bg-primary">

            <p class="navbar-brand" style="font-size: 2rem;">Veterinaria Vidas Peludas</p>
            <img src="logo.png" style="width: 80px; height: 80px;">
        </nav>
        <div class="container text-center">
            <!--Tabla-->
            <table class="table table-borderless" style="margin-top: 20px;">
                <thead>
                    <th>
                        <h1 style="color: gray;">Menú Principal</h1>
                    </th>
                </thead>
                <tr>
                    <td style="margin: 35px auto;">
                        <center><a href="producto_listado.jsp" class="btn btn-info">Listado de Productos</a></center>
                    </td>
                </tr>
                <tr>
                    <td style="margin: 15px auto;">
                        <center><a href="busqueda_productos.jsp" class="btn btn-info">Búsqueda de Productos</a></center>
                    </td>
                </tr>
                <tr>
                    <td style="margin: 15px auto;">
                        <center><a href="venta_productos.jsp" class="btn btn-info">Venta de Productos</a></center>
                    </td>
                </tr>
            </table>          
        </div>
        <footer id="sticky-footer" class="py-4 bg-dark text-white-50" style="position: absolute; bottom: 0; width: 100%;">
            <div class="container text-center">
                <div class="row">
                    <div class="col-sm">
                        <p style="display: inline">Daniela Alejandra Carrillo García</p>
                    </div>
                    <div class="col-sm">
                        <p style="display: inline;">1990-23-12614</p>
                    </div>
                </div><br>    
                <div class="row">
                    <div class="col-sm">
                        <p style="display: inline;">Programación II</p>
                    </div>
                    <div class="col-sm">
                        <p style="display: inline;">Sección: A</p>
                    </div>
                </div>
            </div>
        </footer>          
    </body>
</html>