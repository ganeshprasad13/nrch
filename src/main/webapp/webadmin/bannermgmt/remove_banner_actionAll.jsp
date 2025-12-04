<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String query1;
String strBid = "";
String side = "0";
String strIds = "";
String[] strBids = request.getParameterValues("chkRemove");
if(strBids.length>0){
	strBid = strBids[0];
	for(int i=0;i<strBids.length;i++){
		strIds = strIds + strBids[i]+",";
	}
}
strIds = strIds.substring(0,strIds.length()-1);
//out.print(strIds);

query1 = "delete from  CMS_MAP_BANNER WHERE DMB_ID IN("+strIds+")";
dbBean.setQuery(query1);
dbBean.go1();


String returnurl = "remove_banner.jsp?id="+strBid+"&msg=Banner%20Removed.";
String actype = "3";
String acmsg = "RemoveBannerMapping";
String acdescription = strIds + " banner mapping removed ";
String acSqlQuery = query1;
%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>