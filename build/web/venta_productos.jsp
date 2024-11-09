<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venta de Productos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body style="background: url(https://wallpaperstock.net/wallpapers/thumbs1/33797wide.jpg);">
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
        <div class="container bg-white border my-2 p-2" style="border-radius: 10px;">
            <!--Tabla-->
            <table class="table table-bordered text-center">
                <!--Título-->
                <thead class="thead-dark">
                    <tr>
                        <th colspan="6">
                            <h1 style="text-align: center;">Venta de Productos</h1>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6">
                            <form action="">
                                <div class="form-group">
                                    <div class="row mt-5 justify-content-center">
                                        <div class="form-group col-3">
                                            <label for="nombreProducto">Nombre del Producto a Vender:</label>
                                            <input type="text" required name="txtnombreProducto" id="nombreProducto" class="form-control">
                                        </div>
                                        <button type="submit" name="btnBuscar" class="btn btn-primary col-1 my-4 ml-3" >
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                                            </svg>
                                            Buscar
                                        </button>
                                    </div>
                                    <h2 class="mt-4">Disponibilidad</h2>
                                </div>
                            </form>
                        </td>
                    </tr>
                </tbody>
               
                 <%
             
                if (request.getParameter("btnBuscar") != null) {  
                //    String codigo = request.getParameter("txtcodigoProducto");
                    String nombre = request.getParameter("txtnombreProducto");
                    String query = "";
                    
                    if (nombre!="") {
                        query="select * from productos where nombreProducto like '%"+nombre+"%'";
                     }
                  //  } else if(codigo!="" && nombre==""){
                    //    query="select * from productos where codigoProducto like '"+codigo+"' ";
                    //} else if(codigo!="" && nombre!=""){
                     //   query= "select * from productos where codigoProducto like '"+codigo+"' or nombreProducto like '%"+nombre+"%' ";
                    //}
                    
               
                    Connection cnx = null;
                    Statement sta = null;
                    ResultSet rs = null;
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        cnx = DriverManager.getConnection(
                                "jdbc:mysql://localhost/ExamenFinal?user=root&password=");
                        sta = cnx.createStatement(); 
                   
                        rs = sta.executeQuery(query);
                        while(rs.next()){
                   
                            %>
                          
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>    
                            </tr>
                            
                            <%
                        }
                        sta.close();
                        rs.close();
                        cnx.close();
                    } catch (Exception e) {}

}
                %>
                        
            </table>
            <table class="table table-bordered text-center"> 
                <tbody>
                        <tr>
                            <td colspan="6">
                                <form method="post" action="facturacion.jsp" >
                                    <div class="row mt-5 justify-content-center">
                                        <div class="form-group col-3">
                                            <label for="codigoProducto">Código del Producto a Vender:</label>
                                            <input type="text" name="txtcodigoProducto" id="codigoProducto" class="form-control" required>
                                        </div>
                                        <div class="form-group col-3">
                                            <label for="cantidadCompra">Cantidad a Vender:</label>
                                            <input type="text" name="txtcantidadCompra" id="cantidadCompra" class="form-control" required>
                                        </div>
                                        <button type="submit" name="btnComprar" class="btn btn-primary col-2 mt-4 mb-3 ml-3">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-check-fill" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0m-.646 5.354a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0z"/>
                                            </svg>
                                            Vender
                                        </button>
                                    </div>
                                </form>
                            </td>
                        </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>