<%@ taglib uri="http://jakarta.apache.org/taglibs/mailer-1.1" prefix="mt" %>
<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String DBAUserId = "";
if(session.getAttribute("DBAUserId") != null){
	DBAUserId = (String)session.getAttribute("DBAUserId");
}
String strUpdateUserQuery = "UPDATE CMS_ADMIN_USER  SET DAU_NAME='"+request.getParameter("name") + "',";
strUpdateUserQuery +=  " SECRET_QUESTION ='" +request.getParameter("question") + "',";
strUpdateUserQuery += " ANSWER ='" +request.getParameter("answer") + "',";
strUpdateUserQuery += " DAU_EMAIL ='" +request.getParameter("email") + "'";
strUpdateUserQuery +=  " WHERE DAU_ID = "+DBAUserId+"";
out.print(strUpdateUserQuery);
dbBean.setQuery(strUpdateUserQuery);
dbBean.go1();

	
String actype = "0";
String acmsg = "CreateAdminUser";
String acdescription =  request.getParameter("name") + " login for user  update profile";
String acSqlQuery = strUpdateUserQuery;

%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
response.sendRedirect("../home.jsp?msg=Profile updated successfully");
}
%>