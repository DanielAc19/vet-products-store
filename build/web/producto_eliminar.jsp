<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Producto</title>
    </head>
    <body>
        <%
            String codigo = request.getParameter("codigoProducto");
            
            Connection cnx = null;
            ResultSet rs = null;
            Statement sta = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection(
                        "jdbc:mysql://localhost/ExamenFinal?user=root&password=");
                sta = cnx.createStatement();
                //Eliminar de tabla
                sta.executeUpdate("delete from productos where codigoProducto='"+codigo+"'");
                request.getRequestDispatcher("producto_listado.jsp").forward(request, response);
                sta.close();
                rs.close();
                cnx.close();
            } catch (Exception e){out.print(e+"");}
        %>
    </body>
</html>