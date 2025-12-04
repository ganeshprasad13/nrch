<%@ include file="../../dbConn/dbInit.jsp" %>
<%@ page language="java" import="jakarta.servlet.*,java.io.*,org.apache.commons.fileupload.*,java.util.*" %>

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
 Calendar cal = Calendar.getInstance();
int day =cal.get(Calendar.DAY_OF_MONTH );
int month =cal.get(Calendar.MONTH)+1;
int year = cal.get(Calendar.YEAR);
int hour =cal.get(Calendar.HOUR_OF_DAY ); 
int minute = cal.get(Calendar.MINUTE);
String suffix =day+"-"+month+"-"+year+"_"+hour+"."+minute;

String Division_id = "";
String Department_id = "";
System.out.println("test1");
String org_code = "";
String t_ref_no = "";
String t_title = "";
String t_Desc = "" ;
String t_pre_qual = "" ;
String t_location = "";
String t_pincode = "";
String t_currency = "";
String t_fee = "";
String t_value = "";
String t_emd = "";

String t_pub_date = "";
String t_pub_time = "";
String t_prebid_date = "";
String t_prebid_time = "";
String t_doc_start_date = "";
String t_doc_start_time = "";
String t_doc_end_date = "";
String t_doc_end_time = "";
String t_bidsub_start_date ="";
String t_bidsub_start_time ="";
String t_bidsub_end_date ="";
String t_bidsub_end_time ="";
String t_bid_open_date = "";
String t_bid_open_time = "";

String t_inviting_officer = "";
String t_inviting_off_address = "";
String t_prod_cat = "";
String t_prod_sub_cat ="";
String t_tender_type ="";
String t_tender_cat ="";
String t_form_contract ="";
String t_sector ="";
String t_state ="";
String CompPeriod = "";
String t_remarks ="";

String temp = "";
String div_id ="";
String dept_id ="";
System.out.println("test2");
String User = (String)session.getAttribute("DBAusername");
String strMSG = "";
int isfileuploaded = 0;

