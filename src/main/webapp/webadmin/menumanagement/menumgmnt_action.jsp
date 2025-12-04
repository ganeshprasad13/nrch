<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
	String strDSMs = "0,";
	String strQuery = "";
	String strselSort = "100";
	strQuery = "UPDATE CMS_SECTION_MANAGEMENT SET DSM_HEADER_FLAG = 0";
	dbBean.setQuery(strQuery);
	dbBean.go1();
	if(request.getParameterValues("chkDSMIDs")!= null){
		String strDSMIDs[] = request.getParameterValues("chkDSMIDs");
		//out.print(strDSMIDs.length+"<br>");
		if(strDSMIDs.length>0){
			for(int i=0;i<strDSMIDs.length;i++){
				strselSort = request.getParameter("selSort_"+strDSMIDs[i]);
				if(strselSort ==null || strselSort.equals("")) strselSort = "100";
				strDSMs += strDSMIDs[i]+",";
				strQuery = "UPDATE CMS_SECTION_MANAGEMENT SET DSM_HEADER_FLAG = 1,DSM_MENU_SORTING = "+strselSort+" WHERE DSM_ID ="+strDSMIDs[i];
				dbBean.setQuery(strQuery);
				dbBean.go1();
			}
			
		}
		strDSMs += "0";
		//out.print(strDSMs);
		//DSM_MENU_SORTING
		
	}
%>

<%@ include file="../../dbConn/dbClose.jsp" %>
<% 

response.sendRedirect("menumgmnt.jsp?msg=Menu %20information%20stored");

%>