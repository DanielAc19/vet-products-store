<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Facturación</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body style="background: url(https://fondosmil.com/fondo/457.png);">
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
    
    <table class="table table-bordered text-center">
                <!--Título-->
                <thead class="thead-dark">
                    <tr>
                        <th colspan="5">
                            <h1 style="text-align: center;">Facturación</h1>
                        </th>
                    </tr>
                </thead>
    </table>
    
    <div class="container-sm d-flex align-items-center justify-content-center">
        <%
            String codigo = request.getParameter("txtcodigoProducto");
            int compra = Integer.parseInt(request.getParameter("txtcantidadCompra"));
            
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs0 = null;
            Boolean compraValida = false;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/ExamenFinal?user=root&password=");
                sta = cnx.createStatement();
               
                rs0= sta.executeQuery("SELECT * FROM productos WHERE codigoProducto='" + codigo + "'");

                if (rs0.next()) {
                    String cantidadt = rs0.getString(4);
                    int cantidadTotal = Integer.parseInt(cantidadt);
                    
                    if (compra > cantidadTotal) {
        %>
                    <div class="alert alert-danger" role="alert">
                        Cantidad de productos disponibles insuficiente.
                    </div>
        <%
                    } else {
                        compraValida = true;
                        int nuevaCantidad = cantidadTotal - compra;
                        sta.executeUpdate("update productos set cantidadProducto='"+nuevaCantidad+"' WHERE codigoProducto='"+codigo+"'");
                    }
                    
                  
                } else {
                    out.println("Producto no encontrado.");
                }

                if (compraValida == true) {
                    String query = "SELECT nombreProducto, precioProducto FROM productos WHERE codigoProducto=?";
                    PreparedStatement ps = cnx.prepareStatement(query);
                    ps.setString(1, codigo);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        String nombreProducto = rs.getString("nombreProducto");
                        int precioProducto = rs.getInt("precioProducto");
                        double totalVenta = precioProducto * compra;
        %>
                        <div class="card" style="width: 20rem;">
                            <div class="card-body">
                                <h2 class="card-title" style="text-align: center;">Factura</h2>
                                <p class="card-text" >Producto: <%= nombreProducto %></p>
                                <p class="card-text" >Cantidad Vendida: <%= compra %></p>
                                <p class="card-text" >Precio Unitario: <%= precioProducto %></p>
                                <p class="card-text" >Total a Pagar: Q.<%= totalVenta %></p>
                            </div>
                        </div>
        <%  
                    } else {
                        out.println("Producto no encontrado.");
                    }

                    rs.close();
                    ps.close();
                    cnx.close();
                }
                
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </div>
</body>
</html>
