<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Productos</title>
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
                            <h1 style="text-align: center;">Listado de Productos</h1>
                        </th>
                    </tr>
                </thead>
                <!--Encabezado-->
                <tr>
                    <th scope="row">Código</th>
                    <th scope="row">Nombre</th>
                    <th scope="row">Precio(Q)</th>
                    <th scope="row">Cantidad</th>
                    <th scope="row">Fecha de Vencimiento</th>
                    <th>
                        <a class="btn btn-primary" href="producto_nuevo.jsp">
                            <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-plus-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                            </svg>
                        Crear
                        </a>
                    </th>
                </tr>
                <%
                    //Inicializar Drivers
                    Connection cnx = null;
                    Statement sta = null;
                    ResultSet rs = null;
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        cnx = DriverManager.getConnection(
                                "jdbc:mysql://localhost/ExamenFinal?user=root&password=");
                        sta = cnx.createStatement(); 
                     
                        rs = sta.executeQuery("select * from productos");
                        while(rs.next()){
                            %>
                            
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <!--Botones-->
                                <td>
                                    <a class="btn btn-secondary" href="producto_editar.jsp?codigoProducto=<%=rs.getString(1)%>">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pen-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M13.498.795l.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
                                        </svg>
                                    </a>
                                    <a class="btn btn-danger" href="producto_eliminar.jsp?codigoProducto=<%=rs.getString(1)%>">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                        </svg>
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) rs.close();
                                    if (sta != null) sta.close();
                                    if (cnx != null) cnx.close();
                                }
                            %>
            </table>
        </div>
    </body>
</html>