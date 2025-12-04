<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String query1;
String side = "0";

query1 = "delete from  CMS_MAP_BANNER WHERE DMB_ID =  "+request.getParameter("bid");
dbBean.setQuery(query1);
dbBean.go1();


String returnurl = "remove_banner.jsp?id="+request.getParameter("bid")+"&msg=Banner%20Removed.";

String actype = "3";
String acmsg = "RemoveBannerMapping";
String acdescription = request.getParameter("bid") + " banner mapping removed ";
String acSqlQuery = query1;
%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>