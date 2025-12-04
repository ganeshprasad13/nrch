<%int intPageNo =4;%>
<%@ include file="../../dbConn/dbInit.jsp" %>


<%
	
%>
<%
	
	String strTenderDetails ="SELECT CAL_CAU_LOGIN,CAL_TITLE,CAL_DESCRIPTION,CAL_SQLQUERY,DATE_FORMAT(CAL_CREATED_DATE,'%d-%m-%Y %H:%i'),CAL_IPADDRESS FROM CMS_ADMIN_LOG WHERE CAL_ID ="+request.getParameter("id")+"";
	dbBean.setQuery(strTenderDetails);
	String rsGetNoticDetails[][] = dbBean.getResultSet();
	//out.print(strTenderDetails);
%>
<%
if(rsGetNoticDetails.length>0){%>
<table border="1"  style="font-size:12px;border-collapse:collapse;" width="100%">
		<tr style="background-color:#3271B8;color:white;font-weight:bold;">
			<td colspan="2">Complete Details of the Person what he done</td>
			</tr>
		
		<%for(int l=0;l<rsGetNoticDetails.length;l++){%>
		<tr>  
		   <th>User Name</th><td><%=rsGetNoticDetails[l][0]%></td>
		</tr>
		<tr>
			<th nowrap>Login Date & Time</th><td nowrap="nowrap"><%=rsGetNoticDetails[l][4]%></td>
		</tr>
		<tr>
			<th nowrap>Login IP Address</th><td nowrap="nowrap"><%=rsGetNoticDetails[l][5]%></td>
		</tr>
		<tr>
			<th>Action</th><td><%=rsGetNoticDetails[l][1]%></td>
		</tr>
		<tr>
			<th>Description</th><td><%=rsGetNoticDetails[l][2]%></td>
		</tr>
		<tr>
			<th>Sql Query</th><td><%=rsGetNoticDetails[l][3]%></td>
		</tr>
		<%}%>
	
</table>
<%}%>

<%@ include file="../../dbConn/dbClose.jsp" %>
