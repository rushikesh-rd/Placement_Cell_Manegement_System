<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String rollno=request.getParameter("rollno"); %>
<% 
	Connection con=null;
	PreparedStatement stmtt=null;
	boolean status=false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_cell_db", "root", "root");
			stmtt = con.prepareStatement(
					"update student_info set is_approved='Y' where pk_roll_no=?");
			stmtt.setString(1, rollno);
			
			int i =stmtt.executeUpdate();
			
			if(i>0)
			{
				status=true;
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	con.close();
	stmtt.close();
	
	if(status)
	{
		response.sendRedirect("approvestudents.jsp?msg=Student Approve Sucessfullyy!!!");
	}
}%>

</body>
</html>