<%@ page import="java.sql.*"%>
<%Class.forName("org.postgresql.Driver"); %>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Progma", "no-cache");
	response.setHeader("Expires", "0");
	
	%>

<HTML>
       <HEAD>
       <TITLE>Trainlist</TITLE>
       <link rel="stylesheet" href="css/styles.css">
       </HEAD>
       <BODY>
        <div style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center">
            <H1>Available Trains</H1>
            <%
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
                Statement stmt = con.createStatement() ;
                String start = request.getParameter("starting");
                String end = request.getParameter("ending");
                ResultSet rs =stmt.executeQuery("select * from trains where starting_point = '" +start+"'and ending_point = '"+end+"'") ;
                String phoneNum = request.getParameter("phNum");
                
            %>
        <TABLE BORDER="1">
           <TR>
                 <TH>Train Number</TH>
                 <TH>Train Name</TH>
                 <TH>Starting Point</TH>
                 <TH>Starting Time</TH>
                 <TH>Ending Point</TH>
                 <TH>Ending Time</TH>
                 <TH>Distance</TH>
                 <TH>Book Ticket</TH>
                 <TH>Schedule</TH>
          </TR>
           <% while(rs.next()){
                String number = rs.getString("train_number");
                String name = rs.getString("train_name");
                String starting = rs.getString("starting_point");
                String startTime = rs.getString("starting_time");
                String ending = rs.getString("ending_point");
                String endTime = rs.getString("ending_time");
                int distance = rs.getInt("distance");
                %>
           <TR>
               <form action="ticket" method="post">
                <TD ><input type="hidden" value=" <%=number %>" name="number"> <%= number %></TD>
               <TD> <%= name %></TD>
               <TD> <%= starting %></TD>
               <TD> <%= startTime %></TD>
               <TD> <%= ending %></TD>
               <TD><%= endTime%></TD>
               <TD><%= distance%></TD>
               <TD><button style="width:100px ;margin: 8px;" type="submit">Book</button>
               </form></TD> 
               <TD> <a href="http://localhost:8080/Form/route.jsp?number=<%= number%>&startTime=<%= startTime%>&endTime=<%= endTime%>&distance=<%= distance%>" style="width:100px ;margin: 10px;"><button style="width:100px ;margin: 10px;">view</button></a></TD>
          </TR>
           <% 
           request.setAttribute("number",number);
        }
         %>
        
               </TABLE>
               <button><a href="user.jsp" style="text-decoration:none ; color: aliceblue">Back</a>
        </div>

         </BODY>
</HTML>
