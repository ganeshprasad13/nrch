<% //By-Anurag Tyagi
String strSessionChk = (String)session.getAttribute("DBAusername");
if(strSessionChk == null || strSessionChk.equals("")){
response.sendRedirect("http://"+request.getServerName()+"/works/webadmin/index.jsp");
return;
}%>
<script type="text/javascript">
	//For jsp file check--Anurag
	function ChkfileExt(id){
	var fileName =id.value.toLowerCase();
	if(fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".bmp")==-1){
		alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
		id.value="";
	}
}
	
	</script>
	
<%@ include file="../../dbConn/dbInit.jsp" %>
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
	<title>Upload file...</title>
	<link rel="StyleSheet" href="<%=strWebAppURL%>/css/styles<%=lang%>.css" type="text/css">
	<script language="JavaScript">
	function updateParent()
	{		<% String strtextEng = "<font face='Arial' size='2'>";
				String strtextHindi = "<font face='Arial' size='2'>";
		if (filesUploaded.size() > 0) {
		for (int i=0;i<filesUploaded.size();i++){
		Hashtable htFileProps = (Hashtable) filesUploaded.elementAt(i);
		String filelang = (String)htFileProps.get("lang");
		if(filelang!=null){
			if (filelang.equals("0")) {
			strtextEng = strtextEng + htFileProps.get("name") + "<br/>";
			}else {
			strtextHindi = strtextHindi + htFileProps.get("name") + "<br/>";
			}
		}
		}}%>
		window.opener.updateEngFile("<%=strtextEng%>");
		window.opener.updateHindiFile("<%=strtextHindi%>");
		self.window.close();
	}
	</script>
</head>

<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="4" align="center" bgcolor="#000000">
<tr>
<td class="textn"><font size="2" color="#FFFFFF"><strong>Upload Image File</strong></font></td>
</tr>
</table>
<form action="upload_direct_file_action.jsp" method="post" enctype="multipart/form-data" name="frmUpload" id="frmUpload">
<table align="center" width="85%" border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
<tr>
<td class="textn">Image Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="" name="filelabel" id="filelabel" class="<%if(lang.equals("0")){%>textbox<%} else {%>textboxh<%}%>" ></td>
</tr>
<tr>
<td class="textn">Image Description: &nbsp;&nbsp;<textarea name="filelabe2" id="filelabe2" class="<%if(lang.equals("0")){%>textbox<%} else {%>textboxh<%}%>"> </textarea></td>
</tr>
<tr>
<td class="textn">Upload Image:&nbsp;&nbsp;<input type="file" name="filename" id="filename"  accept="image/png,image/jpeg,application/pdf" class="textbox" onchange="ChkfileExt(this);" ></td>
</tr>
<tr>
<td class="textn" align="center">  <input type="submit" name="AddFile" class="textbox" id="AddFile" value="Add File"> <input type="button" name="Close" id="Close" value="Close" class="textbox" onClick="javascript:updateParent();"></td>
</tr>
<% if (filesUploaded.size() > 0) {
for (int i=0;i<filesUploaded.size();i++){
Hashtable htFileProps = (Hashtable) filesUploaded.elementAt(i);
if (htFileProps!=null) {
if (htFileProps.get("name")!=null) {
%>
<tr>
<td class="textn"><%=htFileProps.get("name")%> <== <a href="upload_direct_file_remove.jsp?id=<%=i%>" class="link1" title="Remove this file...">Remove this file</a></td>
</tr>
<%}}}}%>
</table>
</form>

</body>
</html>
