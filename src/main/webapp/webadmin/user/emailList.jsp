<%@ include file="../header/headerInner.jsp" %>
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
			<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Email List&nbsp;&nbsp;&nbsp;</span></span>
		</td>
	</tr>
</table>
<br>
<div align="center">
<table width="750" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1" cellpadding="3">
	<tr class="tr_bgcolor">
		<td align="center"><b>S. No.</b></td>
		<td align="center"><b>From</b></td>
		<td align="center"><b>Subject</b></td>
		<!--<td align="center"><b>Message</b></td>-->
		<td align="center"><b>Recieve Date</b></td>
	</tr>
<%
String strQuery = "";
strQuery = "SELECT CUR_ID, CUR_USER_ID, CUR_FROM, CUR_TO, CUR_SUBJECT, SUBSTRING(CUR_CONTENT,1,50) CUR_CONTENT, DATE_FORMAT(CUR_SEND_DATE,'%d-%m-%Y %h:%i') AS SEND_DATE,CUR_UNREAD_READ FROM CMS_USER_REQUEST ORDER BY CUR_SEND_DATE DESC";
dbBean.setQuery(strQuery);
String rsGetMailList[][] = dbBean.getResultSet();
if(rsGetMailList.length>0){
	for (int i=0;i<rsGetMailList.length;i++){
		if(rsGetMailList[i][7].equals("1")){%>
		<tr>
			<td align="center">
				<b><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=i+1%></font></a></b></td>
			<td>
				<b><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=rsGetMailList[i][2]%></font></a></b></td>
			<td><b><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=rsGetMailList[i][4]%></font></a></b></td>
			<!--<<td><b><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=rsGetMailList[i][5]%>....</font></a></b></td>-->
			<td align="center"><b><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=rsGetMailList[i][6]%></font></a></b></td>
		</tr>
		<%}else{%>
		<tr>
			<td align="center"><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=i+1%></font></a></td>
			<td><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=rsGetMailList[i][2]%></font></a></td>
			<td><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=rsGetMailList[i][4]%></font></a></td>
			<!--<<tD><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=rsGetMailList[i][5]%>....</font></a></td>-->
			<td align="center"><a href="emailDetails.jsp?id=<%=rsGetMailList[i][0]%>">
				<font color="#000000"><%=rsGetMailList[i][6]%></font></a></td>
		</tr>
		<%}%>
<% 	}	
}else{%>
	<tr>
		<td colspan="6" align="center">
			No record(s) found</td>
	</tr>
<%}%>
</table>
<br><br>
</div>
<%@ include file="../header/footer.jsp" %>