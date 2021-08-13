package controler;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.RegistraionBean;
import beans.StatusBean;
import beans.UserHelp;
import helper.CommonHelper;

/**
 * Servlet implementation class ServletControler
 */
@WebServlet("/ServletControler")
public class ServletControler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletControler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action != null && !"".equals(action)) {
			if (action.equals("registration")) {
				RegistraionBean registraionBean = new RegistraionBean();
				registraionBean.setName(request.getParameter("name"));
				registraionBean.setEmail(request.getParameter("email"));
				registraionBean.setPhoneno(request.getParameter("phoneno"));
				registraionBean.setRollno(request.getParameter("rollno"));
				registraionBean.setUsername(request.getParameter("username"));
				registraionBean.setPassword(request.getParameter("password"));

				CommonHelper commonHelper = new CommonHelper();
				StatusBean statusBean = null;
				try {
					statusBean = commonHelper.userRegistration(registraionBean);
					if (statusBean.isStatus()) {
						response.sendRedirect("jsp/login.jsp?message=Registrtion Sucessfull wait for admin approval");
					} else {
						response.sendRedirect("jsp/registration.jsp?message=Registrtion Failed plz try again");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} 
			
			else if (action.equals("login")) {
				StatusBean bean = null;
				List list = new ArrayList();
				list.add(request.getParameter("username"));
				list.add(request.getParameter("password"));
				CommonHelper commonHelper = new CommonHelper();
				try {
					bean = commonHelper.checklogin(list);
					if (bean.isStatus() && "Y".equals(bean.getIsApproved())) 
					{
						HttpSession httpSession = request.getSession();
						httpSession.setAttribute("name", bean.getMessage());
						httpSession.setAttribute("admin", bean.getIsadmin());
						response.sendRedirect("tjsp/index.jsp");
					} else {
						response.sendRedirect("jsp/login.jsp?message=Invalid Username And Password");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} 
			
			
			else if (action.equals("contactus")) 
			{
				StatusBean bean = null;
				UserHelp help = new UserHelp();
				help.setName(request.getParameter("cname"));
				help.setEmail(request.getParameter("cemail"));
				help.setPhone(request.getParameter("cphone"));
				help.setMessage(request.getParameter("cmessage"));
				
				CommonHelper commonHelper = new CommonHelper();
				StatusBean statusBean = null;
				try {
					statusBean = commonHelper.userHelp(help);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (statusBean.isStatus()) {
					response.sendRedirect("jsp/succes.jsp");
				} else {
					response.sendRedirect("jsp/fail.jsp");
				}	
			}
			
			else if (action.equals("jobpost")) 
			{
				StatusBean bean = null;
				ArrayList list = new ArrayList();
				list.add(request.getParameter("companyname"));
				list.add(request.getParameter("jobprofile"));
				list.add(request.getParameter("jobskils"));
				list.add(request.getParameter("joblocation"));
				list.add(request.getParameter("jobpackage"));
				list.add(request.getParameter("jobdescription"));
				
				CommonHelper commonHelper = new CommonHelper();
				StatusBean statusBean = null;
				try {
					statusBean = commonHelper.jobPost(list);
					if (statusBean.isStatus())
					{
						response.sendRedirect("tjsp/addjobs.jsp?message=Job Added to the portal");
					} else {
						response.sendRedirect("tjsp/addjobs.jsp?message=Job Adding faild ");
					}	
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			else if(action.equals("notification"))
			{
				boolean status=false;
				
				String rollno = request.getParameter("rollno");
				String jobid = request.getParameter("jobid");
				String msg = request.getParameter("message");
				String name = request.getParameter("name");
				
				CommonHelper commonHelper=new CommonHelper();
				StatusBean bean=null;
				try {
					status = commonHelper.sendNotification(rollno,jobid,msg,name);
					if (status)
					{
						response.sendRedirect("tjsp/approveJobs.jsp?msg=Notification send sucessfully");
					} else {
						response.sendRedirect("tjsp/approveJobs.jsp?msg =failed");
					}	
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			}
			
			else if(action.equals("uprofile"))
			{
				boolean status=false;
				ArrayList list=new ArrayList();
				list.add(request.getParameter("rollno"));
				list.add(request.getParameter("name"));
				list.add(request.getParameter("email"));
				list.add(request.getParameter("contactno"));
				list.add(request.getParameter("hscmarks"));
				list.add(request.getParameter("gradmarks"));
				list.add(request.getParameter("pgmarks"));
				list.add(request.getParameter("gender"));
				list.add(request.getParameter("dob"));
				
				
				
				CommonHelper commonHelper=new CommonHelper();
				try {
					status = commonHelper.updateProfile(list);
					
					if (status)
					{
						response.sendRedirect("tjsp/editstudentprofile.jsp?msg=Data Upadated Sucessfully");
					} else {
						response.sendRedirect("tjsp/editstudentprofile.jsp?msg=Failed ");
					}	
				} 
			catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			}
		}
	}

}
