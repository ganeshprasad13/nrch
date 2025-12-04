<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ page language="java" import="javax.servlet.*,java.util.*,java.io.*,org.apache.commons.fileupload.*" %>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
int fla ;
String bannertype="";
String linktype="";
String linksection="";
String linkdirect="";
String linkurl="";
String finallink="";
String filelabel0="";
String filelabel1="";
String filetype="";
String filename1 = "";

String returnurl="";
String fSize = "";
String fContentType = "";
String fFileName = "";
String fSFileName = "";
int status = 0;
String strFlashWidth ="0";
String strFlashHeight = "0";

String temp = "";
String strFileName = "";
String strFileNameLocal = "";
String poolDir = strWebAppURL + "/bannerfile/";
String strType = "";
String strLabel = "";
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
					if (name.equals("bannertype")){
						bannertype = value;
					}
					if (name.equals("linktype")){
						linktype = value;
					}
					if (name.equals("linksection")){
						linksection = value;
					}
					if (name.equals("linkdirect")){
						linkdirect = value;
					}
					if (name.equals("linkurl")){
						linkurl = value;
					}
					if (name.equals("filelabel0")){
						filelabel0 = value;
					}
					if (name.equals("filelabel1")){
						filelabel1 = value;
					}
					if (name.equals("filetype")){
						filetype = value;
					}
					if (name.equals("width")){
						strFlashWidth = value;
					}
					if (name.equals("height")){
						strFlashHeight = value;
					}
				} else if (!item.isFormField()) {
				
				 String [] ext = {".rar",".zip",".docx",".doc",".csv",".txt",".pdf",".jpeg",".png",".gif",".jpg",".JPEG",".JPG",".tif",".TIF",".RAR",".ZIP",".DOCX",".DOC",".CSV",".TXT",".PDF"};
                    String fileName = item.getName();					
					String fnTemp=fileName.toLowerCase();
			    
					for(int j=0;j<ext.length;j++){
					if(fnTemp.endsWith(ext[j])){
					temp ="false";
				
				    String fieldName = item.getFieldName();
					if (!item.getString().equals("") && item.getString()!=null){
				    fileName = item.getName();
					strFileNameLocal = fileName;
				    String contentType = item.getContentType();
				    boolean isInMemory = item.isInMemory();
				    long sizeInBytes = item.getSize();
					File tmpFile = new File(fileName);
					strFileNameLocal = tmpFile.getName();
					String newFileName = this.getServletContext().getRealPath("/bannerfile/") + 
							File.separator + strTime + "-" +tmpFile.getName();
					//out.println(newFileName + "<br/>");
					strFileName = strTime + "-" + tmpFile.getName();
					item.write(new File(newFileName));
					fSize = Long.toString(sizeInBytes);
			 		fContentType = contentType;
			 		fFileName = strFileNameLocal;
			 		fSFileName = strFileName;
					temp = "true";
					}
					}
					}
				}
			}
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }

if(temp.equals("true")){
if (linktype.equals("0")){
finallink = linksection;
}else if(linktype.equals("1")){
finallink = linkdirect;
}else{
finallink = linkurl;
}
//insert data into table for creating a new section

String updateinfo;

String query;
strFlashWidth = strFlashWidth.trim();
strFlashHeight = strFlashHeight.trim();

if(strFlashWidth.equals("")) {
	strFlashWidth = "0";
}
if(strFlashHeight.equals("")) {
	strFlashHeight = "0";
}

query = "INSERT INTO CMS_CREATE_BANNER (DCB_TYPE,DCB_LINK_TYPE,DCB_LINK,DCB_HOVER_ENGLISH,DCB_HOVER_HINDI,DCB_FILE_TYPE,DCB_CREATED_BY,DCB_FILE_NAME,DCB_FILE_SYSNAME,DCB_FILE_SIZE,DCB_FILE_EXT, DCB_WIDTH, DCB_HEIGHT,DCB_CREATED_DATE) VALUES ("+bannertype+","+linktype+",'"+finallink+"','"+filelabel0+"','"+filelabel1+"','"+filetype+"','"+session.getAttribute("DBAusername")+"','"+ fFileName +"','"+ fSFileName +"','"+ fSize +"','"+ fContentType +"'," + strFlashWidth + "," + strFlashHeight + ",now())";

dbBean.setQuery(query);
dbBean.go1();	

returnurl = "create_banner.jsp?msg=Banner%20Created";

String actype = "0";
String acmsg = "BannerCreate";
String acdescription = "Banner created type="+bannertype+", linktype="+linktype+", pointing to="+finallink+" with label = "+filelabel0+" created";
String acSqlQuery = query;
%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>

<% 
}else{
returnurl = "create_banner.jsp?msg=Not Authorised. Bad file formate.";
}

	response.sendRedirect(returnurl);
%>