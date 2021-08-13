<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>  
<title>Jobs</title>

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

						<style>
						    #customerss {
						      font-family: Arial, Helvetica, sans-serif;
						      border-collapse: collapse;
						      width: 100%;
						    }
						
						    #customerss td,
						    #customerss th {
						      border: 1px solid #ddd;
						      padding: 8px;
						    }
						
						    #customerss tr:nth-child(even) {
						      background-color: #f2f2f2;
						    }
						
						   /*  #customerss tr:hover {
						      background-color: #ddd;
						    } */
						
						    #customerss th {
						      padding-top: 12px;
						      padding-bottom: 12px;
						      text-align: left;
						      background-color: #04AA6D;
						      color: white;
						    }
						  </style>

</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse"
	data-offset="50">

	<!-- PRE LOADER -->
	<section class="preloader">
		<div class="spinner">

			<span class="spinner-rotate"></span>

		</div>
	</section>


	<%@include file="header.jsp" %>
	<%
				String status=request.getParameter("status");
				if("Y".equals(status))
				{
					%><div class="alert alert-light" role="alert" align="center" style="color:green">
						  <h3>You have sucessfully applied for this job</h3>
					</div><%
				}
				else if("N".equals(status))
				{
					%>
					<div class="alert alert-light" role="alert" align="center">
					  You Have Already Applied For This Job
					</div>
					<%	
				}
	%>
	<!-- <section> -->
		<div class="container">
			<div class="text-center">
				<h1>Find A Job</h1>
				<br>
					
				<p class="lead">Get best matched jobs directly here.</p>
			</div>
			
		</div>
	<!-- </section> -->
	<section>
		<table id="customerss">
			<tr>
				<th>Company Name</th>
				<th>Job Profile</th>
				<th>Job Skill</th>
				<th>Job Description</th>
				<th>Job Location</th>
				<th>Job Package</th>
				<th>Job Apply</th>
			</tr>
		<% 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_cell_db", "root", "root");
			PreparedStatement stmtt = con.prepareStatement(
					"select company_name,job_profile,job_skil,job_description,job_location,job_package,pk_job_id from job_info where is_active='Y'");

			
			ResultSet rs =stmtt.executeQuery();
			
			while(rs.next())
			{
				%>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
						<td><a href="../tjsp/applyJob.jsp?jobid=<%=rs.getInt(7)%>">Apply</a></td>
					</tr>
				<%
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}%>
		</table>
	</section>
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

	<div class="modal fade bs-example-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Book Now</h4>
				</div>

				<div class="modal-body">
					<form action="#" id="contact-form">
						<div class="row">
							<div class="col-md-6">
								<input type="text" class="form-control"
									placeholder="Pick-up location" required>
							</div>

							<div class="col-md-6">
								<input type="text" class="form-control"
									placeholder="Return location" required>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<input type="text" class="form-control"
									placeholder="Pick-up date/time" required>
							</div>

							<div class="col-md-6">
								<input type="text" class="form-control"
									placeholder="Return date/time" required>
							</div>
						</div>
						<input type="text" class="form-control"
							placeholder="Enter full name" required>

						<div class="row">
							<div class="col-md-6">
								<input type="text" class="form-control"
									placeholder="Enter email address" required>
							</div>

							<div class="col-md-6">
								<input type="text" class="form-control"
									placeholder="Enter phone" required>
							</div>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="section-btn btn btn-primary">Book
						Now</button>
				</div>
			</div>
		</div>
	</div>

	<!-- SCRIPTS -->
	<script src="../tjs/jquery.js"></script>
	<script src="../tjs/bootstrap.min.js"></script>
	<script src="../tjs/owl.carousel.min.js"></script>
	<script src="../tjs/smoothscroll.js"></script>
	<script src="../tjs/custom.js"></script>

</body>
</html>