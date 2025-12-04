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

<%
String strFileName = "";
String strFileNameLocal = "";
String poolDir = strWebAppURL + "/uploads/directcontent/";
String strType = "";
Hashtable htFileProps = new Hashtable();
String strLabel = "";
String strLabe2 = "";

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
					if (name.equals("filelabel")) {
						strLabel = value;
					}
					if (name.equals("filelabe2")) {
						strLabe2 = value;
					}
				} else if (!item.isFormField()) {
				    String fieldName = item.getFieldName();
					if (!item.getString().equals("") && item.getString()!=null){
				    String fileName = item.getName();
					strFileNameLocal = fileName;
					//out.println(strFileNameLocal + "<br/>");
				    String contentType = item.getContentType();
				    boolean isInMemory = item.isInMemory();
				    long sizeInBytes = item.getSize();
					File tmpFile = new File(fileName);
					
					strFileNameLocal = tmpFile.getName();

					String[] myStrArr = tmpFile.getName().split("\\\\"); 
					if(myStrArr.length > 1){
					strFileNameLocal = myStrArr[myStrArr.length-1];
					}
				
					
					//out.println(strFileNameLocal + "<br/>");
					String newFileName = application.getRealPath("/uploads/directcontent/") + 
							File.separator + strTime + "-" +strFileNameLocal;
					//out.println(newFileName + "<br/>");
					
					strFileName = strTime + "-" + strFileNameLocal;
					
					item.write(new File(newFileName));
					htFileProps.put("sysName",strFileName);
					htFileProps.put("name",strFileNameLocal);
					htFileProps.put("contentType",contentType);
					htFileProps.put("size",Long.toString(sizeInBytes));
					htFileProps.put("lang",lang);
					}
				}
			}
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
		
Vector filesUploaded = (Vector)session.getAttribute("fileDirectUploaded");
if (filesUploaded==null) {
	filesUploaded = new Vector();
}
htFileProps.put("label",strLabel);
htFileProps.put("labe2",strLabe2);
filesUploaded.add(htFileProps);
session.setAttribute("fileDirectUploaded",filesUploaded);

%>
<%//=htFileProps.toString()%>

<% response.sendRedirect("upload_direct_file.jsp?langid="+lang);%>
</body>
</html>

