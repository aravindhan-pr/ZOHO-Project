
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css"> 
    <title>Document</title>
   
</head>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Progma", "no-cache");
	response.setHeader("Expires", "0");
	String number = request.getParameter("number");
    String prev_station = request.getParameter("name");
    int stop_no = Integer.valueOf(request.getParameter("stop_no"));
    
	%>

<body>
    <div
        style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center">
        <h2>ADD Stop</h2>
          <form action="stop" method="post">
            <input type="hidden" value=" <%= number %>" name="number">
            <div class="form-group">
               
                <input type="hidden" class="form-control " id="station_id"
                    name="stop_no" value="<%= stop_no%>" />
                <input type="hidden" name="prev_station" value="<%= prev_station%>">
            </div>
            <div class="form-group">
                <label for="name">Station Name</label> 
                <input type="text" class="form-control " id="name"
                    name="next_station" required />
            </div>
            <div class="form-group">
                <label for="name">Halt Time</label> <input type="text" class="form-control " id="" name="haltTime"
                    required />
            </div>
            <div class="form-group">
                <label for="Starting Time">Reach Time </label><input type="text" class="form-control " id="reachTime"
                name="reachTime" required />
            </div>
            <div class="form-group">
                <label for="ending">Distance </label> <input type="text" class="form-control " id="distance" name="distance"
                    required />
            </div>
           <% request.setAttribute("number",number); %>
            <button type="submit">Add Stop</button> 
           
        </form>
        <button><a href="schedule.jsp?number=<%= number%>" style="text-decoration:none ; color:aliceblue">Back</a></button>
       
    </div>
</body>

</html>

