<!DOCTYPE html>
<html lang="en">
<head>

<title>Add Jobs</title>


<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" href="../tcss/bootstrap.min.css">
<link rel="stylesheet" href="../tcss/font-awesome.min.css">
<link rel="stylesheet" href="../tcss/owl.carousel.css">
<link rel="stylesheet" href="../tcss/owl.theme.default.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="../tcss/style.css">

<script>
	var alertPlaceholder = document.getElementById('liveAlertPlaceholder')
	var alertTrigger = document.getElementById('liveAlertBtn')

	function alert(message, type) {
		var wrapper = document.createElement('div')
		wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">'
				+ message
				+ '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

		alertPlaceholder.append(wrapper)
	}

	if (alertTrigger) {
		alertTrigger.addEventListener('click', function() {
			alert('Nice, you triggered this alert message!', 'success')
		})
	}
	
	function validatefield()
	{
		var company = document.getElementById("company").value;
		var profile = document.getElementById("profile").value;
		var skill = document.getElementById("skill").value;
		var location = document.getElementById("location").value;
		var desc = document.getElementById("desc").value;
		var letters = /^[a-zA-Z\s]*$/;
		
		if(company==null || company=="" || !company.match(letters))
		{
			alert("Enter Valid Company Name");
			return false;
		}
		else if(profile==null || profile=="" || !profile.match(letters))
		{
			alert("Enter Valid Profile");
			return false;
		}
		else if(skill==null || skill=="")
		{
			alert("Enter Valid skill");
			return false;
		}
		else if(location==null && location=="")
		{
			alert("Enter Valid location");
			return false;
		}
		else if(desc==null && desc=="")
		{
			alert("Enter Valid desc");
			return false;
		}
	}
</script>

</head>
<%String message = request.getParameter("message"); 
if(message==null)
{
	message = "";
}%>
<body id="top" data-spy="scroll" data-target=".navbar-collapse"
	data-offset="50">

	<!-- PRE LOADER -->
	<section class="preloader">
		<div class="spinner">
			<span class="spinner-rotate"></span>
		</div>
	</section>


	<%@ include file="header.jsp" %>
				<div class="alert alert-light" role="alert" align="center">
 					<%=message%>
				</div>
	<div class="container">
					<div class="text-center">
						<h1>Add Jobs</h1>
					</div>
				</div>
	<!-- Job Post -->
	<section id="contact">	
		<div class="container">
			<div class="row">
				
				<!-- Add job -->
				<div class="col-md-6 col-sm-12" align="center">
					<form id="contact-form" role="form" action="../ServletControler" method="post">
						<div class="col-md-12 col-sm-12" align="center">
							<input type="text" id="company" align="center" class="form-control" placeholder="Company Name" name="companyname" required>
							<input type="text" id="profile" class="form-control"  placeholder="Job Profile" name="jobprofile" required> 
							<input type="text" id="skill" class="form-control" placeholder="Job Skils" name="jobskils" required>
							<input type="text" id="location" class="form-control" placeholder="Job Location" name="joblocation" required>
							<input type="text" id="package" class="form-control" placeholder="Job Package" name="jobpackage" required>
							<textarea id="desc" class="form-control" rows="6" placeholder="Job Description" name="jobdescription" required></textarea>
						</div>
						<div class="col-md-4 col-sm-12">
							<input type="submit" class="form-control" name="Submit"
								value="Submit">
							<input type="hidden" name="action" value="jobpost">
						</div> 
					</form>
				</div>
			</div>
		</div>
	</section>
	
	
	



	<!-- FOOTER -->
	<!-- <footer id="footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4 col-sm-6">
					<div class="footer-info">
						<div class="section-title">
							<h2>Address</h2>
						</div>
						<address>
							<p>
								Kothurud Pune <br>Maharashtra, PIN 411038
							</p>
						</address>

						<ul class="social-icon">
							<li><a href="#" class="fa fa-facebook-square"
								attr="facebook icon"></a></li>
							<li><a href="#" class="fa fa-twitter"></a></li>
							<li><a href="#" class="fa fa-instagram"></a></li>
						</ul>

						<div class="copyright-text">
							<p>Copyright &copy; 2021 Placement Cell</p>

						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-6">
					<div class="footer-info">
						<div class="section-title">
							<h2>Contact Info</h2>
						</div>
						<address>
							<p>+1 333 4040 5566</p>
							<p>
								<a href="mailto:contact@company.com">pcell@pcell.com</a>
							</p>
						</address>

						<div class="footer_menu">
							<h2>Quick Links</h2>
							<ul>
								<li><a href="../tjsp/index.jsp">Home</a></li>
								<li><a href="../tjsp/about-us.jsp">About Us</a></li>
								<li><a href="../tjsp/terms.jsp">Terms & Conditions</a></li>
								<li><a href="../tjsp/contact.jsp">Contact Us</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-12">
					<div class="footer-info newsletter-form">
						<div class="section-title">
							<h2>Newsletter Signup</h2>
						</div>
						<div>
							<div class="form-group">
								<form action="#" method="get">
									<input type="email" class="form-control"
										placeholder="Enter your email" name="email" id="email"
										required> <input type="submit" class="form-control"
										name="submit" id="form-submit" value="Send me">
								</form>
								<span><sup>*</sup> Please note - we do not spam your
									email.</span>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</footer>

 -->

	<!-- SCRIPTS -->
	
	<script src="../tjs/jquery.js"></script>
	<script src="../tjs/bootstrap.min.js"></script>
	<script src="../tjs/owl.carousel.min.js"></script>
	<script src="../tjs/smoothscroll.js"></script>
	<script src="../tjs/custom.js"></script>

</body>
</html>