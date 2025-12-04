<%@ include file="../../dbConn/dbInit.jsp" %>
<%
	String id=request.getParameter("id");
	String openingDate = "";
	if(!id.equals("")){
		String strNotice = "SELECT 	DATE_FORMAT(T_BID_OPEN_DATE,'%d-%m-%Y'), DATE_FORMAT(T_BID_OPEN_DATE,'%H:%i') FROM CMS_NOTICE_MASTER_NEW WHERE T_ID="+id+"";
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
