<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.util.Date,java.text.SimpleDateFormat" %>
<script type="text/javascript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<SCRIPT src="ktdv.js"></script>

<script type="text/javascript">
  	/* No need of it 
	function submit_self()
	{
		var data = document.editNotice.Division_id.value;
		var data1 = document.editNotice.Tender_Type.value;
		document.editNotice.action='editNotice.jsp?Division_id='+data+'&Tender_Type='+data1;
		document.editNotice.submit();
	}
	*/ 
	function CheckForm(){
	
	if(document.editNotice.Division_id.value == 0){
			alert("Please select Dividion ");
			return false
		}
		if(document.editNotice.Department_id.value == 0){
			alert("Please select Department ");
			return false
		}
	
	
	if(document.editNotice.t_ref_no.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Reference No. ");
			document.editNotice.t_ref_no.focus(); 
			return false
		}
	
	if(document.editNotice.t_title.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Title ");
			document.editNotice.t_title.focus();
			return false
		}
	if(document.editNotice.t_Desc.value == ""){
			alert("Please Enter Tender Description ");
			document.editNotice.t_Desc.focus();
			return false
		}
	if(document.editNotice.t_location.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Location ");
			document.editNotice.t_location.focus();
			return false
		}
	
	
	
	//Date validations start here---Anurag Tyagi
	
	
	
	if(document.editNotice.t_pub_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Publication Date");
			document.editNotice.t_pub_date.focus(); 
			return false
		}
	
	if(document.editNotice.t_pub_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.editNotice.t_pub_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.editNotice.t_pub_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.editNotice.t_pub_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.editNotice.t_pub_time.focus(); 
				return false;
			}
		}
	
	
	
	
	/*
	if(document.editNotice.t_prebid_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender PreBid Date");
			document.editNotice.t_prebid_date.focus(); 
			return false
		}
	if(document.editNotice.t_prebid_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.editNotice.t_prebid_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.editNotice.t_prebid_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.editNotice.t_prebid_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.editNotice.t_prebid_time.focus(); 
				return false;
			}
		}
	
	*/
	
	
	if(document.editNotice.t_doc_start_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Document Start Date");
			document.editNotice.t_doc_start_date.focus(); 
			return false
		}
	if(document.editNotice.t_doc_start_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.editNotice.t_doc_start_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.editNotice.t_doc_start_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.editNotice.t_doc_start_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.editNotice.t_doc_start_time.focus(); 
				return false;
			}
		}
	if(document.editNotice.t_doc_end_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Document End Date");
			document.editNotice.t_doc_end_date.focus(); 
			return false
		}
	if(document.editNotice.t_doc_end_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.editNotice.t_doc_end_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.editNotice.t_doc_end_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.editNotice.t_doc_end_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.editNotice.t_doc_end_time.focus(); 
				return false;
			}
		}
	if(document.editNotice.t_bidsub_start_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender BidSub Start Date");
			document.editNotice.t_bidsub_start_date.focus(); 
			return false
		}
	if(document.editNotice.t_bidsub_start_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.editNotice.t_bidsub_start_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.editNotice.t_bidsub_start_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.editNotice.t_bidsub_start_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.editNotice.t_bidsub_start_time.focus(); 
				return false;
			}
		}
	if(document.editNotice.t_bidsub_end_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender BidSub End Date");
			document.editNotice.t_bidsub_end_date.focus(); 
			return false
		}
	if(document.editNotice.t_bidsub_end_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.editNotice.t_bidsub_end_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.editNotice.t_bidsub_end_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.editNotice.t_bidsub_end_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.editNotice.t_bidsub_end_time.focus(); 
				return false;
			}
		}
	if(document.editNotice.t_bid_open_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Bid Open Date");
			document.editNotice.t_bid_open_date.focus(); 
			return false
		}
	if(document.editNotice.t_bid_open_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.editNotice.t_bid_open_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.editNotice.t_bid_open_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.editNotice.t_bid_open_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.editNotice.t_bid_open_time.focus(); 
				return false;
			}
		}
	//End of normal blank date validation
	//Date difference validation start here
	var t1 = document.editNotice.t_pub_date.value;
		var m1 = document.editNotice.t_pub_time.value;
		var t2 = t1.split("-");
		var m2 = m1.split(":");
		var PubDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
		 
		 t1 = document.editNotice.t_prebid_date.value;
		 m1 = document.editNotice.t_prebid_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var PreBidDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
		
		if(PubDateTime > PreBidDateTime){
			alert("PreBid Date should be greater than Publication Date");
			document.editNotice.t_prebid_date.focus(); 
			return false;
		}
	
	t1 = document.editNotice.t_doc_start_date.value;
		 m1 = document.editNotice.t_doc_start_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var DocStartDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > DocStartDateTime){
			alert("Document Start Date should be greater than Publication Date");
			document.editNotice.t_doc_start_date.focus(); 
			return false;
		}
	
	t1 = document.editNotice.t_doc_end_date.value;
		 m1 = document.editNotice.t_doc_end_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var DocEndDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > DocEndDateTime){
			alert("Document End Date should be greater than Publication Date");
			document.editNotice.t_doc_end_date.focus(); 
			return false;
		}
	
	t1 = document.editNotice.t_bidsub_start_date.value;
		 m1 = document.editNotice.t_bidsub_start_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var BidSubStartDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > BidSubStartDateTime){
			alert("BidSub Start Date should be greater than Publication Date");
			document.editNotice.t_bidsub_start_date.focus(); 
			return false;
		}
	
	t1 = document.editNotice.t_bidsub_end_date.value;
		 m1 = document.editNotice.t_bidsub_end_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var BidSubEndDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > BidSubEndDateTime){
			alert("BidSub End Date should be greater than Publication Date");
			document.editNotice.t_bidsub_end_date.focus(); 
			return false;
		}
	
	t1 = document.editNotice.t_bid_open_date.value;
		 m1 = document.editNotice.t_bid_open_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var BidOpenDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than Publication Date");
			document.editNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	//other conditions --Anurag Tyagi
	
	if(DocStartDateTime > BidSubStartDateTime){
			alert("Bid Submission Start Date should be greater than or equal to Document Download Start Date");
			document.editNotice.t_bidsub_start_date.focus(); 
			return false;
		}
	
	if(DocStartDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than or equal to Document Download Start Date");
			document.editNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	if(DocEndDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than or equal to Document Download End Date");
			document.editNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	if(BidSubStartDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than or equal to Bid Submission Start Date");
			document.editNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	if(BidSubEndDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than or equal to Bid Submission End Date");
			document.editNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	//other conditions end
	
	
	//End of Date Difference script---Anurag
	
	
	if(document.editNotice.t_inviting_officer.value == ""){
			alert("Please Enter Tender Inviting Officer ");
			document.editNotice.t_inviting_officer.focus();
			return false
		}
	if(document.editNotice.t_inviting_off_address.value == ""){
			alert("Please Enter Tender Inviting Officer's Address ");
			document.editNotice.t_inviting_off_address.focus();
			return false
		}
	
	
	if(document.editNotice.t_prod_cat.value == 0){
			alert("Please select Product Category ");
			return false
		}
	
	if(document.editNotice.t_tender_type.value == 0){
			alert("Please select Tender Type ");
			return false
		}
	if(document.editNotice.t_tender_cat.value == 0){
			alert("Please select Tender Category ");
			return false
		}
	if(document.editNotice.t_sector.value == 0){
			alert("Please select Sector ");
			return false
		}
	if(document.editNotice.t_state.value == 0){
			alert("Please select State ");
			return false
		}
	
	if(document.editNotice.FileUpload11.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Select file ");
			document.editNotice.FileUpload11.focus(); 
			return false
		}
		
		return true;
	}
	
	
	//Anurag Tyagi
	function SpecChk(testid)
   {  
     var testValue=testid.value;
      //var iChars = "!@#$%^&*()+=-[]\';,./{}|\":<>?";   
	  var iChars = "%'";   
      for (var i = 0; i < iChars.length; i++) {   
        if (testValue.indexOf(iChars.charAt(i)) != -1)    
        {    
          alert(" Special characters like ' and %  are not allowed. Please remove them and try again.");
		  testid.value=filter(testid.value);
		  return false;  
		   }  
	                                          }
      return true;
   }
	function filter(str) {
         
          //re = /\$|,|@|#|~|`|\%|\*|\^|\&|\(|\)|\+|\=|\[|\-|\_|\]|\[|\}|\{|\;|\:|\'|\"|\<|\>|\?|\||\\|\!|\$|\./g;
		 // remove special characters like "$" and "," etc...
		   re = /\$|\%|\'/g;
          return str.replace(re, "");
     }
	 
	 function SpecChk2(testid)
   {  
     var testValue=testid.value;
      //var iChars = "!@#$%^&*()+=-[]\';,./{}|\":<>?";   
	  var iChars = "!@#$%^&*()+=-[]\';,/{}|\":<>?";   
      for (var i = 0; i < iChars.length; i++) {   
        if (testValue.indexOf(iChars.charAt(i)) != -1)    
        {    
          alert(" Special characters are not allowed.");
		  testid.value=filter2(testid.value);
		  return false;  
		   }  
	                                          }
      return true;
   }
	function filter2(str) {
         
          //re = /\$|,|@|#|~|`|\%|\*|\^|\&|\(|\)|\+|\=|\[|\-|\_|\]|\[|\}|\{|\;|\:|\'|\"|\<|\>|\?|\||\\|\!|\$|\./g;
		 // remove special characters like "$" and "," etc...
		  re = /\$|,|@|#|~|`|\%|\*|\^|\&|\(|\)|\+|\=|\[|\-|\_|\]|\[|\}|\{|\;|\:|\'|\"|\<|\>|\?|\||\\|\!|\$/g;
          return str.replace(re, "");
     }
	
	//For jsp file check--Anurag
	function ChkfileExt(id){
	var fileName =id.value;
	var arr=fileName.substring(0,fileName.indexOf('.')-1);
	var iChars = "!@#$%^&*()+=-[]\';,/{}|\"<>?";   
      for (var i = 0; i < iChars.length; i++) {   
        if (arr.indexOf(iChars.charAt(i)) != -1||arr.indexOf(' ')!=-1)    
        {    
          alert("Special characters and spaces are not allowed in file name");
		  id.value="";
		  return false;  
		   }  
		   }
	if(fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".bmp")==-1){
		alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
		id.value="";
	}
}
</script>
<%
Calendar cal = Calendar.getInstance();
String timeZone = cal.getTimeZone().getDisplayName();
final String DATE_FORMAT_NOW = "dd-MM-yyyy HH:mm:ss";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
String time=sdf.format(cal.getTime());

String N_ID  = "-100";
if(request.getParameter("N_ID")!=null &&  !request.getParameter("N_ID").trim().equals("")){
	N_ID = request.getParameter("N_ID");
}
String strTenTypeId  = "-100";
if(request.getParameter("type_id")!=null &&  !request.getParameter("type_id").trim().equals("")){
	strTenTypeId = request.getParameter("type_id");
}

String strTenType = "";
strTenType = "SELECT TypeID,TENDER_TYPE FROM CMS_TENDER_TYPE_NEW";
dbBean.setQuery(strTenType);
String rsGetTenType[][] = dbBean.getResultSet();

String strDivision = "";
strDivision = "SELECT CMSD_ID,CMSD_DIVISIONS FROM CMS_DIVISIONS ORDER BY CMSD_DIVISIONS";
dbBean.setQuery(strDivision);
String rsGetDivision[][] = dbBean.getResultSet();

String strDepartment = "";
String strDepartmentId = (String)session.getAttribute("DEPT_ID");
		//strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE CMSDEPT_ID IN ("+strDepartmentId+") ";
strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS ";
dbBean.setQuery(strDepartment);
String rsGetDepartment[][] = dbBean.getResultSet();

    
//Anurag

String strProdCat = "";
strProdCat = "SELECT ProdCode,ProductName FROM cms_product_master";
dbBean.setQuery(strProdCat);
String rsGetProdCat[][] = dbBean.getResultSet();

String strTenCat = "";
strTenCat = "SELECT TenderCatcode,Description FROM cms_tender_category";
dbBean.setQuery(strTenCat);
String rsGetTenCat[][] = dbBean.getResultSet();

String strFormCont = "";
strFormCont = "SELECT ContractID,form_of_contract FROM cms_form_contract_master";
dbBean.setQuery(strFormCont);
String rsGetFormCont[][] = dbBean.getResultSet();

String strSector = "";
strSector = "SELECT SectorID,SectorName FROM cms_sector_master";
dbBean.setQuery(strSector);
String rsGetSector[][] = dbBean.getResultSet();

String strState = "";
strState = "SELECT StateID,StateName FROM cms_state_master";
dbBean.setQuery(strState);
String rsGetState[][] = dbBean.getResultSet();	
	
	
	String	strDivId ="";
	String	strDeptId ="";
	String	org_code ="";
	String	ref_no  ="";
	String	title ="";
	String	desc  ="";
	String	pre_qual="";
	String	location  ="";
	String	pincode =""; 
	String	cur  ="";
	String	fee ="";
	String	value ="";
	String	emd="";
	String	pub_date ="";
	String	pub_date_time ="";
	String	prebid_date ="";
	String	prebid_date_time ="";
	
	String	doc_strDate ="";
	String	doc_strDate_time ="";
	String	doc_endDate ="";
	String	doc_endDate_time ="";
	
	String	bidsub_strDate ="";
	String	bidsub_strDate_time ="";
	String	bidsub_endDate ="";
	String	bidsub_endDate_time ="";
	String	bidopen_Date ="";
	String	bidopen_Date_time ="";
	String	inviting_off ="";
	String	inviting_off_add ="";
	
	String	prod_cat ="";
	String	prod_subcat ="";
	//String	strTenTypeId ="";
	String	tender_cat ="";
	String	form_contract ="";
	String	strsector ="";
	String	strstate ="";
	String	ret_url ="";
	
	String	remarks ="";
	String	file ="";
	String	file1 ="";
	String	file2="";
	String	file3 ="";
	String	file4 ="";
	//Anurag
	String currentDate="";
	String chkbidopen_Date="";
	int expired=-100;
	
	
	String strNotice= "";
	strNotice = "SELECT NM.T_ID, DIVI.CMSD_ID, DEPT.CMSDEPT_ID, NM.XML_USER_ID, NM.T_REF_NO, NM.T_TITLE, NM.T_DESC, NM.T_PRE_QUAL, NM.T_LOCATION, NM.T_PINCODE, NM.T_CURRENCY, NM.T_FEE, NM.T_VALUE, NM.T_EMD, DATE_FORMAT(NM.T_PUB_DATE,'%d-%m-%Y'), DATE_FORMAT(NM.T_PUB_DATE,'%H:%i'), DATE_FORMAT(NM.T_PREBID_DATE,'%d-%m-%Y'), DATE_FORMAT(NM.T_PREBID_DATE,'%H:%i'), DATE_FORMAT(NM.T_DOC_START_DATE,'%d-%m-%Y'), DATE_FORMAT(NM.T_DOC_START_DATE,'%H:%i'), DATE_FORMAT(NM.T_DOC_END_DATE,'%d-%m-%Y'), DATE_FORMAT(NM.T_DOC_END_DATE,'%H:%i'), DATE_FORMAT(NM.T_BIDSUB_START_DATE,'%d-%m-%Y'), DATE_FORMAT(NM.T_BIDSUB_START_DATE,'%H:%i'), DATE_FORMAT(NM.T_BIDSUB_END_DATE,'%d-%m-%Y'), DATE_FORMAT(NM.T_BIDSUB_END_DATE,'%H:%i'), DATE_FORMAT(NM.T_BID_OPEN_DATE,'%d-%m-%Y'), DATE_FORMAT(NM.T_BID_OPEN_DATE,'%H:%i'), NM.T_INVITING_OFFICER, NM.T_INVITING_OFF_ADDRESS, NM.T_PROD_CAT, NM.T_PROD_SUB_CAT, NM.T_TENDER_TYPE, NM.T_TENDER_CATEGORY, NM.T_FORM_CONTRACT, NM.T_SECTOR, NM.T_STATE, NM.T_RETURN_URL, NM.T_REMARKS, NM.FILE_NAME, NM.FILE_NAME1, NM.FILE_NAME2, NM.FILE_NAME3, NM.FILE_NAME4, DATE_FORMAT(NOW(),'%d-%m-%Y %H:%i:%s'), DATE_FORMAT(NM.T_BID_OPEN_DATE,'%d-%m-%Y %H:%i:%s') FROM CMS_NOTICE_MASTER_NEW AS NM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = NM.DEPT_ID AND DIVI.CMSD_ID = NM.DIV_ID AND STATUS = 'Active' "; 
	
	strNotice +=" AND T_ID = "+N_ID+"";
	
	dbBean.setQuery(strNotice);
	String rsGetNoticeDetails[][] = dbBean.getResultSet();
	if(rsGetNoticeDetails.length>0){
	
		strDivId  = rsGetNoticeDetails[0][1];
		strDeptId = rsGetNoticeDetails[0][2];
		org_code  = rsGetNoticeDetails[0][3];
		ref_no  = rsGetNoticeDetails[0][4];
		title = rsGetNoticeDetails[0][5];
		desc  = rsGetNoticeDetails[0][6];
		pre_qual = rsGetNoticeDetails[0][7];
		location   = rsGetNoticeDetails[0][8];
		pincode   = rsGetNoticeDetails[0][9];
		cur   = rsGetNoticeDetails[0][10];
		fee   = rsGetNoticeDetails[0][11];
		value = rsGetNoticeDetails[0][12];
		emd = rsGetNoticeDetails[0][13];
		pub_date = rsGetNoticeDetails[0][14];
		pub_date_time = rsGetNoticeDetails[0][15];
		prebid_date = rsGetNoticeDetails[0][16];
		prebid_date_time = rsGetNoticeDetails[0][17];
	
		doc_strDate = rsGetNoticeDetails[0][18];
		doc_strDate_time = rsGetNoticeDetails[0][19];
		doc_endDate = rsGetNoticeDetails[0][20];
		doc_endDate_time = rsGetNoticeDetails[0][21];
	
		bidsub_strDate =rsGetNoticeDetails[0][22];
		bidsub_strDate_time =rsGetNoticeDetails[0][23];
		bidsub_endDate =rsGetNoticeDetails[0][24];
		bidsub_endDate_time = rsGetNoticeDetails[0][25];
		bidopen_Date = rsGetNoticeDetails[0][26];
		bidopen_Date_time = rsGetNoticeDetails[0][27];
		inviting_off = rsGetNoticeDetails[0][28];
		inviting_off_add = rsGetNoticeDetails[0][29];
	
		prod_cat =rsGetNoticeDetails[0][30];
		prod_subcat =rsGetNoticeDetails[0][31];
		strTenTypeId =rsGetNoticeDetails[0][32];
		tender_cat = rsGetNoticeDetails[0][33];
		form_contract = rsGetNoticeDetails[0][34];
		strsector = rsGetNoticeDetails[0][35];
		strstate = rsGetNoticeDetails[0][36];
		ret_url = rsGetNoticeDetails[0][37];
	
		remarks =rsGetNoticeDetails[0][38];
		file =rsGetNoticeDetails[0][39];
		file1 =rsGetNoticeDetails[0][40];
		file2 = rsGetNoticeDetails[0][41];
		file3 = rsGetNoticeDetails[0][42];
		file4 = rsGetNoticeDetails[0][43];
		
		//not editing expired tender--Anurag
		currentDate= rsGetNoticeDetails[0][44];
		chkbidopen_Date= rsGetNoticeDetails[0][45];
		//out.print("Current Date"+currentDate); //out.print("<br>");
		//out.print("Open Date"+chkbidopen_Date);
		try{
		SimpleDateFormat mysdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date date1 = mysdf.parse(currentDate);
		Date date2 = mysdf.parse(chkbidopen_Date);
		if (date1.after(date2)) {
                //out.print("Tender Open Date Expired");
				expired=-1;
            }
		if (date1.before(date2)) {
                //out.print("Tender Open Date not Expired");
				expired=1;
            }
		if (date1.equals(date2)) {
                //out.print("Today is last Date");
				expired=0;
            }
			//out.print("Expired No."+expired);
			}catch(Exception e){out.print(e);}
		
		
		}
%>

<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;<a href="index.jsp?selectType=1">Manage Tender Notice</a>
&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;<a href="searchNotice.jsp">Search Notice</a>&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;Edit Tender Notice</span></p>

<form id="form1"  name="editNotice" action="editNoticeAction.jsp" METHOD="POST" ENCTYPE="multipart/form-data" onsubmit="return CheckForm();">
        <input type="hidden" name="N_ID" value="<%=N_ID%>">
		<table width="50%" border="1" align="center" class="sample">
			<tr>
                <td colspan="2" align="center"><font color="blue">
                   <%if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }%>
					</font>
                </td>
            </tr>
            <tr class="tr_bgcolor">
                <td colspan="2" align="center">
                    <b>Edit Tender Notice</b>

                </td>
            </tr>
			<tr>
                <td> ORGANISATION CODE</td>
                <td><input name="org_code" type="text" id="org_code" value="<%=org_code%>" readonly /></td>
			 </tr>
			
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font>Division</td>
                <td><select name="Division_id" disabled="disabled">
			  			<option value="0">--Select Division--</option>
						<%if(rsGetDivision.length>0){
							for(int i=0;i<rsGetDivision.length;i++){%>
							<option value="<%=rsGetDivision[i][0]%>" <%if(strDivId.equals(rsGetDivision[i][0])){%>selected<%}%> ><%=rsGetDivision[i][1]%></option>
						<%	}
						}%>
						<option value="-1" <%if(strDivId.equals("-1")){%>selected<%}%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Division</option>
					</select></td>
			 </tr>
             <tr>
                <td><font color="red"><b>*&nbsp;</b></font>Department</td>
                <td><select name="Department_id" disabled="disabled">
				<option value="0">--Select Department--</option>
						<%if(rsGetDepartment.length>0){%>
						<%
							for(int i=0;i<rsGetDepartment.length;i++){%>
							<option value="<%=rsGetDepartment[i][0]%>" <%if(strDeptId.equals(rsGetDepartment[i][0])){%>selected<%}%> ><%=rsGetDepartment[i][1]%></option>
						<%	}
						}%>
						<%if(strDivId.equals("-1")){%>
						<option value="-1" selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Department</option>
						<%}%>
					</select></td>
			 </tr>
			
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font> Tender Reference No.</td>
                <td><input name="t_ref_no" type="text" id="t_ref_no" value="<%=ref_no%>"/></td>
			 </tr>
			
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font> Tender Title (in English)</td>
                <td><textarea name="t_title" rows="1" cols="50" id="t_title" onkeyup="return SpecChk(this);"><%=title%></textarea></td>
			</tr>
			
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font> Tender Description (in English)</td>
                <td><textarea name="t_Desc" rows="4" cols="50" id="t_Desc" onkeyup="return SpecChk(this);"><%=desc%></textarea></td>
            </tr>
			
			<tr>
                <td> Tender Pre Qual</td>
                <td><input name="t_pre_qual" type="text" id="t_pre_qual" value="<%=pre_qual%>"/></td>
			 </tr>
			 
			 <tr>
                <td><font color="red"><b>*&nbsp;</b></font> Tender Location</td>
                <td><input name="t_location" type="text" id="t_location" value="<%=location%>" onkeyup="return SpecChk2(this);"/></td>
			 </tr>
			 
			<tr>
                <td> Pin Code</td>
                <td><input name="t_pincode" type="text" id="t_pincode" value="<%=pincode%>"/></td>
			 </tr>
			
			<tr>
                <td> Currency</td>
                <td><input name="t_currency" type="text" id="t_currency" value="<%=cur%>"/></td>
			 </tr>
			
			<tr>
                <td >Tender Fee</td>
                <td > 
					<img src="../../images/rupees.jpg">&nbsp;<input name="t_fee" value="<%=fee%>" type="text" id="t_fee" onkeyup="return SpecChk2(this);"/></td>
                
            </tr>
			<tr>
                <td > Tender Value</td>
                <td ><img src="../../images/rupees.jpg">&nbsp;<input name="t_value" value="<%=value%>" type="text" id="t_value" onkeyup="return SpecChk2(this);"/> </td>
            </tr>
			
			<tr>
                <td >EMD</td>
                <td> <img src="../../images/rupees.jpg">&nbsp;<input name="t_emd" value="<%=emd%>" type="text" id="t_emd" onkeyup="return SpecChk2(this);"/> </td>
            </tr>
			
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font>Tender Publication Date 
				On Website</td>
                <td nowrap="nowrap"><input name="t_pub_date" type="text" id="t_pub_date" value="<%=pub_date%>" class="textbox" readonly="readonly"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_pub_date'
                                           });
                    </script>
					 Time
					<input name="t_pub_time" type="text" id="t_pub_time" value="<%if(!pub_date_time.equals("")){out.print(pub_date_time);}else{%>00:00<%}%>"/>(hh:mm)
				</td>
			</tr>
			
			<tr>
                <td nowrap="nowrap">Tender PreBid Date </td>
                <td nowrap="nowrap"><input name="t_prebid_date" type="text" id="t_prebid_date" value="<%if(!prebid_date.equals("00-00-0000")){out.print(prebid_date);}%>" class="textbox" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_prebid_date'
                                           });
                    </script>
					 Time
					<input name="t_prebid_time" type="text" id="t_prebid_time" value="<%if(!prebid_date_time.equals("")){out.print(prebid_date_time);}else{%>00:00<%}%>"/>(hh:mm)
				</td>
			</tr>
			
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Document Download Start Date</td>
                <td nowrap="nowrap"><input name="t_doc_start_date" type="text" id="t_doc_start_date" value="<%=doc_strDate%>" readonly="readonly"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_doc_start_date'
                                           });
                    </script>
					Time
					<input name="t_doc_start_time" type="text" id="t_doc_start_time" value="<%if(!doc_strDate_time.equals("")){out.print(doc_strDate_time);}else{%>00:00<%}%>"/>(hh:mm)					
				</td>
			 </tr>
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Document Download End Date</td>
                <td nowrap="nowrap"><input name="t_doc_end_date" type="text" id="t_doc_end_date" value="<%=doc_endDate%>" readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_doc_end_date'
                                           });
                    </script>
					Time
					<input name="t_doc_end_time" type="text" id="t_doc_end_time" value="<%if(!doc_endDate_time.equals("")){out.print(doc_endDate_time);}else{%>00:00<%}%>"/>(hh:mm)					
				</td>
			 </tr>
			
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Bid Submission Start Date</td>
                <td nowrap="nowrap"><input name="t_bidsub_start_date" type="text" id="t_bidsub_start_date" value="<%=bidsub_strDate%>" readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_bidsub_start_date'
                                           });
                    </script>
					Time
					<input name="t_bidsub_start_time" type="text" id="t_bidsub_start_time" value="<%if(!bidsub_strDate_time.equals("")){out.print(bidsub_strDate_time);}else{%>00:00<%}%>"/>(hh:mm)					
				</td>
			 </tr>
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Bid Submission End Date</td>
                <td nowrap="nowrap"><input name="t_bidsub_end_date" type="text" id="t_bidsub_end_date" value="<%=bidsub_endDate%>" readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_bidsub_end_date'
                                           });
                    </script>
					Time
					<input name="t_bidsub_end_time" type="text" id="t_bidsub_end_time" value="<%if(!bidsub_endDate_time.equals("")){out.print(bidsub_endDate_time);}else{%>00:00<%}%>"/>(hh:mm)					
				</td>
			 </tr>
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Bid Open Date</td>
                <td nowrap="nowrap"><input name="t_bid_open_date" type="text" id="t_bid_open_date" value="<%=bidopen_Date%>" readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_bid_open_date'
                                           });
                    </script>
					Time
					<input name="t_bid_open_time" type="text" id="t_bid_open_time" value="<%if(!bidopen_Date_time.equals("")){out.print(bidopen_Date_time);}else{%>00:00<%}%>"/>(hh:mm)					
				</td>
			 </tr>
			<tr>
             	<td><font color="red"><b>*&nbsp;</b></font>Tender Inviting Officer</td>
                <td><input type="text" name="t_inviting_officer" id="t_inviting_officer" value="<%=inviting_off%>"/></td>
             </tr>
			<tr>
             	<td><font color="red"><b>*&nbsp;</b></font>Tender Inviting Officer's Address</td>
                <td><textarea  name="t_inviting_off_address" id="t_inviting_off_address" rows="4" cols="50"><%=inviting_off_add%></textarea></td>
             </tr>
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font>Tender Product Category</td>
                <td><select name="t_prod_cat" >
			  			<option value="0">--Select Product Category--</option>
						<%if(rsGetProdCat.length>0){
							for(int i=0;i<rsGetProdCat.length;i++){%>
							<option value="<%=rsGetProdCat[i][0]%>" <%if(prod_cat.equals(rsGetProdCat[i][0])){%>selected<%}%>><%=rsGetProdCat[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			<tr>
             	<td>Tender Product Sub Category</td>
                <td><input type="text" name="t_prod_sub_cat" id="t_prod_sub_cat" value="<%=prod_subcat%>"/></td>
             </tr>
			
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font>Tender Type</td>
                <td><select name="t_tender_type" >
			  			<option value="0">--Select Tender Type--</option>
						<%if(rsGetTenType.length>0){
							for(int i=0;i<rsGetTenType.length;i++){%>
							<option value="<%=rsGetTenType[i][0]%>" <%if(strTenTypeId.equals(rsGetTenType[i][0])){%>selected<%}%>><%=rsGetTenType[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			 
			 <tr>
                <td><font color="red"><b>*&nbsp;</b></font>Tender Category</td>
                <td><select name="t_tender_cat" >
			  			<option value="0">--Select Tender Category--</option>
						<%if(rsGetTenCat.length>0){
							for(int i=0;i<rsGetTenCat.length;i++){%>
							<option value="<%=rsGetTenCat[i][0]%>" <%if(tender_cat.equals(rsGetTenCat[i][0])){%>selected<%}%>><%=rsGetTenCat[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			 
			 <tr>
                <td> Tender Form Contract</td>
                <td><select name="t_form_contract" >
			  			<option value="0">--Select Form Contract--</option>
						<%if(rsGetFormCont.length>0){
							for(int i=0;i<rsGetFormCont.length;i++){%>
							<option value="<%=rsGetFormCont[i][0]%>" <%if(form_contract.equals(rsGetFormCont[i][0])){%>selected<%}%>><%=rsGetFormCont[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			 
			 <tr>
                <td><font color="red"><b>*&nbsp;</b></font> Sector</td>
                <td><select name="t_sector" >
			  			<option value="0">--Select Sector--</option>
						<%if(rsGetSector.length>0){
							for(int i=0;i<rsGetSector.length;i++){%>
							<option value="<%=rsGetSector[i][0]%>" <%if(strsector.equals(rsGetSector[i][0])){%>selected<%}%>><%=rsGetSector[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			 
			 <tr>
                <td><font color="red"><b>*&nbsp;</b></font> State</td>
                <td><select name="t_state" >
			  			<option value="0">--Select State--</option>
						<%if(rsGetState.length>0){
							for(int i=0;i<rsGetState.length;i++){%>
							<option value="<%=rsGetState[i][0]%>" <%if(strstate.equals(rsGetState[i][0])){%>selected<%}%>><%=rsGetState[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			 
			 
			 <tr>
             	<td>Remarks</td>
                <td><textarea  name="t_remarks" id="t_remarks" rows="4" cols="50"><%=remarks%></textarea></td>
             </tr>
			 
			 <tr>
                <td> Tender File </td>
                <td>
					<input type="file" name="FileUpload1" id="FileUpload1" onchange="ChkfileExt(this);"/>
					<%if(!file.equals("")){%>
					<a href="../../<%=Hname%>/notice/<%=file%>" target="_blank"><font color="black">View Upload File</font></a>
					<%}%>
					<input type="file" name="FileUpload1" id="FileUpload1" onchange="ChkfileExt(this);"/>
					<%if(!file1.equals("")){%>
					<a href="../../<%=Hname%>/notice/<%=file1%>" target="_blank"><font color="black">View Upload File</font></a>
					<%}%>
					<input type="file" name="FileUpload1" id="FileUpload1" onchange="ChkfileExt(this);"/>
					<%if(!file2.equals("")){%>
					<a href="../../<%=Hname%>/notice/<%=file2%>" target="_blank"><font color="black">View Upload File</font></a>
					<%}%>
					<input type="file" name="FileUpload1" id="FileUpload1" onchange="ChkfileExt(this);"/>
					<%if(!file3.equals("")){%>
					<a href="../../<%=Hname%>/notice/<%=file3%>" target="_blank"><font color="black">View Upload File</font></a>
					<%}%>
					<input type="file" name="FileUpload1" id="FileUpload1" onchange="ChkfileExt(this);"/>
					<%if(!file4.equals("")){%>
					<a href="../../<%=Hname%>/notice/<%=file4%>" target="_blank"><font color="black">View Upload File</font></a>
					<%}%>
				</td>
				
            </tr>
            
			
			 <tr>
                <td align="center" colspan="4" class="style1">
                    <br />
                    <br />
                    <% if (expired==-1){%>
                    <input type="submit" name="Button1" value="Save"  id="Button1" class="button" style="width:125px;" disabled />
                    <% }else{%>
					<input type="submit" name="Button1" value="Save"  id="Button1" class="button" style="width:125px;" />
					<%}%>
					
					&nbsp;
                    <input id="Button2" class="button" type="button" value="Cancel" />&nbsp; &nbsp;
                    <font color="red"><b>*&nbsp; Mandatory Fields</b></font>
                </td>
            </tr>
                   </table>
</form>
<%@ include file="../header/footerInner.jsp" %>
