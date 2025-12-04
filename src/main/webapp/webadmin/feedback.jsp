<script type="text/javascript" src="js/commonCheck.js"></script>
<script>
function chkForm(){
if(document.interaction.name.value == ""){
	alert ("Please provide us your name");
	document.interaction.name.focus();
	return false;
	}

var field = document.interaction.email; 
var str = document.interaction.email.value; 

var reg1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; 
var reg2 = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/; 

if ((!reg1.test(str)) && reg2.test(str)) { 			
}else{
	alert("\"" + str + "\" is not valid E-mail Id,Please provide your valid E-mail Id"); 
	document.interaction.email.focus();
	document.interaction.email.select();
	return false;
}

if(document.interaction.contactNo.value.replace(/^\s+|\s+$/g, '')=="")
    {
        alert("Please Fill Mobile No..");
        return false; 
    }
	if(isNaN(document.interaction.contactNo.value))
    {
        alert("Please Fill only numeric value");
        return false; 
    }
	if(document.interaction.contactNo.value.length != 10)
    {
        alert("Please Fill 10 Digit Mobile No..");
        return false; 
    }



if(document.interaction.dept.value == 0){
	alert ("Please select a department to send your feedback/ query to.");
	document.interaction.dept.focus();
	return false;
	}
	if(document.interaction.comments.value == ""){
	alert ("Please enter your comments");
	document.interaction.comments.focus();
	return false;
	}
}
</script>
<%
String strDeptID = dbBean.getcell(getinfo,0,0);
Vector getFeedbackSections = new Vector();
String query_feedback;
query_feedback = "SELECT DRD_ID, DRD_DEPT_NAME, DRD_DEPT_EMAIL FROM CMS_RESPONSE_DEPT WHERE DRD_ACTIVE_STATUS=1 order by DRD_DEPT_NAME";
dbBean.setQuery(query_feedback);
getFeedbackSections=(Vector)dbBean.go();
%>
<table width="90%" align="center" style="border-collapse: collapse" border="1" brodercolor="EFEFEF">
<form name="interaction" action="feedback_action.jsp" method="post" onsubmit="return chkForm();">
<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
<input type="hidden" name="sid" value="<%=dbBean.getcell(getinfo,0,0)%>">
<input type="hidden" name="lang" value="<%=lang%>">
<input type="hidden" name="info" value="0">
<%if (request.getParameter("msg")!=null){%>
<tr>
	<td height="25" align="center" class="texth" colspan="2">
	<b>Your feedback/ response had been submitted. We will be responding back to you soon. Thank you for your valuable feedback.</b>
	</td>
</tr>
<%}%>
<tr>
	<td height="25" align="center" class="textn" colspan="2" bgcolor="EFEFEF">
	<b>Please fill out the following information</b>
	</td>
</tr>
<tr>
	<td width="40%" class="textn">
	Your Name
	</td>
	<td width="60%">
	<input type="text" name="name" class="textbox" size="28" onkeyup="checkInputString(this,100);" onblur="checkInputString(this,100);">
	</td>
</tr>
<tr>
	<td width="40%" class="textn">
	<font color="red"><b>*</b></font>Your E-mail
	</td>
	<td width="60%">
	<input type="text" name="email" class="textbox" size="28" onkeyup="checkInputString(this,200);" onblur="checkInputString(this,100);">
	</td>
</tr>
<tr>
	<td width="40%" class="textn">
	<font color="red"><b>*</b></font>Contact No./Mobile No.</td>
	<td width="60%">
	+91-<input type="text" name="contactNo" class="textbox" size="28" onkeyup="checkInputString(this,20);" onblur="checkInputString(this,100);">
	</td>
</tr>
<tr>
	<td width="40%" class="textn">
	Select type of comment
	</td>
	<td width="60%">
	<select name="dept" id="dept">
	<option value="0">Please select type of comments</option>
	<%for (int i=0;i<getFeedbackSections.size();i++) {%>
	<option value="<%=dbBean.getcell(getFeedbackSections,0,i)%>"><%=dbBean.getcell(getFeedbackSections,1,i)%></option>
	<%}%>
</select>
	</td>
</tr>
<tr>
	<td width="40%" class="textn">
	Comments
	</td>
	<td width="60%">
	<textarea class="textbox" name="comments" rows="5" cols="30" onkeyup="checkInputString(this,1000);" onblur="checkInputString(this,100);"></textarea>
	</td>
</tr>
<tr>
									<td valign="top" colspan="2">
									<p align="left">
									<%	/*String strMSG="testing";
									if(!strMSG.equals(""))
									{
										out.print("<div><font color='#FF0000' size='+1'><strong>"+strMSG+"</strong></font><br><br></div>");
									}
									*/%>
									&nbsp;&nbsp;&nbsp;<strong>Please enter the string shown in the image:</strong></td></tr>
									<tr>
									<td align="center" nowrap colspan="2">
									&nbsp;&nbsp;&nbsp;<img src="Cap_Img.jsp" width="100px">
									&nbsp;&nbsp;<input type="text" name="txtShownImg" id="txtShownImg" size="10" maxlength="20" onkeyup="checkInputString(this,100);" onblur="checkInputString(this,100);">
									</td>
								</tr>
								

<tr>
	<td align="center" colspan="2">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Submit" class="textbox">
	<input type="reset" class="textbox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<font color="red"><b>*&nbsp; Mandatory Fields</b></font></td>
</tr>
</form>
</table>

<br><br>