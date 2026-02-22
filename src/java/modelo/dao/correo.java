package modelo.dao;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class correo {

    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String SMTP_USERNAME = "misajsebas19@gmail.com"; // El email
    private static final String SMTP_PASSWORD = "kshw lecm klmw kapq"; // contraseña de aplicación generada

    public static void enviarCorreoBienvenida(String toEmail, String nombre) {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Activar registros de depuración
        props.put("mail.debug", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            // Crear un objeto MimeMessage
            Message message = new MimeMessage(session);

            // Configurar el remitente y el destinatario
            message.setFrom(new InternetAddress(SMTP_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

            // Configurar el asunto y el contenido del mensaje
            message.setSubject("¡Bienvenido a la GameNest!");
            String emailContent = "Hola " + nombre + ",\n\n"
                    + "Gracias por registrarte en Gamenest. Estamos encantados de tenerte con nosotros.\n\n"
                    + "Saludos cordiales,\n"
                    + "El equipo de GameNest";
            message.setText(emailContent);

            // Enviar el mensaje
            Transport.send(message);

            // Mensaje de registro para confirmar el envío exitoso
            System.out.println("Correo de bienvenida enviado exitosamente");

        } catch (MessagingException e) {
            // Manejo de excepciones: imprimir la traza de la excepción
            e.printStackTrace();
        }
    }
    
    private static void enviarCorreo(String toEmail, String nombre, String subject, String emailContent) {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(emailContent);
            Transport.send(message);
            System.out.println("Correo enviado exitosamente");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    public static void enviarCorreoAprobacion(String toEmail, String nombre) {
        enviarCorreo(toEmail, nombre, "¡Reclamación Aprobada!", "Hola " + nombre + ",\n\nTu reclamación ha sido aprobada.\n\nGracias por su reclamación. Ha sido revisada y nuestro equipo se pondrá en contacto con usted en breve para resolver el asunto. Apreciamos su paciencia.\nEl equipo de GameNest");
    }

    public static void enviarCorreoRechazo(String toEmail, String nombre) {
        enviarCorreo(toEmail, nombre, "Reclamación Rechazada", "Hola " + nombre + ",\n\nTu reclamación ha sido rechazada.\n\nLamentablemente, no podemos proceder con su reclamación en esta ocasión. Si tiene alguna pregunta adicional o desea discutir el asunto, por favor contáctenos. Agradecemos su comprensión. \n\nSaludos cordiales,\nEl equipo de GameNest");
    }

}
