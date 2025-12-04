<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%

String DivisionId = request.getParameter("DivisionId");
String Department = request.getParameter("Department");
String DepartmentDescription = request.getParameter("DepartmentDescription");

					String strACLDetails = "INSERT INTO CMS_GROUPS(CMSDEPT_CMSD_ID, CMSDEPT_NAME, CMSDEPT_DESC, CMSDEPT_CBY, CMSDEPT_CDATE) VALUES ("+DivisionId+",'"+Department+"','"+DepartmentDescription+"','"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					
%>
	<%@ include file="../../dbConn/dbClose.jsp" %>
	<% 
		response.sendRedirect("manageGroups.jsp?msg=Group%20Added!");
}
%>