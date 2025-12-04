<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<script type="text/javascript" src="js/calendar_us.js"></script>
<script type="text/javascript">
	function CheckForm(){
		if(document.AddAwardTender.Description_Eng.value == ""){
			alert("Please Enter Description ");
			return false
		}
		if(document.AddAwardTender.Name.value == ""){
			alert("Please Enter Name ");
			return false
		}
		if(document.AddAwardTender.Awarded_On.value == ""){
			alert("Please select Awarded Date ");
			return false
		}
		if(document.AddAwardTender.Closed_On.value == ""){
			alert("Please select closed Date ");
			return false
		}
		if(document.AddAwardTender.Cost.value == ""){
			alert("Please Enter cost ");
			return false
		}
		return true;
	}
	
	//For jsp file check--Anurag
	function ChkfileExt(id){
	var fileName =id.value;
	if(fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".bmp")==-1){
		alert("Only pdf, txt, csv, doc, docx, xls, jpg, gif, png, bmp files can be uploaded");
		id.value="";
	}
}
	
</script>
<%
String Division_id  = "";
if(request.getParameter("Division_id")!=null &&  !request.getParameter("Division_id").trim().equals("")){
	Division_id = request.getParameter("Division_id");
}
String Department_id  = "";
if(request.getParameter("Department_id")!=null &&  !request.getParameter("Department_id").trim().equals("")){
	Department_id = request.getParameter("Department_id");
}
String Tender_id  = "";
if(request.getParameter("Tender_id")!=null &&  !request.getParameter("Tender_id").trim().equals("")){
	Tender_id = request.getParameter("Tender_id");
}
%>
<SCRIPT src="ktdv.js"></script>
<p align="center"><span class="mgContentTitle"><a href="TenderAward.jsp">&nbsp;&nbsp;&nbsp;Manage Awarded Tenders&nbsp;&nbsp;&nbsp;</span></p>
<form id="form1" name="AddAwardTender" action="AddTenderAwardAction.jsp" METHOD="POST" ENCTYPE="multipart/form-data" onsubmit="return CheckForm();">
        <table width="90%" border="1" align="center" class="sample">
		<tr>
                <td colspan="2" align="center">
                   <%if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }%>
                </td>
            </tr>
            <tr>
                <td colspan="2"  align="center" class="tr_bgcolor"> Add Awarded Tender </td>
            </tr>
			<tr>
                <td>High Value Tender</td>
                <td><input type="checkbox" name="HVT" value="1" checked/></td>
			</tr>
			<tr>
                <td>Name Of Work Description(in English)</td>
                <td><textarea name="Description_Eng" rows="4" cols="50" id="TenTitleEng" ></textarea></td>
			</tr>
			<tr>
                <td>Name Of Work Description (in Hindi</td>
                <td><textarea name="Description_Hin" rows="4" cols="50" id="TenTitleHin" onkeyup="javascript:changeVal(this)"></textarea></td>
			</tr>
            <tr>
                <td>Awarded To</td>
                <td><input name="Name" type="text" id="Name" size="50"/></td>
            </tr>
            <tr>
                <td> Awarded&nbsp; On</td>
                <td><input name="Awarded_On" type="text" value="" id="Awarded_On" class="textbox" readonly="readonly"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 'Awarded_On'
                                           });
                    </script></td>
			 </tr>
			 <tr>
                <td> Closed On</td>
                <td><input name="Closed_On" type="text" value="" id="Closed_On" class="textbox" readonly="readonly"/><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'form1',
                                                 // input name
                                                 'controlname': 'Closed_On'
                                           });
                    </script></td>
			 </tr>
			 <tr>
                <td > Cost In Lakhs</td>
                <td ><img src="../../images/rupees.jpg">&nbsp;<input name="Cost" value="" type="text" id="TenOpenTime" /> </td>
            </tr>
			<tr>
                <td > Billing Status</td>
                <td ><input name="BillStatus" value="" size="50" type="text" id="TenCloseTime" /> </td>
            </tr>
            <tr>
                <td >Upload File</td>
                <td ><input  value="" type="file" name="upload1" onchange="ChkfileExt(this);"/> </td>
            </tr>
			<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
             <tr>
                <td >
					<input type="hidden" name="Division_id" id="Division_id" value="<%=Division_id%>">
					<input type="hidden" name="Department_id" id="Department_id" value="<%=Department_id%>">          
					<input type="hidden" name="Tender_id" id="Tender_id" value="<%=Tender_id%>"> </td>
                  <td>  <input type="submit" name="btnAdd" value="Save"  id="btnAdd" class="button"/>
                <input id="Button2" class="button" type="reset" value="reset"  /></td>
            </tr>
			<tr></tr>
		</table>
</form>



<%@ include file="../header/footerInner.jsp" %>