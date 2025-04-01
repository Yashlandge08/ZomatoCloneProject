import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CheckJars")
public class CheckJars extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        File libFolder = new File(getServletContext().getRealPath("/WEB-INF/lib"));
        if (libFolder.exists() && libFolder.isDirectory()) {
            String[] jarFiles = libFolder.list();
            response.setContentType("text/plain");
            response.getWriter().println("JARs in /WEB-INF/lib:");

            for (String jar : jarFiles) {
                response.getWriter().println(jar);
                System.out.println("Loaded JAR: " + jar); // Print in Tomcat logs
            }
        } else {
            response.getWriter().println("WEB-INF/lib folder not found!");
        }
    }
}
