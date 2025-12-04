<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{%>

<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String strDiv ="",strDesc="";
if(request.getParameter("editId")!=null && request.getParameter("edit")!=null){
		strDiv = request.getParameter("Division");
		strDesc = request.getParameter("DivisionDescription");
		String strQuery = "UPDATE CMS_DIVISIONS SET CMSD_DIVISIONS='"+strDiv+"',CMSD_DESCRIPTION = '"+strDesc+"' WHERE CMSD_ID="+request.getParameter("editId")+"";
		//out.print(strQuery);
		dbBean.setQuery(strQuery);
		dbBean.go1();
		}
%>
	<%@ include file="../../dbConn/dbClose.jsp" %>
	<% 
		response.sendRedirect("manageDivisions.jsp?msg=Division%20Updated!");
}%>