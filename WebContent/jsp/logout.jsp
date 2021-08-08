<%String contextpath=request.getContextPath();
HttpSession httpSession=request.getSession(false);
if(httpSession!=null && !"".equals(httpSession))
{
	httpSession.invalidate();
}
response.sendRedirect("index.jsp");
%>