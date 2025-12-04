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
	strTenderDetails = "SELECT TM.ID,DIVI.CMSD_DIVISIONS,DEPT.CMSDEPT_NAME,TM.TENDER_NO,TM.APPROXIMATE_COST,TM.TENDER_TITLE_ENG,TM.FILE_ENG,TM.TENDER_OPEN_DATE,TM.TENDER_OPEN_TIME,TM.TENDER_CLOSE_DATE,TM.TENDER_CLOSE_TIME,TM.NOTICE_ID FROM  CMS_TENDER_MASTER_NEW AS TM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = TM.DEPT_ID AND DIVI.CMSD_ID = TM.DIV_ID  AND STATUS = 'Active' AND ID="+strTenId+"";
	dbBean.setQuery(strTenderDetails);
	String rsGetTenderDetails[][] = dbBean.getResultSet();
%>
<%if(rsGetTenderDetails.length>0){%>
<table border="1" align="center">
	<tr>
	    <td>Division</td><td><%=rsGetTenderDetails[0][1]%></td>
	</tr>
	<tr>
		<td>Department</td><td><%=rsGetTenderDetails[0][2]%></td>
	</tr>
	<tr>
		<td>Tender No.</td><td><%=rsGetTenderDetails[0][3]%></td>
	</tr>
	<tr>
		<td>Approximate Cost</td><td><%=rsGetTenderDetails[0][4]%></td>
	</tr>
	<%
		// Select Tender Division 
	String strNotice = "";
	strNotice = "SELECT FILE_NAME,ID FROM CMS_NOTICE_MASTER WHERE ID = "+rsGetTenderDetails[0][11]+"";
	dbBean.setQuery(strNotice);
	String rsGetNotice[][] = dbBean.getResultSet();
	if(rsGetNotice.length>0){
	NOTICE_ID = rsGetNotice[0][1];
	%>
	<tr>
		<td>Notice </td><td><a href="../../upload/<%=rsGetNotice[0][0]%>"><%=rsGetNotice[0][0]%></a></td>
	</tr>
	<%}%>
	<tr>
		<td>Tender Document </td><td><a href="../../upload/<%=rsGetTenderDetails[0][6]%>"><%=rsGetTenderDetails[0][6]%></a></td>
	</tr>
	<tr>
		<td>Tender Open From </td><td><%=rsGetTenderDetails[0][7]%> <%=rsGetTenderDetails[0][8]%></td>
	</tr>
	<tr>
		<td>Tender Open Up To </td><td><%=rsGetTenderDetails[0][9]%> <%=rsGetTenderDetails[0][10]%></td>
	</tr>
	<%}%>
	<%
		// Select tender Corri
	String strCorri = "";
	strCorri = "SELECT FILE_ENG FROM CMS_CORRIGENDUM_NEW WHERE NOTICE_TENDER_ID ="+strTenId+" AND TYPE_ID = 2";
	dbBean.setQuery(strCorri);
	String rsGetCorri[][] = dbBean.getResultSet();
	if(rsGetCorri.length>0){%>
	<tr>
		<td>Corrigendum </td><td>&nbsp; </td></tr>
	<%
		for(int i=0;i<rsGetCorri.length;i++){
	%>
	<tr><td>&nbsp; </td><td><a href="../../upload/<%=rsGetCorri[i][0]%>"><%=rsGetCorri[i][0]%></a></td>
	</tr>
	<%}}%>
	<%
		// Select tender Department
	String strNoticeCorri = "";
	strNoticeCorri = "SELECT FILE_ENG FROM CMS_CORRIGENDUM_NEW WHERE NOTICE_TENDER_ID ="+NOTICE_ID+" AND TYPE_ID = 1";
	dbBean.setQuery(strNoticeCorri);
	String rsGetNoticeCorri[][] = dbBean.getResultSet();
	if(rsGetNoticeCorri.length>0){
		for(int i=0;i<rsGetNoticeCorri.length;i++){
	%>
	<tr>
		<td>&nbsp; </td><td><a href="../../upload/<%=rsGetNoticeCorri[i][0]%>"><%=rsGetNoticeCorri[i][0]%></a></td>
	</tr>
	<%}}%>
</table>
<input type="button" name="Back" value="Back" onclick="history.go(-1)">

<%@ include file="../header/footerInner.jsp" %>