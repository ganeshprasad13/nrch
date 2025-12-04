<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<script type="text/javascript" src="js/calendar_us.js"></script>
<script type="text/javascript">
	function CheckForm(){
		if(document.AddTenderDocAction.TenderNo.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender No. ");
			return false
		}
		if(document.AddTenderDocAction.TenTitleEng.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Title ");
			return false
		}
		if(document.AddTenderDocAction.TenDescEng.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter English Description ");
			return false
		}
		if(document.AddTenderDocAction.TenOpenDate.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please select Tender open date ");
			return false
		}
		if(document.AddTenderDocAction.TenCloseDate.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please select Tender close date ");
			return false
		}
		if(document.AddTenderDocAction.TenOpenTime.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddTenderDocAction.TenOpenTime.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for Tender Opening Time.");
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				return false;
			}
		}
		if(document.AddTenderDocAction.TenCloseTime.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddTenderDocAction.TenCloseTime.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for Tender Closing Time.");
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				return false;
			}
		}
	//Check for Tender Open and Closing Date and Time
		var t1 = document.AddTenderDocAction.TenOpenDate.value;
		var m1 = document.AddTenderDocAction.TenOpenTime.value
		var t2 = t1.split("-");
		var m2 = m1.split(":");
		var StartDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
		 t1 = document.AddTenderDocAction.TenCloseDate.value;
		 m1 = document.AddTenderDocAction.TenCloseTime.value
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var EndDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
		if(StartDateTime < EndDateTime){
			alert(" closing date should be less then  opening date");
			return false;
		}
		if(document.AddTenderDocAction.Amount.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender value ");
			return false
		}
		if(document.AddTenderDocAction.FileUpload11.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please select file name ");
			return false
		}
	return true;
	}
	
	//For jsp file check--Anurag
	function ChkfileExt(id){
	var fileName =id.value;
	if(fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".bmp")==-1 && fileName.lastIndexOf(".zip")==-1 && fileName.lastIndexOf(".rar")==-1){
		alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp, zip, rar files can be uploaded");
		id.value="";
	}
}
	
</script>
<%
String Tender_Type  = "";
if(request.getParameter("Tender_Type")!=null &&  !request.getParameter("Tender_Type").trim().equals("")){
	Tender_Type = request.getParameter("Tender_Type");
}
String Division_id  = "";
if(request.getParameter("Division_id")!=null &&  !request.getParameter("Division_id").trim().equals("")){
	Division_id = request.getParameter("Division_id");
}
String Department_id  = "";
if(request.getParameter("Department_id")!=null &&  !request.getParameter("Department_id").trim().equals("")){
	Department_id = request.getParameter("Department_id");
}
String Notice_id  = "";
if(request.getParameter("Notice_id")!=null &&  !request.getParameter("Notice_id").trim().equals("")){
	Notice_id = request.getParameter("Notice_id");
}
String tenderNo = "";
String descEng = "";
//String descHin = "";
String openDate = "";
String closeDate = "";
String openTime = "";
String closeTime = "";

String Amount = "";
String Margin = "";
String TimeLimit = "";
String Document_Coll ="";
String Document_Coll1 ="";
String Document_Subbim = "";
String Document_Subbim1 = "";
String TitleEng = "";

