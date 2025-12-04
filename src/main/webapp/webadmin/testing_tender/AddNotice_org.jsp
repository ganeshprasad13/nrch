<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
<script type="text/javascript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<SCRIPT src="ktdv.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://jquery.bassistance.de/validate/jquery.validate.js"></script>
<script src="http://jquery.bassistance.de/validate/additional-methods.js"></script>
<script>
// just for the demos, avoids form submit
jQuery.validator.setDefaults({  
          debug: true,  
		  success: "valid"
});
$( "#AddNotice" ).validate({ 
 rules: {  
    FileUpload11: {    
         required: true,     
         extension: "pdf|zip|rar|doc|docx"  
     } 
   }
 });
 </script>
 


<script type="text/javascript">
var ar_ext = ['pdf','zip','rar','doc','docx'];        // array with allowed extensions

function checkName(el, to, sbm) {
// - coursesweb.net
  // get the file name and split it to separe the extension
  var name = el.value;
  var ar_name = name.split('.');

  // for IE - separe dir paths (\) from name
  var ar_nm = ar_name[0].split('\\');
  for(var i=0; i<ar_nm.length; i++) var nm = ar_nm[i];

  // add the name in 'to'
  document.getElementById(to).value = nm;

  // check the file extension
  var re = 0;
  for(var i=0; i<ar_ext.length; i++) {
    if(ar_ext[i] == ar_name[1]) {
      re = 1;
      break;
    }
  }

  // if re is 1, the extension is in the allowed list
  if(re==1) {
    // enable submit
    document.getElementById(sbm).removeAttribute("disabled");
  }
  else {
    // delete the file name, disable Submit, Alert message
    el.value = '';
    document.getElementById(sbm).setAttribute("disabled","disabled");
    alert('".'+ ar_name[1]+ '" is not an file type allowed for upload');
  }
}

  	
	function submit_self()
	{
	
		var data = document.AddNotice.Division_id.value;
		//var data1 = document.AddNotice.Tender_Type.value;
		//document.AddNotice.action='AddNotice.jsp?Division_id='+data+'&Tender_Type='+data1;
		document.AddNotice.action='AddNotice.jsp?Division_id='+data;
		
		document.AddNotice.submit();
	}
	
	function CheckForm(){
	
	if(document.AddNotice.Division_id.value == 0){
			alert("Please select Dividion ");
			return false
		}
		if(document.AddNotice.Department_id.value == 0){
			alert("Please select Department ");
			return false
		}
	
	
	if(document.AddNotice.t_ref_no.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Reference No. ");
			document.AddNotice.t_ref_no.focus(); 
			return false
		}
	
	if(document.AddNotice.t_title.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Title ");
			document.AddNotice.t_title.focus();
			return false
		}
	if(document.AddNotice.t_Desc.value == ""){
			alert("Please Enter Tender Description ");
			document.AddNotice.t_Desc.focus();
			return false
		}
	if(document.AddNotice.t_location.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Location ");
			document.AddNotice.t_location.focus();
			return false
		}
	
	
	//Date validations start here---Anurag Tyagi
	
	
	
	if(document.AddNotice.t_pub_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Publication Date");
			document.AddNotice.t_pub_date.focus(); 
			return false
		}
	
	if(document.AddNotice.t_pub_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddNotice.t_pub_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.AddNotice.t_pub_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.AddNotice.t_pub_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.AddNotice.t_pub_time.focus(); 
				return false;
			}
		}
	
	
	
	
	/*
	if(document.AddNotice.t_prebid_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender PreBid Date");
			document.AddNotice.t_prebid_date.focus(); 
			return false
		}
	if(document.AddNotice.t_prebid_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddNotice.t_prebid_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.AddNotice.t_prebid_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.AddNotice.t_prebid_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.AddNotice.t_prebid_time.focus(); 
				return false;
			}
		}
	
	*/
	
	
	if(document.AddNotice.t_doc_start_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Document Start Date");
			document.AddNotice.t_doc_start_date.focus(); 
			return false
		}
	if(document.AddNotice.t_doc_start_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddNotice.t_doc_start_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.AddNotice.t_doc_start_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.AddNotice.t_doc_start_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.AddNotice.t_doc_start_time.focus(); 
				return false;
			}
		}
	if(document.AddNotice.t_doc_end_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Document End Date");
			document.AddNotice.t_doc_end_date.focus(); 
			return false
		}
	if(document.AddNotice.t_doc_end_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddNotice.t_doc_end_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.AddNotice.t_doc_end_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.AddNotice.t_doc_end_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.AddNotice.t_doc_end_time.focus(); 
				return false;
			}
		}
	if(document.AddNotice.t_bidsub_start_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender BidSub Start Date");
			document.AddNotice.t_bidsub_start_date.focus(); 
			return false
		}
	if(document.AddNotice.t_bidsub_start_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddNotice.t_bidsub_start_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.AddNotice.t_bidsub_start_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.AddNotice.t_bidsub_start_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.AddNotice.t_bidsub_start_time.focus(); 
				return false;
			}
		}
	if(document.AddNotice.t_bidsub_end_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender BidSub End Date");
			document.AddNotice.t_bidsub_end_date.focus(); 
			return false
		}
	if(document.AddNotice.t_bidsub_end_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddNotice.t_bidsub_end_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.AddNotice.t_bidsub_end_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.AddNotice.t_bidsub_end_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.AddNotice.t_bidsub_end_time.focus(); 
				return false;
			}
		}
	if(document.AddNotice.t_bid_open_date.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender Bid Open Date");
			document.AddNotice.t_bid_open_date.focus(); 
			return false
		}
	if(document.AddNotice.t_bid_open_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddNotice.t_bid_open_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.AddNotice.t_bid_open_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.AddNotice.t_bid_open_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.AddNotice.t_bid_open_time.focus(); 
				return false;
			}
		}
	//End of normal blank date validation
	//Date difference validation start here
	var t1 = document.AddNotice.t_pub_date.value;
		var m1 = document.AddNotice.t_pub_time.value;
		var t2 = t1.split("-");
		var m2 = m1.split(":");
		var PubDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
		 
		 t1 = document.AddNotice.t_prebid_date.value;
		 m1 = document.AddNotice.t_prebid_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var PreBidDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
		
		if(PubDateTime > PreBidDateTime){
			alert("PreBid Date should be greater than Publication Date");
			document.AddNotice.t_prebid_date.focus(); 
			return false;
		}
	
	t1 = document.AddNotice.t_doc_start_date.value;
		 m1 = document.AddNotice.t_doc_start_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var DocStartDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > DocStartDateTime){
			alert("Document Start Date should be greater than Publication Date");
			document.AddNotice.t_doc_start_date.focus(); 
			return false;
		}
	
	t1 = document.AddNotice.t_doc_end_date.value;
		 m1 = document.AddNotice.t_doc_end_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var DocEndDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > DocEndDateTime){
			alert("Document End Date should be greater than Publication Date");
			document.AddNotice.t_doc_end_date.focus(); 
			return false;
		}
	
	t1 = document.AddNotice.t_bidsub_start_date.value;
		 m1 = document.AddNotice.t_bidsub_start_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var BidSubStartDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > BidSubStartDateTime){
			alert("BidSub Start Date should be greater than Publication Date");
			document.AddNotice.t_bidsub_start_date.focus(); 
			return false;
		}
	
	t1 = document.AddNotice.t_bidsub_end_date.value;
		 m1 = document.AddNotice.t_bidsub_end_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var BidSubEndDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > BidSubEndDateTime){
			alert("BidSub End Date should be greater than Publication Date");
			document.AddNotice.t_bidsub_end_date.focus(); 
			return false;
		}
	
	t1 = document.AddNotice.t_bid_open_date.value;
		 m1 = document.AddNotice.t_bid_open_time.value;
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var BidOpenDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
	
	if(PubDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than Publication Date");
			document.AddNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	//other conditions --Anurag Tyagi
	
	if(DocStartDateTime > BidSubStartDateTime){
			alert("Bid Submission Start Date should be greater than or equal to Document Download Start Date");
			document.AddNotice.t_bidsub_start_date.focus(); 
			return false;
		}
	
	if(DocStartDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than or equal to Document Download Start Date");
			document.AddNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	if(DocEndDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than or equal to Document Download End Date");
			document.AddNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	if(BidSubStartDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than or equal to Bid Submission Start Date");
			document.AddNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	if(BidSubEndDateTime > BidOpenDateTime){
			alert("Bid Open Date should be greater than or equal to Bid Submission End Date");
			document.AddNotice.t_bid_open_date.focus(); 
			return false;
		}
	
	//other conditions end
	
	
	//End of Date Difference script---Anurag
	
	
	if(document.AddNotice.t_inviting_officer.value == ""){
			alert("Please Enter Tender Inviting Officer ");
			document.AddNotice.t_inviting_officer.focus();
			return false
		}
	if(document.AddNotice.t_inviting_off_address.value == ""){
			alert("Please Enter Tender Inviting Officer's Address ");
			document.AddNotice.t_inviting_off_address.focus();
			return false
		}
	
	if(document.AddNotice.t_prod_cat.value == 0){
			alert("Please select Product Category ");
			return false
		}
	
	if(document.AddNotice.t_tender_type.value == 0){
			alert("Please select Tender Type ");
			return false
		}
	if(document.AddNotice.t_tender_cat.value == 0){
			alert("Please select Tender Category ");
			return false
		}
	if(document.AddNotice.t_sector.value == 0){
			alert("Please select Sector ");
			return false
		}
	if(document.AddNotice.t_state.value == 0){
			alert("Please select State ");
			return false
		}
	
	if(document.AddNotice.FileUpload11.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Select file ");
			document.AddNotice.FileUpload11.focus(); 
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
	
	/*-------------------Updated By Aman 08-05-2014----------------------*/
	
	function ChkfileExt(){

	var id2 = document.getElementById('file1');
	var id3 = document.getElementById("file1").value;

	var img1 = id2.value;
	var n1 = img1.match('.jsp');
	//alert(n);
	if (n1 == '.jsp') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n1 = img1.match('.php');
	//alert(n);
	if (n1 == '.php') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n1 = img1.match('.exe');
	//alert(n);
	if (n1 == '.exe') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n1 = img1.match('.java');

	if (n1 == '.java') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}


	var fileName1 =id3.value;

	if( id3 === "" ) {
	//alert("Please upload any file.");
	}
	else{
	if(fileName1.lastIndexOf(".pdf")==-1 && fileName1.lastIndexOf(".txt")==-1 && fileName1.lastIndexOf(".csv")==-1 && fileName1.lastIndexOf(".doc")==-1 && fileName1.lastIndexOf(".docx")==-1 && fileName1.lastIndexOf(".xls")==-1 && fileName1.lastIndexOf(".jpg")==-1 && fileName1.lastIndexOf(".gif")==-1 && fileName1.lastIndexOf(".png")==-1 && fileName1.lastIndexOf(".bmp")==-1 && fileName1.lastIndexOf(".sql")==-1){
	alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}
	}


	/*-------------------Updated By Aman 08-05-2014----------------------*/



	var id4 = document.getElementById('file2');
	var id5 = document.getElementById("file2").value;

	var img2 = id4.value;
	var n2 = img2.match('.jsp');
	//alert(n);
	if (n2 == '.jsp') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n2 = img2.match('.php');
	//alert(n);
	if (n2 == '.php') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n2 = img2.match('.exe');
	//alert(n);
	if (n2 == '.exe') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n2 = img2.match('.java');

	if (n2 == '.java') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}


	var fileName2 =id5.value;

	if( id5 === "" ) {
	//alert("Please upload any file.");
	}
	else{
	if(fileName2.lastIndexOf(".pdf")==-1 && fileName2.lastIndexOf(".txt")==-1 && fileName2.lastIndexOf(".csv")==-1 && fileName2.lastIndexOf(".doc")==-1 && fileName2.lastIndexOf(".docx")==-1 && fileName2.lastIndexOf(".xls")==-1 && fileName2.lastIndexOf(".jpg")==-1 && fileName2.lastIndexOf(".gif")==-1 && fileName2.lastIndexOf(".png")==-1 && fileName2.lastIndexOf(".bmp")==-1 && fileName2.lastIndexOf(".sql")==-1){
	alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}
	}


	/*---------------Updated By Aman 08-05-2014--------------------------*/



	var id6 = document.getElementById('file3');
	var id7 = document.getElementById("file3").value;

	var img3 = id6.value;
	var n3 = img3.match('.jsp');
	//alert(n);
	if (n3 == '.jsp') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n3 = img3.match('.php');
	//alert(n);
	if (n3 == '.php') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n3 = img3.match('.exe');
	//alert(n);
	if (n3 == '.exe') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n3 = img3.match('.java');

	if (n3 == '.java') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}


	var fileName3 =id7.value;

	if( id7 === "" ) {
	//alert("Please upload any file.");
	}
	else{
	if(fileName3.lastIndexOf(".pdf")==-1 && fileName3.lastIndexOf(".txt")==-1 && fileName3.lastIndexOf(".csv")==-1 && fileName3.lastIndexOf(".doc")==-1 && fileName3.lastIndexOf(".docx")==-1 && fileName3.lastIndexOf(".xls")==-1 && fileName3.lastIndexOf(".jpg")==-1 && fileName3.lastIndexOf(".gif")==-1 && fileName3.lastIndexOf(".png")==-1 && fileName3.lastIndexOf(".bmp")==-1 && fileName3.lastIndexOf(".sql")==-1){
	alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}
	}


	/*----------------Updated By Aman 08-05-2014-------------------------*/



	var id8 = document.getElementById('file4');
	var id9 = document.getElementById("file4").value;

	var img4 = id8.value;
	var n4 = img4.match('.jsp');
	//alert(n);
	if (n4 == '.jsp') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n4 = img4.match('.php');
	//alert(n);
	if (n4 == '.php') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n4 = img4.match('.exe');
	//alert(n);
	if (n4 == '.exe') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n4 = img4.match('.java');

	if (n4 == '.java') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}


	var fileName4 =id9.value;

	if( id9 === "" ) {
	//alert("Please upload any file.");
	}
	else{
	if(fileName4.lastIndexOf(".pdf")==-1 && fileName4.lastIndexOf(".txt")==-1 && fileName4.lastIndexOf(".csv")==-1 && fileName4.lastIndexOf(".doc")==-1 && fileName4.lastIndexOf(".docx")==-1 && fileName4.lastIndexOf(".xls")==-1 && fileName4.lastIndexOf(".jpg")==-1 && fileName4.lastIndexOf(".gif")==-1 && fileName4.lastIndexOf(".png")==-1 && fileName4.lastIndexOf(".bmp")==-1 && fileName4.lastIndexOf(".sql")==-1){
	alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}
	}
	

	/*------------------Updated By Aman 08-05-2014-----------------------*/



	var id10 = document.getElementById('file5');
	var id11 = document.getElementById("file5").value;

	var img5 = id10.value;
	var n5 = img5.match('.jsp');
	//alert(n);
	if (n5 == '.jsp') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n5 = img5.match('.php');
	//alert(n);
	if (n5 == '.php') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n5 = img5.match('.exe');
	//alert(n);
	if (n5 == '.exe') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}

	var n5 = img5.match('.java');

	if (n5 == '.java') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}


	var fileName5 =id11.value;

	if( id11 === "" ) {
	//alert("Please upload any file.");
	}
	else{
	if(fileName5.lastIndexOf(".pdf")==-1 && fileName5.lastIndexOf(".txt")==-1 && fileName5.lastIndexOf(".csv")==-1 && fileName5.lastIndexOf(".doc")==-1 && fileName5.lastIndexOf(".docx")==-1 && fileName5.lastIndexOf(".xls")==-1 && fileName5.lastIndexOf(".jpg")==-1 && fileName5.lastIndexOf(".gif")==-1 && fileName5.lastIndexOf(".png")==-1 && fileName5.lastIndexOf(".bmp")==-1 && fileName5.lastIndexOf(".sql")==-1){
	alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, sql files can be uploaded");
	return false;
	}
	}
}
	
	
</script>
<%
Calendar cal = Calendar.getInstance();
String timeZone = cal.getTimeZone().getDisplayName();
final String DATE_FORMAT_NOW = "dd-MM-yyyy HH:mm:ss";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
String time=sdf.format(cal.getTime());

