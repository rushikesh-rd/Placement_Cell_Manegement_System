<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Login Home</title>
<%

HttpSession httpSession=request.getSession(false);

if(httpSession==null || "".equals(httpSession))
{
	response.sendRedirect("jsp/login.jsp");
}
Object obj = httpSession.getAttribute("name");
String name = obj.toString();
Object obj1 = httpSession.getAttribute("admin");
String admin="";
if(obj1==null || "".equals(obj1)){obj1="N";}else{admin =obj1.toString();}
if(name ==null || "".equals(name)){name="";}

%>
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

</head>
<body>
<!-- MENU NavBar-->
	<section class="navbar custom-navbar navbar-fixed-top"
		role="navigation">
		<div class="container">

			<div class="navbar-header">
				<button class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon icon-bar"></span> <span class="icon icon-bar"></span>
					<span class="icon icon-bar"></span>
				</button>

				<!-- lOGO TEXT HERE -->
				<a href="#" class="navbar-brand">Placement Cell</a>
			</div>

			<!-- MENU LINKS -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-nav-first">
					
					<li class="active"><a ><%=name %></a></li>
					<li><a href="../tjsp/index.jsp">Home</a></li>
					
					<li><a href="../tjsp/about-us.jsp">About Us</a></li>
					
					<%if("Y".equals(admin)){ %>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Admin <span class="caret"></span></a>

						<ul class="dropdown-menu">
							<li><a href="../tjsp/addjobs.jsp">Add Jobs</a></li>
							<li><a href="../tjsp/editjobs.jsp">Listed Jobs on Portal</a></li>
							<li><a href="../tjsp/approvestudents.jsp">Approve Students</a></li>
							<li><a href="../tjsp/seeeditreports.jsp">All registered students</a></li>
							<!-- <li><a href="../tjsp/sendnotification.jsp">Send Notification</a></li> -->
							<li><a href="../tjsp/approveJobs.jsp">Approve Jobs</a></li>
						</ul>
					</li>
					<% }else if(admin==null || "".equals(admin)){%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Student <span class="caret"></span></a>
							
						<ul class="dropdown-menu">
							<li><a href="../tjsp/studentprofile.jsp">Profile</a></li>
							<li><a href="../tjsp/editstudentprofile.jsp">Edit Profile</a></li>
							<li><a href="../tjsp/studentappliedjobs.jsp">Applied Jobs</a></li>
							<li><a href="../tjsp/seenotification.jsp">Notification</a></li>
						</ul>
						<li><a href="../tjsp/job-listing.jsp">Jobs</a></li>
					</li>
					<%}if(name!=null && !"".equals(name))
					{
						%><li><a href="../jsp/logout.jsp">Logout</a></li><%
					}%>

					
				</ul>
			</div>

		</div>
	</section>

</body>
</html>