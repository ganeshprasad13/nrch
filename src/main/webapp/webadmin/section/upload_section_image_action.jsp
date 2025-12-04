<%@ page language="java" import="jakarta.servlet.*,java.util.*,java.io.*,org.apache.commons.fileupload.*" %>

<%@ include file="../../dbConn/dbInit.jsp" %>
<% 
String lang=(String)session.getAttribute("langid");
if(lang!=null){
	if(lang.equals("")){
		lang = "0";
	}
}else{
	lang = "0";
}
%>

<html>
<head>
	<title>File Upload</title>
	<link rel="StyleSheet" href="<%=strWebAppURL%>/css/styles<%=lang%>.css" type="text/css">
	
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<%
String strFileName = "";
String strFileNameLocal = "";
String poolDir = strWebAppURL + "/uploads/sectionbanner/";
String strType = "";
Hashtable htFileProps = new Hashtable();
String strid = "";
String section = "";
long sizeInBytes = 0;
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
					if (name.equals("id")) {
						strid = value;
					}
				} else if (!item.isFormField()) {
				    String fieldName = item.getFieldName();
					if (!item.getString().equals("") && item.getString()!=null){
				    String fileName = item.getName();
					strFileNameLocal = fileName;
				    String contentType = item.getContentType();
				    boolean isInMemory = item.isInMemory();
				    sizeInBytes = item.getSize();
					File tmpFile = new File(fileName);
					strFileNameLocal = tmpFile.getName();
					String newFileName = application.getRealPath("/uploads/sectionbanner/") + 
							File.separator + strTime + "-" +tmpFile.getName();
					//out.println(newFileName + "<br/>");
					strFileName = strTime + "-" + tmpFile.getName();
					item.write(new File(newFileName));
					
section = "UPDATE CMS_SECTION_MANAGEMENT ";
section = section + " SET DSM_USER_FILENAME='"+strFileNameLocal+"', DSM_SYS_FILENAME='"+strFileName+"',DSM_FILE_SIZE ="+sizeInBytes+",DSM_FILE_EXT='"+contentType+"'";
section = section + " WHERE DSM_ID = "+strid;

//out.println(section);

dbBean.setQuery(section);
dbBean.go1();					
					
					}
				}
			}
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
		

%>
<%//=htFileProps.toString()%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<%response.sendRedirect("upload_section_msg.jsp?lang="+lang+"&size="+sizeInBytes+"&imgName="+strFileName);%>
</body>
</html>

