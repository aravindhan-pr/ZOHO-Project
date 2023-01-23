<%@ page import="java.sql.*" %>
<%Class.forName("org.postgresql.Driver"); %>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Progma", "no-cache");
	response.setHeader("Expires", "0");
	
	%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>Document</title>
</head>
<body>
    <div style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center">

         <div>
           <h1>Ticket Booked Successfully</h1>
        </div>
           <button><a href="user.jsp" style="text-decoration:none ; color: aliceblue">Back</a><br><br>

            <button><a href="logout" style="text-decoration:none ; color: aliceblue">Logout</a>
    </div>
   
</body>
</html>