//String TitleHin = "";


	String condition = "";
	String strNoticeNo = "";
	/*
	strNoticeNo = "SELECT ID, NOTICE_NO, DESCRIPTION, DESCRIPTION_HINDI, DATE_FORMAT(VALID_FROM,'%d-%m-%Y'), DATE_FORMAT(VALID_TO,'%d-%m-%Y'), VALID_FORM_TIME,	VALID_TO_TIME,APPROXIMATE_COST,EARNEST_MONEY,TENDER_DOC_COST,DATE_FORMAT(DOCUMENT_COLL,'%d-%m-%Y'),DATE_FORMAT(DOCUMENT_COLL,'%H-%i'),DATE_FORMAT(DOCUMENT_SUBBMI,'%d-%m-%Y'),DATE_FORMAT(DOCUMENT_SUBBMI,'%H-%i'),TITLE_ENG,TITLE_HIN FROM CMS_NOTICE_MASTER WHERE  ID="+Notice_id+"";
	*/
	strNoticeNo = "SELECT T_ID, T_REF_NO, T_DESC, DATE_FORMAT(T_BID_OPEN_DATE,'%d-%m-%Y'), DATE_FORMAT(T_BID_OPEN_DATE,'%H:%i'),DATE_FORMAT(T_PUB_DATE,'%d-%m-%Y'), DATE_FORMAT(T_PUB_DATE,'%H:%i'), T_VALUE,T_EMD,T_FEE,DATE_FORMAT(T_DOC_END_DATE,'%d-%m-%Y'),DATE_FORMAT(T_DOC_END_DATE,'%H:%i'),DATE_FORMAT(T_BIDSUB_END_DATE,'%d-%m-%Y'),DATE_FORMAT(T_BIDSUB_END_DATE,'%H:%i'),T_TITLE FROM CMS_NOTICE_MASTER_NEW WHERE  T_ID="+Notice_id+"";
	
	
	dbBean.setQuery(strNoticeNo);
	String rsGetNoticeDetails[][] = dbBean.getResultSet();
	if(rsGetNoticeDetails.length>0){
		tenderNo = rsGetNoticeDetails[0][1];
		descEng = rsGetNoticeDetails[0][2];
		
		//descHin = rsGetNoticeDetails[0][3];
		
		openDate = rsGetNoticeDetails[0][3];
		openTime = rsGetNoticeDetails[0][4];
		
		closeDate = rsGetNoticeDetails[0][5];
		//openTime = rsGetNoticeDetails[0][6];
		closeTime = rsGetNoticeDetails[0][6];
		
		Amount = rsGetNoticeDetails[0][7];
		Margin = rsGetNoticeDetails[0][8];
		TimeLimit = rsGetNoticeDetails[0][9];		
		
		Document_Coll = rsGetNoticeDetails[0][10];
		Document_Coll1 = rsGetNoticeDetails[0][11];
		
		Document_Subbim = rsGetNoticeDetails[0][12];
		Document_Subbim1 = rsGetNoticeDetails[0][13];
		
		TitleEng = rsGetNoticeDetails[0][14];
		//TitleHin = rsGetNoticeDetails[0][16];
	}
