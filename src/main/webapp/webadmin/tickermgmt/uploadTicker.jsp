<% //By-Anurag Tyagi
String strSessionChk = (String)session.getAttribute("DBAusername");
if(strSessionChk == null || strSessionChk.equals("")){
response.sendRedirect("http://"+request.getServerName()+"/works/webadmin/index.jsp");
return;
}%>
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
	if(fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".html")==-1 && fileName.lastIndexOf(".htm")==-1){
		alert("Only pdf,txt,csv,doc,docx,xls,jpg,gif,png,html,htm files can be uploaded");
		return false;
	}
		
		
		return true;
	}
</script>
</head>

<body class=vdev scroll=no>
<center>
<form action="uploadTickerAction.jsp" method="post" enctype="multipart/form-data" name="frmUpload" id="frmUpload" onsubmit="return check();">
<input type="hidden" name="ticNo" value="<%=request.getParameter("ticNo")%>">
<table bgcolor=#999999 border=1 width=100% cellpading=0 cellspacing=0>
	<tr>
		<td class=vdevtitle colspan=2></td>
	</tr>
	<tr>
		<td align=right class=vdevtext>Select Image</script>:</td>
		<td><input type=file name="file1" size=55  id="file1"></td>
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