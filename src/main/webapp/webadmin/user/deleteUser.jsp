<%@ include file="../../dbConn/dbInit.jsp" %>

<% // For delete User
String strComMess ="";

	if(request.getParameter("action") != null && request.getParameter("action").equals("del")){
		String userId = request.getParameter("userId");
		String strTenderDelete = "delete from cms_admin_user WHERE DAU_ID ="+userId+"";
		dbBean.setQuery(strTenderDelete);
		dbBean.go1();
		strComMess = "User Deleted Successfully";
	String actype = "0";
	String acmsg = "DeleteUser";
	String acdescription =  session.getAttribute("DBAusername") + " login for add delete user ";
	String acSqlQuery = strTenderDelete;
	%>
	<%@ include file="../createlog.jsp" %>
<%}%>

<%@ include file="../../dbConn/dbClose.jsp" %>
<%
	response.sendRedirect("manageUsers.jsp?strMSG="+strComMess);
%>