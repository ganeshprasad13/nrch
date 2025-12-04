<%@ page language="java" import="jakarta.servlet.*,java.io.*,org.apache.commons.fileupload.*,java.util.*,java.text.SimpleDateFormat,java.util.Date" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../dbConn/dbInit.jsp" %>


<%
try{ 


String zoneid=request.getParameter("ZONE_ID");
//String stationid=request.getParameter("STATION_ID");
String site=request.getParameter("SITE");
String stacat=request.getParameter("STA_CAT");
String area=request.getParameter("AREA");
String remark=request.getParameter("remark");
ResultSet rs_new=null;
out.print("a");
PreparedStatement ps = null;
String strQuery="";

String fSize = "";
String fContentType = "";
String fFileName = "";
String fSFileName = "";
int status = 0;
String strFlashWidth ="0";
String strFlashHeight = "0";

String strFileName = "";
String strFileNameLocal = "";
String strType = "";
String strLabel = "";
String strDay="",strMonth="",strYear="",strDate="";

try {
			
			//System.out.println(	"CONTENT-LENGHT" +	request.getContentLength());
			
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
			
			if(name.equals("ZONE_ID")){
				zoneid=value.replaceAll("'","''");
				out.print("b");
			}
			

			if(name.equals("SITE")){
				site=value.replaceAll("'","''");
			}			
			if(name.equals("STA_CAT")){
				stacat=value.replaceAll("'","''");
			}
			
			if(name.equals("AREA")){
				area=value.replaceAll("'","''");
			}
			if(name.equals("remark")){
				remark=value.replaceAll("'","''");
			}
			
			
			
			
				} 
				
				else if (!item.isFormField()) {
				
				    String fieldName = item.getFieldName();
					if (!item.getString().equals("") && item.getString()!=null){
				    String fileName = item.getName();
					strFileNameLocal = fileName;
				    String contentType = item.getContentType();
				    boolean isInMemory = item.isInMemory();
				    long sizeInBytes = item.getSize();
					File tmpFile = new File(fileName);
					strFileNameLocal = tmpFile.getName();
					String newFileName = application.getRealPath("/uploads/Commercial_Sites/") + 
					File.separator  +strMonth+strYear+strTime+strDate+tmpFile.getName().substring(fileName.indexOf("."));
					strFileName = strMonth+strYear+strTime+strDate+ tmpFile.getName().substring(fileName.indexOf("."));
					item.write(new File(newFileName));
					fSize = Long.toString(sizeInBytes);
			 		fContentType = contentType;
			 		fFileName = strFileNameLocal;
			 		fSFileName = strFileName;
					out.print("c");
					}
				
				}
			}
        }
        catch (Exception ex) {
		out.print(ex);
            ex.printStackTrace();
        }
		



strQuery="INSERT INTO  commercialsite1 (state,railway,site,area,status,fileupload) VALUES(?,?,?,?,?,?)";
ps=cn.prepareStatement(strQuery);
 ps.setString(1,stacat);
 ps.setString(2,zoneid);
 ps.setString(3,site);
 ps.setString(4,area);
 ps.setString(5,remark);
 ps.setString(6,strFileName);
 out.print("d");
 ps.execute();
 out.print("success");
response.sendRedirect("rlda.jsp?strMSG=Your Details have been Successfully Added.");

}
catch(Exception e)
{out.print(e);}
%>
