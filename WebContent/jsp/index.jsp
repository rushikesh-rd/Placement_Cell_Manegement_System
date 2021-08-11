<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Home</title>
<link rel="stylesheet" href="../css/index.css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
</head>

<body>

	<header>

		<nav class="navbar navbar-expand-lg navbar-light bg-">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Placement Cell</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page"
								href="../jsp/contactus.jsp">Help</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="../jsp/contactus.jsp"></a>
						</li>
					</ul>

					<form class="d-flex">

						<button type="submit" class="btn btn-success"
							formaction="../jsp/login.jsp">Login</button>
					</form>

				</div>
			</div>
		</nav>

		<h1 class="big-title translate" data-speed="0.1">One Stop Campus
			Placement Solution</h1>

		<img src="../imeges/person.png" class="person translate"
			data-speed="-0.25" alt="">
		<img src="../imeges/mountain1.png" class="mountain1 translate"
			data-speed="-0.2" alt="">
		<img src="../imeges/mountain2.png" class="mountain2 translate"
			data-speed="0.4" alt="">
		<img src="../imeges/mountain3.png" class="mountain3 translate"
			data-speed="0.3" alt="">
		<img src="../imeges/sky.png" class="sky translate" data-speed="0.5"
			alt="">
	</header>
</body>

</html>