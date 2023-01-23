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
       <link rel="stylesheet" href="css/route.css"> 
</HEAD>
<BODY>
   
   <H1>Schedule</H1>
   <div  class="station-container">
      <div class="line"></div>
   <%
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
                Statement stmt = con.createStatement();
                String number = request.getParameter("number");
                String startTime = request.getParameter("startTime");
                String endTime = request.getParameter("endTime");
                String total_Distance = request.getParameter("distance");
                number = number.trim();
                ResultSet rc = stmt.executeQuery("Select * from trains where train_number = '"+number+"'");
                if(rc.next()){
                String starting = rc.getString("starting_point");
                String ending = rc.getString("ending_point");
                %>
             <div id="stations" class="upper_div">
               <div class = "square"></div>
               <div ><%= starting%></div> 
               
            </div>
         <% ResultSet rs =stmt.executeQuery("SELECT t1.*, t2.station_name FROM route_stations t1 inner join stations t2 on t1.station_id = t2.station_id where train_number = '"+number+"' order by stop_no");
           while(rs.next()){
               int stop_no = rs.getInt("stop_no");
                String name = rs.getString("station_name");
                String haltTime = rs.getString("halt_time");
                String reachTime = rs.getString("reach_time");
                int distance = rs.getInt("distance");%>
            <div id="stations" class = "mid_div">
             <div class="stn-name"><%= distance %>km</div> 
              
               <div class="point"></div>
               <div class="stn-name"><%= name %></div>
               <div >Halt time : <%= haltTime %>mins</div> 
               <div>Reach Time : <%= reachTime %> </div> 
               
            </div>
         <%}%>
            <div id="stations" class = "lower_div">
            <div><%= total_Distance%>km</div>
            <div class="square" ></div>
            <div ><%= ending%></div> 
            <div>Reaching Time:<%= endTime%></div>
              
           </div>
           </div>
           <div class="btn">
            <a href="trainlist.jsp?starting=<%= starting%>&ending=<%= ending%>" style="text-decoration:none ; color:aliceblue"><button>Back</button></a>
            <%}%>
           </div>
         </BODY>
</HTML>