<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/registration.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<%
String contextPath = request.getContextPath();
String message = request.getParameter("message");
if(message==null)
{
	message = "";
}
%>
<title>Register</title>
<script>
function validateField()
{
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var phone = document.getElementById("phoneno").value;
	var rollno = document.getElementById("rollno").value;
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var phonenoregx = /^\d{10}$/;
	var emailregx = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var numonly = /^\d+/;
	var letters = /* /^[A-Za-z]+$/ *//^[a-zA-Z\s]*$/;
	if(name==null || name=="" || !name.match(letters))
	{
		alert("Plz Enter Name");
		return false;
	}
	else if(email==null || email=="" || !email.match(emailregx))
	{
		alert("Plz Enter Email");
		return false;
	}
	else if(phone==null || phone=="" || !phone.match(phonenoregx))
	{
		alert("Plz Enter Phone No");
		return false;
	}
	else if(rollno==null || rollno=="" || !rollno.match(numonly))
	{
		alert("Plz Enter Roll No");
		return false;
	}
	else if(username==null || username=="")
	{
		alert("Plz Enter Username");
		return false;
	}
	else if(password==null || password=="")
	{
		alert("Plz Enter Password");
		return false;
	}
}
</script>
</head>
<body>
	<nav class="navbar navbar-light bg">

		<div class="container-fluid">

			<a class="navbar-brand" href="../jsp/index.jsp">
				<img src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt=""
					width="30" height="24" class="d-inline-block align-text-top">
				Home
			</a>

			<a class="navbar-brand" href="../jsp/contactus.jsp">
				<img src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt=""
					width="30" height="24" class="d-inline-block align-text-top">
				Help
			</a>

		</div>
	</nav>

	<img class="wave" src="../imeges/wave.png">
	<div class="container">
		<div class="img">
			<img src="../imeges/bg.svg">
		</div>
		<div class="login-content">
			<form  action="../ServletControler" method="post">

				<h2 class="title"></h2>
				<div><%=message %></div>
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Name</h5>
						<input type="text"  name="name" id="name" class="input">
					</div>
				</div>

				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Email</h5>
						<input type="text" name="email" id="email" class="input">
					</div>
				</div>

				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Phone</h5>
						<input type="text" name="phoneno" id="phoneno" class="input">
					</div>
				</div>



				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Roll no</h5>
						<input type="text" name="rollno" id="rollno" class="input">
					</div>
				</div>


				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Username</h5>
						<input type="text" name="username" id="username" class="input">
					</div>
				</div>

				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">
						<h5>Password</h5>
						<input type="password" name="password" id="password" class="input">
					</div>
				</div>

				<input type="submit" class="btn" value="Register" onclick="return validateField();">
				<input type="hidden" name="action" value="registration">
			</form>
		</div>
	</div>
	<script type="text/javascript" src="../js/registration.js"></script>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
</body>
</html>