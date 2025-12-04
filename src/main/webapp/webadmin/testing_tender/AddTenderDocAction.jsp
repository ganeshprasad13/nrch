<%@ include file="../../dbConn/dbInit.jsp" %>
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
<%!
	public String formatDate1(String strDate,String strDate1){
		String strReturn = "";
		if(strDate == null || "".equals(strDate.trim())){ 
			return strReturn;
		}
		String strTemp[] = strDate.split("-");
		strReturn = (strTemp[2]+"-"+strTemp[1]+"-"+strTemp[0])+" "+strDate1+":00";
		return strReturn;
	}
%>
<%
String User = "";
if(session.getAttribute("DBAusername") != null){
	User = (String)session.getAttribute("DBAusername");
}
String Tender_Type ="";
String Division_id ="";
String  Department_id ="";
String Notice_id ="";
String TenderNo ="" ;
String TenTitleEng ="" ;
String TenTitleHin = "";
String TenDescEng = "";
String TenDescHin = "";
String TenOpenDate = "";
String TenCloseDate = "";
String TenOpenTime = "";
String TenCloseTime = "";
String Amount = "";
String Margin = "";
String TimeLimit = "";
String DocumentColl = "";
String DocumentColl1 = "";
String DocumentSubmi = "";
String DocumentSubmi1 = "";
String strMSG = "Record Added Successfully";
int isfileuploaded = 0;
Calendar calNow = Calendar.getInstance();
long lTime = calNow.getTimeInMillis();
String strTime = Long.toString(lTime);
strTime = ""+strTime+"_";
String fContentType = "";
String fFileName[] = new String[11];
String fSFileName = "";
String newFileName[] = new String[11];
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
			
			if (name.equals("TenderNo")){
				 TenderNo  = value.replaceAll("'","''");
			}
			if (name.equals("TenTitleEng")){
				 TenTitleEng  = value.replaceAll("'","''");
			}
			if (name.equals("TenTitleHin")){
				 TenTitleHin  = value.replaceAll("'","''");
			}
			if (name.equals("TenDescEng")){
				 TenDescEng = value.replaceAll("'","''");
			}
			
			if (name.equals("TenDescHin")){
				 TenDescHin = value.replaceAll("'","''");
			}
			if (name.equals("TenOpenDate")){
				 TenOpenDate = value.replaceAll("'","''");
			}
			if (name.equals("TenCloseDate")){
				 TenCloseDate = value.replaceAll("'","''");
			}
			if (name.equals("TenOpenTime")){
				 TenOpenTime = value.replaceAll("'","''");
			}
			if (name.equals("TenCloseTime")){
				 TenCloseTime = value.replaceAll("'","''");
			}
			if (name.equals("Amount")){
				 Amount = value.replaceAll("'","''");
			}
			if (name.equals("Margin")){
				 Margin = value.replaceAll("'","''");
			}
			if (name.equals("TimeLimit")){
				 TimeLimit = value.replaceAll("'","''");
			}
			if (name.equals("Tender_Type")){
				Tender_Type  = value.replaceAll("'","''");
			}
			if (name.equals("Division_id")){
				 Division_id  = value.replaceAll("'","''");
			}	
			if (name.equals("Department_id")){
				 Department_id  = value.replaceAll("'","''");
			}
			if (name.equals("Notice_id")){
				 Notice_id  = value.replaceAll("'","''");
			}
			if (name.equals("DocumentColl")){
				 DocumentColl = value.replaceAll("'","''");
			}
			if (name.equals("DocumentColl1")){
				 DocumentColl1 = value.replaceAll("'","''");
			}
			if (name.equals("DocumentSubmi")){
				 DocumentSubmi = value.replaceAll("'","''");
			}
			if (name.equals("DocumentSubmi1")){
				 DocumentSubmi1 = value.replaceAll("'","''");
			}
				
		}else if (!item.isFormField()){        
			String fieldName = item.getFieldName();
			out.println(fieldName+"-----");
			if (!item.getString().equals("") && item.getString()!=null){
				isfileuploaded = 1;
				String fileName = item.getName();
				fContentType = item.getContentType();
				boolean isInMemory = item.isInMemory();
				fSize = item.getSize();
				File tmpFile = new File(fileName);
				String strFileArray[] = tmpFile.getName().split("\\\\");
				fFileName[count] = strTime+strFileArray[strFileArray.length-1];
				newFileName[count] = application.getRealPath(""+Hname+"/tender") + 
				File.separator  +strTime+strFileArray[strFileArray.length-1];
				//out.print(newFileName + "<br/>");
				item.write(new File(newFileName[count]));
				if(fFileName[count]!=null && !fFileName[count].equals("")){
					fFileName[count]=""+fFileName[count];
				}
				count++;
			}
		}
	}                                   // end of While
}catch (Exception ex) {
	ex.printStackTrace();
	out.print(""+"inside"+ex.getMessage());
}
try {
	
	String NoticeQuery="";
	float convertinlaks = 0;
    
 	if (Margin==null || Margin.equals("")){
        Margin = "0";
    }
    if (TimeLimit==null || TimeLimit.equals("")){
        TimeLimit = "0";
    }
	String hindiTempTi = "";
	for(count=0;count<TenTitleHin.length();count++)	{
		hindiTempTi +="&#"+(int)TenTitleHin.charAt(count)+";";
	}TenTitleHin = hindiTempTi;
	
	String hindiTempDesc = "";
	for(count=0;count<TenDescHin.length();count++)	{
		hindiTempDesc +="&#"+(int)TenDescHin.charAt(count)+";";
	}TenTitleHin = hindiTempDesc;
	TenOpenDate = formatDate(TenOpenDate);
	TenCloseDate = formatDate(TenCloseDate);
	DocumentColl = formatDate1(DocumentColl,DocumentColl1);
	DocumentSubmi = formatDate1(DocumentSubmi,DocumentSubmi1);
		NoticeQuery = "INSERT INTO CMS_TENDER_MASTER_NEW (TENDER_NO, NOTICE_ID, DIV_ID, DEPT_ID,TENDER_TITLE_ENG,TENDRT_TITLE_HINDI,TENDER_DESC_ENG,TENDER_DESC_HIN, TENDER_OPEN_DATE,TENDER_CLOSE_DATE,TENDER_OPEN_TIME,TENDER_CLOSE_TIME,APPROXIMATE_COST,EARNEST_MONEY,TENDER_DOC_COST,	FILE_ENG, FILE_HINDI,CREATED_BY,CREATED_ON, TENDER_TYPE_ID,STATUS,DOCUMENT_COLL,DOCUMENT_SUBBMI,FILE2,FILE3,FILE4,FILE5,FILE6,FILE7,FILE8,FILE9,FILE10)";
		NoticeQuery+= "VALUES('"+TenderNo+"',"+Notice_id+","+Division_id+","+Department_id+",'"+TenTitleEng+"','"+TenTitleHin+"','"+TenDescEng+"','"+TenDescHin+"','"+TenOpenDate+"','"+TenCloseDate+"','"+TenOpenTime+"','"+ TenCloseTime+"','"+Amount+"','"+Margin+"','"+TimeLimit+"','"+fFileName[0]+"','"+fFileName[10]+"','"+User+"',NOW(),"+Tender_Type+",'Active','"+DocumentColl+"','"+DocumentSubmi+"','"+fFileName[1]+"','"+fFileName[2]+"','"+fFileName[3]+"','"+fFileName[4]+"','"+fFileName[5]+"','"+fFileName[6]+"','"+fFileName[7]+"','"+fFileName[8]+"','"+fFileName[9]+"')";
	    
		dbBean.setQuery(NoticeQuery);
	dbBean.go1();
	
// For log Creation
	String actype = "0";
	String acmsg = "AddNewTenderDocument";
	String acdescription =  session.getAttribute("DBAUserId") + " login for add New Tender Document information ";
	String acSqlQuery = NoticeQuery;
	%>
	<%@ include file="../createlog.jsp" %>
<%
	strMSG = "Record Added Successfully";
}catch (Exception ex) {
	out.println("Found some error : "+ex);
}
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% response.sendRedirect("TenderDoc.jsp?strMSG="+strMSG+"");%>




