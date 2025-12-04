<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
<%
String strTenId  = "-100";
if(request.getParameter("T_ID")!=null &&  !request.getParameter("T_ID").trim().equals("")){
	strTenId = request.getParameter("T_ID");
}

//Select Tender Details
String strTenderDetails = "";
String condition = "";
String NOTICE_ID ="-100";
	strTenderDetails = "SELECT TM.ID,TM.TENDER_NO,TM.APPROXIMATE_COST,TM.TENDER_TITLE_ENG,TM.FILE_ENG,TM.TENDER_OPEN_DATE,TM.TENDER_OPEN_TIME,TM.TENDER_CLOSE_DATE,TM.TENDER_CLOSE_TIME,TM.NOTICE_ID FROM  CMS_TENDER_MASTER_NEW AS TM WHERE  STATUS = 'Active' AND ID="+strTenId+"";
	dbBean.setQuery(strTenderDetails);
	String rsGetTenderDetails[][] = dbBean.getResultSet();
%>
<%if(rsGetTenderDetails.length>0){%>
<table border="1" align="center">
	
	<tr>
		<td>Tender No.</td><td><%=rsGetTenderDetails[0][1]%></td>
	</tr>
	<tr>
		<td>Approximate Cost</td><td><%=rsGetTenderDetails[0][2]%></td>
	</tr>
	<%
		// Select Tender Division 
	String strNotice = "";
	strNotice = "SELECT FILE_NAME,ID FROM CMS_NOTICE_MASTER WHERE ID = "+rsGetTenderDetails[0][9]+"";
	dbBean.setQuery(strNotice);
	String rsGetNotice[][] = dbBean.getResultSet();
	if(rsGetNotice.length>0){
	NOTICE_ID = rsGetNotice[0][1];
	%>
	<tr>
		<td>Notice </td><td><a href="../../Documents<%=rsGetNotice[0][0]%>"><%=rsGetNotice[0][0]%></a></td>
	</tr>
	<%}%>
	<tr>
		<td>Tender Document </td><td><a href="../../Documents/<%=rsGetTenderDetails[0][4]%>"><%=rsGetTenderDetails[0][4]%></a></td>
	</tr>
	<tr>
		<td>Tender Open From </td><td><%=rsGetTenderDetails[0][5]%> <%=rsGetTenderDetails[0][6]%></td>
	</tr>
	<tr>
		<td>Tender Open Up To </td><td><%=rsGetTenderDetails[0][7]%> <%=rsGetTenderDetails[0][8]%></td>
	</tr>
	<%}%>
	<%
		// Select tender Department
	String strCorri = "";
	strCorri = "SELECT FILE_ENG FROM CMS_CORRIGENDUM_NEW WHERE NOTICE_TENDER_ID ="+strTenId+" AND TYPE_ID = 2";
	dbBean.setQuery(strCorri);
	String rsGetCorri[][] = dbBean.getResultSet();
	if(rsGetCorri.length>0){
	%>
	<tr>
		<td>Corrigendum </td><td><a href="../../Documents/<%=rsGetCorri[0][0]%>"><%=rsGetCorri[0][0]%></a></td>
	</tr>
	<%}%>
	<%
		// Select tender Department
	String strNoticeCorri = "";
	strNoticeCorri = "SELECT FILE_ENG FROM CMS_CORRIGENDUM_NEW WHERE NOTICE_TENDER_ID ="+NOTICE_ID+" AND TYPE_ID = 1";
	dbBean.setQuery(strNoticeCorri);
	String rsGetNoticeCorri[][] = dbBean.getResultSet();
	if(rsGetNoticeCorri.length>0){
	%>
	<tr>
		<td>&nbsp; </td><td><a href="../../Documents/<%=rsGetNoticeCorri[0][0]%>"><%=rsGetNoticeCorri[0][0]%></a></td>
	</tr>
	<%}%>
</table>
<a href="Tender.jsp">Back</a>

<%@ include file="../header/footerInner.jsp" %>