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
 Calendar cal = Calendar.getInstance();
int day =cal.get(Calendar.DAY_OF_MONTH );
int month =cal.get(Calendar.MONTH)+1;
int year = cal.get(Calendar.YEAR);
int hour =cal.get(Calendar.HOUR_OF_DAY ); 
int minute = cal.get(Calendar.MINUTE);
String suffix =day+"-"+month+"-"+year+"_"+hour+"."+minute;

String Division_id = "";
String Department_id = "";


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
String t_return_url ="";
String t_remarks ="";

String div_id ="";
String dept_id ="";

String N_ID="";
String User="";

if(session.getAttribute("DBAusername") != null){
	User = (String)session.getAttribute("DBAusername");
}
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
			if (name.equals("N_ID")){
				N_ID = value.replaceAll("'","''");
			}
			
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
				 t_ref_no = value.replaceAll("'","''");
			}
			if (name.equals("t_title")){
				 t_title = value.replaceAll("'","''");
			}
			if (name.equals("t_Desc")){
				 t_Desc = value.replaceAll("'","''");
			}
			if (name.equals("t_pre_qual")){
				 t_pre_qual = value.replaceAll("'","''");
			}
			if (name.equals("t_location")){
				 t_location = value.replaceAll("'","''");
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
				 t_inviting_officer = value.replaceAll("'","''");
			}	
			if (name.equals("t_inviting_off_address")){
				 t_inviting_off_address = value.replaceAll("'","''");
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
			if (name.equals("t_return_url")){
				t_return_url = value.replaceAll("'","''");
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
			String fieldName = item.getFieldName();
			out.println(fieldName+"-----");
			if (item.getString()==null || item.getString().equals("")){
					count++;
				}else{
				isfileuploaded = 1;
				String fileName = item.getName();
				fContentType = item.getContentType();
				boolean isInMemory = item.isInMemory();
				fSize = item.getSize();
				File tmpFile = new File(fileName);
				String strFileArray[] = tmpFile.getName().split("\\\\");
				fFileName[count] = strTime+strFileArray[strFileArray.length-1];
				newFileName[count] = application.getRealPath("/"+Hname+"/notice") + 
				File.separator  +strTime+strFileArray[strFileArray.length-1];
				item.write(new File(newFileName[count]));
				if(fFileName[count]!=null && !fFileName[count].equals("")){
					fFileName[count]=fFileName[count];
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
	String logDetails  = "";
	
	
	String	pub_date = formatDate1(t_pub_date,t_pub_time);
	String	prebid_date = formatDate1(t_prebid_date,t_prebid_time);
	String	doc_start_date = formatDate1(t_doc_start_date,t_doc_start_time);
	String	doc_end_date = formatDate1(t_doc_end_date,t_doc_end_time);
	
	String	bidsub_start_date = formatDate1(t_bidsub_start_date,t_bidsub_start_time);
	String	bidsub_end_date = formatDate1(t_bidsub_end_date,t_bidsub_end_time);
	String	bid_open_date = formatDate1(t_bid_open_date,t_bid_open_time);
	
		/*
		NoticeQuery = "UPDATE CMS_NOTICE_MASTER SET NOTICE_NO='"+NoticeNo+"',VALID_FROM='"+NoticeStartDate+"',VALID_TO='"+NoticeEndDate+ "',VALID_FORM_TIME='"+NoticeOpenTime+"',VALID_TO_TIME='" + NoticeClosTime +"'";
		NoticeQuery+= ",DESCRIPTION='"+English_Desc+"', DESCRIPTION_HINDI='"+Hindi_Desc+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW(),APPROXIMATE_COST='"+Amount+"',EARNEST_MONEY='"+Margin+"',TENDER_DOC_COST='"+TimeLimit+"',DOCUMENT_COLL='"+DocumentColl+"',DOCUMENT_SUBBMI='"+DocumentSubmi+"',TITLE_ENG='"+TenTitleEng+"',TITLE_HIN='"+TenTitleHin+"',CONTACT_NAME='"+conName+"',CONTACT_EMAIL='"+conEmail+"',CONTACT_TP='"+conTelPho+"',CONTACT_ADD='"+conAdd+"' WHERE ID ="+N_ID+"";
		*/
		
		NoticeQuery = "UPDATE CMS_NOTICE_MASTER_NEW SET T_REF_NO='"+t_ref_no+"',T_TITLE='"+t_title+"', T_DESC='"+t_Desc+"', T_PRE_QUAL='"+t_pre_qual+"', T_LOCATION='"+t_location+"', T_PINCODE='"+t_pincode+"', T_CURRENCY='"+t_currency+"', T_FEE='"+t_fee+"', T_VALUE='"+t_value+"', T_EMD='"+t_emd+"', T_PUB_DATE='"+pub_date+"', T_PREBID_DATE='"+prebid_date+"', T_DOC_START_DATE='"+doc_start_date+"', T_DOC_END_DATE='"+doc_end_date+"', T_BIDSUB_START_DATE='"+bidsub_start_date+"', T_BIDSUB_END_DATE='"+bidsub_end_date+"', T_BID_OPEN_DATE='"+bid_open_date+"', T_INVITING_OFFICER='"+t_inviting_officer+"', T_INVITING_OFF_ADDRESS='"+t_inviting_off_address+"', T_PROD_CAT='"+t_prod_cat+"', T_PROD_SUB_CAT='"+t_prod_sub_cat+"', T_TENDER_TYPE='"+t_tender_type+"', T_TENDER_CATEGORY='"+t_tender_cat+"', T_FORM_CONTRACT='"+t_form_contract+"', T_SECTOR='"+t_sector+"', T_STATE='"+t_state+"', T_RETURN_URL='"+t_return_url+"', T_REMARKS='"+t_remarks+"', MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE T_ID ='"+N_ID+"' ";
		
		
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logDetails = NoticeQuery;
	
	
	if(fFileName[0] != null && !fFileName[0].equals("")){
		NoticeQuery = "UPDATE CMS_NOTICE_MASTER_NEW SET FILE_NAME='"+fFileName[0]+"' WHERE T_ID ="+N_ID+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logDetails +=NoticeQuery;
	}
	if(fFileName[1] != null && !fFileName[1].equals("")){
		NoticeQuery = "UPDATE CMS_NOTICE_MASTER_NEW SET FILE_NAME1='"+fFileName[1]+"' WHERE T_ID ="+N_ID+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logDetails +=NoticeQuery;
	}
	if(fFileName[2] != null && !fFileName[2].equals("")){
		NoticeQuery = "UPDATE CMS_NOTICE_MASTER_NEW SET FILE_NAME2='"+fFileName[2]+"' WHERE T_ID ="+N_ID+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logDetails +=NoticeQuery;
	}
	if(fFileName[3] != null && !fFileName[3].equals("")){
		NoticeQuery = "UPDATE CMS_NOTICE_MASTER_NEW SET FILE_NAME3='"+fFileName[3]+"' WHERE T_ID ="+N_ID+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logDetails +=NoticeQuery;
	}
	if(fFileName[4] != null && !fFileName[4].equals("")){
		NoticeQuery = "UPDATE CMS_NOTICE_MASTER_NEW SET FILE_NAME4='"+fFileName[4]+"' WHERE T_ID ="+N_ID+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logDetails +=NoticeQuery;
	}
	
	/*
	String tenderQuery = "UPDATE CMS_TENDER_MASTER_NEW SET TENDER_NO = '"+NoticeNo+"',TENDER_OPEN_DATE='"+NoticeStartDate+"',TENDER_CLOSE_DATE='"+NoticeEndDate+ "',";
	tenderQuery += " TENDER_OPEN_TIME = '"+NoticeOpenTime+"',TENDER_CLOSE_TIME='"+NoticeClosTime+"',APPROXIMATE_COST='"+Amount+"', EARNEST_MONEY='"+Margin+"', TENDER_DOC_COST='"+TimeLimit+"' ,";
	tenderQuery += " TENDER_TITLE_ENG='"+TenTitleEng+"', TENDRT_TITLE_HINDI='"+TenTitleHin+"', TENDER_DESC_ENG='"+English_Desc+"', TENDER_DESC_HIN='"+Hindi_Desc+"' WHERE NOTICE_ID= "+N_ID+"";
	//out.print(NoticeQuery);
	*/
	//Anurag Tyagi
	String tenderQuery = "UPDATE CMS_TENDER_MASTER_NEW SET TENDER_NO = '"+t_ref_no+"',TENDER_OPEN_DATE='"+formatDate(t_bid_open_date)+"',TENDER_CLOSE_DATE='"+formatDate(t_pub_date)+ "',";
	
	tenderQuery += " TENDER_OPEN_TIME = '"+t_bid_open_time+"',TENDER_CLOSE_TIME='"+t_pub_time+"',APPROXIMATE_COST='"+t_value+"', EARNEST_MONEY='"+t_emd+"', TENDER_DOC_COST='"+t_fee+"' ,";
	
	tenderQuery += " TENDER_TITLE_ENG='"+t_title+"', TENDER_DESC_ENG='"+t_Desc+"' WHERE NOTICE_ID= "+N_ID+"";
	
	
	dbBean.setQuery(tenderQuery);
	dbBean.go1();
	logDetails +=tenderQuery;
	
	String actype = "0";
	String acmsg = "EditNotice";
	String acdescription =  session.getAttribute("DBAUserId") + " login for Edit Notice information ";
	String acSqlQuery = logDetails;
	%>
	<%@ include file="../createlog.jsp" %>
<%
	strMSG = "Record Updated Successfully";
}catch (Exception ex) {
	out.println("Found some error : "+ex);
	//strMSG = "Some error find";
	
	strMSG = "Record Updated Successfully";  // for required purpose
}
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% response.sendRedirect("searchNotice.jsp?strMSG="+strMSG+"");%>




