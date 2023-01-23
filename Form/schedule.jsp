<%@ page import="java.sql.*" %>
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
            <H1>Schedule</H1>
            <%
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
                Statement stmt = con.createStatement();
                String number = request.getParameter("number");
                number = number.trim();
                ResultSet rc = stmt.executeQuery("Select * from trains where train_number = '"+number+"'");
                if(rc.next()){
                String starting = rc.getString("starting_point");
                String ending = rc.getString("ending_point");
               
             %>
        <TABLE BORDER="1">
           <TR>
            <td>Starting Point</td>
            <td colspan="4" style=" text-align: center;"><%= starting%>  </td>
           </TR>
           <TR>
                 <TH>Station Name</TH>
                 <TH>Halt time</TH>
                 <TH>Reach Time</TH>
                 <TH>Distance</TH>
                 <TH>Actions</TH>
                <%
                ResultSet rs =stmt.executeQuery("SELECT t1.*, t2.station_name FROM route_stations t1 inner join stations t2 on t1.station_id = t2.station_id where train_number = '"+number+"' order by stop_no"); %>
          </TR>
          
           <% while(rs.next()){
           
                int stop_no = rs.getInt("stop_no");
                String haltTime = rs.getString("halt_time");
                String reachTime = rs.getString("reach_time");
                int distance = rs.getInt("distance");
                int station_id = rs.getInt("station_id");
                int next_station_id = rs.getInt("next_station_id");
                String station_name = rs.getString("station_name");
                %>
               
                <TR>  
                  <form action="deleteStop" method="post">
                   <TD>  <%= station_name%> </TD>
                   <TD> <%= haltTime %>mins</TD>
                   <TD> <%= reachTime %></TD>
                   <TD> <%= distance %>km</TD>
                   <input name="number" value="<%=number%>" type="hidden">
                   <input name="stop_no" value="<%=stop_no%>" type="hidden">
                   <Td> <button style="width:100px ;margin: 8px;" type="submit"  >Delete</button>
                   </form>
                     <a href="http://localhost:8080/Form/addStop.jsp?stop_no=<%= stop_no+1%>&number=<%= number%>&name=<%=station_name%>"><button>Next Station</button></a>
                  </Td> 
                  
                   </TR>
            <% }%>
            <TR>
               <td>Ending Point</td>
               <td colspan="4" style=" text-align: center;"><%= ending%>  </td>
              </TR>
              <%}%>
              <TR>
               </TABLE>
               <a href="adminTrainList.jsp" style="text-decoration:none ; color:aliceblue"><button>Back</button></a>
        </div>
        
         </BODY>
</HTML>