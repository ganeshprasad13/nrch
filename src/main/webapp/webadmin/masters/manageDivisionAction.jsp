<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%

String Division = request.getParameter("Division");
String DivisionDescription = request.getParameter("DivisionDescription");

					String strACLDetails = "INSERT INTO CMS_DIVISIONS  (CMSD_DIVISIONS, CMSD_DESCRIPTION,CMSD_CBY,CMSD_CDATE) VALUES ('"+Division+"','"+DivisionDescription+"','"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					
%>
	<%@ include file="../../dbConn/dbClose.jsp" %>
	<% 
		response.sendRedirect("manageDivisions.jsp?msg=Division%20Added!");
}
%>