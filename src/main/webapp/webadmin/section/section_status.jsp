<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%


//insert data into table for creating a new section

String section = "UPDATE CMS_SECTION_MANAGEMENT ";
section = section + " SET DSM_STATUS="+request.getParameter("action");
section = section + " WHERE DSM_ID = "+request.getParameter("id")+" or DSM_PATH like  '%,"+request.getParameter("id")+",%'";
out.println(section);
dbBean.setQuery(section);
dbBean.go1();


String returnurl = "";
if (request.getParameter("action").equals("1")){
returnurl = "section_management.jsp?path="+request.getParameter("path")+"&parent="+request.getParameter("parent")+"&msg=Section%20Activated%20Successfully";
}else{
returnurl = "section_management.jsp?path="+request.getParameter("path")+"&parent="+request.getParameter("parent")+"&msg=Section%20De-activated%20Successfully";
}
%>
<% 
String actype = "2";
String acmsg = "StatusUpdate";
String acdescription = "Section "+request.getParameter("id")+" status changed under parent "+request.getParameter("path");
String acSqlQuery = "";
%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>

<%
	response.sendRedirect(returnurl);
%>