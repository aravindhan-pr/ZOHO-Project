<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div style="position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center">
	<div>
		<h1 align :center>Registration Form</h1>
	</div>
	<div>
		<form action="register" method="post">
			<div class="form-group">
				<label for="name">Name</label> <input type="text"
					class="form-control " id="name" name ="name" required />
			</div>
			<div class="form-group">
				<label for="age">Age</label> <input type="text"
					class="form-control " id="age" name="age" required/>
			</div>
			<div class="form-group">
				<label for="number">Phone Number</label> <input type="text"
					class="form-control " id="number" name="number" required />
			</div>
			<div class="form-group">
				<label for="email">Email</label> <input type="text"
					class="form-control " id="email" name="email" required />
			</div>
			<div class="form-group">
				<fieldset>
					<legend>Gender</legend>

					<div>
						<input type="radio" id="male" name="gender" value="M" checked>
						<label for="male">Male</label>
					</div>

					<div>
						<input type="radio" id="female" name="gender" value="F"> <label
							for="female">Female</label>
					</div>

					<div>
						<input type="radio" id="others" name="gender" value="O"> <label
							for="others">Others</label>
					</div>
				</fieldset>
				
			</div>
			<div class="form-group">
				<fieldset>
					<legend>Berth Preference</legend>

					<div>
						<input type="radio" id="upper" name="berth" value="U" checked>
						<label for="upper">Upper</label>
					</div>

					<div>
						<input type="radio" id="middle" name="berth" value="M"> <label
							for="middle">Middle</label>
					</div>

					<div>
						<input type="radio" id="lower" name="berth" value="O"> <label
							for="lower">Lower</label>
					</div>
				</fieldset>
			</div>
			<div class="form-group">
				<label for="password">Set password</label> <input type="password"
					class="form-control " id="password" name="password" required/>
			</div>
			<button type="submit">Register</button>
			<br>
        <div style="margin-top:8px ;">
            Already a User? <a style="text-decoration:none ;" href="login.jsp">Login</a>
        </div>
		</form>
		<button><a href="welcome.jsp" style="text-decoration:none ; color:aliceblue">Back</a></button>
	</div>
	</div>
</body>
</html>