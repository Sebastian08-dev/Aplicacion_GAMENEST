package Controlador;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.ReclamacionDAO;
import modelo.dto.reclamaciones;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "ControladorGuardarRec", urlPatterns = {"/ControladorGuardarRec"})
public class ControladorGuardarRec extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Directorio donde se guardarán las imágenes
        String uploadDirectory = getServletContext().getRealPath("/") + File.separator + "evidencias";

        // Crear el directorio si no existe
        File uploadDir = new File(uploadDirectory);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Verificar si la solicitud contiene archivos
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = upload.parseRequest(request);

                String nombre = null;
                String apellidos = null;
                String correo = null;
                String telefono = null;
                String producto = null;
                double monto_reclamado = 0;
                String descripcion_problema = null;
                String evidencia = null;

                for (FileItem item : items) {
                    if (item.isFormField()) {
                        // Procesar campos del formulario
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        switch (fieldName) {
                            case "nombre":
                                nombre = fieldValue;
                                break;
                            case "apellidos":
                                apellidos = fieldValue;
                                break;
                            case "correo":
                                correo = fieldValue;
                                break;
                            case "telefono":
                                telefono = fieldValue;
                                break;
                            case "producto":
                                producto = fieldValue;
                                break;
                            case "monto_reclamado":
                                monto_reclamado = Double.parseDouble(fieldValue);
                                break;
                            case "descripcion_problema":
                                descripcion_problema = fieldValue;
                                break;
                        }
                    } else {
                        // Procesar archivo subido
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadDirectory + File.separator + fileName;
                        File uploadedFile = new File(filePath);
                        System.out.println("Guardando archivo en: " + filePath);
                        item.write(uploadedFile);
                        evidencia = "evidencias/" + fileName;
                    }
                }

                // Crear un objeto Reclamaciones con la información del formulario
                reclamaciones nuevaReclamacion = new reclamaciones(0, nombre, apellidos, correo, telefono, producto, monto_reclamado, descripcion_problema, evidencia);

                // Crear una instancia del DAO para el registro de reclamaciones
                ReclamacionDAO dao = new ReclamacionDAO();

                // Intentar registrar la reclamación
                boolean registrado = dao.reclamaciones(nuevaReclamacion);

                // Mostrar mensaje de éxito o error según el resultado del registro
                if (registrado) {
                    // Si el registro fue exitoso, mostrar mensaje de éxito y redireccionar
                    response.getWriter().println("<script type=\"text/javascript\">");
                    response.getWriter().println("alert('¡Reclamación registrada exitosamente!');");
                    response.getWriter().println("window.location.href = 'index.jsp';");
                    response.getWriter().println("</script>");
                } else {
                    // Si hubo un error en el registro, mostrar un mensaje de error
                    response.getWriter().println("<div class='error'>Error al registrar la reclamación. Intente nuevamente más tarde</div>");
                }

            } catch (Exception ex) {
                ex.printStackTrace();
                response.getWriter().println("<div class='error'>Error al procesar la solicitud. Intente nuevamente más tarde</div>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador para guardar reclamaciones con evidencia";
    }
}
