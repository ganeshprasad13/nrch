<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String query;

query = "UPDATE CMS_INCLUDE_SECTION SET DIS_BODY ='"+ request.getParameter("description0")+"' WHERE DIS_ID ="+request.getParameter("id0");
out.print(query);
dbBean.setQuery(query);
dbBean.go1();

query = "UPDATE CMS_INCLUDE_SECTION SET DIS_BODY ='"+ request.getParameter("description1")+"' WHERE DIS_ID ="+request.getParameter("id1");
out.print(query);
dbBean.setQuery(query);
dbBean.go1();

String returnurl = "manage_footer.jsp?msg=Footer%20Updated.";
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>