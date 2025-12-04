<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
	int done = 0;
	//check if  password is specified
	String strDept = "";
String []strDeptValues =request.getParameterValues("Department_id");
String strTemp = "";
for(int i=0;i<strDeptValues.length;i++){
	strTemp =strTemp +strDeptValues[i];
	strDept = strTemp;
	strTemp += ",";
}
	String updatepwd;
	String strNewPwd = "";
	if(request.getParameter("npwd") !=null && !request.getParameter("npwd").trim().equals("")){
		strNewPwd = request.getParameter("npwd");
	}
	if (strNewPwd.equals("")) {
		updatepwd = "UPDATE CMS_ADMIN_USER SET DAU_NAME = '" + request.getParameter("name") + "', DAU_EMAIL = '" + request.getParameter("email") + "',DEPT_ID='"+strDept+"', DAU_STATUS = " + request.getParameter("status") + " WHERE ";
		updatepwd = updatepwd +" DAU_ID = "+ request.getParameter("userId") ;
	} else {
		updatepwd = "UPDATE CMS_ADMIN_USER SET DAU_PASSWORD = '" + request.getParameter("npwd") + "' , DAU_NAME = '" + request.getParameter("name") + "',DEPT_ID='"+strDept+"', DAU_EMAIL = '" + request.getParameter("email") + "', DAU_STATUS = " + request.getParameter("status") + " WHERE ";
		updatepwd = updatepwd +" DAU_ID = "+ request.getParameter("userId") ;
	}
	dbBean.setQuery(updatepwd);
	dbBean.go1(); 
	
	
	String actype = "1";
	String acmsg = "EditAdminUser";
	String acdescription =  request.getParameter("userId") + " login for user  " +  request.getParameter("name") + " information updated";
	String acSqlQuery = updatepwd;
%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect("../home.jsp?msg=User%20updated");
}
%>