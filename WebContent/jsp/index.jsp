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

	<section>
		<div class="shadow"></div>

		<div class="container">
			<div class="content opacity">
				<h3 class="title">
					About
					<div class="border"></div>
				</h3>
				<p class="text">Education in the society is surrounded by the
					need for a job. Jobs fills the students’ dreams and enable them to
					lead a life with fulfillment and accomplishment. Colleges, on the
					other hand, plays an important role in the placement of the
					candidate ín reputed companies all across the nation and worldwide.</p>
			</div>

			<div class="imgContainer opacity">
				<img src="../imeges/image.jpg" alt="">
			</div>
		</div>
	</section>

	<script src="../js/index.js"></script>
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