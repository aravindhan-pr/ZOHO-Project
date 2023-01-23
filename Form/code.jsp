<%@ page import="java.sql.*" %>
<%Class.forName("org.postgresql.Driver"); %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Progma", "no-cache");
	response.setHeader("Expires", "0");
    String code = "";
    String number = request.getParameter("number");
    number = number.trim();
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
                Statement stmt = con.createStatement() ;
                ResultSet rs =stmt.executeQuery("SELECT * from users where phone_number = '"+number+"' ") ;
                if(rs.next()){
                     code = rs.getString("secret_key");
                }
                String name = "TrainTicketBookingApp";
                String qr="https://chart.googleapis.com/chart?cht=qr&chl=otpauth://totp/"+name+"?secret="+code+"&chs=160x160&chld=L|0";

	%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>code</title>
</head>
<body>
    <div style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center;min-height: 70vh">
    <div>
        <h1>Registration Succussfully :)</h1>
        <h2>Please note the below code for TFA</h2>
        <h3><%= code%></h3>
        <img src="<%= qr%>" alt="">
    </div>
    <button><a href="welcome.jsp" style="text-decoration:none ; color:aliceblue">Back</a></button>
</body>
</html>