<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Búsqueda Productos</title>
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
                            <h1 style="text-align: center;">Búsqueda de Productos</h1>
                        </th>
                    </tr>
                </thead>
                <!--Encabezado-->
                <tbody>
                    <tr>
                        <td colspan="6">
                            <!--Formulario debajo del encabezado de la tabla-->
                            <form action="">
                                <div class="row mt-5 justify-content-center">
                                    <div class="form-group col-3">
                                        <label for="codigoProducto">Código del Producto:</label>
                                        <input type="text" name="txtcodigoProducto" id="codigoProducto" class="form-control" value="">
                                    </div>
                                    <div class="form-group col-3">
                                        <label for="nombreProducto">Nombre del Producto:</label>
                                        <input type="text" name="txtnombreProducto" id="nombreProducto" class="form-control" value="">
                                    </div>
                                    <button type="submit" name="btnBuscar" class="btn btn-primary col-1 mt-4 mb-3 ml-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                                        </svg>
                                        Buscar
                                    </button>
                                </div>
                            </form>
                        </td>
                    </tr>
                </tbody>
                <%
                    //Obtener Valores
                    if (request.getParameter("btnBuscar") != null) {  
                        String codigo = request.getParameter("txtcodigoProducto");
                        String nombre = request.getParameter("txtnombreProducto");
                        String query = "";

                        if (codigo=="" && nombre!="") {
                            query="select * from productos where nombreProducto like '%"+nombre+"%'";
                        } else if(codigo!="" && nombre==""){
                            query="select * from productos where codigoProducto like '"+codigo+"' ";
                        } else if(codigo!="" && nombre!=""){
                            query= "select * from productos where codigoProducto like '"+codigo+"' or nombreProducto like '%"+nombre+"%' ";
                        }

                        //Inicializar Drivers
                        Connection cnx = null;
                        Statement sta = null;
                        ResultSet rs = null;
                        try{
                        Class.forName("com.mysql.jdbc.Driver");
                        cnx = DriverManager.getConnection("jdbc:mysql://localhost/ExamenFinal?user=root&password=");
                        sta = cnx.createStatement(); 
                        //Obtener resultados para tabla
                        rs = sta.executeQuery(query);
                        while(rs.next()){
                %>
                    <!--Contenido-->
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
                            sta.close();
                            rs.close();
                            cnx.close();
                        } catch (Exception e) {}
                    }
                %>                  
            </table>
        </div>
    </body>
</html>