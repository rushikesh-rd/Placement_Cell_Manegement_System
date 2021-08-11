<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Long jobid = new Long(request.getParameter("jobid"));
	%>
	<%
	Connection con = null;
	PreparedStatement stmtt = null;
	boolean status = false;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_cell_db", "root", "root");
		stmtt = con.prepareStatement("update job_info set is_active='N' where pk_job_id=?");
		stmtt.setLong(1,jobid);

		int i = stmtt.executeUpdate();

		if (i > 0) {
			status = true;
		}
	}

	catch (Exception e) {
		e.printStackTrace();
	} finally {
		con.close();
		stmtt.close();

		if (status) {
			response.sendRedirect("editjobs.jsp?msg=Record Sucessfully Deleted");
		} else {
			response.sendRedirect("editjobs.jsp?msg=Failed ");
		}
	}
	%>
</body>
</html>