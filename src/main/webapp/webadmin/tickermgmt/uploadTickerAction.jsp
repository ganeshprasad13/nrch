<%@ page language="java" import="javax.servlet.*,java.util.*,java.io.*,org.apache.commons.fileupload.*" %>
<%@ include file="../../dbConn/dbInit.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>File Upload</title>
	<LINK REL=stylesheet HREF='./skin/vdev.css' TYPE='text/css'>
	<script src="../skin/language.js"></script>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<%
String strFileName = "";
String strFileNameLocal = "";
String ticNo = "";
String strGetUserQuery = "";

int isfileuploaded = 0;
String fContentType = "";
String fFileName[] = new String[2];
String fSFileName = "";
String newFileName[] = new String[2];
long fSize =0;
int count =0;

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
					if (name.equals("ticNo")) {
						ticNo = value;
					}
				} else if (!item.isFormField()) {
				    String fieldName = item.getFieldName();
					if (!item.getString().equals("") && item.getString()!=null){
						isfileuploaded = 1;
						String fileName = item.getName();
						fContentType = item.getContentType();
						boolean isInMemory = item.isInMemory();
						fSize = item.getSize();
						File tmpFile = new File(fileName);
						String strFileArray[] = tmpFile.getName().split("\\\\");
						fFileName[count] = strTime+strFileArray[strFileArray.length-1];
						newFileName[count] = this.getServletContext().getRealPath("/ticker") + 
						File.separator  +strTime+strFileArray[strFileArray.length-1];
						//out.print(newFileName + "<br/>");
						item.write(new File(newFileName[count]));
						if(fFileName[count]!=null && !fFileName[count].equals("")){
							fFileName[count]=""+fFileName[count];
						}
					}
				}
			}
		}
    catch (Exception ex) {
        ex.printStackTrace();
    }

strGetUserQuery = "UPDATE CMS_TICKER SET CT_FILE='"+fFileName[0]+"' WHERE CT_ID ="+ticNo+"";
dbBean.setQuery(strGetUserQuery);
dbBean.go1();
String actype = "0";
	String acmsg = "TickerFileUpload";
	String acdescription =  session.getAttribute("DBAusername") + " login for upload Ticker File  ";
	String acSqlQuery = strGetUserQuery;
	%>
	<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp"%>
File upload successfully
<button class=vdev onclick=self.close() title=close >Close</button>


