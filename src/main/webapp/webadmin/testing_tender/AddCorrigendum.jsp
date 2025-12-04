<%try{%>
<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %><br>

<script type="text/javascript">
  	function submit_self()
	{
		var data = document.AddCorrigendum.Division_id.value;
		var data1 = document.AddCorrigendum.Department_id.value;
		document.AddCorrigendum.action='AddCorrigendum.jsp?Division_id='+data+'&Department_id='+data1;
		document.AddCorrigendum.submit();
		
	}
	function CheckForm(){
		if(document.AddCorrigendum.Division_id.value == 0){
			alert("Please select Division ");
			return false
		}
		if(document.AddCorrigendum.Department_id.value == 0){
			alert("Please select Department ");
			return false
		}
		if(document.AddCorrigendum.Corri_Type.value == ""){
			alert("Please select corrigendum type ");
			return false
		}
		var corriType = 0;
		for (var i=0; i < document.AddCorrigendum.Corri_Type.length; i++){
   			if (document.AddCorrigendum.Corri_Type[i].checked){
      			 corriType = document.AddCorrigendum.Corri_Type[i].value;
      		}
  	    }
		if(corriType == ""){
			if(document.AddCorrigendum.Notice_id.value == 0){
				alert("Please select corrigendum for");
				document.AddCorrigendum.Notice_id.focus();
				return false;
			}
		}
		if(corriType == 2){
			if(document.AddCorrigendum.Tender_id.value == 0){
				alert("Please select tender no.");
				return false;
			}
		}
		if(corriType == 1){
			if(document.AddCorrigendum.Notice_id.value == 0){
				alert("Please select notice no.");
				return false;
			}
		}
		if(document.AddCorrigendum.revised_time.value != ""){
			var timRegX = /^(\d{1,2}):(\d{2})?$/;
			var timArr = document.AddCorrigendum.revised_time.value.match(timRegX);
			if (timArr == null){
				alert("Time is not in a valid format for  Opening Time.");
				document.AddCorrigendum.revised_time.focus(); 
				return false;
			}hour = timArr[1];minute = timArr[2];
			if (hour < 0  || hour > 23){	
				alert("Hour must be between 1 and 23.");
				document.AddCorrigendum.revised_time.focus(); 
				return false;
			}
			if (minute<0 || minute > 59){
				alert ("Minute must be between 0 and 59.");
				document.AddCorrigendum.revised_time.focus(); 
				return false;
			}
		}
		if(document.AddCorrigendum.FileUpload1.value == ""){
			alert("Please select file ");
			return false
		}
		
	 return true;
	}
	function checkType(id){
		if(id == 1){
			document.getElementById("nid").style.display="";
			document.getElementById("tid").style.display="none";
		}
		if(id == 2){
			document.getElementById("nid").style.display="none";
			document.getElementById("tid").style.display="";
		}
	}
	
		/*-------------------Updated By Aman 08-05-2014----------------------*/
	
	function ChkfileExt(){
	/*
	var fileName =id.value;
	if(fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".bmp")==-1){
		alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
		id.value="";
	}
	*/
		
	var id = document.getElementById('FileUpload2');
	var id1 = document.getElementById("FileUpload2").value;

	var id2 = document.getElementById('FileUpload1');
	var id3 = document.getElementById("FileUpload1").value;

	var img = id.value;
	var n = img.match('.jsp');
	//alert(n);
	if (n == '.jsp') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
	return false;
	}

	var n = img.match('.php');
	//alert(n);
	if (n == '.php') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
	return false;
	}

	var n = img.match('.exe');
	//alert(n);
	if (n == '.exe') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
	return false;
	}

	var n = img.match('.java');

	if (n == '.java') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
	return false;
	}

	var img2 = id2.value;
	var n2 = img2.match('.jsp');
	//alert(n);
	if (n2 == '.jsp') 
	{
	alert("Not Authorised ,Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
	return false;
	}

	var n2 = img2.match('.php');
	//alert(n);
	if (n2 == '.php') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
	return false;
	}

	var n2 = img2.match('.exe');
	//alert(n);
	if (n2 == '.exe') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
	return false;
	}

	var n2 = img2.match('.java');
	if (n2 == '.java') 
	{
	alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
	return false;
	}

	var fileName =id1.value;

	if( id1 === "" ) {
	//alert("Please upload any file.");
	}
	else{
	if( fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".JPG")==-1 && fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".xlsx")==-1){
	alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
	return false;
	}
	}
	var fileName =id3.value;

	if( id3 === "" ) {
	//alert("Please upload any file.");
	}
	else{
	if(fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".bmp")==-1){
	alert("Only pdf, txt, csv, doc, docx, xls, xlsx ,jpg files can be uploaded");
	return false;
	}
	}
	
}

	
</script>
<script language="JavaScript1.2">
	
