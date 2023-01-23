<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css"> 
    <title>EditTrain</title>
</head>
<body>
    <%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Progma", "no-cache");
	response.setHeader("Expires", "0");
	
	%>
   
    <div style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center; min-height: 70vh;">
        <%    
                Class.forName("org.postgresql.Driver"); 
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
                Statement stmt = con.createStatement() ;
                String number = request.getParameter("number");
                number = number.trim();
                ResultSet rs =stmt.executeQuery("SELECT * FROM trains  where train_number = '"+number+"'") ;
                if(rs.next()) {
                %>
            <h2>Edit Form</h2>
        <form action="editTrainForm" method="post">
            <input type="hidden" value=" <%= number %>" name="number">
               <div class="form-group">
                <label for="number">Train number</label> 
                <input type="text" class="form-control " id="number"
                    name="number" value= "<%= number %>""  required />
                    </div>
           <div class="form-group">
                <label for="name">Train name </label> 
                <input type="text" class="form-control " id="name" name="name" value='<%=rs.getString("train_name")%>'
                    required />
            </div>
            <div class="form-group">
                <label for="starting">Starting Point</label> <input type="text" class="form-control "  value='<%= rs.getString("starting_point")%>'
                    name="starting" required />
            </div>
            <div class="form-group">
                <label for="Starting Time">Starting Time:</label><input type="text" class="form-control "  value='<%= rs.getString("starting_time") %>'
                name="stTime" required />
                <div class="form-group">
                    <label for="ending">Ending Point:</label> <input type="text" class="form-control "  name="ending" value='<%= rs.getString("ending_point")%>'
                        required />
                </div>
                <div class="form-group">
                    <label for="edtime">Reach time</label> <input type="text" class="form-control "  name="edTime" value='<%= rs.getString("ending_time")%>'
                        required />
                </div>
                <div class="form-group">
                    <label for="edtime">Distance</label> <input type="text" class="form-control "  name="distance" value='<%= rs.getInt("distance")%>'
                        required />
                </div>
                <%
            }
                %>
            <button type="submit">update</button>
            
        </form>
        <button><a href="admin.jsp" style="text-decoration:none ; color:aliceblue">Back</a></button>
    </div>
   
</body>
</html>
