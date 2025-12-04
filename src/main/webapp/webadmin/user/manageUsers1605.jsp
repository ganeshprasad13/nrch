<%@ include file="../header/headerInner.jsp" %>
<%
if(!strDBAacc.equals("100")){
response.sendRedirect("http://"+request.getServerName()+"/works/webadmin/home.jsp"); 
}
%>
<script>
function chkForm(){
	/*if(document.addUser.npwd.value!=document.addUser.cpwd.value){
	alert("Password and confirm password must be same");
	document.addUser.cpwd.focus();
	return false;
	}*/
	if(document.addUser.Department_id.value == 0){
		alert("Select Division/Department Name");
		return false;
	}
}

</script>
<script language="JavaScript1.2">
	
function ajaxfunction()
{
	var str=document.getElementById("username").value;
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
			//document.getElementById("test1").innerHTML=xmlhttp.responseText;
			document.getElementById("test").innerHTML=xmlhttp.responseText;
			document.getElementById("test1").innerHTML=xmlhttp.responseText;
			//alert(xmlhttp.responseText);
		}
	}
	
	var url="Check.jsp?id="+str;
	xmlhttp.open("GET",url,true);
	
	xmlhttp.send(null);
}
</script>

<%
String strDepartment = "";
	strDepartment = "SELECT CMS_DEPARTMENTS.CMSDEPT_ID,CONCAT(CMS_DIVISIONS.CMSD_DIVISIONS,'-(',CMS_DEPARTMENTS.CMSDEPT_NAME,')') FROM CMS_DIVISIONS INNER JOIN CMS_DEPARTMENTS  ON (CMS_DIVISIONS.CMSD_ID = CMS_DEPARTMENTS.CMSDEPT_CMSD_ID) WHERE CMS_DIVISIONS.CMSD_FLAG=1 AND CMS_DEPARTMENTS.CMSDEPT_FLAG=1";
	dbBean.setQuery(strDepartment);
	String rsGetDepartment[][] = dbBean.getResultSet();
%>
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;User Management&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>
<font color="blue"><b><%if(request.getParameter("strMSG") != null && !request.getParameter("strMSG").equals("")){out.print(request.getParameter("strMSG"));}%></b></font>
<br>
<form name="addUser" id="addUser" action="addUser_action.jsp" method="post" onsubmit="return chkForm()">
<br>
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1">
<tr class="tr_bgcolor">
	<td align=center height=23 colspan="2">
	<b>Add new user</b>
	</td>
</tr>

             <tr>
                <td align="right" width="50%">Division/Department</td>
                <td><select name="Department_id" multiple size="6">
						<%if(rsGetDepartment.length>0){%>
						<option value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--Select Department--</option>
						<%for(int k=0;k<rsGetDepartment.length;k++){%>
							<option value="<%=rsGetDepartment[k][0]%>" ><%=rsGetDepartment[k][1]%></option>
						<%	}
						}%>
					</select><br>
					<span style="color:red;">Note : *Use Ctrl+ to select multiple option</span>
					</td>
		
		</tr>
<!--
		<tr>
	<td align="right" width="50%">Login Username</td>
	<td width="50%"><input type="text" class="textbox" name="username" id="username" onkeyup="ajaxfunction();">
	<font color="red"><span id="test"></span></font>
	</td>
</tr>
<!--
<tr>
	<td align="right" width="50%">Password</td>
	<td width="50%"><input type="password" class="textbox" name="npwd"></td>
</tr>
<tr>
	<td align="right" width="50%">Confirm Password</td>
	<td width="50%"><input type="password" class="textbox" name="cpwd"></td>
</tr>

<tr>
	<td align="right" width="50%">Display Name</td>
	<td width="50%"><input type="text" class="textbox" name="name"></td>
</tr>

<tr>
	<td align="right" width="50%">Email-id</td>
	<td width="50%"><input type="text" class="textbox" name="email"></td>
</tr>
<tr>
	<td align="center" align="center" colspan="2"><input type="submit" name="save" class="textbox" value="Add User"></td>
</tr>
<tr>
	<td colspan="2" style="color:#800000;"><b>Note :</b> Password will be generated automatically by the System and will be mailed directly to the User.</td>
</tr> -->
</form> 
</table>
<br>
<br><br>
<table width="750" align="center" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1" cellpadding="3">
<tr class="tr_bgcolor">
	<td align="center"><b>S.No.</b></td>
	<td align="center"><b>Login Username</b></td>
	<td align="center"><b>Email-id</b></td>
	<td align="center"><b>User Type</b></td>
	<td align="center"><b>Status</b></td>
	<td align="center"><b>Mode</b></td>
</tr>
<%

Vector getright = new Vector();
String query_right;
query_right = "SELECT DAU_NAME,DAU_EMAIL,DAU_ACCESS_LEVEL,DAU_STATUS,DAU_ID FROM CMS_ADMIN_USER";
dbBean.setQuery(query_right);
getright=(Vector)dbBean.go();
//out.println(query_right);
	if (getright.size()!=0){
		for (int i=0;i<getright.size();i++){%>
			<tr>
			<td align="center"><%=i+1%></td>
				<td><%=dbBean.getcell(getright,0,i)%>
				</td><td align="center"><%=dbBean.getcell(getright,1,i)%></td>
				<td><%if(dbBean.getcell(getright,2,i).equals("100")){%>Adminstrator<%}else{%>User<%}%></td>
				<td align=center><%if(dbBean.getcell(getright,3,i).equals("1")){%>Active<%}else{%>Deleted<%}%></td>
				<td align="center"><a href="editUser.jsp?userId=<%=dbBean.getcell(getright,4,i)%>">
					<font color="black"><u>Edit</u></font></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="deleteUser.jsp?userId=<%=dbBean.getcell(getright,4,i)%>&action=del" onclick="return confirm('Are you sure you want to delete?')">
					<font color="black"><u>Delete</u></font></a>
				</td>
			</tr>
<% 		}			//	end of For loop
	}else{
%>
<tr>
	<td colspan="6" align="center">
	No record(s) found
	</td>
</tr>
<% } 			//	end of IF Condition%>
</table>
<br><br>
</div>
<%@ include file="../header/footer.jsp" %>