
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<!DOCTYPE html>
					<html lang="en">

					<head>
						<title>Approve Jobs</title>
						<meta charset="UTF-8">
						<meta http-equiv="X-UA-Compatible" content="IE=Edge">
						<meta name="description" content="">
						<meta name="keywords" content="">
						<meta name="author" content="">
						<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

						<link rel="stylesheet" href="../tcss/bootstrap.min.css">
						<link rel="stylesheet" href="../tcss/font-awesome.min.css">
						<link rel="stylesheet" href="../tcss/owl.carousel.css">
						<link rel="stylesheet" href="../tcss/owl.theme.default.min.css">

						<script>
							function validateMessage(rollno)
							{
								var rollno = rollno;
								var approve = document.getElementById("approve_"+rollno).value;
								if(approve=="N")
								{
									alert("you have to approve first");
									return false;
								}
								return true;
							}
						</script>
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

					<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

						<!-- PRE LOADER -->
						<section class="preloader">
							<div class="spinner">
								<span class="spinner-rotate"></span>
							</div>
						</section>

						<%@ include file="header.jsp" %>
							<%String msg = request.getParameter("msg")!=null?request.getParameter("msg"):"";%>
							<div><%=msg %></div>
							<section>
								<table id="customerss">
									<tr>
										<th>Roll_No</th>
										<th>Name</th>
										<th>Company Name</th>
										<th>Job Profile</th>
										<th>Job Skill</th>
										<th>Job Description</th>
										<th>Job Location</th>
										<th>Job Package</th>
										<th>Approved</th>
										<th>Job Approve</th>
										<th>Send Message</th>
										
									</tr>
									<% Connection con=null; PreparedStatement stmtt=null; try {
									   Class.forName("com.mysql.cj.jdbc.Driver");
									   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_cell_db", "root", "root" );
									   stmtt=con.prepareStatement( "select stinfo.pk_roll_no,stinfo.name,jobinfo.company_name,jobinfo.job_profile,jobinfo.job_skil,jobinfo.job_description,jobinfo.job_location,jobinfo.job_package,apjob.is_approved,apjob.pk_applied_jobs from applied_jobs apjob join student_info stinfo on apjob.fk_roll_no=stinfo.pk_roll_no join job_info jobinfo on jobinfo.pk_job_id=apjob.fk_job_id where apjob.is_active='Y' and stinfo.is_active='Y' and jobinfo.is_active='Y'");
									   ResultSet rs=stmtt.executeQuery(); while(rs.next()) { %>
										<tr>
											<td>
												<%=rs.getString(1) %>
											</td>
											<td>
												<%=rs.getString(2) %>
											</td>
											<td>
												<%=rs.getString(3) %>
											</td>
											<td>
												<%=rs.getString(4) %>
											</td>
											<td>
												<%=rs.getString(5) %>
											</td>
											<td>
												<%=rs.getString(6) %>
											</td>
											<td>
												<%=rs.getString(7) %>
											</td>
											<td>
												<%=rs.getString(8) %>
											</td>
											<td>
												<%=rs.getString(9) %>
											</td>
												<td><a href="../tjsp/jobApproval.jsp?apjobid=<%=rs.getInt(10)%>" id="<%="approve_"+rs.getString(1) %>">Approve</a>
											</td>
												<td><a href="../tjsp/sendnotification.jsp?apjobid=<%=rs.getInt(10)%>&rollno=<%=rs.getString(1) %>&name=<%=rs.getString(2) %>" onclick="return validateMessage(<%=rs.getString(1) %>)">Send</a>
											</td>
											
										</tr>
										<% } } catch (Exception e) { e.printStackTrace(); }finally { con.close();
											stmtt.close(); }%>
								</table>
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