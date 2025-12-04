<%int intPageNo =4;%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<br>
<%
	
%>
<%
	
	String strTenderDetails ="SELECT VENDOR_NAME,VENDOR_FIRM, VENDOR_EMAIL, VENDOR_ADDRESS, VENDOR_STATE,  VENDOR_COUNTRY,VENDOR_PHONE_O,VENDOR_MOBILE	FROM CMS_VENDOR_LOGIN WHERE VENDOR_ID ="+request.getParameter("id")+"";
	dbBean.setQuery(strTenderDetails);
	String rsGetNoticDetails[][] = dbBean.getResultSet();
	//out.print(strTenderDetails);
%>
<%
if(rsGetNoticDetails.length>0){%>
<table border="1" style="font-size:12px;border-collapse:collapse;" width="100%" cellpadding="3">
	
		<tr style="background-color:#3271B8;color:white;font-weight:bold;">
			<td colspan="2">Complete Details of the Person who Downloaded the Tender/Notice Document</td>
			</tr>
		<%for(int l=0;l<rsGetNoticDetails.length;l++){%>
		<tr>  
		   <th style="background-color:#EFEFEF;">Name</th><td><%=rsGetNoticDetails[l][0]%></td>
		</tr>
		<tr>  
		   <th style="background-color:#EFEFEF;">Firm Name</th><td><%=rsGetNoticDetails[l][1]%></td>
		</tr>
		<tr>
			<th style="background-color:#EFEFEF;">E-mail</th><td nowrap="nowrap"><%=rsGetNoticDetails[l][2]%></td>
		</tr>
		<tr>
			<th style="background-color:#EFEFEF;">Address </th><td><%=rsGetNoticDetails[l][3]%></td>
		</tr>
		<tr>
			<th style="background-color:#EFEFEF;">State </th><td><%=rsGetNoticDetails[l][4]%></td>
		</tr>
		<tr>
			<th style="background-color:#EFEFEF;">Country </th><td><%=rsGetNoticDetails[l][5]%></td>
		</tr>
		<tr>
			<th style="background-color:#EFEFEF;">Mobile No.</th><td><%=rsGetNoticDetails[l][7]%></td>
		</tr>
		<tr>
			<th style="background-color:#EFEFEF;">Phone No.</th><td><%=rsGetNoticDetails[l][6]%></td>
		</tr>
		<%}%>
	
</table>
<%}%>

<%@ include file="../../dbConn/dbClose.jsp" %>
