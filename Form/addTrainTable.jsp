<%@ page import="java.sql.*" %>
<%Class.forName("org.postgresql.Driver"); %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
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
                ResultSet rs =stmt.executeQuery("SELECT * FROM trains") ;
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
                       <TD ><input type="hidden" value=" <%=number %>" name="number"> <%= number %></TD>
                       <TD> <%= name %></TD>
                       <TD> <%= starting %></TD>
                       <TD> <%= startTime %></TD>
                       <TD> <%= ending %></TD>
                       <TD> <%= endTime %></TD>
                       <TD><%= distance%></TD>
                      <%request.setAttribute("number",number);%>
                    </form>
            </TR>
           <% }%>
               </TABLE>
               <button><a href="addtrain.jsp" style="text-decoration:none ; color:aliceblue">Add Train</a></button>
               <button><a href="admin.jsp" style="text-decoration:none ; color:aliceblue">Back</a></button>
             </div>
        
         </BODY>
</HTML>