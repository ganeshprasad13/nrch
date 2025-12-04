<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
	//insert data into table for creating a new section
	String acmore = "";
	String acSqlQuery1 = "";
	String section = "update CMS_RELATED_LINKS ";
	section = section + "set CRL_LABEL='"+request.getParameter("label0").replaceAll("'","&#39")+"', CRL_URL='"+request.getParameter("linkurl").replaceAll("'","&#39")+"',CRL_MODIFIED_BY='"+session.getAttribute("DBAusername")+"', CRL_MODIFIED_DATE=now() where CRL_ID = "+request.getParameter("id");
	acSqlQuery1 = section;
	dbBean.setQuery(section);
	dbBean.go1();
	
	
	section = "update CMS_RELATED_LINKS ";
	section = section + "set CRL_LABEL='"+request.getParameter("label0").replaceAll("'","&#39")+"', CRL_URL='"+request.getParameter("linkurl").replaceAll("'","&#39")+"',CRL_MODIFIED_BY='"+session.getAttribute("DBAusername")+"', CRL_MODIFIED_DATE=now() where CRL_parent_id = "+request.getParameter("id");
	acSqlQuery1 += "<hr>"+section;
	dbBean.setQuery(section);
	dbBean.go1();
	
	
	
	
	String returnurl = "related_links_other.jsp?msg=Related%20Other%20Site%20Link%20Updated";
	
	String actype = "1";
	String acmsg = "OtherRelatedLinksEdit";
	String acdescription = "<hr>"+request.getParameter("linkurl")+" - "+request.getParameter("label0")+"<hr> modified";
	String acSqlQuery = acSqlQuery1;
%>
<%@ include file="../createlog.jsp"%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>