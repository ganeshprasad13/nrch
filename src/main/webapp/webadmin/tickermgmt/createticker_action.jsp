<%@ include file="../../dbConn/dbInit.jsp" %>
<%

String strLabel = "";
String strContent = "";
String isActive = "0";
if(request.getParameter("txtTickerLabel") != null){
	strLabel = request.getParameter("txtTickerLabel").replaceAll("'","''");
}
if( request.getParameter("txtcontent")!= null){
	strContent =  request.getParameter("txtcontent").replaceAll("'","''");
}
if(request.getParameter("chkActive")!= null){
	isActive = request.getParameter("chkActive");
}
String strInsertSql = "";
	strInsertSql = "INSERT INTO CMS_TICKER (CT_CONTENT_HINDI, CT_CONTENT, CT_STATUS, CT_CREATED_BY, CT_CREATED_DATE) VALUES     ('"+strLabel+"','"+strContent+"',"+isActive+",'"+session.getAttribute("DBAusername")+"',now())";
	dbBean.setQuery(strInsertSql);
	dbBean.go1();

String returnurl = "ticker_management.jsp?msg=Ticker%20Updated";
//String nreturnurl=returnurl.subString(0,url.lastIndexOf("?");
String actype = "0";
String acmsg = "CreatednewTicker";
String acdescription = "Ticker updated";
String acSqlQuery = strInsertSql;
%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>