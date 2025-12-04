<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.util.Date,java.text.SimpleDateFormat" %>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<script type="text/javascript" src="js/calendar_us.js"></script>
<script type="text/javascript">
	function CheckForm(){
		if(document.editTenderDocAction.TenderNo.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender No. ");
			return false
		}
		if(document.editTenderDocAction.TenTitleEng.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Title ");
			return false
		}
		if(document.editTenderDocAction.TenDescEng.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter English Description ");
			return false
		}
		if(document.editTenderDocAction.TenOpenDate.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please select Tender open date ");
			return false
		}
		if(document.editTenderDocAction.TenCloseDate.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please select Tender close date ");
			return false
		}
		if(document.editTenderDocAction.TenOpenTime.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.editTenderDocAction.TenOpenTime.value.match(timRegX);
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
		if(document.editTenderDocAction.TenCloseTime.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.editTenderDocAction.TenCloseTime.value.match(timRegX);
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
		var t1 = document.editTenderDocAction.TenOpenDate.value;
		var m1 = document.editTenderDocAction.TenOpenTime.value
		var t2 = t1.split("-");
		var m2 = m1.split(":");
		var StartDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
		 t1 = document.editTenderDocAction.TenCloseDate.value;
		 m1 = document.editTenderDocAction.TenCloseTime.value
		 t2 = t1.split("-");
		 m2 = m1.split(":");
		var EndDateTime = new Date(t2[2],t2[1]-1,t2[0],m2[0],m2[1]);
		if(StartDateTime < EndDateTime){
			alert(" closing date should be less then  opening date");
			return false;
		}
		if(document.editTenderDocAction.Amount.value.replace(/^\s+|\s+$/g, '') == ""){
			alert("Please Enter Tender value ");
			return false
		}
		
	return true;
	}
	function backform(){
		history.back();
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
String T_ID  = "";
if(request.getParameter("T_ID")!=null &&  !request.getParameter("T_ID").trim().equals("")){
	T_ID = request.getParameter("T_ID");
}
String tenderNo = "";
String titleEng = "";
String titleHin = "";
String descEng = "";
String descHin = "";
String openDate = "";
String closeDate = "";
String openTime = "";
String closeTime = "";
String tenderValue = "";
String EMD = "";
String tenderDocCost = "";
String fileEng = "";
String fileHin = "";
String DocumentColl = "";
String DocumentColl1 = "";
String DocumentSubmi = "";
String DocumentSubmi1 = "";
String file2="",file3="",file4="",file5="",file6="",file7="",file8="",file9="",file10="";

//Anurag
	String currentDate="";
	String chkbidopen_Date="";
	int expired=-100;
	
	String strTender = "";
	strTender = "SELECT ID, TENDER_NO, TENDER_TITLE_ENG, TENDRT_TITLE_HINDI,TENDER_DESC_ENG, TENDER_DESC_HIN, DATE_FORMAT(TENDER_OPEN_DATE,'%d-%m-%Y'), DATE_FORMAT(TENDER_CLOSE_DATE,'%d-%m-%Y'), TENDER_OPEN_TIME, TENDER_CLOSE_TIME, APPROXIMATE_COST, EARNEST_MONEY, TENDER_DOC_COST, FILE_ENG, FILE_HINDI,DATE_FORMAT(DOCUMENT_COLL,'%d-%m-%Y'),DATE_FORMAT(DOCUMENT_COLL,'%H:%i'),DATE_FORMAT(DOCUMENT_SUBBMI,'%d-%m-%Y'),DATE_FORMAT(DOCUMENT_SUBBMI,'%H:%i'),FILE2,FILE3,FILE4,FILE5,FILE6,FILE7,FILE8,FILE9,FILE10, DATE_FORMAT(NOW(),'%d-%m-%Y %H:%i:%s'),DATE_FORMAT(CONCAT(TENDER_OPEN_DATE,' ',TENDER_OPEN_TIME,':00'),'%d-%m-%Y %H:%i:%s') FROM CMS_TENDER_MASTER_NEW WHERE  ID ="+T_ID+"";
	dbBean.setQuery(strTender);
	String rsGetTenderDetails[][] = dbBean.getResultSet();
	if(rsGetTenderDetails.length>0){
		tenderNo = rsGetTenderDetails[0][1];
		titleEng = rsGetTenderDetails[0][2];
		titleHin = rsGetTenderDetails[0][3];
		descEng = rsGetTenderDetails[0][4];
		descHin = rsGetTenderDetails[0][5];
		openDate = rsGetTenderDetails[0][6];
		closeDate = rsGetTenderDetails[0][7];
		openTime = rsGetTenderDetails[0][8];
		closeTime = rsGetTenderDetails[0][9];
		tenderValue = rsGetTenderDetails[0][10];
		EMD = rsGetTenderDetails[0][11];
		tenderDocCost = rsGetTenderDetails[0][12];
		fileEng = rsGetTenderDetails[0][13];
		fileHin = rsGetTenderDetails[0][14];
		DocumentColl = rsGetTenderDetails[0][15];
		DocumentColl1 = rsGetTenderDetails[0][16];
		DocumentSubmi = rsGetTenderDetails[0][17];
		DocumentSubmi1 = rsGetTenderDetails[0][18];
		file2 = rsGetTenderDetails[0][19];file3=rsGetTenderDetails[0][20];file4=rsGetTenderDetails[0][21];
		file5 = rsGetTenderDetails[0][22];file6=rsGetTenderDetails[0][23];file7=rsGetTenderDetails[0][24];
		file8=rsGetTenderDetails[0][25];file9=rsGetTenderDetails[0][26];file10=rsGetTenderDetails[0][27];
		
		
		//not editing expired tender--Anurag
		currentDate= rsGetTenderDetails[0][28];
		chkbidopen_Date= rsGetTenderDetails[0][29];
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
<link rel="StyleSheet" href="css/styles0.css" type="text/css">
<SCRIPT src="ktdv.js"></script>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;<a href="index.jsp?selectType=2">Manage Tender Document</a>
&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;<a href="searchTender.jsp">Search Tender</a>&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;Edit Tender Document</span></p>
<form id="form1" name="editTenderDocAction" action="editTenderDocAction.jsp" METHOD="POST" ENCTYPE="multipart/form-data" onsubmit="return CheckForm();">
		<input type="hidden" value="<%=rsGetTenderDetails[0][0]%>" name="Tender_id">
	   <table width="50%" border="1" align="center" class="sample">
		<tr>
                <td colspan="2" align="center">
                   <%if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }%>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="tr_bgcolor">
                    Edit Tender

                </td>
            </tr>
            <tr>
                <td>Tender Number</td>
                <td><input name="TenderNo" type="text" value="<%=tenderNo%>" id="TenderNo" readonly="readonly"/></td>
			</tr>
			 <tr>
                <td nowrap="nowrap">Publication date on website</td>
                <td nowrap="nowrap"><input name="TenCloseDate" type="text" value="<%=closeDate%>" id="TenCloseDate" class="textbox" readonly="readonly"/>
					Time &nbsp;<input name="TenCloseTime" readonly="readonly" value="<%if(!closeTime.equals("")){out.print(closeTime);}else{out.print("00:00");}%>" type="text" id="TenCloseTime" />(hh:mm)
					</td>
			 </tr>
			 <tr>
                <td nowrap="nowrap">Last Date of Document Collection</td>
                <td nowrap="nowrap"><input name="DocumentColl" type="text" id="DocumentColl" value="<%=DocumentColl%>" readonly="readonly"/>
					Time
					<input name="DocumentColl1" type="text" readonly="readonly" id="DocumentColl1" value="<%if(!DocumentColl1.equals("")){out.print(DocumentColl1);}else{out.print("00:00");}%>"/>(hh:mm)
				</td>
			 </tr>
			 <tr>
                <td nowrap="nowrap"> Last date for Document Submission</td>
                <td nowrap="nowrap"><input name="DocumentSubmi" type="text" id="DocumentSubmi" value="<%=DocumentSubmi%>" readonly="readonly"/>
					Time
					<input name="DocumentSubmi1" type="text" readonly="readonly" id="DocumentSubmi1" value="<%if(!DocumentSubmi1.equals("")){out.print(DocumentSubmi1);}else{out.print("00:00");}%>"/>(hh:mm)					
				</td>
			 </tr>
			 <tr>
                <td nowrap="nowrap"> Date of Opening</td>
                <td nowrap="nowrap"><input name="TenOpenDate" type="text" value="<%=openDate%>" id="TenOpenDate" class="textbox" readonly="readonly"/>
					Time &nbsp;<input name="TenOpenTime" readonly="readonly" value="<%if(!openTime.equals("")){out.print(openTime);}else{out.print("00:00");}%>" type="text" id="TenOpenTime" />(hh:mm)
				</td>
			 </tr>
            <tr>
                <td > Tender value</td>
                <td ><input name="Amount" value="<%=tenderValue%>" type="text" id="txtAmount" readonly="readonly"/> </td>
            </tr>
            <tr>
                <td >EMD</td>
                <td> <input name="Margin" value="<%=EMD%>" type="text" id="txtMargin" readonly="readonly"/> </td>
            </tr>
            <tr>
                <td >Cost of Tender Document</td>
                <td > <input name="TimeLimit" value="<%=tenderDocCost%>" type="text" id="txtTimeLimit" readonly="readonly"/></td>
                
            </tr>
            <tr>
                <td>Tender Title English</td>
                <td><textarea name="TenTitleEng" rows="2" cols="20" id="TenTitleEng"  readonly="readonly"><%=titleEng%></textarea></td>
			</tr>
			<tr>
                <td>Tender Title Hindi</td>
                <td><textarea name="TenTitleHin" rows="2" cols="20" id="TenTitleHin" onkeyup="javascript:changeVal(this)" readonly="readonly"><%=titleHin%></textarea></td>
			</tr>
            <tr>
                <td> Tender Description English</td>
                <td><textarea name="TenDescEng" rows="2" cols="20" id="TenDescEng" readonly="readonly"><%=descEng%></textarea></td>
            </tr>
             <tr>
			  <td>Tender Description Hindi </td>
			   <td><textarea name="TenDescHin" rows="2" cols="20" id="TenDescHin" onkeyup="javascript:changeVal(this)" readonly="readonly"><%=descHin%></textarea>               
               </td> 
			 </tr>
            <tr>
                <td>Upload File </td>
                <td nowrap="nowrap">(1)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/>(2)<input type="file" name="FileUpload1" id="FileUpload1" class="textbox" onchange="ChkfileExt(this);"/></td>
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
                <td>View Upload Files</td>
                <td>
					<%if(!fileEng.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=fileEng%>" target="_blank"><font color="black">(1)Click Here</font></a><br>
					<%}%>
					<%if(!file2.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=file2%>" target="_blank"><font color="black">(2)Click Here</font></a><br>
					<%}%>
					<%if(!file3.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=file3%>" target="_blank"><font color="black">(3)Click Here</font></a><br>
					<%}%>
					<%if(!file4.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=file4%>" target="_blank"><font color="black">(4)Click Here</font></a><br>
					<%}%>
					<%if(!file5.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=file5%>" target="_blank"><font color="black">(5)Click Here</font></a><br>
					<%}%>
					<%if(!file6.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=file6%>" target="_blank"><font color="black">(6)Click Here</font></a><br>
					<%}%>
					<%if(!file7.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=file7%>" target="_blank"><font color="black">(7)Click Here</font></a><br>
					<%}%>
					<%if(!file8.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=file8%>" target="_blank"><font color="black">(8)Click Here</font></a><br>
					<%}%>
					<%if(!file9.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=file9%>" target="_blank"><font color="black">(9)Click Here</font></a><br>
					<%}%>
					<%if(!file9.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=file9%>" target="_blank"><font color="black">(10)Click Here</font></a><br>
					<%}%>
				</td>
            </tr>
            <tr>
                <td > Upload Hindi  File</td>
                <td >
					<input type="file" name="FileUpload2" id="FileUpload2" onchange="ChkfileExt(this);"/>
					<%if(!fileHin.equals("")){%>
					<a href="../../<%=Hname%>/tender/<%=fileHin%>" target="_blank"><font color="black">View Upload File</font></a>
					<%}%>
				</td>
            </tr>
			<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
             <tr>
				<td>&nbsp;</td>
                <td >
                    
					<% if (expired==-1){%>
					<input type="submit" name="btnAdd" value="Save"  id="btnAdd" class="button" disabled />
					<% }else{%>
					<input type="submit" name="btnAdd" value="Save"  id="btnAdd" class="button"/>
					<%}%>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <!--<input type="button" value="Back" name="back" onclick="backform();"/>-->
				</td>
                
            </tr>
			<tr></tr>
		</table>
</form>
<%@ include file="../header/footerInner.jsp" %>