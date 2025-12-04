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
</script>
</head>

<body class=vdev scroll=no>
<center>
<form action="uploadConfigAction.jsp" method="post" enctype="multipart/form-data" name="frmUpload" id="frmUpload" onsubmit="return check();">
<input type="hidden" name="imgNo" value="<%=request.getParameter("imgNo")%>">
<table bgcolor=#999999 border=1 width=100% cellpading=0 cellspacing=0>
	<tr>
		<td class=vdevtitle colspan=2></td>
	</tr>
	<tr>
		<td align=right class=vdevtext>Select Image</script>:</td>
		<td><input type=file name="file1" size=55 ></td>
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