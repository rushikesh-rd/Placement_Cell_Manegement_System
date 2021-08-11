package helper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.RegistraionBean;
import beans.StatusBean;
import beans.UserHelp;
import dao.CommonDao;

public class CommonHelper {

	public StatusBean userRegistration(RegistraionBean registraionBean) throws SQLException {
		// TODO Auto-generated method stub
		StatusBean bean = new StatusBean();
		if (registraionBean.getName() != null && !"".equals(registraionBean.getName())
				&& registraionBean.getEmail() != null && !"".equals(registraionBean.getEmail())
				&& registraionBean.getPhoneno() != null && !"".equals(registraionBean.getPhoneno())
				&& registraionBean.getRollno() != null && !"".equals(registraionBean.getRollno())
				&& registraionBean.getUsername() != null && !"".equals(registraionBean.getUsername())
				&& registraionBean.getPassword() != null && !"".equals(registraionBean.getPassword())) {
			CommonDao commonDao = new CommonDao();
			bean = commonDao.userRegistration(registraionBean);
			bean.setStatus(false);
			if (bean != null && !"".equals(bean)) {
				bean.setStatus(true);
			}
		} else {
			bean.setStatus(false);
		}
		return bean;
	}

	public StatusBean checklogin(List list) throws SQLException {
		// TODO Auto-generated method stub
		StatusBean bean = new StatusBean();
		if (list != null && !"".equals(list) && list.get(0) != null && !"".equals(list.get(0)) && list.get(1) != null
				&& !"".equals(list.get(1))) {
			CommonDao commonDao = new CommonDao();
			bean = commonDao.checklogin(list);
		} else {
			bean.setStatus(false);
		}
		return bean;
	}

	public StatusBean userHelp(UserHelp help) throws SQLException {
		// TODO Auto-generated method stub
		StatusBean statusBean = new StatusBean();
		if (help.getName() != null && !"".equals(help.getName()) 
				&& help.getEmail() != null && !"".equals(help.getEmail()) 
				&& help.getPhone() != null && !"".equals(help.getPhone())
				&& help.getMessage() != null && !"".equals(help.getMessage())) {
			CommonDao commonDao = new CommonDao();
			statusBean = commonDao.userHelp(help);
			statusBean.setStatus(false);
			if(statusBean != null && !"".equals(statusBean)) 
			{
				statusBean.setStatus(true);
			}
		}
		else 
		{
			statusBean.setStatus(false);
		}
		
		return statusBean;
	}

	public StatusBean jobPost(ArrayList list) throws SQLException {
		// TODO Auto-generated method stub
		StatusBean statusBean = new StatusBean();
		if (list != null && !"".equals(list) && list.get(0) != null && !"".equals(list.get(0)) 
				&& list.get(1) != null && !"".equals(list.get(1)) 
				&& list.get(2) != null && !"".equals(list.get(2))
				&& list.get(3) != null && !"".equals(list.get(3))
				&& list.get(4) != null && !"".equals(list.get(4))
				&& list.get(5) != null && !"".equals(list.get(5)) ) 
		{
			CommonDao commonDao = new CommonDao();
			statusBean = commonDao.jobPost(list);
		}
		else
		{
			statusBean.setStatus(false);
		}
		return statusBean;
	}

	public boolean sendNotification(String rollno,String jobid,String msg,String name) throws SQLException
	{
		boolean status = false;
		if (rollno != null && !"".equals(rollno) 
				&& jobid != null && !"".equals(jobid) 
				&& msg != null && !"".equals(msg)
				&& name!=null && !"".equals(name)) 
		{
			CommonDao commonDao = new CommonDao();
			status = commonDao.sendNotification(rollno,jobid,msg,name);
		}
		return status;
	}

	public boolean updateProfile(ArrayList list) throws SQLException
	{
		//StatusBean statusBean = new StatusBean();
		boolean status = false;
		if (list != null && !"".equals(list) && list.get(0) != null && !"".equals(list.get(0)) 
				&& list.get(1) != null && !"".equals(list.get(1)) 
				&& list.get(2) != null && !"".equals(list.get(2))
				&& list.get(3) != null && !"".equals(list.get(3))
				&& list.get(4) != null && !"".equals(list.get(4))
				&& list.get(5) != null && !"".equals(list.get(5))
				&& list.get(6) != null && !"".equals(list.get(6))
				&& list.get(7) != null && !"".equals(list.get(7))
				&& list.get(8) != null && !"".equals(list.get(8))) 
			
		{
			CommonDao commonDao = new CommonDao();
			status = commonDao.updateStudentProfile(list);
		}
		// TODO Auto-generated method stub
		return status;
	}

}
