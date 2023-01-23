
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="css/styles.css"> 
    <title>Login</title>
</head>
<body>
       
    <div style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center; min-height: 70vh"><h1>Login</h1>
    <form action="login" method="post">
        <div class="form-group">
            <label for="number">Username</label> <input type="text"
                class="form-control " id="number" name ="username" required />
        </div>
        <div class="form-group">
            <label for="password">Password</label> <input type="password"
                class="form-control " id="password" name="password" required/>
        </div>
        <button style="width:70px;"><a href="welcome.jsp" style="text-decoration:none; color: aliceblue;">back</a></button>
        <button type="submit">Login</button>
        
    </form>
</div>
</body>
</html>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

