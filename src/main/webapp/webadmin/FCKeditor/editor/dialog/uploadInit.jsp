<html>
<head>
<title>Upload and Insert Local File</title>

<link rel=stylesheet href='./skin/vdev.css' type='text/css'>
<script src="./skin/language.js"></script>
<script>
<% 
String strType = request.getParameter("type");
if (strType!="" && strType.equals("image")) {
session.setAttribute("fileType","images");%>
POOLURL= "../../uploads/images"
<% } else { 
session.setAttribute("fileType","files");%>
POOLURL= "../../uploads/files"
<%}%>
function goSubmit()
{<% if (strType!="" && strType.equals("image")) {%>
  document.forms[0].filetype.value="image"
<% } else { %>
  document.forms[0].filetype.value="file"
<%}%>
  document.forms[0].submit()
}

function goOpenPool()
{
 window.open(POOLURL+'/index.html','filespool')
}
</script>
</head>

<body class=vdev scroll=no>
<center>
<form action="upload.jsp" method="post" enctype="multipart/form-data" name="frmUpload" id="frmUpload">
<table bgcolor=#999999 border=1 width=100% cellpading=0 cellspacing=0>
<tr>
<td class=vdevtitle colspan=2><script>document.writeln(FILEUPLOAD)</script></td>
</tr>
<tr>
<td align=right class=vdevtext><script>document.writeln(SELECTFILE)</script>:</td>
<td><input type=file name="file" size=55 accept="application/x-www-form-urlencoded"></td>
</tr>
<input type="hidden" name="filetype" value="">
<tr>
<td colspan=2 align=center>
<button class=vdev onclick=goSubmit() title=send><script>document.writeln(SEND)</script></button>
<button class=vdev onclick=self.close() title=close><script>document.writeln(CLOSE)</script></button>
<!--- <BUTTON class=vdev onclick="goOpenPool(); return false" title=Show><script>document.writeln(FILESPOOL)</script></BUTTON> --->
</td></tr>
</table>
</form>
</center>
</body>