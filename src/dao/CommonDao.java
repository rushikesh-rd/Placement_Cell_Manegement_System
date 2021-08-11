package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.graalvm.compiler.core.GraalCompiler.Request;

import beans.RegistraionBean;
import beans.StatusBean;
import beans.UserHelp;
import dbconnection.JdbcConnection;


public class CommonDao {
	
	JdbcConnection jdbcObj = new JdbcConnection();
	
	String pattern = "dd/MM/yyyy HH:mm:ss";
	DateFormat df = new SimpleDateFormat(pattern);
	java.util.Date today = Calendar.getInstance().getTime();        
	String date = df.format(today);

	public StatusBean userRegistration(RegistraionBean registraionBean) throws SQLException {

		Connection con = jdbcObj.getConnection();
		StatusBean bean=new StatusBean();
		PreparedStatement stmtt = null;
		try {
			stmtt = con.prepareStatement(
					"insert into student_info(pk_roll_no,name,email,mobile_no,username,password,is_active,is_approved) values(?,?,?,?,?,?,'Y','N')");

			stmtt.setInt(1, Integer.valueOf(registraionBean.getRollno()));
			stmtt.setString(2, registraionBean.getName());
			stmtt.setString(3, registraionBean.getEmail());
			stmtt.setString(4, (registraionBean.getPhoneno()));
			stmtt.setString(5, registraionBean.getUsername());
			stmtt.setString(6, registraionBean.getPassword());
			int i=stmtt.executeUpdate();
			bean.setStatus(false);
			if(i>0)
			{
				bean.setStatus(true);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			stmtt.close();
		}
		return bean;
	}

	public StatusBean checklogin(List list) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = jdbcObj.getConnection();
		StatusBean bean=new StatusBean();
		PreparedStatement stmtt = null;
		try {
			stmtt = con.prepareStatement(
					"select name,is_admin,is_approved from student_info where username=? and password=?");

			stmtt.setString(1, (String) list.get(0));
			stmtt.setString(2, (String) list.get(1));
			ResultSet rs =stmtt.executeQuery();
			bean.setStatus(false);
			if(rs.next())
			{
				bean.setStatus(true);
				bean.setMessage(rs.getString(1));
				bean.setIsadmin(rs.getString(2));
				bean.setIsApproved(rs.getString(3));
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			stmtt.close();
		}
		return bean;
	}

	public StatusBean userHelp(UserHelp help) throws SQLException {
		Connection con = jdbcObj.getConnection();
		StatusBean bean=new StatusBean();
		PreparedStatement stmtt = null;
		try {
			String query="insert into contact_us(name,email,mobile_no,message,updated_time) values(?,?,?,?,?)";
			stmtt = con.prepareStatement(query);
			

			stmtt.setString(1, help.getName());
			stmtt.setString(2, help.getEmail());
			stmtt.setString(3, help.getPhone());
			stmtt.setString(4, help.getMessage());
			stmtt.setString(5, date);
			
			
			int i=stmtt.executeUpdate();
			bean.setStatus(false);
			if(i>0)
			{
				bean.setStatus(true);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			stmtt.close();
		}
		return bean;
	}

	public StatusBean jobPost(ArrayList list) throws SQLException {
		Connection con = jdbcObj.getConnection();
		StatusBean bean=new StatusBean();
		PreparedStatement stmtt = null;
		try {
			String query="insert into job_info(job_profile,job_skil,job_description,job_location,job_package,company_name,is_active) values(?,?,?,?,?,?,'Y')";
			stmtt = con.prepareStatement(query);
			
			stmtt.setString(1, (String) list.get(1));
			stmtt.setString(2, (String) list.get(2));
			stmtt.setString(3, (String) list.get(5));
			stmtt.setString(4, (String) list.get(3));
			stmtt.setString(5, (String) list.get(4));
			stmtt.setString(6, (String) list.get(0));
			
			
			
			int i=stmtt.executeUpdate();
			bean.setStatus(false);
			if(i>0)
			{
				bean.setStatus(true);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			stmtt.close();
		}
		return bean;	
	}
	
	public Map getJobDetails() throws SQLException
	{
		// TODO Auto-generated method stub
				Map map = new HashMap();
				List listt = new ArrayList();
				int counter = 0;
				Connection con = jdbcObj.getConnection();
				StatusBean bean=new StatusBean();
				PreparedStatement stmtt = null;
				try {
					stmtt = con.prepareStatement(
							"select job_profile,job_skil,job_description,job_location,job_package,conpany_name,pk_job_id from job_info where is_acctive='Y'");

					
					ResultSet rs =stmtt.executeQuery();
					
					if(rs.next())
					{
						listt.add(rs.getString(1));
						listt.add(rs.getString(2));
						listt.add(rs.getString(3));
						listt.add(rs.getString(4));
						listt.add(rs.getString(5));
						listt.add(rs.getString(6));
						listt.add(rs.getString(7));	
						map.put(counter, listt);
						counter++;
					}
				
				}

				catch (Exception e) {
					e.printStackTrace();
				} finally {
					con.close();
					stmtt.close();
				}
				return map;
	}
	
	public Boolean applyJob(String jobid,String name) throws SQLException
	{
		Connection con = jdbcObj.getConnection();
		StatusBean bean=new StatusBean();
		Boolean status=false;
		PreparedStatement stmtt = null;
		try {
			stmtt = con.prepareStatement("select pk_roll_no from student_info where name=?");
			stmtt.setString(1, name);			
			ResultSet rs =stmtt.executeQuery();
			
			if(rs.next())
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

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			stmtt.close();
		}
		return status;
	}

	public Boolean sendNotification(String rollno,String jobid,String msg,String name) throws SQLException {
		//S TODO Auto-generated method stub
		Connection con = jdbcObj.getConnection();
		StatusBean bean=new StatusBean();
		Boolean status=false;
		PreparedStatement stmtt = null;
		try {
			stmtt = con.prepareStatement("insert into notification(notification,roll_no,job_id,is_active,name) values(?,?,?,'Y',?)");
			stmtt.setString(1, msg);
			stmtt.setLong(2, Long.valueOf(rollno));
			stmtt.setLong(3, Long.valueOf(jobid));
			stmtt.setString(4, name);
			int rs =stmtt.executeUpdate();
			if(rs>0)
			{
				status=true;
			}
		
		}

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			stmtt.close();
		}
		return status;

	}

	public boolean updateStudentProfile(ArrayList list) throws SQLException
	{Connection con = jdbcObj.getConnection();
	//StatusBean bean=new StatusBean();
	boolean status = false;
	PreparedStatement stmtt = null;
	
	int pk_roll_no=Integer.parseInt((String) list.get(0));

	
	try {
		stmtt = con.prepareStatement("update student_info set name=?,email=?,mobile_no=?,hsc_mark=?,grad_marks=?,pg_marks=?,gender=?,dob=? where is_active='Y' and pk_roll_no='"+pk_roll_no+"' ");
		stmtt.setString(1, (String) list.get(1));
		stmtt.setString(2, (String) list.get(2));
		stmtt.setString(3, (String) list.get(3));
		stmtt.setInt(4, Integer.parseInt((String)list.get(4)));
		stmtt.setInt(5, Integer.parseInt((String)list.get(5)));
		stmtt.setInt(6, Integer.parseInt((String)list.get(6)));
		stmtt.setString(7, (String) list.get(7));
		stmtt.setString(8, (String) list.get(8));
		
		int i=stmtt.executeUpdate();
		
		if(i>0)
		{
			status = true;
		}
	}

	catch (Exception e) {
		e.printStackTrace();
	} finally {
		con.close();
		stmtt.close();
	}
	return status;
		// TODO Auto-generated method stub
	}

	
}
