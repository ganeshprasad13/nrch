<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String query;

query = "UPDATE CMS_INCLUDE_CONTENT SET DIC_BODY ='"+ request.getParameter("description0")+"' WHERE DIC_ID ="+request.getParameter("id0");
out.print(query);
dbBean.setQuery(query);
dbBean.go1();

String str = request.getParameter("description1");
//str = new  String(str.getBytes("ISO-8859-1"),"UTF-8"); 
query = "UPDATE CMS_INCLUDE_CONTENT SET DIC_BODY =N'"+ str +"' WHERE DIC_ID ="+request.getParameter("id1");
out.print(query);
dbBean.setQuery(query);
dbBean.go1();

String returnurl = "manage_rights.jsp?msg=Right%20Updated.";
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>