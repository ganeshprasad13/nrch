<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>

<%
String query1;
String side = "0";
String strBackUrl = request.getParameter("backUrl");
int intLength = strBackUrl.lastIndexOf("&msg=");
if (intLength<0) {
	intLength = strBackUrl.length();
}
strBackUrl = strBackUrl.substring(0,intLength);

if (request.getParameter("idval") != null){
String[] side_t = request.getParameterValues("idval");

for (int m=0;m<(side_t.length);m++)  {
side = side_t[m];
query1 = "delete from CMS_SECTION_MANAGEMENT where DSM_ID="+side;
dbBean.setQuery(query1);
dbBean.go1();
		}
	}

//String returnurl = "map_banner.jsp?id="+request.getParameter("bid")+"&msg=Selected%20Section%20Maped%20To%20Banner";
%>

<%@ include file="../../dbConn/dbClose.jsp" %>
<%//=strBackUrl%><br>
<%//=intLength%>

<script language="JavaScript">
window.location = "<%=strBackUrl%>&msg=Section%20deleted";
</script>
<!--- <a href="javascript:history.back()">Go Back</a> --->