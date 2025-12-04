<%@ page language="java" import="javax.servlet.*,java.util.*,java.io.*,org.apache.commons.fileupload.*" %>

<%@ include file="../../dbConn/dbsettings.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>File Upload</title>
	<LINK REL=stylesheet HREF='./skin/vdev.css' TYPE='text/css'>
	<script src="./skin/language.js"></script>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<%
String strFileName = "";
String strFileNameLocal = "";
String poolDir = strWebAppURL + "/uploads/";
String strType = "";

try {
			//System.out.println(	"CONTENT-LENGHT" +	request.getContentLength());
			String sessId = session.getId();
			//System.out.println("session id = " + sessId);
            DiskFileUpload fu = new DiskFileUpload();
            // maximum size before a FileUploadException will be thrown
            fu.setSizeMax(999999999);
            // maximum size that will be stored in memory
            fu.setSizeThreshold(4096);
            // the location for saving data that is larger than getSizeThreshold()
            fu.setRepositoryPath(System.getProperty("java.io.tmpdir"));
            List fileItems = fu.parseRequest(request);
            Iterator i = fileItems.iterator();
			
			//getting current ts in ms
			Calendar calNow = Calendar.getInstance();
			long lTime = calNow.getTimeInMillis();
			String strTime = Long.toString(lTime);
			
			
		    while(i.hasNext())
			{
				FileItem item = (FileItem)i.next();
				if (item.isFormField()) {
				    String name = item.getFieldName();
				    String value = item.getString();
					if (name.equals("filetype")) {
						strType = value;
					}
				} else if (!item.isFormField()) {
				    String fieldName = item.getFieldName();
					if (!item.getString().equals("") && item.getString()!=null){
				    String fileName = item.getName();
					strFileNameLocal = fileName;
				    String contentType = item.getContentType();
				    boolean isInMemory = item.isInMemory();
				    long sizeInBytes = item.getSize();
					File tmpFile = new File(fileName);
					String newFileName = this.getServletContext().getRealPath("/uploads/"+(String)session.getAttribute("fileType")) + 
							File.separator + strTime + "-" +tmpFile.getName();
					//out.println(newFileName + "<br/>");
					strFileName = strTime + "-" + tmpFile.getName();
					item.write(new File(newFileName));
					}
				}
			}
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
if (strType == null || strType=="") {
strType = "image";
//out.println("parameter paasss nahi ho raha be");
}
if (strType.equals("image")) {
	poolDir = poolDir + "images/";
} else {
	poolDir = "/uploads/files/";
}
%>


</body>
</html>


<html>
<head><title>Upload and Insert Local File</title></head>
<body class=vdev scroll=no>
<center>
<table width="100%" border="0" cellspacing="2" cellpadding="3">
<TR>
<TD class=vdevtitle><script>document.writeln(FILEUPLOADED)</script></TD></TR>
<tr><td class=vdevtext2>

File <strong>"<%= strFileNameLocal %>"</strong> was uploaded and was renamed to <strong>"<%=strFileName%>"</strong>.<br>You can now access the file with URL:
<a href="<%= poolDir + strFileName %>" target=nw123><strong><%= strFileName %></strong></a>
</td></tr>
<tr><td class=vdevtext2 align="center">
<%if (strType.equals("image")) {%>
<a href="javascript:window.opener.doFormatF('InsertImage,<%=poolDir%><%=strFileName%>');javascript:self.window.close()"><strong>Insert Image</strong></a>
<% } else { %>
<a href="javascript:window.opener.doFormatF('InsertFileAsLink,<%=poolDir%><%=strFileName%>');javascript:self.window.close()"><strong>Insert File as Link</strong></a>
<%}%>
</td></tr>
<!--- <tr><td class=vdevtext2 align="center" ><b><a href="http://192.168.124.1/docs/denabank/3$en5v2/cms/show.jsp" target=nw123>Files-Pool</a></b>
</td></tr> --->
<tr><td align="center" class="vdevtext2"><b><a href="javascript:history.back()">Back</a></b>
</td></tr></table>
</center></body></html>
</body>
</html>





