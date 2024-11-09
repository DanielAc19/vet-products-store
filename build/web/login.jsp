<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body style="background: url(https://fondosmil.com/fondo/457.png);">
        <nav class="navbar navbar-dark bg-primary">
            <p class="navbar-brand" style="font-size: 2rem;">Bienvenido a Veterinaria Vidas Peludas</p>
            <img src="logo.png" style="width: 80px; height: 80px;">
        </nav><br>
       
            <div class="container" style="margin-top: 65px;">
                
                <div class="row">
                    <img src="inicio.jpg" class="img-fluid" style="width: 400px; height: 380px; margin-left: 85px;">
                    <div class="col-md-4 ml-auto p-3 mb-2 bg-light text-dark" style="margin-right: 45px;"> <!-- Ajusta el ancho con col-md-* y alinea a la derecha -->
                        <form action="index.jsp" method="post" style="margin-top: 25px;">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Usuario</label>
                                <input type="name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Contraseña</label>
                                <input type="password" class="form-control" id="exampleInputPassword1">
                                <small id="contraseña" class="form-text text-muted">Nunca compartas tu contraseña con alguien más</small>
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Recordar credenciales</label>
                            </div>
                            <button type="submit" class="col ml-auto btn btn-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
                                    <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
                                </svg>
                            Ingresar
                            </button>
                        </form>
                    </div>
                </div>
                <%
                    //Inicializar driver
                    Connection cnx = null;
                    Statement sta = null;
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        cnx = DriverManager.getConnection(
                                "jdbc:mysql://localhost/ExamenFinal?user=root&password=");
                        sta = cnx.createStatement();
                    } catch (Exception e){}  
                %>
            </div>
    </body>
</html>