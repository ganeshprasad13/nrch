<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{%>

<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String strMSG = "",strQuery="",strDivision="",strDept="",strDesc="",strID=request.getParameter("editId");
if(strID!=null && request.getParameter("edit")!=null){
		strDivision = request.getParameter("DivisionId");
		strDept = request.getParameter("Department");
		strDesc = request.getParameter("DepartmentDescription");
		strQuery = "UPDATE CMS_DEPARTMENTS SET CMSDEPT_NAME='"+strDept+"',CMSDEPT_DESC = '"+strDesc+"',CMSDEPT_CMSD_ID= '"+strDivision+"' WHERE CMSDEPT_ID="+strID+"";
		//out.print(strQuery);
		dbBean.setQuery(strQuery);
		dbBean.go1();
		}
%>
	<%@ include file="../../dbConn/dbClose.jsp" %>
	<% 
		response.sendRedirect("manageDepartments.jsp?msg=Department%20Updated!");
}%>