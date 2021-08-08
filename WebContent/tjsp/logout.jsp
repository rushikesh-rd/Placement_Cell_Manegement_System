<%HttpSession httpSession=request.getSession(false);
if(httpSession!=null && !"".equals(httpSession))
{
	response.sendRedirect("jsp/login.jsp");
}
httpSession.invalidate();%>