<body leftmargin=0 topmargin=0>
<link rel=stylesheet type="text/css" href="../css/styles0.css">
<link rel="stylesheet" type="text/css" href="../css/admin.css" />
<script type="text/javascript" src="../js/commonCheck.js"></script>
<br><br>
<script type="text/javascript">
function hideAns()
{
	if (document.login.question.value == "7"){
		document.login.answer.value="";
		document.login.answer.disabled = true;
	}
	else {
		document.login.answer.disabled = false; 
	}
//alert(document.login.question.value);
//document.getElementById("demo").innerHTML=Date();
}
</script>

<form name="login" action="passwordRecoveryAction.jsp" method="post">

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/admin.css" />
</head>

<body>
	<table width="980" border="0" align="center" height="80%" valign="top" class="table_border" style="margin-top:-45px;">
		<tr>
			<td valign="top" >
				<img src="images/left_top_img.jpg">
			</td>
		</tr>
		<tr>
			<td valign="top" style="background-color:#DCDCDE;font-family:arial;font-size:12px;font-weight:bold;text-align:center;vertical-align:middle">
				Username or Password Recovery
			</td>
		</tr>
		<tr>
			<td>
				<table>
					<tr>
						<td style="border-right:1px dotted gray;"><img src="images/left_img.png"></td>
						<td style="padding-left:20px;">
							
							<table cellpadding="3" border="0"  class="admin_bg" height="230" width="325">
								<tr><td></td></tr>
								<tr>
									<td colspan="2" height="20"><p><b>&nbsp;&nbsp;&nbsp;Enter Following Information:</b></p></td>
								</tr>
								<tr>
									<td height="20">&nbsp;&nbsp;&nbsp;User ID:</td><td><input type="text" name="userid" size="23" onkeyup="checkInputString(this,100);" onblur="checkInputString(this,100);"></td>
								</tr>
								<tr>
									<td height="20">&nbsp;&nbsp;&nbsp;E-mail:</td><td><input type="text" name="email" size="23" onkeyup="checkInputString(this,100);" onblur="checkInputString(this,100);"></td>
								</tr>
								<tr>
									<td height="20">&nbsp;&nbsp;&nbsp;Secret Question</td>
									<td>
										<select id="question" name="question" onchange="hideAns();">
											<option value="" SELECTED >- Select One -</option>
											<option value="1">Your father name ?</option>                   
											<option value="2">Your mother name ?</option>                   
											<option value="3">your school name ?</option>                   
											<option value="4">your friend name ?</option>                   
											<option value="5">your pet name ?</option>                   
											<option value="6">your favorite place ?</option>
											<option value="7">Other</option> 
										</select>
									</td>
								</tr>
								<tr>
									<td height="20">&nbsp;&nbsp;&nbsp;Answer:</td><td><input type="text" name="answer" size="23" onkeyup="checkInputString(this,100);" onblur="checkInputString(this,100);"></td>
								</tr>
								<!--
								<tr>
									<td height="20">&nbsp;&nbsp;&nbsp;Select Division:</td><td><select><option>--Select Division--</option>
									</select></td>
								</tr>
								-->
								<tr>
									<td></td><td style="padding-right:0px;text-decoration:none;"><input type="submit" value="submit" class="textbox"  border=0></a></td>
								</tr>
							</table>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp" style="color:#2B63CE;">Sign In</a>
							<br>
							<div align=center><font face=arial size=2 color=red><% if (request.getParameter("msg")!=null){%>
								<%=request.getParameter("msg")%>
								<%}%></font>
							</div>
							
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		<tr>
			<td style="color:#004488;font-family:tahoma;font-size:11px;text-align:center;border-top:1px solid gray;"><br>
				&copy; 2010. All rights reserved.<br><br>

This is the Portal of Indian Railways, developed with an objective to enable a single window access to information and services being provided by the various Indian Railways entities. The content in this Portal is the result of a collaborative effort of various Indian Railways Entities and Departments Maintained by CRIS, Ministry of Railways, Government of India. 			</td>
		</tr>
		
	</table>

</body>

</html>

</form>



