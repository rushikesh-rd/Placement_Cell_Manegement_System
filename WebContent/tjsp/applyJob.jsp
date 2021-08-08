<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String contextpath=request.getContextPath(); %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%HttpSession httpSession=request.getSession(false);
String name=(String)httpSession.getAttribute("name");
String jobid= request.getParameter("jobid");

Boolean status=false;
Connection con=null;
PreparedStatement stmtt=null;
boolean data=false;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_cell_db", "root", "#rushikesh11");
	stmtt = con.prepareStatement("select pk_roll_no from student_info where name=?");
	stmtt.setString(1, name);			
	ResultSet rs =stmtt.executeQuery();
	
	while(rs.next())
	{
		stmtt = con.prepareStatement("select fk_roll_no from applied_jobs where fk_roll_no=? and fk_job_id=?");
		stmtt.setString(1, rs.getString(1));
		stmtt.setString(2, jobid);
		ResultSet rset = stmtt.executeQuery();
		while(rset.next())
		{
			data=true;
		}
		if(!data)
		{
			stmtt = con.prepareStatement("insert into applied_jobs(fk_roll_no,fk_job_id,is_approved,is_active) values(?,?,'N','Y')");
			stmtt.setString(1, rs.getString(1));
			stmtt.setString(2, jobid);
			int i=stmtt.executeUpdate();
			if(i>0)
			{
				status=true;
			}
		}
	}
}

catch (Exception e) {
	e.printStackTrace();
} finally {
	con.close();
	stmtt.close();
}
if(status)
{
	response.sendRedirect("job-listing.jsp?status=Y");
}
else
{
	response.sendRedirect("job-listing.jsp?status=N");
}
%>
</body>
</html>