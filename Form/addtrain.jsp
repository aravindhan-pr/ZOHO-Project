<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css"> 
    <title>Document</title>
   
</head>
<%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Progma", "no-cache");
	response.setHeader("Expires", "0");%>
<body>
    <div
        style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center">
        <h2>ADD Train</h2>
        <form action="AddTrain1" method="post">
            <div class="form-group">
                <label for="number">Train number</label> 
                <input type="text" class="form-control " id="number"
                    name="number" required />
            </div>
            <div class="form-group">
                <label for="name">Train name</label> <input type="text" class="form-control " id="name" name="name"
                    required />
            </div>
            <div class="form-group">
                <label for="starting">Starting Point</label> <input type="text" class="form-control " id="starting"
                    name="starting" required />
            </div>
            <div class="form-group">
                <label for="Starting Time">Starting Time:</label><input type="text" class="form-control " id="stTime"
                name="stTime" required />
            <div class="form-group">
                <label for="ending">Ending Point :</label> <input type="text" class="form-control " id="route" name="ending"
                    required />
            </div>
                <div class="form-group">
                    <label for="edTime">Ending Time :</label> <input type="text" class="form-control "  name="edTime"
                        required />
                </div>
                <div class="form-group">
                    <label for="distance">Distance</label> <input type="text" class="form-control "  name="distance"
                        required />
                </div>
            <button type="submit">Add Train</button>
           
        </form>
        <button><a href="addTrainTable.jsp" style="text-decoration:none ; color:aliceblue">Back</a></button>
       </div>
</body>

</html>

