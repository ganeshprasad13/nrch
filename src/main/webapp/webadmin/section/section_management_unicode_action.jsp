<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%

String str = request.getParameter("description1");

str = new  String(str.getBytes("ISO-8859-1"),"UTF-8"); 

String updateinfo = "INSERT INTO test(description)VALUES (N'"+str+"')";
dbBean.setQuery(updateinfo);
dbBean.go1();

out.print(updateinfo+"<>");

String query = "select description from test order by id desc";
dbBean.setQuery(query);
Vector rs = new Vector();
rs = (Vector)dbBean.go();

out.print("<font face='AcrutiOfficePriya'"+dbBean.getcell(rs,0,0));
%>

<%@ include file="../../dbConn/dbClose.jsp" %>

<% 
	//response.sendRedirect(returnurl);
%>