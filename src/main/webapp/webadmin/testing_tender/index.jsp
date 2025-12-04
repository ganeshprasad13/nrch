<%@ include file="../header/headerInner.jsp" %>

<%
	String selectType = "";
	if(request.getParameter("selectType")!=null && !request.getParameter("selectType").equals("")){
		selectType = request.getParameter("selectType");
	}
%>
<%if(selectType.equals("1")){%>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Tender Notice&nbsp;&nbsp;&nbsp;</span></p>
<table align="center" class="sample" width="60%">
	<tr>
		<td><b>For Add New Tender Notice</b></td><td align="center" nowrap="nowrap"><a href="AddNotice.jsp"><font color="red">Click Here</font></td>
	</tr>
	<tr>
		<td><b>For Edit/Delete Notice</b></td><td nowrap="nowrap" align="center"><a href="searchNotice.jsp"><font color="red">Click Here</font></td>
	</tr>
</table>
<%}%>
<%if(selectType.equals("2")){%>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Tender Document&nbsp;&nbsp;&nbsp;</span></p>
<table align="center" class="sample" width="60%">
	<tr>
		<td><b>For Add New Tender Document</b></td><td align="center" nowrap="nowrap"><a href="TenderDoc.jsp"><font color="red">Click Here</font></td>
	</tr>
	<tr>
		<td><b>For Edit/Delete Tender Document</b></td><td nowrap="nowrap" align="center"><a href="searchTender.jsp"><font color="red">Click Here</font></td>
	</tr>

</table>
<%}%>
<%if(selectType.equals("3")){%>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Corrigendum&nbsp;&nbsp;&nbsp;</span></p>
<table align="center" class="sample" width="60%">
	<tr>
		<td><b>For Add New Corrigendum</b></td><td align="center" nowrap="nowrap"><a href="AddCorrigendum.jsp"><font color="red">Click Here</font></td>
	</tr>
	<tr>
		<td><b>For Edit/Delete Corrigendum</b></td><td nowrap="nowrap" align="center"><a href="searchCorri.jsp"><font color="red">Click Here</font></td>
	</tr>
</table>
<%}%>
<%if(selectType.equals("4")){%>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Tender Awarded&nbsp;&nbsp;&nbsp;</span></p>
<table align="center" class="sample" width="60%">
	<tr>
		<td><b>For Awarded Tender</b></td><td align="center" nowrap="nowrap"><a href="TenderAward.jsp"><font color="red">Click Here</font></td>
	</tr>
</table>
<%}%>
<%if(selectType.equals("5")){%>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Bill Status&nbsp;&nbsp;&nbsp;</span></p>
<table align="center" class="sample" width="60%">
	<tr>
		<td colspan="2" align="center">Through pdf/xls/doc</td>
	</tr>
	<tr>
		<td><b>For Uploading Data File</b></td><td align="center" nowrap="nowrap"><a href="addBillStatusDoc.jsp"><font color="red">Click Here</font></td>
	</tr>
	<tr>
		<td><b>For Edit/Delete Documents</b></td><td nowrap="nowrap" align="center"><a href="editBillStatusDoc.jsp"><font color="red">Click Here</font></td>
	</tr>
</table>
<table align="center" class="sample" width="60%">
	<tr>
		<td colspan="2" align="center">Form Based</td>
	</tr>
	<tr>
		<td><b>For Uploading Data File</b></td><td align="center" nowrap="nowrap"><a href="addBillStatusForm.jsp"><font color="red">Click Here</font></td>
	</tr>
	<tr>
		<td><b>For Edit/Delete Records</b></td><td nowrap="nowrap" align="center"><a href="editBillStatusForm.jsp"><font color="red">Click Here</font></td>
	</tr>
</table>
<table align="center" class="sample" width="60%">
	<tr>
		<td colspan="2" align="center">Through CSV Uploading</td>
	</tr>
	<tr>
		<td><b>For Uploading Data File</b></td><td align="center" nowrap="nowrap"><a href="billStatusAdd.jsp"><font color="red">Click Here</font></td>
	</tr>
	<tr>
		<td><b>For Data Processing</b></td><td nowrap="nowrap" align="center"><a href="billImport.jsp"><font color="red">Click Here</font></td>
	</tr>
</table>
<%}%>
<%@ include file="../header/footerInner.jsp" %>