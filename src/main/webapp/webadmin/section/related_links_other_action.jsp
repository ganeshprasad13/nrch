<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%

//insert data into table for creating a new section
String acmore = "";
String acSqlQuery1 ="";


String section = "INSERT INTO CMS_RELATED_LINKS ";
section = section + "(CRL_LABEL, CRL_URL, CRL_STATUS,";
section = section + "CRL_LANG, CRL_CREATED_BY,CRL_CREATED_DATE) VALUES ";
section = section + "( '"+request.getParameter("label0").replaceAll("'","&#39")+"', '"+request.getParameter("linkurl").replaceAll("'","&#39")+"',1,";
section = section + "0, '"+session.getAttribute("DBAusername")+"',now())";
acSqlQuery1 = section;
dbBean.setQuery(section);
dbBean.go1();

Vector getinfo = new Vector();
String query_info;
query_info = "SELECT MAX(CRL_ID) FROM CMS_RELATED_LINKS WHERE ";
query_info = query_info + " CRL_LABEL = '"+request.getParameter("label0").replaceAll("'","&#39")
+"' and CRL_URL='"+request.getParameter("linkurl").replaceAll("'","&#39")+"'";
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go(); 



section = "INSERT INTO CMS_RELATED_LINKS ";
section = section + "(CRL_LABEL, CRL_URL, CRL_STATUS,";
section = section + "CRL_LANG, CRL_CREATED_BY,CRL_parent_id,CRL_CREATED_DATE) VALUES ";
section = section + "( '"+request.getParameter("label1").replaceAll("'","&#39")+"', '"+request.getParameter("linkurl").replaceAll("'","&#39")+"',1,";
section = section + "1, '"+session.getAttribute("DBAusername")+"',"+dbBean.getcell(getinfo,0,0)+",now())";
acSqlQuery1 += "<hr>"+section;
dbBean.setQuery(section);
dbBean.go1();




String returnurl = "related_links_other.jsp?msg=Related%20Other%20Site%20Link%20created";

String actype = "0";
String acmsg = "RelatedLinkOtherCreate";
String acdescription = "<hr>"+request.getParameter("linkurl")+" - "+request.getParameter("label0")+"<hr> created";
String acSqlQuery = acSqlQuery1;
%>
<%@ include file="../createlog.jsp"%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>