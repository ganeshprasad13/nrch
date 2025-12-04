<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
int fla ;
String id="";
String fileid="";
String refid = "";
int status = 0;
//getting current ts in ms
Calendar calNow = Calendar.getInstance();
long lTime = calNow.getTimeInMillis();
String strTime = Long.toString(lTime);
strTime = strTime + session.getId();
id = request.getParameter("id");
fileid = request.getParameter("fileid");
refid = request.getParameter("refid");		
//insert data into table for creating a new section
String updateinfo;
updateinfo = "delete from CMS_DIRECT_FILE where DDF_ID = " + fileid ;
dbBean.setQuery(updateinfo);
dbBean.go1();
String returnurl = "section_direct_edit.jsp?refid="+refid+"&id="+id;
String actype = "1";
String acmsg = "DirectContentEdit";
String acdescription = "<hr>"+request.getParameter("description0")+"<hr> edited  under parent "+request.getParameter("path");
String acSqlQuery = updateinfo;%>
<%@ include file="../createlog.jsp"%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>
