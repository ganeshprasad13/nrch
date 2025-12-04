<%@ include file="../../dbConn/dbInit.jsp" %>
<%
	String id=request.getParameter("id");
	String openingDate = "";
	if(!id.equals("")){
		String strNotice = "SELECT 	DATE_FORMAT(TENDER_OPEN_DATE,'%d-%m-%Y'), TENDER_OPEN_TIME FROM CMS_TENDER_MASTER_NEW WHERE ID="+id+"";
		dbBean.setQuery(strNotice);
		String rsGetNotice[][] = dbBean.getResultSet();
		if(rsGetNotice.length > 0){
			openingDate = rsGetNotice[0][0]+"&nbsp;&nbsp;"+rsGetNotice[0][1];
			out.print(openingDate);
		}
		else{
			out.print("");
		}
	}else {
		out.print("");
	}
%>

<%@ include file="../../dbConn/dbClose.jsp" %>
