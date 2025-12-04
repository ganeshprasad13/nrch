<html>
<head>
<title>Upload and Insert Local File</title>
<link rel=stylesheet href='./skin/vdev.css' type='text/css'>
<script >
	function check(){
		if(document.frmUpload.file1.value == ''){
			return false;
		}
		return true;
	}
	
	//For jsp file check--Anurag
	function ChkfileExt(id){
	var fileName =id.value;
	if(fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".bmp")==-1){
		alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
		id.value="";
	}
}
</script>
</head>

<body class=vdev scroll=no>
<center>
<form action="editCorrigendumAction.jsp" method="post" enctype="multipart/form-data" name="frmUpload" id="frmUpload" onsubmit="return check();">
<input type="hidden" name="corriId" value="<%=request.getParameter("corriId")%>">
<table bgcolor=#999999 border=1 width=100% cellpading=0 cellspacing=0>
	<tr>
		<td class=vdevtitle colspan=2></td>
	</tr>
	<tr>
		<td align=right class=vdevtext>Select Image</script>:</td>
		<td><input type=file name="file1" size=55 onchange="ChkfileExt(this);"></td>
	</tr>
		
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="save">
			<button class=vdev onclick=self.close() title=close >Close</button>
		</td>
	</tr>
</table>
</form>
</center>
</body>