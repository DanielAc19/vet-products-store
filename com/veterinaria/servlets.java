import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GenerarPDFServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=lista_productos.pdf");
        
        try (OutputStream out = response.getOutputStream()) {
            Document document = new Document();
            PdfWriter.getInstance(document, out);
            document.open();
            
            // Conectar a la base de datos
            Connection cnx = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/ExamenFinal?user=root&password=");
                stmt = cnx.createStatement();
                rs = stmt.executeQuery("SELECT * FROM productos");
                
                // Título del documento
                document.add(new Paragraph("Listado de Productos"));
                document.add(new Paragraph(" ")); // Línea en blanco
                
                // Crear la tabla
                PdfPTable table = new PdfPTable(5); // 5 columnas
                table.setWidthPercentage(100);
                
                // Encabezados de columna
                table.addCell("Código");
                table.addCell("Nombre");
                table.addCell("Precio (Q)");
                table.addCell("Cantidad");
                table.addCell("Fecha de Vencimiento");
                
                // Agregar filas con los datos de los productos
                while (rs.next()) {
                    table.addCell(rs.getString("codigo"));
                    table.addCell(rs.getString("nombre"));
                    table.addCell(rs.getString("precio"));
                    table.addCell(rs.getString("cantidad"));
                    table.addCell(rs.getString("fecha_vencimiento"));
                }
                
                document.add(table);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (cnx != null) cnx.close();
            }
            
            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}
