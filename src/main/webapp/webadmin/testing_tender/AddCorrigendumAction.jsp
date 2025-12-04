<%@ include file="../../dbConn/dbInit.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
<%@ page language="java" import="javax.servlet.*,java.io.*,org.apache.commons.fileupload.*,java.util.*" %>
<%@ taglib uri="http://jakarta.apache.org/taglibs/mailer-1.1" prefix="mt" %>
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
	//Anurag Tyagi
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
String Notice_id="";
String Tender_id="";
String Title_Eng="";
String Title_Hin="";
String  Desc_Eng="";
String Desc_Hin="";
String Corri_Type ="";
String revised_date = "";
String revised_time = "";
String temp = "";

//updating dates added 09 july 2012--Anurag Tyagi
	String	t_doc_start_date ="";
	String	t_doc_start_time ="";
	String	t_doc_end_date ="";
	String	t_doc_end_time ="";
	String	t_bidsub_start_date ="";
	String	t_bidsub_start_time ="";
	String	t_bidsub_end_date ="";
	String	t_bidsub_end_time ="";


String User = (String)session.getAttribute("DBAusername");
String strMSG = "";
int isfileuploaded = 0;
Calendar calNow = Calendar.getInstance();
long lTime = calNow.getTimeInMillis();
String strTime = Long.toString(lTime);
strTime = ""+strTime+"_";
String fContentType = "";
String fFileName[] = new String[2];
String fSFileName = "";
String newFileName[] = new String[2];
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
			if (name.equals("Notice_id")){
				Notice_id  = value.replaceAll("'","''");
			}
			if (name.equals("Tender_id")){
				 Tender_id  = value.replaceAll("'","''");
			}	
			if (name.equals("Title_Eng")){
				 Title_Eng  = value.replaceAll("'","''");
			}
			if (name.equals("Title_Hin")){
				 Title_Hin  = value.replaceAll("'","''");
			}
			if (name.equals("Desc_Eng")){
				 Desc_Eng  = value.replaceAll("'","''");
			}
			if (name.equals("Desc_Hin")){
				 Desc_Hin  = value.replaceAll("'","''");
			}
			if (name.equals("Corri_Type")){
				 Corri_Type  = value.replaceAll("'","''");
			}
			if (name.equals("revised_date")){
				 revised_date  = value.replaceAll("'","''");
			}
			if (name.equals("revised_time")){
				 revised_time  = value.replaceAll("'","''");
			}
				
		
		if (name.equals("t_doc_start_date")){
				 t_doc_start_date = value.replaceAll("'","''");
			}
			if (name.equals("t_doc_start_time")){
				 t_doc_start_time = value.replaceAll("'","''");
			}
			if (name.equals("t_doc_end_date")){
				 t_doc_end_date = value.replaceAll("'","''");
			}
			if (name.equals("t_doc_end_time")){
				 t_doc_end_time = value.replaceAll("'","''");
			}
			if (name.equals("t_bidsub_start_date")){
				 t_bidsub_start_date = value.replaceAll("'","''");
			}
			if (name.equals("t_bidsub_start_time")){
				 t_bidsub_start_time = value.replaceAll("'","''");
			}	
			if (name.equals("t_bidsub_end_date")){
				 t_bidsub_end_date = value.replaceAll("'","''");
			}	
			if (name.equals("t_bidsub_end_time")){
				 t_bidsub_end_time = value.replaceAll("'","''");
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
			    temp ="false";
				for(int j=0;j<ext.length;j++){
			    if(fnTemp.endsWith(ext[j])){
				
				fSize = item.getSize();
				File tmpFile = new File(fileName);
				String strFileArray[] = tmpFile.getName().split("\\\\");
				fFileName[count] = strTime+strFileArray[strFileArray.length-1];
				newFileName[count] = this.getServletContext().getRealPath("/"+Hname+"/corrigendum") + 
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
//Anurag
String	doc_start_date = formatDate1(t_doc_start_date,t_doc_start_time);
String	doc_end_date = formatDate1(t_doc_end_date,t_doc_end_time);
String	bidsub_start_date = formatDate1(t_bidsub_start_date,t_bidsub_start_time);
String	bidsub_end_date = formatDate1(t_bidsub_end_date,t_bidsub_end_time);


String NOTICE_TENDER_ID = "";
	if(Corri_Type.equals("1")){
		NOTICE_TENDER_ID = Notice_id;
	}
	if(Corri_Type.equals("2")){
		NOTICE_TENDER_ID = Tender_id;
	}
	
	//For change revised date
	
	if(!revised_date.equals("")){
	String strNoticeId = "";
	String strTenderId = "";
	String strPreDate = "";
	
	String revised_date_tm = formatDate(revised_date);         // need for tender master table 26-02-2013
	revised_date = formatDate1(revised_date,revised_time);
	
	if(Corri_Type.equals("1")){
		strNoticeId = Notice_id;
		String steTenderQuery = "SELECT ID FROM CMS_TENDER_MASTER_NEW WHERE NOTICE_ID ="+strNoticeId+"";
		dbBean.setQuery(steTenderQuery);
		String rsGetTenderId[][] = dbBean.getResultSet();
		if(rsGetTenderId.length>0){
			strTenderId = rsGetTenderId[0][0];
		}
	}
	if(Corri_Type.equals("2")){
		strTenderId = Tender_id;
		String steNoticeQuery = "SELECT NOTICE_ID FROM CMS_TENDER_MASTER_NEW WHERE ID ="+strTenderId+"";
		dbBean.setQuery(steNoticeQuery);
		String rsGetNoticeId[][] = dbBean.getResultSet();
		if(rsGetNoticeId.length>0){
			strNoticeId = rsGetNoticeId[0][0];
		}
	}
	String strUpdateDate = "";
	if(!strNoticeId.equals("")){
		strUpdateDate = "SELECT date_format(T_BID_OPEN_DATE,'%d-%m-%Y'),date_format(T_BID_OPEN_DATE,'%H:%i') FROM CMS_NOTICE_MASTER_NEW WHERE T_ID= "+strNoticeId+"";
		dbBean.setQuery(strUpdateDate);
		String rsGetPrevDate[][] = dbBean.getResultSet();
		if(rsGetPrevDate.length>0){
			strPreDate = rsGetPrevDate[0][0] +" "+ rsGetPrevDate[0][1];
		}
		
		
		strUpdateDate = "UPDATE CMS_NOTICE_MASTER_NEW SET T_BID_OPEN_DATE='"+revised_date+"' ,REVISED_DATE='"+strPreDate+"' WHERE T_ID= "+strNoticeId+"";
		dbBean.setQuery(strUpdateDate);
		dbBean.go1();
	}
	if(!strTenderId.equals("")){
		strUpdateDate = "UPDATE CMS_TENDER_MASTER_NEW SET TENDER_OPEN_DATE='"+revised_date_tm+"',TENDER_OPEN_TIME='"+revised_time+"' WHERE ID= "+strTenderId+"";
		dbBean.setQuery(strUpdateDate);
		dbBean.go1();
	}
}

//for updating dates added 09 july 2012
String tender_id_no="";
	String notice_id_no="";
	if(Corri_Type.equals("1")){
		notice_id_no=Notice_id;
		String steTenderQuery = "SELECT ID FROM CMS_TENDER_MASTER_NEW WHERE NOTICE_ID ='"+Notice_id+"'";
		dbBean.setQuery(steTenderQuery);
		String rsGetTenderId[][] = dbBean.getResultSet();
		if(rsGetTenderId.length>0){
			tender_id_no = rsGetTenderId[0][0];
		}
	}
	if(Corri_Type.equals("2")){
		tender_id_no=Tender_id;
		String steNoticeQuery = "SELECT NOTICE_ID FROM CMS_TENDER_MASTER_NEW WHERE ID ='"+Tender_id+"'";
		dbBean.setQuery(steNoticeQuery);
		String rsGetNoticeId[][] = dbBean.getResultSet();
		if(rsGetNoticeId.length>0){
			notice_id_no = rsGetNoticeId[0][0];
		}
	}
	String strUpdateDate2 = "UPDATE CMS_NOTICE_MASTER_NEW SET T_DOC_START_DATE='"+doc_start_date+"', T_DOC_END_DATE='"+doc_end_date+"', T_BIDSUB_START_DATE='"+bidsub_start_date+"', T_BIDSUB_END_DATE='"+bidsub_end_date+"' WHERE T_ID= '"+notice_id_no+"'";
		
		dbBean.setQuery(strUpdateDate2);
		dbBean.go1();
	
	strUpdateDate2 = "UPDATE CMS_TENDER_MASTER_NEW SET DOCUMENT_COLL='"+doc_end_date+"',DOCUMENT_SUBBMI='"+bidsub_end_date+"' WHERE ID= '"+tender_id_no+"'";
		
		dbBean.setQuery(strUpdateDate2);
		dbBean.go1();	
//end updating dates added 09 july 2012


//Finish
	String hindiTempTi = "";
	for(count=0;count<Title_Hin.length();count++)	{
		hindiTempTi +="&#"+(int)Title_Hin.charAt(count)+";";
	}Title_Hin = hindiTempTi;
	
	String hindiTempDesc = "";
	for(count=0;count<Desc_Hin.length();count++)	{
		hindiTempDesc +="&#"+(int)Desc_Hin.charAt(count)+";";
	}Desc_Hin = hindiTempDesc;
	String CorriQuery = "";
		CorriQuery = "INSERT INTO CMS_CORRIGENDUM_NEW(NOTICE_TENDER_ID, TYPE_ID,TITLE_ENG,DESCRIPTION_ENG, FILE_ENG,CREATED_BY, CREATED_ON,STATUS, TITLE_HIN,DESCRIPTION_HIN,FILE_HIN)";
		CorriQuery+= "VALUES("+NOTICE_TENDER_ID+","+Corri_Type+",'"+Title_Eng+"','"+Desc_Eng+"','"+fFileName[0]+"','"+User+"',NOW(),'Active','"+Title_Hin+"','"+Desc_Hin+"','"+fFileName[1]+"')";
	
	dbBean.setQuery(CorriQuery);
	dbBean.go1();
// For Sending mail if corrigendum issue after download tender
	String strMail = "";
	if(Corri_Type.equals("2")){
		strMail = "SELECT VL.VENDOR_NAME,VL.VENDOR_EMAIL,TM.TENDER_NO FROM CMS_TENDER_DOWNLOAD_LOG as TDL,CMS_VENDOR_LOGIN as VL,CMS_TENDER_MASTER_NEW as TM  WHERE TDL.TENDER_ID = "+NOTICE_TENDER_ID+" AND TM.ID="+NOTICE_TENDER_ID+" AND TDL.VENDOR_ID=VL.VENDOR_ID ";
	}
	//Anurag
	if(Corri_Type.equals("1")){
		strMail = "SELECT VL.VENDOR_NAME,VL.VENDOR_EMAIL,NM.T_REF_NO  FROM CMS_TENDER_DOWNLOAD_LOG as TDL,CMS_VENDOR_LOGIN as VL,CMS_NOTICE_MASTER_NEW as NM  WHERE TDL.NOTICE_ID  = "+NOTICE_TENDER_ID+" AND NM.T_ID="+NOTICE_TENDER_ID+" AND TDL.VENDOR_ID=VL.VENDOR_ID";
	}
	dbBean.setQuery(strMail);
	String rsGetMailDetails[][] = dbBean.getResultSet();
	if(rsGetMailDetails.length>0){
		String vendorName = rsGetMailDetails[0][0];
		String vendorEmail = rsGetMailDetails[0][1];
		String tenderNO = rsGetMailDetails[0][2];
		String message = "New corrigendum Issue corresponding to Tender No. <b>"+tenderNO+"</b>";
			   message +="<br>Download Corrigendum file <a href='http://cris-"+Hname+".cris.org.in/CRIS/"+Hname+"/corrigendum/"+fFileName[0]+"'>Click Here</a>";
		boolean bIsSMTPAuth = false;
		String strEmailFrom = ""+Hname+"@cris.org.in";
		String strEmailTo = vendorEmail;
		String strEmailCC = "anurag.tyagi@agnicient.com";
		String strEmailCc = "";
		String strEmailBcc = "";
		String strSubject ="New corrigendum Issue" ;
		String strMessage = message;
	%>
		<mt:mail>
			<mt:server>203.176.113.172</mt:server>
			<mt:setrecipient type="to"><%=strEmailTo%></mt:setrecipient>		
			<mt:from><%=strEmailFrom%></mt:from>
			<mt:subject><%=strSubject%></mt:subject>
			<mt:message type="html"><%=message%></mt:message>
			<mt:send>
				<p>There was an error while sending the email.<br/><br/>
				<mt:error id="err">
					<jsp:getProperty name="err" property="error"/><br/>
				</mt:error>
				<br/>Please back up a page, fix the error and resubmit.</p>
			</mt:send>
		</mt:mail>
	<%
	}
//Finish

	String actype = "0";
	String acmsg = "AddNewCorrigendum";
	String acdescription =  session.getAttribute("DBAUserId") + " login for add New Corrigendum information ";
	String acSqlQuery = CorriQuery;
	%>
	<%@ include file="../createlog.jsp" %>
<%
	//strMSG = "Record Added Successfully";
}catch (Exception ex) {
	//out.println("Found some error : "+ex);
	strMSG = "Found some error. Please try again";
}
%>
<%@ include file="../../dbConn/dbClose.jsp" %>

<% 
}else{
  strMSG = "Not Authorised  Bad file formate.";
} 
%>

<% response.sendRedirect("AddCorrigendum.jsp?strMSG="+strMSG+"");%>