%>
<SCRIPT src="ktdv.js"></script>
<form id="form1" name="AddTenderDocAction" action="AddTenderDocAction.jsp" METHOD="POST" ENCTYPE="multipart/form-data" onsubmit="return CheckForm();">
        <table width="50%" border="1" align="center" style="font-family:tahoma;font-size:12px;border-collapse:collapse;" cellpadding="3">
		<input type="hidden" name="Tender_Type" id="Tender_Type" value="<%=Tender_Type%>">
					<input type="hidden" name="Division_id" id="Division_id" value="<%=Division_id%>">
					<input type="hidden" name="Department_id" id="Department_id" value="<%=Department_id%>">          
					<input type="hidden" name="Notice_id" id="Notice_id" value="<%=Notice_id%>"> 
		<tr>
                <td colspan="2" align="center">
                   <%if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }%>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="tr_bgcolor">
                    Add Tender Document

                </td>
            </tr>
            <tr>
                <td><font color="red"><b>*&nbsp;</b></font>Tender Reference No.</td>
                <td><input name="TenderNo" type="text" value="<%=tenderNo%>" id="TenderNo" readonly="readonly"/></td>
			</tr>
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font>Tender Publication Date </td>
                <td nowrap="nowrap"><input name="TenCloseDate" type="text" value="<%=closeDate%>" id="TenCloseDate" class="textbox" readonly="readonly"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 'TenCloseDate'
                                           });
                    </script>
					 Time &nbsp;<input name="TenCloseTime" value="<%if(!closeTime.equals("")){out.print(closeTime);}else{out.print("00:00");}%>" type="text" id="TenCloseTime" />(hh:mm)
				</td>
			 </tr>
			<tr>
                <td nowrap="nowrap">Tender Document Download End Date</td>
                <td nowrap="nowrap"><input name="DocumentColl" type="text" id="DocumentColl" value="<%=Document_Coll%>"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 'DocumentColl'
                                           });
                    </script>
					Time
					<input name="DocumentColl1" type="text" id="DocumentColl1" value="<%if(!Document_Coll1.equals("")){out.print(Document_Coll1);}else{out.print("00:00");}%>"/>(hh:mm)
				</td>
			 </tr>
			 <tr>
                <td nowrap="nowrap"> Tender Bid Submission End Date</td>
                <td nowrap="nowrap"><input name="DocumentSubmi" type="text" id="DocumentSubmi" value="<%=Document_Subbim%>"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 'DocumentSubmi'
                                           });
                    </script>
					Time
					<input name="DocumentSubmi1" type="text" id="DocumentSubmi1" value="<%if(!Document_Subbim1.equals("")){out.print(Document_Subbim1);}else{out.print("00:00");}%>"/>(hh:mm)					
				</td>
			 </tr>
			 <tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Bid Open Date</td>
                <td nowrap="nowrap"><input name="TenOpenDate" type="text" value="<%=openDate%>" id="TenOpenDate" class="textbox" readonly="readonly"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 'TenOpenDate'
                                           });
                    </script>
					 Time &nbsp;<input name="TenOpenTime" value="<%if(!openTime.equals("")){out.print(openTime);}else{out.print("00:00");}%>" type="text" id="TenOpenTime" />(hh:mm)
				</td>
			 </tr>
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font>Tender Title (in English)</td>
                <td><textarea name="TenTitleEng" rows="1" cols="50" id="TenTitleEng" value=""><%=TitleEng%></textarea></td>
			</tr>
			<tr>
                <td>Tender Title (in Hindi)</td>
                <td><textarea name="TenTitleHin" rows="1" cols="50" id="TenTitleHin" onkeyup="javascript:changeVal(this)" value=""> </textarea></td>
			</tr>
            <tr>
                <td><font color="red"><b>*&nbsp;</b></font> Tender Description (in English)</td>
                <td><textarea name="TenDescEng" rows="4" cols="50" id="TenDescEng"><%=descEng%></textarea></td>
            </tr>
             <tr>
			  <td>Tender Description Hindi </td>
			   <td><textarea name="TenDescHin" rows="4" cols="50" id="TenDescHin" onkeyup="javascript:changeVal(this)"> </textarea>               
               </td> 
			 </tr>
            
            <tr>
                <td ><font color="red"><b>*&nbsp;</b></font> Tender value</td>
                <td ><img src="../../images/rupees.jpg">&nbsp;<input name="Amount" value="<%=Amount%>" type="text" id="txtAmount" /> </td>
            </tr>
            <tr>
                <td >EMD</td>
                <td> <img src="../../images/rupees.jpg">&nbsp;<input name="Margin" value="<%=Margin%>" type="text" id="txtMargin"/> </td>
            </tr>
            <tr>
                <td >Cost of Tender Document</td>
                <td > <img src="../../images/rupees.jpg">&nbsp;<input name="TimeLimit" value="<%=TimeLimit%>" type="text" id="txtTimeLimit" /></td>
                
            </tr>
           
            <tr>
                <td>Upload File (English) </td>
                <td nowrap="nowrap">(<font color="red"><b>*&nbsp;</b></font>1)<input type="file" name="FileUpload11" id="FileUpload11" class="textbox" onchange="ChkfileExt(this);"/>(2)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td nowrap="nowrap">(3)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/>(4)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/></td>
            </tr><tr>
                <td>&nbsp;</td>
                <td nowrap="nowrap">(5)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/>(6)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/></td>
            </tr>
			<tr>
                <td>&nbsp;</td>
                <td nowrap="nowrap">(7)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/>(8)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/></td>
            </tr>
			<tr>
                <td>&nbsp;</td>
                <td nowrap="nowrap">(9)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/>(10)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/></td>
            </tr>
            <tr>
                <td > Upload File (Hindi)</td>
                <td ><input type="file" name="FileUpload2" id="FileUpload2" onchange="ChkfileExt(this);"/>
				</td>
            </tr>
			<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
             <tr>
                <td >
					
                    <input type="submit" name="btnAdd" value="Save"  id="btnAdd" class="button"/></td>
                <td>&nbsp;<font color="red"><b>*&nbsp; Mandatory Fields</b></font></td>
            </tr>
			<tr></tr>
		</table>
</form>

<%@ include file="../header/footerInner.jsp" %>