String fContentType = "";
String fFileName[] = new String[6];
String fSFileName = "";
String newFileName[] = new String[6];
long fSize =0;
int count =0;
Calendar calNow = Calendar.getInstance();
long lTime = calNow.getTimeInMillis();
String strTime = Long.toString(lTime);
strTime = ""+strTime+"_";
System.out.println("test3");
try {
	System.out.println("CONTENT-LENGHT" +  request.getContentLength());
	String sessId = session.getId();
	DiskFileUpload fu = new DiskFileUpload();
	fu.setSizeMax(999999999);
	fu.setSizeThreshold(4096);
	fu.setRepositoryPath(System.getProperty("java.io.tmpdir"));
	List fileItems = fu.parseRequest(request);
	Iterator i = fileItems.iterator();
	System.out.println("test4");
	while(i.hasNext()){
		FileItem item = (FileItem)i.next();
		if (item.isFormField()) {
			System.out.println("test5");
			String name = item.getFieldName();
			String value = item.getString();
			
			if (name.equals("Division_id")){
				Division_id = value.replaceAll("'","''");
			}
			
				if (name.equals("Department_id")){
				 Department_id = value.replaceAll("'","''");
			}	
			
			if (name.equals("org_code")){
				 org_code = value.replaceAll("'","''");
			}
			if (name.equals("t_ref_no")){
				 t_ref_no = value.replaceAll("'","&#39");
			}
			if (name.equals("t_title")){
				 t_title = value.replaceAll("'","&#39");
			}
			if (name.equals("t_Desc")){
				 t_Desc = value.replaceAll("'","&#39");
			}
			if (name.equals("t_pre_qual")){
				 t_pre_qual = value.replaceAll("'","&#39");
			}
			if (name.equals("t_location")){
				 t_location = value.replaceAll("'","&#39");
			}
			if (name.equals("t_pincode")){
				 t_pincode = value.replaceAll("'","''");
			}
			if (name.equals("t_currency")){
				 t_currency = value.replaceAll("'","''");
			}
			if (name.equals("t_fee")){
				 t_fee = value.replaceAll("'","''");
			}
			if (name.equals("t_value")){
				 t_value = value.replaceAll("'","''");
			}
			if (name.equals("t_emd")){
				 t_emd = value.replaceAll("'","''");
			}
			if (name.equals("t_pub_date")){
				 t_pub_date = value.replaceAll("'","''");
			}
			if (name.equals("t_pub_time")){
				 t_pub_time = value.replaceAll("'","''");
			}
			if (name.equals("t_prebid_date")){
				 t_prebid_date = value.replaceAll("'","''");
			}
			if (name.equals("t_prebid_time")){
				 t_prebid_time = value.replaceAll("'","''");
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
			if (name.equals("t_bid_open_date")){
				 t_bid_open_date = value.replaceAll("'","''");
			}	
			if (name.equals("t_bid_open_time")){
				 t_bid_open_time = value.replaceAll("'","''");
			}	
			if (name.equals("t_inviting_officer")){
				 t_inviting_officer = value.replaceAll("'","&#39");
			}	
			if (name.equals("t_inviting_off_address")){
				 t_inviting_off_address = value.replaceAll("'","&#39");
			}	
			if (name.equals("t_prod_cat")){
				 t_prod_cat = value.replaceAll("'","''");
			}	
			if (name.equals("t_prod_sub_cat")){
				 t_prod_sub_cat = value.replaceAll("'","''");
			}	
			if (name.equals("t_tender_type")){
				 t_tender_type = value.replaceAll("'","''");
			}	
			if (name.equals("t_tender_cat")){
				 t_tender_cat = value.replaceAll("'","''");
			}	
			if (name.equals("t_form_contract")){
				 t_form_contract = value.replaceAll("'","''");
			}	
			if (name.equals("t_sector")){
				t_sector = value.replaceAll("'","''");
			}
			if (name.equals("t_state")){
				t_state = value.replaceAll("'","''");
			}
			
			if (name.equals("CompPeriod")){
				 CompPeriod = value.replaceAll("'","''");
			}
			
			if (name.equals("t_remarks")){
				t_remarks = value.replaceAll("'","''");
			}
			
			if (name.equals("Division_id")){
				div_id = value.replaceAll("'","''");
			}
			if (name.equals("Department_id")){
				dept_id = value.replaceAll("'","''");
			}
			
		
	
	
		}else if (!item.isFormField()){   
System.out.println("test6");		
			String fieldName = item.getFieldName();
			out.println(fieldName+"-----");
			if (item.getString()!=null && item.getString().equals("")){
				System.out.println("test7");
				count++;
			}else{
			
			String [] ext = {".rar",".zip",".docx",".doc",".csv",".txt",".pdf",".jpeg",".png",".gif",".jpg",".JPEG",".JPG",".tif",".TIF",".RAR",".ZIP",".DOCX",".DOC",".CSV",".TXT",".PDF"};	
			temp ="false";
System.out.println("test8");
				isfileuploaded = 1;
				String fileName = item.getName();
				String fnTemp=fileName.toLowerCase();
				fContentType = item.getContentType();
				boolean isInMemory = item.isInMemory();
				fSize = item.getSize();
			for(int j=0;j<ext.length;j++){
			  if(fnTemp.endsWith(ext[j])){
				File tmpFile = new File(fileName);
				String strFileArray[] = tmpFile.getName().split("\\\\");
				fFileName[count] = strTime+strFileArray[strFileArray.length-1];
				newFileName[count] = this.getServletContext().getRealPath("/"+Hname+"/notice") + 
				File.separator  +strTime+strFileArray[strFileArray.length-1];
				item.write(new File(newFileName[count]));
				if(fFileName[count]!=null && !fFileName[count].equals("")){
					fFileName[count]=fFileName[count];
				}
				count++;
				temp = "true";
				}
			   }
			}
			
		}
	}                                   // end of While
}catch (Exception ex) {


 System.out.println("test9");
	ex.printStackTrace();
	
}

  

try {
System.out.println("test10");
	String NoticeQuery="";
	
String	pub_date = formatDate1(t_pub_date,t_pub_time);
String	prebid_date = formatDate1(t_prebid_date,t_prebid_time);
String	doc_start_date = formatDate1(t_doc_start_date,t_doc_start_time);
String	doc_end_date = formatDate1(t_doc_end_date,t_doc_end_time);
	
String	bidsub_start_date = formatDate1(t_bidsub_start_date,t_bidsub_start_time);
String	bidsub_end_date = formatDate1(t_bidsub_end_date,t_bidsub_end_time);
String	bid_open_date = formatDate1(t_bid_open_date,t_bid_open_time);
	
	
		/*
		NoticeQuery = "INSERT INTO CMS_NOTICE_MASTER(NOTICE_NO,VALID_FROM,VALID_TO,VALID_FORM_TIME,VALID_TO_TIME,FILE_NAME,STATUS,CREATED_BY,CREATED_ON,DESCRIPTION, DESCRIPTION_HINDI, HINDI_FILE_NAME,DIV_ID,DEPT_ID,TENDER_TYPE_ID,APPROXIMATE_COST,EARNEST_MONEY,TENDER_DOC_COST,TITLE_ENG,TITLE_HIN,DOCUMENT_COLL,DOCUMENT_SUBBMI,CONTACT_NAME,CONTACT_EMAIL,CONTACT_TP,CONTACT_ADD,FILE_NAME1,FILE_NAME2,FILE_NAME3,FILE_NAME4)";
		NoticeQuery+= "VALUES('"+NoticeNo+"','"+NoticeStartDate+"','"+NoticeEndDate+ "','"+NoticeOpenTime+"','" + NoticeClosTime +"','"+fFileName[0]+"','Active','"+User+"',NOW(),'"+English_Desc+"','"+Hindi_Desc+"','"+fFileName[5]+"',"+Division_id+","+Department_id+","+Tender_Type+",'"+Amount+"','"+Margin+"','"+TimeLimit+"','"+TenTitleEng+"','"+TenTitleHin+"','"+DocumentColl+"','"+DocumentSubmi+"','"+conName+"','"+conEmail+"','"+conTelPho+"','"+conAdd+"','"+fFileName[1]+"','"+fFileName[2]+"','"+fFileName[3]+"','"+fFileName[4]+"')";
	*/

	NoticeQuery ="INSERT INTO cms_notice_master_new ( XML_USER_ID, T_REF_NO, T_TITLE, T_DESC, T_PRE_QUAL, T_LOCATION, T_PINCODE, T_CURRENCY, T_FEE, T_VALUE, T_EMD, T_PUB_DATE, T_PREBID_DATE, T_DOC_START_DATE, T_DOC_END_DATE, T_BIDSUB_START_DATE, T_BIDSUB_END_DATE, T_BID_OPEN_DATE, T_INVITING_OFFICER, T_INVITING_OFF_ADDRESS, T_PROD_CAT, T_PROD_SUB_CAT, T_TENDER_TYPE, T_TENDER_CATEGORY, T_FORM_CONTRACT, T_SECTOR, T_STATE, T_REMARKS,DIV_ID,DEPT_ID, FILE_NAME, FILE_NAME1, FILE_NAME2, FILE_NAME3,      FILE_NAME4,STATUS,CREATED_BY,CREATED_ON,COMPLETION_PERIOD)";

NoticeQuery+= "VALUES('"+org_code+"','"+t_ref_no+"','"+t_title+"','"+t_Desc+"','"+t_pre_qual+"','"+t_location+"','"+t_pincode+"','"+t_currency+"','"+t_fee+"','"+t_value+"','"+t_emd+"','"+pub_date+"','"+prebid_date+"','"+doc_start_date+"','"+doc_end_date+"','"+bidsub_start_date+"','"+bidsub_end_date+"','"+bid_open_date+"','"+t_inviting_officer+"','"+t_inviting_off_address+"','"+t_prod_cat+"','"+t_prod_sub_cat+"','"+t_tender_type+"','"+t_tender_cat+"','"+t_form_contract+"','"+t_sector+"','"+t_state+"','"+t_remarks+"','"+div_id+"','"+dept_id+"','"+fFileName[0]+"', '"+fFileName[1]+"','"+fFileName[2]+"','"+fFileName[3]+"','"+fFileName[4]+"','Active','"+User+"',NOW(),'"+CompPeriod+"')";
	
	
	dbBean.setQuery(NoticeQuery);
	dbBean.go1();
	
	
	
	
	String actype = "0";
	String acmsg = "AddNewNotice";
	String acdescription =  session.getAttribute("DBAUserId") + " login for add New Notice information ";
	String acSqlQuery = NoticeQuery;
	System.out.println("test11");
	%>
	<%@ include file="../createlog.jsp" %>
<%
	strMSG = "Record Added Successfully";
}catch (Exception ex) {
	System.out.println("test12");
	ex.printStackTrace();
	strMSG = "Record Added Successfully";    //but error if double field not field as required
}
%>





<%
	try{
	//Anurag Tyagi
	System.out.println("test123");
	String updateurl="UPDATE cms_notice_master_new SET T_RETURN_URL= CONCAT('http://www."+Hname+".indianrailways.gov.in/TenderDetails_cpp.jsp?T_ID=',t_id,'&lang=0&id=0,299')";
	dbBean.setQuery(updateurl);
	dbBean.go1();
	
	strMSG = "Record Added Successfully";
}catch (Exception ex) {
	System.out.println("test14");
	ex.printStackTrace();
	strMSG = "Some error find"+ex;  //Anurag Tyagi
	//strMSG = "Record Added Successfully";    //but error if double field not field as required
}
%>



<% 
 if(temp.equals("false")){
			  response.sendRedirect("AddNotice.jsp?msg=Not Authorised  Bad file formate.");
			}else{
%>
<% response.sendRedirect("AddNotice.jsp?strMSG="+strMSG+"");}%>

<%@ include file="../../dbConn/dbClose.jsp" %>


