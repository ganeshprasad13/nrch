<%@ include file="../header/headerInner.jsp" %>
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
			<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Email Details&nbsp;&nbsp;&nbsp;</span></span>
		</td>
	</tr>
</table>
<br>
<div align="center">
<table width="750" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1" cellpadding="3">
<%
String strQuery = "";
strQuery = "UPDATE CMS_USER_REQUEST SET CUR_UNREAD_READ=0 WHERE CUR_ID="+request.getParameter("id");
dbBean.setQuery(strQuery);
dbBean.go1();
strQuery = "SELECT CUR_ID, CUR_USER_ID, CUR_FROM, CUR_TO, CUR_SUBJECT, CUR_CONTENT, DATE_FORMAT(CUR_SEND_DATE,'%d-%m-%Y %h:%i:%s') CUR_SEND_DATE,CUR_UNREAD_READ FROM CMS_USER_REQUEST WHERE CUR_ID = "+request.getParameter("id");
dbBean.setQuery(strQuery);
String rsGetMailList[][] = dbBean.getResultSet();
if(rsGetMailList.length>0){%>
	<tr>
		<td><b>From</b></td>
		<td><%=rsGetMailList[0][2]%></td>
	</tr>
	<tr>
		<td><b>Subject</b></td>
		<td><%=rsGetMailList[0][4]%></td>
	</tr>
	<tr>
		<td><b>Message</b></td>
		<td><%=rsGetMailList[0][5]%></td>
	</tr>
	<tr>
		<td><b>Recieve Date</b></td>
		<td><%=rsGetMailList[0][6]%></td>
	</tr>
<%}%>
</table>
<br><br>
<a href="emailList.jsp"><font color="black">Back</font></a>
</div>
<%@ include file="../header/footer.jsp" %>