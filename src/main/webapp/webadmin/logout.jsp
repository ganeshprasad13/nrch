<%
response.setHeader( "Pragma", "no-cache" );
response.setHeader( "Cache-Control", "no-cache" );
response.setDateHeader( "Expires", 0 );
%>
<%@ include file="../dbConn/dbInit.jsp" %>
<% 
/*String strLogDetails="UPDATE CMS_LOGIN_DETAILS LAST_LOGOUT=NOW() WHERE USER_ID="+(String)session.getAttribute("DBAUserId")+"";
	dbBean.setQuery(strLogDetails);
	dbBean.go1();
*/
session.invalidate() ; 
%>
<%@ include file="../dbConn/dbClose.jsp" %>
<%
response.sendRedirect(strAppPath+"/webadmin/index.jsp?msg=You%20have%20successfully%20logged%20out");
/*out.print("<script>window.open('index.jsp?msg=You%20have%20successfully%20logged%20out','_self');</script>");*/
%>