<%@ include file="../../dbConn/dbInit.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
String strMSG="";
String pubDesignation="";
String id= request.getParameter("id");
String refid = request.getParameter("refid");
String User = (String)session.getAttribute("DBAusername");

try {
	String strPubInfo = "";
			strPubInfo = "UPDATE CMS_DIRECT_CONTENT SET DDC_STATUS=3, DDC_MODIFIED_DATE=NOW(),DDC_MODIFIED_BY='"+User+"' WHERE DDC_IDENTIFIER = '" + refid + "'";
			dbBean.setQuery(strPubInfo);
			dbBean.go1();
			String actype = "1";
			String acmsg = "DirectContentDelete";
			String acdescription =  session.getAttribute("DBAUserId") + " login for DirectContentDelete ";
			String acSqlQuery = strPubInfo;
			%>
			<%@ include file="../createlog.jsp" %>
			<%
			strMSG = "Record Deleted Successfully";
}catch (Exception ex) {
	out.println("Found some error : "+ex);
	strMSG = "Found Some Error";
}
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% response.sendRedirect("section_direct.jsp?msg="+strMSG+"&id="+id+"");%>