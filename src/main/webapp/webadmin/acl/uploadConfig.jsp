<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<html>
<head>
<title>Upload and Insert Local File</title>
<link rel=stylesheet href='./skin/vdev.css' type='text/css'>
<script >
	function check(){
		if(document.frmUpload.file1.value == ''){
			return false;
		}
		
		
		var fileName = document.getElementById("file1").value;
	if(fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".JPG")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".GIF")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".PNG")==-1 && fileName.lastIndexOf(".bmp")==-1 ){
		alert("Only jpg,gif,png,bmp files can be uploaded");
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
		<td><input type=file name="file1" size=55 id="file1"></td>
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
<%}%>