function ajaxfunction()
{
	var str=document.getElementById("Notice_id").value;
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
	}
	else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if(xmlhttp.readyState==4){
			var mySplitResult = (xmlhttp.responseText).split("\t");
			document.getElementById("test").innerHTML=mySplitResult[2];
			document.getElementById("t_doc_start_date").value=mySplitResult[3];
			document.getElementById("t_doc_start_time").value=mySplitResult[4];
			document.getElementById("t_doc_end_date").value=mySplitResult[5];
			document.getElementById("t_doc_end_time").value=mySplitResult[6];
			document.getElementById("t_bidsub_start_date").value=mySplitResult[7];
			document.getElementById("t_bidsub_start_time").value=mySplitResult[8];
			document.getElementById("t_bidsub_end_date").value=mySplitResult[9];
			document.getElementById("t_bidsub_end_time").value=mySplitResult[10];
		}
	}
	
	var url="getNoticeOpeningDate2.jsp?id="+str;
	xmlhttp.open("GET",url,true);
	
	xmlhttp.send(null);
}
function ajaxfunction1()
{
	var str=document.getElementById("Tender_id").value;
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
	}
	else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if(xmlhttp.readyState==4){
			var mySplitResult = (xmlhttp.responseText).split("\t");
			document.getElementById("test").innerHTML=mySplitResult[2];
			document.getElementById("t_doc_start_date").value=mySplitResult[3];
			document.getElementById("t_doc_start_time").value=mySplitResult[4];
			document.getElementById("t_doc_end_date").value=mySplitResult[5];
			document.getElementById("t_doc_end_time").value=mySplitResult[6];
			document.getElementById("t_bidsub_start_date").value=mySplitResult[7];
			document.getElementById("t_bidsub_start_time").value=mySplitResult[8];
			document.getElementById("t_bidsub_end_date").value=mySplitResult[9];
			document.getElementById("t_bidsub_end_time").value=mySplitResult[10];
		}
	}
	
	var url="getTenderOpeningDate2.jsp?id="+str;
	xmlhttp.open("GET",url,true);
	
	xmlhttp.send(null);
}
</script>
<table width="100%" class="mgContentTitle" valign="top">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle"><a href="index.jsp?selectType=3">Manage Corrigendum</a>&nbsp;&nbsp;&raquo;&nbsp;&nbsp;Add Corrigendum&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>
<br>
<%
String strDivId  = "-100";
if(request.getParameter("Division_id")!=null &&  !request.getParameter("Division_id").trim().equals("")){
	strDivId = request.getParameter("Division_id");
}
String strDeptId  = "-100";
if(request.getParameter("Department_id")!=null &&  !request.getParameter("Department_id").trim().equals("")){
	strDeptId = request.getParameter("Department_id");
}
// Select Tender Division 
String strDivision = "";
	strDivision = "SELECT CMSD_ID,CMSD_DIVISIONS FROM CMS_DIVISIONS ORDER BY CMSD_DIVISIONS";
	dbBean.setQuery(strDivision);
	String rsGetDivision[][] = dbBean.getResultSet();
