<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/styles.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auth</title>
</head>
<body>
    <form action="TwoFactor" method = "post">
    <div
        style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center; min-height:70vh  ">
    <h1>Two Factor Authentication</h1>
    <label for="code">Enter the code to continue...</label><br>
    <input type="number" name="code" required>
    <br>
    <button type="submit">Continue</button>
</div>
</form>

</body>
</html>
