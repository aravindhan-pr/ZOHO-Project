<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="css/admin.css">
    <title>User</title>
</head>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Progma", "no-cache");
	response.setHeader("Expires", "0");
	
	%>
<body>
    <div style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center;min-height: 70vh">
    <div><h1>User pannel</h1></div>
    <div>
        
        <a href="searchTrain.jsp" style="text-decoration:none ; color: aliceblue;"  ><button>Search Train</button></a><br>
       
    </div>
    
    <button><a href="logout" style="text-decoration:none ; color: aliceblue">Logout</a>
    </button>



</div>
</body>
</html>