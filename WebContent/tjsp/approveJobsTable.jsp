<%@page import="java.sql.ResultSet" %>
  <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.sql.DriverManager" %>
      <%@page import="java.sql.Connection" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
          <!DOCTYPE html>
          <html>

          <head>
            <style>
              #customers {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
              }

              #customers td,
              #customers th {
                border: 1px solid #ddd;
                padding: 8px;
              }

              #customers tr:nth-child(even) {
              
                background-color: #f2f2f2;
              }

              #customers tr:hover {
                background-color: #ddd;
              }

              #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #04AA6D;
                color: white;
              }
            </style>
          </head>

          <body>

            
              <% Connection con=null; 
              PreparedStatement stmtt=null;
              try 
              {
            	Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_cell_db", "root" , "root");
                stmtt=con.prepareStatement( "select stinfo.name,jobinfo.company_name,jobinfo.job_profile,jobinfo.job_skil,jobinfo.job_description,jobinfo.job_location,jobinfo.job_package,apjob.is_approved,apjob.pk_applied_jobs from applied_jobs apjob join student_info stinfo on apjob.fk_roll_no=stinfo.pk_roll_no join job_info jobinfo on jobinfo.pk_job_id=apjob.fk_job_id where apjob.is_active='Y' and stinfo.is_active='Y' and jobinfo.is_active='Y'"
                ); 
                ResultSet rs=stmtt.executeQuery(); 
                while(rs.next()) 
                { %>
              <table id="customers">
              <tr>
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
                  <td><a href="../tjsp/jobApproval.jsp?apjobid=<%=rs.getInt(9)%>">Approve</a>
                  </td>
                </tr>
                <% 
                }
                } 
              catch (Exception e) 
              { 
            	  e.printStackTrace(); 
              }
              finally 
              { 
            	  con.close(); stmtt.close(); 
              }%>

            </table>

          </body>

          </html>