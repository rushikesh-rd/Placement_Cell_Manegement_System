<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Edit Student Profile</title>
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
	function validatefield()
	{
		var rollno = document.getElementById("rollno").value;
		var name = document.getElementById("name").value;
		var mobile = document.getElementById("mobile").value;
		var email = document.getElementById("email").value;
		var hsc = document.getElementById("hsc").value;
		var ug = document.getElementById("ug").value;
		var pg = document.getElementById("pg").value;
		var dob= document.getElementById("dob").value;
		var phonenoregx = /^\d{10}$/;
		var emailregx = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var numbersonly = /^\d+/;
		var letters = /^[a-zA-Z\s]*$/;
		if(rollno == null || rollno=="")
		{
			alert("Enter valid roll no");
			return false;
		}
		else if(name == null || name=="" || !name.match(letters))
		{
			alert("Enter valid name");
			return false;
		}
		else if(mobile == null || mobile=="" || !mobile.match(phonenoregx))
		{
			alert("Enter valid mobile no");
			return false;
		}
		else if(email == null || email=="" || !email.match(emailregx))
		{
			alert("Enter valid email");
			return false;
		}
		else if(hsc == null || hsc=="" || !hsc.match(numbersonly) || hsc>=101)
		{
			alert("Enter valid hsc marks");
			return false;
		}
		else if(ug == null || ug=="" || !ug.match(numbersonly) || ug>=101)
		{
			alert("Enter valid ug marks");
			return false;
		}
		else if(pg == null || pg=="" || !pg.match(numbersonly) || pg>=101)
		{
			alert("Enter valid pg marks");
			return false;
		}
		else if(dob == null || dob=="")
		{
			alert("Enter valid Date");
			return false;
		}
		return true;
	}
</script>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse"
	data-offset="50">

	<!-- PRE LOADER -->
	<section class="preloader">
		<div class="spinner">
			<span class="spinner-rotate"></span>
		</div>
	</section>


	<%@ include file="header.jsp" %>
			<%
		String contextPath = request.getContextPath();
		String message = request.getParameter("msg");
		if(message==null)
		{
			message = "";
		}
		%>

	<div class="alert alert-light" role="alert" align="center" style="color:green">
		<h3><%=message %></h3>
	</div>
	
	
<%
							Connection con = null;
							PreparedStatement stmtt = null;
							try {
								Class.forName("com.mysql.cj.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_cell_db", "root", "root");
								stmtt = con.prepareStatement(
								"select pk_roll_no,name,email,mobile_no,hsc_marks,grad_marks,pg_marks,gender,dob from student_info where name=? and is_active='Y'");
								stmtt.setString(1,name);
								ResultSet rs = stmtt.executeQuery();
								while (rs.next()) {
							%>
							<!-- Job Post -->
							
							<section id="contactt">
							<div class="container">
							<div class="row">
				
							<!-- Add job -->
							
							<div  class="col-md-6 col-sm-12" align="center">
							<form id="contactt-form"  role="form" action="../ServletControler" method="post">
								<div class="input-group input-group-lg">
									  <span class="input-group-text" id="inputGroup-sizing-lg">Roll No</span><br>
									  <input type="text" id="rollno" class="form-control" aria-label="Sizing example input" name="rollno" value="<%=rs.getInt(1) %>" aria-describedby="inputGroup-sizing-lg" readonly >
								
									  <span class="input-group-text" id="inputGroup-sizing-lg">Name</span><br>
									  <input type="text" id="name" class="form-control" aria-label="Sizing example input" name="name" value="<%=rs.getString(2) %>" aria-describedby="inputGroup-sizing-lg" readonly >
								
									  <span class="input-group-text" id="inputGroup-sizing-lg">Email</span><br>
									  <input type="text" id="email" class="form-control" aria-label="Sizing example input" name="email" value="<%=rs.getString(3) %>" aria-describedby="inputGroup-sizing-lg"  >
								
									  <span class="input-group-text" id="inputGroup-sizing-lg">Contact No</span><br>
									  <input type="text" id="mobile" class="form-control" aria-label="Sizing example input" name="contactno" value="<%=rs.getString(4) %>" aria-describedby="inputGroup-sizing-lg"  >
								
								      <span class="input-group-text" id="inputGroup-sizing-lg">Date Of Birth </span><br>
									  <input type="text" id="dob" class="form-control" aria-label="Sizing example input" name="dob" value="<%=rs.getString(9) %>" aria-describedby="inputGroup-sizing-lg" placeholder="DD/MM/YY"  >
								
									  <span class="input-group-text" id="inputGroup-sizing-lg">Hsc Marks</span><br>
									  <input type="text" id="hsc" class="form-control" aria-label="Sizing example input" name="hscmarks" value="<%=rs.getInt(5) %>" aria-describedby="inputGroup-sizing-lg"  >
								
									  <span class="input-group-text" id="inputGroup-sizing-lg">Graduation Marks</span><br>
									  <input type="text" id="ug" class="form-control" aria-label="Sizing example input" name="gradmarks" value="<%=rs.getInt(6) %>" aria-describedby="inputGroup-sizing-lg"  >
								
									  <span class="input-group-text" id="inputGroup-sizing-lg">Post Graduation Marks</span><br>
									  <input type="text" id="pg" class="form-control" aria-label="Sizing example input" name="pgmarks" value="<%=rs.getInt(7) %>" aria-describedby="inputGroup-sizing-lg"  >
								
								Gender
								<div class="form-check">
									  <input class="form-check-input" type="radio" name="gender" value="M" id="flexRadioDefault1">
									  <label class="form-check-label" for="flexRadioDefault1">
									    Male
									  </label>
								
									  <input class="form-check-input" type="radio" name="gender" value="F" id="flexRadioDefault2" checked>
									  <label class="form-check-label" for="flexRadioDefault2">
									    Female
									  </label>
								</div>								
									<div class="col-md-4 col-sm-12">
										<button type="submit" value="submit" class="btn btn-primary btn-lg" onclick="return validatefield(); ">UPDATE</button>
										
										<!-- <input type="submit" name="submit" value="Update"> -->
										<input type="hidden" name="action" value="uprofile">
									</div>
								<%
								}
								} catch (Exception e) {
								e.printStackTrace();
								} finally {
								con.close();
	
								stmtt.close();
								}
								%>
							</form>
							</div>
							</section>
							

	<main>
		



	</main>



	<!-- FOOTER -->
							<footer id="footer">
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

	<!-- SCRIPTS -->
	<script src="../tjs/jquery.js"></script>
	<script src="../tjs/bootstrap.min.js"></script>
	<script src="../tjs/owl.carousel.min.js"></script>
	<script src="../tjs/smoothscroll.js"></script>
	<script src="../tjs/custom.js"></script>

</body>
</html>