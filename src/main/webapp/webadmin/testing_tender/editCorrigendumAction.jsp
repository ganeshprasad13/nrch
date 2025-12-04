<%@ page language="java" import="javax.servlet.*,java.util.*,java.io.*,org.apache.commons.fileupload.*" %>
<%@ include file="../../dbConn/dbInit.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>File Upload</title>
	<LINK REL=stylesheet HREF='./skin/vdev.css' TYPE='text/css'>
	<script src="../skin/language.js"></script>
	<script type="text/javascript">
		function gourl(){
			self.close();
			parent.reload();
		}
	</script>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<%
String corriId = "";
String strFileName  = "";
String strFileNameLocal  = "";
String strMSG = "File upload successfully";
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
					if (name.equals("corriId")) {
						corriId = value;
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
					strFileName = strTime + "-" + tmpFile.getName();
					String newFileName = this.getServletContext().getRealPath("/"+Hname+"/corrigendum/"+strFileName);
					out.println(newFileName + "<br/>");
					
					item.write(new File(newFileName));
					}
				}
			}
    }catch (Exception ex) {
        ex.printStackTrace();
		strMSG ="Some Error Found during file upload";
    }
	try {
		dbBean.setQuery("UPDATE CMS_CORRIGENDUM_NEW SET FILE_ENG ='"+strFileName+"' WHERE ID="+corriId+"");
		dbBean.go1();
	}catch (Exception ex) {
        ex.printStackTrace();
		strMSG ="Some Error Found during inserting data";
    }
%>
<%@ include file="../../dbConn/dbClose.jsp"%>
<%=strMSG%>
<button class="vdev" onclick="gourl();" title="close" >Close</button>