String strDivId  = "-100";
if(request.getParameter("Division_id")!=null &&  !request.getParameter("Division_id").trim().equals("")){
	strDivId = request.getParameter("Division_id");
}

String strTenTypeId  = "-100";
if(request.getParameter("Tender_Type")!=null &&  !request.getParameter("Tender_Type").trim().equals("")){
	strTenTypeId = request.getParameter("Tender_Type");
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
if(session.getAttribute("DBAacc") != null && !session.getAttribute("DBAacc").equals("100")){
		strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE CMSDEPT_ID IN ("+strDepartmentId+") AND CMSDEPT_CMSD_ID ="+strDivId+"";
	}else{
		strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE  CMSDEPT_CMSD_ID ="+strDivId+"";
	}
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
%>

<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;<a href="index.jsp?selectType=1">Manage Tender Notice</a>
&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;Add Tender Notice</span></p>

<!-- Anurag tyagi-->
<table width="50%" border="1" align="center" class="sample">
									<tr class="tr_bgcolor">
										<td align="center"> 
										<b><span style="color:yellow;">CPP Tenders User Manual [ <a target="_blank" style="color:yellow;" href="../images/tender_notice_cpp.pdf">Download</a> ]</span>
										
										</td>
										
									
								</tr>		
</table>





<form id="form1"  name="AddNotice" action="AddNoticeAction.jsp" METHOD="POST" ENCTYPE="multipart/form-data" onsubmit="return CheckForm();">
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
                    <b>Add Tender Notice</b>

                </td>
            </tr>
			
			<tr>
                <td> ORGANISATION CODE</td>
                <td><input name="org_code" type="text" id="org_code" value="CG57006" readonly /></td>
			 </tr>
			
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font>Division</td>
                <td><select name="Division_id" onchange="javascript:submit_self()">
			  			<option value="0">--Select Division--</option>
						<%if(rsGetDivision.length>0){
							for(int i=0;i<rsGetDivision.length;i++){%>
							<option value="<%=rsGetDivision[i][0]%>" <%if(strDivId.equals(rsGetDivision[i][0])){%>selected<%}%>><%=rsGetDivision[i][1]%></option>
						<%	}
						}%></select></td>
			 </tr>
             <tr>
                <td><font color="red"><b>*&nbsp;</b></font>Department</td>
                <td><select name="Department_id">
				<option value="0">--Select Department--</option>
						<%if(rsGetDepartment.length>0){%>
						<%
							for(int i=0;i<rsGetDepartment.length;i++){%>
							<option value="<%=rsGetDepartment[i][0]%>"><%=rsGetDepartment[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			
			
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font> Tender Reference No.</td>
                <td><input name="t_ref_no" type="text" id="t_ref_no" value=""/></td>
			 </tr>
			
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font> Tender Title (in English)</td>
                <td><textarea name="t_title" rows="1" cols="50" id="t_title" value="" onkeyup="return SpecChk(this);" ></textarea></td>
			</tr>
			
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font> Tender Description (in English)</td>
                <td><textarea name="t_Desc" rows="4" cols="50" id="t_Desc" onkeyup="return SpecChk(this);" ></textarea></td>
            </tr>
			
			<tr>
                <td> Tender Pre Qual</td>
                <td><input name="t_pre_qual" type="text" id="t_pre_qual" value=""/></td>
			 </tr>
			 
			 <tr>
                <td><font color="red"><b>*&nbsp;</b></font> Tender Location (Fill City Name only)</td>
                <td><input name="t_location" type="text" id="t_location" value="" maxlength="20" onkeyup="return SpecChk2(this);"/></td>
			 </tr>
			 
			<tr>
                <td> Pin Code</td>
                <td><input name="t_pincode" type="text" id="t_pincode" value=""/></td>
			 </tr>
			
			<tr>
                <td> Currency</td>
                <td><input name="t_currency" type="text" id="t_currency" value="INR" readonly /></td>
			 </tr>
			 <tr>
                <td colspan="2" class="tr_bgcolor" align="left"><font size="1"<b>For Tender Fee, Value and EMD Please Don't put comma or any other special character(e.g 5,000 is not valid but 5000.00 is valid)<b></font> </td>
                
			 </tr>
			
			<tr>
                <td >Tender Fee</td>
                <td > 
					<img src="../../images/rupees.jpg">&nbsp;<input name="t_fee" value="" type="text" id="t_fee" onkeyup="return SpecChk2(this);" /></td>
                
            </tr>
			<tr>
                <td > Tender Value</td>
                <td ><img src="../../images/rupees.jpg">&nbsp;<input name="t_value" value="" type="text" id="t_value" onkeyup="return SpecChk2(this);" /> </td>
            </tr>
			
			<tr>
                <td >EMD</td>
                <td> <img src="../../images/rupees.jpg">&nbsp;<input name="t_emd" value="" type="text" id="t_emd" onkeyup="return SpecChk2(this);" /> </td>
            </tr>
			
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font>Tender Publication Date 
				On Website</td>
                <td nowrap="nowrap"><input name="t_pub_date" type="text" id="t_pub_date" value="" class="textbox" readonly="readonly"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_pub_date'
                                           });
                    </script>
					 Time
					<input name="t_pub_time" type="text" id="t_pub_time" value="00:00"/>(hh:mm)
				</td>
			</tr>
			
			<tr>
                <td nowrap="nowrap">Tender PreBid Date </td>
                <td nowrap="nowrap"><input name="t_prebid_date" type="text" id="t_prebid_date" value="" class="textbox" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_prebid_date'
                                           });
                    </script>
					 Time
					<input name="t_prebid_time" type="text" id="t_prebid_time" value="00:00"/>(hh:mm)
				</td>
			</tr>
			
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Document Download Start Date</td>
                <td nowrap="nowrap"><input name="t_doc_start_date" type="text" id="t_doc_start_date" value="" readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_doc_start_date'
                                           });
                    </script>
					Time
					<input name="t_doc_start_time" type="text" id="t_doc_start_time" value="00:00"/>(hh:mm)					
				</td>
			 </tr>
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Document Download End Date</td>
                <td nowrap="nowrap"><input name="t_doc_end_date" type="text" id="t_doc_end_date" value="" readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_doc_end_date'
                                           });
                    </script>
					Time
					<input name="t_doc_end_time" type="text" id="t_doc_end_time" value="00:00"/>(hh:mm)					
				</td>
			 </tr>
			
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Bid Submission Start Date</td>
                <td nowrap="nowrap"><input name="t_bidsub_start_date" type="text" id="t_bidsub_start_date" value=""readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_bidsub_start_date'
                                           });
                    </script>
					Time
					<input name="t_bidsub_start_time" type="text" id="t_bidsub_start_time" value="00:00"/>(hh:mm)					
				</td>
			 </tr>
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Bid Submission End Date</td>
                <td nowrap="nowrap"><input name="t_bidsub_end_date" type="text" id="t_bidsub_end_date" value="" readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_bidsub_end_date'
                                           });
                    </script>
					Time
					<input name="t_bidsub_end_time" type="text" id="t_bidsub_end_time" value="00:00"/>(hh:mm)					
				</td>
			 </tr>
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Bid Open Date</td>
                <td nowrap="nowrap"><input name="t_bid_open_date" type="text" id="t_bid_open_date" value="" readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 't_bid_open_date'
                                           });
                    </script>
					Time
					<input name="t_bid_open_time" type="text" id="t_bid_open_time" value="00:00"/>(hh:mm)					
				</td>
			 </tr>
			<tr>
             	<td><font color="red"><b>*&nbsp;</b></font>Tender Inviting Officer</td>
                <td><input type="text" name="t_inviting_officer" id="t_inviting_officer"/></td>
             </tr>
			<tr>
             	<td><font color="red"><b>*&nbsp;</b></font>Tender Inviting Officer's Address</td>
                <td><textarea  name="t_inviting_off_address" id="t_inviting_off_address" rows="4" cols="50"></textarea></td>
             </tr>
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font>Tender Product Category</td>
                <td><select name="t_prod_cat" >
			  			<option value="0">--Select Product Category--</option>
						<%if(rsGetProdCat.length>0){
							for(int i=0;i<rsGetProdCat.length;i++){%>
							<option value="<%=rsGetProdCat[i][0]%>" ><%=rsGetProdCat[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			<tr>
             	<td>Tender Product Sub Category</td>
                <td><input type="text" name="t_prod_sub_cat" id="t_prod_sub_cat"/></td>
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
							<option value="<%=rsGetTenCat[i][0]%>" ><%=rsGetTenCat[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			 
			 <tr>
                <td> Tender Form Contract</td>
                <td><select name="t_form_contract" >
			  			<option value="">--Select Form Contract--</option>
						<%if(rsGetFormCont.length>0){
							for(int i=0;i<rsGetFormCont.length;i++){%>
							<option value="<%=rsGetFormCont[i][0]%>" ><%=rsGetFormCont[i][1]%></option>
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
							<option value="<%=rsGetSector[i][0]%>" ><%=rsGetSector[i][1]%></option>
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
							<option value="<%=rsGetState[i][0]%>" ><%=rsGetState[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
			 
			 <tr>
                <td > Completion Period</td>
                <td >&nbsp;&nbsp;&nbsp;<input name="CompPeriod" value="" type="text" id="CompPeriod" /> </td>
            </tr>
			 
			 
			 <tr>
             	<td>Remarks</td>
                <td><textarea  name="t_remarks" id="t_remarks" rows="4" cols="50"></textarea></td>
             </tr>
			 
			 <tr>
                <td>Tender File (English) </td>
                <td nowrap="nowrap">(<font color="red"><b>*&nbsp;</b></font>1)<input type="file" name="FileUpload11" id="file1" class="textbox" onChange="javascript:return ChkfileExt();" />(2)<input type="file" name="FileUpload1" id="file2" class="textbox" onChange="javascript:return ChkfileExt();"/></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td nowrap="nowrap">&nbsp;&nbsp;(3)&nbsp;&nbsp;<input type="file" name="FileUpload1" id="file3" class="textbox" onChange="javascript:return ChkfileExt();"/>(4)<input type="file" name="FileUpload1" id="file4" class="textbox" onChange="javascript:return ChkfileExt();"/></td>
            </tr><tr>
                <td>&nbsp;</td>
                <td nowrap="nowrap">&nbsp;&nbsp;(5)&nbsp;&nbsp;<input type="file" name="FileUpload1" id="file5" class="textbox" onChange="javascript:return ChkfileExt();"/></td>
            </tr>
			 
			 
			 
             <tr>
                <td align="center" colspan="4" class="style1">
                    <br />
                    <br />
                    
                    <input type="submit" name="Button1" value="Save"  id="Button1" class="button" onClick="javascript:return ChkfileExt();" />
                    &nbsp;
                    <input id="Button2" class="button" type="reset" value="reset" />&nbsp; &nbsp;
                    <font color="red"><b>*&nbsp; Mandatory Fields</b></font>
                   
                </td>
            </tr>
                   </table>
</form>
<%@ include file="../header/footerInner.jsp" %>