// Select tender Department
String strDepartment = "";
String strDepartmentId = (String)session.getAttribute("DEPT_ID");
	if(session.getAttribute("DBAacc") != null && !session.getAttribute("DBAacc").equals("100")){
		strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE CMSDEPT_ID IN ("+strDepartmentId+") AND CMSDEPT_CMSD_ID ="+strDivId+"";
	}else{
		strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE  CMSDEPT_CMSD_ID ="+strDivId+"";
	}
	dbBean.setQuery(strDepartment);
	String rsGetDepartment[][] = dbBean.getResultSet();
	//Select tender no
String strNoticeNo = "";

	String condition = "";
	strNoticeNo = "SELECT T_ID,T_REF_NO FROM  CMS_NOTICE_MASTER_NEW WHERE T_BID_OPEN_DATE >= DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00')  AND STATUS = 'Active'";
	if(strDivision != null){
		condition += " AND DIV_ID = "+strDivId+"";
	}
	if(strDepartment != null){
		condition += " AND DEPT_ID = "+strDeptId+"";
	}
	if(condition.equals("")){
		condition = " AND DIV_ID=-100";
	}
	if(strDivId.equals("-1")){
		condition = " AND DEPT_ID = '-1' AND DIV_ID = '-1'";
	}
	
	strNoticeNo =strNoticeNo+condition;
	dbBean.setQuery(strNoticeNo);
	//out.print(strNoticeNo);
	String rsGetNoticeNo[][] = dbBean.getResultSet();
	
	
// Select Tender
String strTenderNo = "";
	strTenderNo = "SELECT ID,TENDER_NO FROM  CMS_TENDER_MASTER_NEW WHERE  TENDER_OPEN_DATE >= DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00')   AND STATUS = 'Active'";
	strTenderNo = strTenderNo+condition;
	dbBean.setQuery(strTenderNo);
	//out.print(strTenderNo);
	String rsGetTenderNo[][] = dbBean.getResultSet();
%>
 
<SCRIPT src="ktdv.js"></script>
<script type="text/javascript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<form id="AddCorrigendum" name="AddCorrigendum" action="AddCorrigendumAction.jsp" METHOD="POST" ENCTYPE="multipart/form-data" onsubmit="return CheckForm();">

