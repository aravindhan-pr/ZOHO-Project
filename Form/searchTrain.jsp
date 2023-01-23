<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>${username}</title>
</head>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Progma", "no-cache");
	response.setHeader("Expires", "0");
	
	%>
<body>
    <div style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center">
    <form action="showTrain" method="post">
        <input type="hidden" value=${ username }  name="usernumber">
        <input type="hidden" value=${ phNum }  name="phNum">
        <h2>Welcome back!! ${username}</h2>
        <h3>where you want to go??</h3>
        <div class="form-group">
            <label for="starting">Staring Point</label> <input type="text"
                class="form-control " id="starting" name ="starting" required />
        </div>
        <div class="form-group">
            <label for="ending">Ending Point</label> <input type="text"
                class="form-control " id="ending" name="ending" required/>
        </div>
        <button type="submit">Continue</button>
        </form>
       
        <button><a href="logout" style="text-decoration:none ; color: aliceblue;">Logout</a>
</div> 
</body>
</html>