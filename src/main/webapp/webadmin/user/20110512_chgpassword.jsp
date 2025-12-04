<%@ include file="../header/headerInner.jsp" %>

<script>
function chkForm(){
	if(document.chgPassword.ppwd.value==""){
	alert("Please specify current password");
	document.chgPassword.ppwd.focus();
	return false;
	}
	if(document.chgPassword.npwd.value!=document.chgPassword.cpwd.value){
	alert("New password and confirm password must be same");
	document.chgPassword.cpwd.focus();
	return false;
	}
}
</script>

<form name="chgPassword" action="chgpassword_action.jsp" method="post" onsubmit="return chkForm()">
<br>
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2">
	<b>Change Administrator Password</b>
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Present Password
	</td>
	<td width="50%">
	<input type="password" class="textbox" name="ppwd">
	</td>
</tr>
<tr>
	<td align="right" width="50%">New Password</td>
	<td width="50%">
	<input type="password" class="textbox" name="npwd">
	</td>
</tr>
<tr>
	<td align="right" width="50%">Confirm Password</td>
	<td width="50%">
	<input type="password" class="textbox" name="cpwd">
	</td>
</tr>
<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Change Password"></td>
</tr>
</form> 
</table>

<br>

<br><br>
<%@ include file="../header/footerInner.jsp" %>