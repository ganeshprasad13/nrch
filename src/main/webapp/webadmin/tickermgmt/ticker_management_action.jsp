<%@ include file="../../dbConn/dbInit.jsp" %>
 <meta http-equiv="Content-type" content="text/html" charset="utf-8">
<%
String updateTickerEntry = "";
String statusValue = "0";

	String strUpdateTickerStatus = "UPDATE CMS_TICKER set CT_STATUS = 0";
	dbBean.setQuery(strUpdateTickerStatus);
	dbBean.go1();
	String strDSMs = "";
	if(request.getParameterValues("chkTickerId")!= null){
		String strDSMIDs[] = request.getParameterValues("chkTickerId");
		if(strDSMIDs.length>0){
			for(int i=0;i<strDSMIDs.length;i++){
				strDSMs += strDSMIDs[i]+",";
				updateTickerEntry = "UPDATE CMS_TICKER set CT_STATUS = 1, CT_CONTENT = '"+request.getParameter("content-"+strDSMIDs[i]).replaceAll("'","''").replaceAll("\"","&#34;")+"',CT_CONTENT_HINDI = '"+request.getParameter("contenth-"+strDSMIDs[i]).replaceAll("'","''").replaceAll("\"","&#34;")+"',CT_MODIFIED_BY ='"+session.getAttribute("DBAusername")+"',CT_MODIFIED_DATE=NOW() WHERE CT_ID = "+strDSMIDs[i];
					dbBean.setQuery(updateTickerEntry);
					dbBean.go1();
				out.print(updateTickerEntry+"<hr>");
			}
		}
	}

String returnurl = "ticker_management.jsp?msg=Ticker%20Updated";
String actype = "3";
String acmsg = "UpdateTicker";
String acdescription = "Ticker updated";
String acSqlQuery = updateTickerEntry;
%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>