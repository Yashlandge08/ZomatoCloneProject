import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import com.example.DBConnection;

@WebServlet("/AddRestaurantServlet")
public class AddRestaurantServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String contactno = request.getParameter("contact_no");

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false); 

            String sqlRestaurant = "INSERT INTO restaurants (name, email, password, street, city, pincode, contact_no) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sqlRestaurant)) {
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, street);
                ps.setString(5, city);
                ps.setString(6, pincode);
                ps.setString(7, contactno);
                ps.executeUpdate();
            }

            String sqlUser = "INSERT INTO users (email, password, role, created_at) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sqlUser)) {
                ps.setString(1, email);
                ps.setString(2, password);
                ps.setString(3, "Restaurant"); 
                ps.setString(4, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))); 
                ps.executeUpdate();
            }

            conn.commit(); 
        } catch (Exception e) {
            e.printStackTrace();
        }

        sendEmail(email, password);

        response.sendRedirect("ManageRestaurantsServlet");
    }

    private void sendEmail(String recipientEmail, String password) {
        String senderEmail = "yashlandge08@gmail.com"; 
        String senderPassword = "ggylhgmhwnirbfyt"; 

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.socketFactory.port", "587");
        properties.put("mail.smtp.socketFactory.class", "jakarta.net.ssl,SSLSoocketFactory");
        
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Restaurant Registration - Login Details");
            message.setText("Hello,\n\nYour restaurant has been registered successfully! Your login credentials:\n\nEmail: " 
                            + recipientEmail + "\nPassword: " + password + "\n\nThank you!");

            Transport.send(message);
            System.out.println("Email sent successfully to " + recipientEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
