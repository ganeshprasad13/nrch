
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
  document.frmUpload.filetype.value="image"
<% } else { %>
  document.frmUpload.filetype.value="file"
<%}%>
	//alert(document.frmUpload.filetype.value);
  //document.frmUpload.submit()
  
 
/* -------------------Updated By Aman Kumar 09-05-2014 -------------------------------*/
	
var id = document.getElementById('file1');
var id1 = document.getElementById("file1").value;

var img = id.value;
var n = img.match('.jsp');
//alert(n);
if (n == '.jsp') 
{
alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
return false;
}

var n = img.match('.php');
//alert(n);
if (n == '.php') 
{
alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
return false;
}

var n = img.match('.exe');
//alert(n);
if (n == '.exe') 
{
alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
return false;
}

var n = img.match('.java');

if (n == '.java') 
{
alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
return false;
}

var fileName =id1.value;

if( id1 === "" ) {
//alert("Please upload any file.");
}
else{
if(fileName.lastIndexOf(".zip")==-1 && fileName.lastIndexOf(".rar")==-1 && fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".jpeg")==-1 && fileName.lastIndexOf(".html")==-1 && fileName.lastIndexOf(".htm")==-1){
alert("Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
return false;
}
}
  
}

function goOpenPool()
{
 window.open(POOLURL+'/index.html','filespool')
}
</script>
</head>

<body class=vdev scroll=no>
<center>
<form action="upload.jsp" method="post" enctype="multipart/form-data" name="frmUpload" id="frmUpload" >
<table bgcolor=#999999 border=1 width=100% cellpading=0 cellspacing=0>
<tr>
<td class=vdevtitle colspan=2><script>document.writeln(FILEUPLOAD)</script></td>
</tr>
<tr>
<td align=right class=vdevtext><script>document.writeln(SELECTFILE)</script>:</td>
<!-- <td><input type=file name="file" size=55 accept="application/x-www-form-urlencoded"></td>  -->
<td><input type="file" name="file1" id="file1" onChange="javascript:return goSubmit();" ></td>
</tr>
<input type="hidden" name="filetype" value="">
<tr>
<td colspan=2 align=center>
<!--<button class=vdev onclick=goSubmit() title=send><script>document.writeln(SEND)</script></button> -->
<input type="submit"  name="send" value="SEND" onClick="javascript:return goSubmit();" >

<button class=vdev onclick=self.close() title=close><script>document.writeln(CLOSE)</script></button>
<!--- <BUTTON class=vdev onclick="goOpenPool(); return false" title=Show><script>document.writeln(FILESPOOL)</script></BUTTON> --->
</td></tr>
</table>
</form>
</center>
</body>