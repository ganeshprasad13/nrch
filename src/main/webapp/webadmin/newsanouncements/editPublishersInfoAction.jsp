<%@ include file="../../dbConn/dbInit.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
<%@ page language="java" import="jakarta.servlet.*,java.io.*,org.apache.commons.fileupload.*,java.util.*" %>
<%!
	public String formatDate(String strDate){
		String strReturn = "";
		if(strDate == null || "".equals(strDate.trim())){ 
			return strReturn;
		}
		String strTemp[] = strDate.split("-");
		strReturn = (strTemp[2]+"-"+strTemp[1]+"-"+strTemp[0]);
		return strReturn;
	}
%>
<%
String pubName="";
String pubDesignation="";
String pubSign="";
String officerId = "";
String User = (String)session.getAttribute("DBAusername");
String strMSG = "";
int isfileuploaded = 0;
Calendar calNow = Calendar.getInstance();
long lTime = calNow.getTimeInMillis();
String strTime = Long.toString(lTime);
strTime = ""+strTime+"_";
String fContentType = "";
String fFileName[] = new String[1];
String fSFileName = "";
String newFileName[] = new String[1];
String temp = "";
long fSize =0;
int count =0;

try {
	System.out.println("CONTENT-LENGHT" +  request.getContentLength());
	String sessId = session.getId();
	DiskFileUpload fu = new DiskFileUpload();
	fu.setSizeMax(999999999);
	fu.setSizeThreshold(4096);
	fu.setRepositoryPath(System.getProperty("java.io.tmpdir"));
	List fileItems = fu.parseRequest(request);
	Iterator i = fileItems.iterator();
	while(i.hasNext()){
		FileItem item = (FileItem)i.next();
		if (item.isFormField()) {
			String name = item.getFieldName();
			String value = item.getString();
			if (name.equals("pubName")){
				pubName  = value.replaceAll("'","''");
			}
			if (name.equals("pubDesignation")){
				 pubDesignation  = value.replaceAll("'","''");
			}	
			if (name.equals("pubSign")){
				 pubSign  = value.replaceAll("'","''");
			}
			if (name.equals("officerId")){
				 officerId  = value.replaceAll("'","''");
			}
		}else if (!item.isFormField()){        
			String fieldName = item.getFieldName();
			out.println(fieldName+"-----");
			if (!item.getString().equals("") && item.getString()!=null){
				isfileuploaded = 1;
				String fileName = item.getName();
				fContentType = item.getContentType();
				boolean isInMemory = item.isInMemory();
				
				String [] ext = {".rar",".zip",".docx",".doc",".csv",".txt",".pdf",".jpeg",".png",".gif",".jpg",".JPEG",".JPG",".tif",".TIF",".RAR",".ZIP",".DOCX",".DOC",".CSV",".TXT",".PDF"};	
				String fnTemp=fileName.toLowerCase();
			    
				for(int j=0;j<ext.length;j++){
			    if(fnTemp.endsWith(ext[j])){
				temp ="false";
				
				fSize = item.getSize();
				File tmpFile = new File(fileName);
				String strFileArray[] = tmpFile.getName().split("\\\\");
				fFileName[count] = strTime+strFileArray[strFileArray.length-1];
				newFileName[count] = application.getRealPath("/signature") + 
				File.separator  +strTime+strFileArray[strFileArray.length-1];
				//out.print(newFileName + "<br/>");
				item.write(new File(newFileName[count]));
				if(fFileName[count]!=null && !fFileName[count].equals("")){
					fFileName[count]=""+fFileName[count];
				}
				count++;
				temp = "true";
			    }
			   }
			}
		}
	}                                   // end of While
}catch (Exception ex) {
	ex.printStackTrace();
	out.print(""+"inside"+ex.getMessage());
}
if(temp.equals("true")){

try {
	String strPubInfo = "";
		if(fFileName[0] != null && !fFileName[0].equals("")){
			strPubInfo = "UPDATE CMS_PRESS_PUBLISHER_INFO SET PUB_NAME='"+pubName+"', PUB_DESIGNATION='"+pubDesignation+"', PUB_SIGNATURE='"+fFileName[0]+"',PUB_MODIFY_ON=NOW(),PUB_MODIFY_BY='"+User+"' WHERE ID="+officerId+"";
		}else{
			strPubInfo = "UPDATE CMS_PRESS_PUBLISHER_INFO SET PUB_NAME='"+pubName+"', PUB_DESIGNATION='"+pubDesignation+"', PUB_MODIFY_ON=NOW(),PUB_MODIFY_BY='"+User+"' WHERE ID="+officerId+"";
		}
		dbBean.setQuery(strPubInfo);
		dbBean.go1();
	String actype = "0";
	String acmsg = "editNewPublisherInfo";
	String acdescription =  session.getAttribute("DBAUserId") + " login for edit Publisher Officer information ";
	String acSqlQuery = strPubInfo;
	%>
	<%@ include file="../createlog.jsp" %>
<%
	strMSG = "Record Updated Successfully";
}catch (Exception ex) {
	out.println("Found some error : "+ex);
}
}else{
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<%
 //response.sendRedirect("addPublishersInfo.jsp?msg=Not Authorised.  Bad file formate.");
  strMSG = "Not Authorised.  Bad file formate.";
} %>

<% response.sendRedirect("addPublishersInfo.jsp?strMSG="+strMSG+"");%>