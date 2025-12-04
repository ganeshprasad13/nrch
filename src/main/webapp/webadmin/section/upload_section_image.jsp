<%@ include file="../../../dbConn/dbsettings.jsp" %>

<% 
String lang="";
if(request.getParameter("langid")!=null){
	if(!request.getParameter("langid").equals("")){
		lang =  request.getParameter("langid");
	}else{
		lang = "0";
	}
}else{
	lang = "0";
}
session.setAttribute("langid",lang);
Vector filesUploaded = (Vector)session.getAttribute("fileDirectUploaded");
if (filesUploaded==null) {
	filesUploaded = new Vector();
}
%>
<html>
<head>
	<title>Upload Image...</title>
	<link rel="StyleSheet" href="<%=strWebAppURL%>/css/styles<%=lang%>.css" type="text/css">
	<script language="JavaScript">
	function updateParent()
	{		
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
<form action="upload_section_image_action.jsp" method="post" enctype="multipart/form-data" name="frmUpload" id="frmUpload">
<input type="Hidden" name="id" value="<%=request.getParameter("id")%>">
<table align="center" width="85%" border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
<td class="textn"><input type="file" name="filename" id="filename"  accept="image/gif,image/jpeg,image/tiff" class="textbox" ></td>
</tr>
<tr>
<td class="textn">  <input type="submit" name="AddFile" class="textbox" id="AddFile" value="Update Image"> <input type="button" name="Cancel" id="Cancel" value="Cancel" class="textbox" onClick="javascript:updateParent();"></td>
</tr>

</table>
</form>

</body>
</html>
