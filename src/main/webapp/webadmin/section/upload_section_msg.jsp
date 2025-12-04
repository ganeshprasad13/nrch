<html>
<head>
	<title>Upload Image...</title>
	<link rel="StyleSheet" href="../../css/styles<%=request.getParameter("lang")%>.css" type="text/css">
	<script language="JavaScript">
	function updateParent()
	{	
		window.opener.UpdateSectionImage("<img src=\"../../uploads/sectionbanner/<%=request.getParameter("imgName")%>\" border=\"0\" alt=\"\">");
		self.window.close();
		
	}
	</script>
</head>

<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="4" align="center" bgcolor="#000000">
<tr>
<td class="textn"><font size="2" color="#FFFFFF"><strong>Upload Image</strong></font></td>
</tr>
</table>
<br><br>
<table align="center" width="85%" border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
<td class="textn" align="center">Image Uploaded</td>
</tr>
<tr>
<td class="textn" align="center"><a href="javascript:updateParent();">Close This Window</a></td>
</tr>

</table>


</body>
</html>
