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
String imgNo = "";
String image1= "";
String image2= "";
String image3= "";
String image4= ""; //for change logo
String image5= ""; //for hindi image
String image6= "";
String image7= "";
String image17= "";/* for site logo in hindi*/
String strGetUserQuery = "";

Vector rsGetUser3 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=3 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
dbBean.setQuery(strGetUserQuery);
rsGetUser3 = (Vector)dbBean.go();
if(rsGetUser3.size()>0){ 
	image4 = dbBean.getcell(rsGetUser3,0,0);
}

Vector rsGetUser5 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=5 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
dbBean.setQuery(strGetUserQuery);
rsGetUser5 = (Vector)dbBean.go();
if(rsGetUser5.size()>0){ 
	image1 = dbBean.getcell(rsGetUser5,0,0);
}

Vector rsGetUser6 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=6 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
dbBean.setQuery(strGetUserQuery);
rsGetUser6 = (Vector)dbBean.go();
if(rsGetUser6.size()>0){ 
	image2 = dbBean.getcell(rsGetUser6,0,0);
}

Vector rsGetUser7 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=7 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
dbBean.setQuery(strGetUserQuery);
rsGetUser7 = (Vector)dbBean.go();
if(rsGetUser7.size()>0){ 
	image3 = dbBean.getcell(rsGetUser7,0,0);
}
/* Update hindi images*/
Vector rsGetUser8 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=14 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
dbBean.setQuery(strGetUserQuery);
rsGetUser8 = (Vector)dbBean.go();
if(rsGetUser8.size()>0){ 
	image5 = dbBean.getcell(rsGetUser8,0,0);
}

Vector rsGetUser9 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=15 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
dbBean.setQuery(strGetUserQuery);
rsGetUser9 = (Vector)dbBean.go();
if(rsGetUser9.size()>0){ 
	image6 = dbBean.getcell(rsGetUser9,0,0);
}

Vector rsGetUser10 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=16 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
dbBean.setQuery(strGetUserQuery);
rsGetUser10 = (Vector)dbBean.go();
if(rsGetUser10.size()>0){ 
	image7 = dbBean.getcell(rsGetUser10,0,0);
}

Vector rsGetUser17 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=17 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
dbBean.setQuery(strGetUserQuery);
rsGetUser17 = (Vector)dbBean.go();
if(rsGetUser17.size()>0){ 
	image17 = dbBean.getcell(rsGetUser17,0,0);
}
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
					if (name.equals("imgNo")) {
						imgNo = value;
					}
				} else if (!item.isFormField()) {
				    String fieldName = item.getFieldName();
					if (!item.getString().equals("") && item.getString()!=null){
				    String fileName = item.getName();
					strFileNameLocal = fileName;
					String tempfile = "";
					if(imgNo.equals("1")){
						tempfile = image1;
					}
					if(imgNo.equals("2")){
						tempfile = image2;
					}
					if(imgNo.equals("3")){
						tempfile = image3;
					}
					if(imgNo.equals("4")){
						tempfile = image4;
					}
					if(imgNo.equals("5")){
						tempfile = image5;
					}
					if(imgNo.equals("6")){
						tempfile = image6;
					}
					if(imgNo.equals("7")){
						tempfile = image7;
					}
					if(imgNo.equals("17")){
						tempfile = image17;
					}
					out.print(tempfile);
				    String contentType = item.getContentType();
				    boolean isInMemory = item.isInMemory();
				    long sizeInBytes = item.getSize();
					File tmpFile = new File(fileName);
					String newFileName = this.getServletContext().getRealPath("/template/site1/images/"+tempfile);
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


%>
<%@ include file="../../dbConn/dbClose.jsp"%>
File upload successfully
<button class=vdev onclick=self.close() title=close >Close</button>


