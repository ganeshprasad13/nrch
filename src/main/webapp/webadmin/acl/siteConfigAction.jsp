<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%

String description0 = request.getParameter("description0");
String description1 = request.getParameter("description1");
String strMSG="";

String strAllSQL = "";
PreparedStatement ps= null;
try{
		String query = "update cms_intro_text SET intro_english= ? , intro_hindi = ? WHERE id=1 ";
		ps= cn.prepareStatement(query);
		ps.setString(1,description0);
		ps.setString(2,description1);
		ps.executeUpdate();
		strMSG = "3";
}catch(Exception ex){
	ex.printStackTrace();
	strMSG="2";
}
			String actype = "1";
			String acmsg = "SiteConfiguration";
			String acdescription =  session.getAttribute("DBAusername") + " Site Configuration updated";
			String acSqlQuery = strAllSQL;
			%>
			
		<%@ include file="../createlog.jsp" %>
		<%@ include file="../../dbConn/dbClose.jsp" %>
		<% 
		response.sendRedirect("siteConfig.jsp?strMSG="+strMSG);
	}%>