<table width="90%" border="1" align="center" class="sample">
		  	<tr> 
				<td colspan="2"  align="center"><font color="blue">
						<%if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }%></font>
				</td>
			</tr>
            <tr class="tr_bgcolor">
                <td colspan="2"  align="center"><b>Add Corrigendum</b></td>
            </tr>
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font>Division </td>
                <td><select name="Division_id" onchange="javascript:submit_self()">
			  			<option value="0">--Select Division--</option>
						<%if(rsGetDivision.length>0){
							for(int i=0;i<rsGetDivision.length;i++){%>
							<option value="<%=rsGetDivision[i][0]%>" <%if(strDivId.equals(rsGetDivision[i][0])){%>selected<%}%>><%=rsGetDivision[i][1]%></option>
						<%	}
						}%>
						
					</select></td>
			 </tr>
             <tr>
                <td><font color="red"><b>*&nbsp;</b></font>Department </td>
                <td><select name="Department_id" onchange="javascript:submit_self()">
						<%if(rsGetDepartment.length>0){%>
						<option value="0">--Select Department--</option>
						<%
							for(int i=0;i<rsGetDepartment.length;i++){%>
							<option value="<%=rsGetDepartment[i][0]%>" <%if(strDeptId.equals(rsGetDepartment[i][0])){%>selected<%}%>><%=rsGetDepartment[i][1]%></option>
						<%	}
						}%>
						
					</select></td>
			 </tr>
			 <tr>
			 	<td><font color="red"><b>*&nbsp;</b></font>Corrigendum For </td>
				<td><input type="radio"  name="Corri_Type" value="1" onclick="checkType('1')">Notice &nbsp;&nbsp;
					<input type="radio" name="Corri_Type" value="2" onclick="checkType('2')">Tender &nbsp;&nbsp;
				</td>
			 </tr>

			 <tr id="nid">
                <td><font color="red"><b>*&nbsp;</b></font>Notice No. </td>
                <td><select name="Notice_id" id="Notice_id" onchange="ajaxfunction();">
						<option value="0">--Select Notice--</option>
						<%if(rsGetNoticeNo.length>0){
							for(int i=0;i<rsGetNoticeNo.length;i++){%>
							<option value="<%=rsGetNoticeNo[i][0]%>" ><%=rsGetNoticeNo[i][1]%></option>
						<%}}%>
				 </td>
				 </tr>
				</div>
				
				<tr id="tid">
				 <td><font color="red"><b>*&nbsp;</b></font> Tender No. </font></td>
				 	<td><select name="Tender_id" id="Tender_id" onchange="ajaxfunction1();">
						<option value="0" >--Select Tender--</option>
						<%if(rsGetTenderNo.length>0){
							for(int i=0;i<rsGetTenderNo.length;i++){%>
							<option value="<%=rsGetTenderNo[i][0]%>" ><%=rsGetTenderNo[i][1]%></option>
						<%}}%>
					</select></td>
			 </tr>
			 </div>

			<tr>
                <td>Tender Opening Date</td>
                <td><span id="test"></span></td>
              </tr>
			 <tr>
                <td>Revised Date&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><b>(if any)</b></font></td>
                <td>
					<input name="revised_date" value="" type="text" id="revised_date" size="30"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'AddCorrigendum',
                                                 // input name
                                                 'controlname': 'revised_date'
                                           });
                    </script>
					&nbsp;Time
					<input name="revised_time" value="00:00" type="text" id="revised_time"/>(hh:mm)
				</td>
              </tr>
             



			
			
			
			
			
			<tr>
                <td nowrap="nowrap"><font color="red"><b>*&nbsp;</b></font> Tender Document Download Start Date</td>
                <td nowrap="nowrap"><input name="t_doc_start_date" type="text" id="t_doc_start_date" value="" readonly="readonly" /><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'AddCorrigendum',
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
                                                'formname': 'AddCorrigendum',
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
                                                'formname': 'AddCorrigendum',
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
                                                'formname': 'AddCorrigendum',
                                                 // input name
                                                 'controlname': 't_bidsub_end_date'
                                           });
                    </script>
					Time
					<input name="t_bidsub_end_time" type="text" id="t_bidsub_end_time" value="00:00"/>(hh:mm)					
				</td>
			 </tr>















			 <tr>
                <td>Corrigendum Title (in English)</td>
                <td><input name="Title_Eng" value="" type="text" id="txtTitle" size="50"/></td>
              </tr>
			  <tr>
                <td>Corrigendum Title (in Hindi)</td>
                <td><input name="Title_Hin" value="" type="text" size="50" id="txtTitle"  onkeyup="javascript:changeVal(this)"/></td>
              </tr>
            <tr>
                <td>Description (in English)</td>
                <td><textarea name="Desc_Eng" rows="4" cols="50" id="txtDescription"></textarea></td>
             </tr>
            <tr>                    
			<td>Description (in Hindi) </td>
				<td><textarea name="Desc_Hin" rows="4" cols="50" id="txtarea" onkeyup="javascript:changeVal(this)"></textarea></td>
			</tr>
            <tr>
                <td><font color="red"><b>*&nbsp;</b></font> Upload File(English) </td>
	              <td ><input type="file" name="FileUpload1" id="FileUpload1" onchange="javascript:return ChkfileExt();"/> </td>
            </tr>
            
              <tr>
                <td>Upload File (Hindi)</td>
                <td><input type="file" name="FileUpload2" id="FileUpload2" onchange="javascript:return ChkfileExt();"/></td>
            </tr>                 
            <tr><td>&nbsp;</td>
                <td >
                    <input type="submit" name="btnAdd" value="Add" onClick="javascript:return ChkfileExt();" id="btnAdd"/>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    <input id="Button2"  type="reset" value="reset"  />&nbsp; &nbsp;
					<font color="red"><b>*&nbsp; Mandatory Fields</b></font>
                </td>
            </tr>
               
        </table>
</form>

<%@ include file="../header/footerInner.jsp" %>
<%}catch(Exception e){out.print(e);}%>