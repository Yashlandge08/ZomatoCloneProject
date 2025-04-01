
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/uploads/*")
public class ImageServlet extends HttpServlet {
    private static final String IMAGE_UPLOAD_DIR = "C:/uploads/";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String imageName = request.getPathInfo().substring(1);
        File imageFile = new File(IMAGE_UPLOAD_DIR + imageName);

        if (imageFile.exists()) {
            response.setContentType(getServletContext().getMimeType(imageFile.getName()));
            response.setContentLength((int) imageFile.length());

            try (FileInputStream fis = new FileInputStream(imageFile);
                 OutputStream os = response.getOutputStream()) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fis.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
