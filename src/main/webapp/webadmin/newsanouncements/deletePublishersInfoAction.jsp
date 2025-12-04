<%@ include file="../../dbConn/dbInit.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
String strMSG="";
String pubDesignation="";
String pubSign="";
String officerId = request.getParameter("officerId");
String User = (String)session.getAttribute("DBAusername");

try {
	String strPubInfo = "";
	boolean flag = true;
		strPubInfo = "SELECT * FROM CMS_DIRECT_CONTENT WHERE DDC_OFFICER_ID = "+officerId+" AND DDC_END_DATE > NOW()";
		Vector officerDetails = new Vector();
		dbBean.setQuery(strPubInfo);
		officerDetails=(Vector)dbBean.go();
		if(officerDetails.size()>0){
			flag = false;
		}
		if(flag){
			strPubInfo = "UPDATE CMS_PRESS_PUBLISHER_INFO SET STATUS='DeActive', PUB_MODIFY_ON=NOW(),PUB_MODIFY_BY='"+User+"' WHERE ID="+officerId+"";
			dbBean.setQuery(strPubInfo);
			dbBean.go1();
			String actype = "1";
			String acmsg = "DeletePublisherInfo";
			String acdescription =  session.getAttribute("DBAUserId") + " login for delete Publisher Officer information ";
			String acSqlQuery = strPubInfo;
			%>
			<%@ include file="../createlog.jsp" %>
			<%
			strMSG = "Record Deleted Successfully";
	}else{
		strMSG = "1";
	}
}catch (Exception ex) {
	out.println("Found some error : "+ex);
	strMSG = "Found Some Error";
}
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% response.sendRedirect("addPublishersInfo.jsp?strMSG="+strMSG+"");%>