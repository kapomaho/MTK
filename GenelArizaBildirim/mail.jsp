<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" errorPage="Error.jsp" %>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" import="javax.naming.*,java.io.*,javax.mail.*,
javax.mail.internet.*,com.sun.mail.smtp.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.*"%>
        
        <%
    request.setCharacterEncoding("UTF-8");    
%>

<html>
<head>
<title>Arıza Takip Sistemi</title>
</head>

<body>

<%!
public void sendMail(String mail) throws Exception
{
    
    String host = "smtp.fides.com.tr"; //"smtp.gmail.com";
String user = "m.k@fides.com.tr"; //"YourEmailId@gmail.com" // email id to send the emails
String pass = "m9gk31"; //Your gmail password
//String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
String to = "m.k@fides.com.tr"; // out going email id
String from = "info@fides.com.tr"; //Email id of the recipient
String subject = "Yeni Arıza";
String SSL_FACTORY;
		SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";                
String messageText = mail+" firmasından yeni ariza talebi açılmıştır.Arıza detayını MTK Açık Arızalar bölümünde görebilirsiniz.";
boolean sessionDebug = true;
// while start
Properties props = System.getProperties();
props.put("mail.smtp.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress("destek@fides.com.tr")};
msg.setRecipients(Message.RecipientType.TO, address);
 msg.setSubject(MimeUtility.encodeText(subject, "utf-8", "B"));
msg.setContent(messageText, "text/html; charset=utf-8"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());
System.out.println("Email sent");
//WasEmailSent = true; // assume it was sent
}
catch (Exception err) {
//WasEmailSent = false; // assume it's a fail
}
transport.close();

    
    
    
}
//while end
%>


</body>

</html> 