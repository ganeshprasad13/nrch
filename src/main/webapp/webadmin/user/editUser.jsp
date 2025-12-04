<%int intPageNo =4;%>
<%@ include file="../header/headerInner.jsp" %>
<%
if(!strDBAacc.equals("100")){
response.sendRedirect("http://"+request.getServerName()+"/works/webadmin/home.jsp"); 
}
%>
<%
String DBAUserId = "";
if(session.getAttribute("DBAUserId") != null){
	DBAUserId = (String)session.getAttribute("DBAUserId");
}
String strGetUserQuery = "select DAU_ID, DAU_LOGIN, DAU_NAME from CMS_ADMIN_USER";
Vector rsGetUser = new Vector();
dbBean.setQuery(strGetUserQuery);
rsGetUser = (Vector)dbBean.go();

String strDepartment = "";
	strDepartment = "SELECT CMS_DEPARTMENTS.CMSDEPT_ID,CONCAT(CMS_DIVISIONS.CMSD_DIVISIONS,'-(',CMS_DEPARTMENTS.CMSDEPT_NAME,')') FROM CMS_DIVISIONS INNER JOIN CMS_DEPARTMENTS  ON (CMS_DIVISIONS.CMSD_ID = CMS_DEPARTMENTS.CMSDEPT_CMSD_ID)";
	dbBean.setQuery(strDepartment);
String rsGetDepartment[][] = dbBean.getResultSet();
String strUserDept = "";
String strUserId = request.getParameter("userId");
String strName = request.getParameter("name");
String strEmail = request.getParameter("email");
String strStatus = request.getParameter("status");

if (strUserId != null) {
	String strGetUserInfo = "select * from CMS_ADMIN_USER where DAU_ID = " + strUserId;
	Vector rsGetUserInfo = new Vector();
	dbBean.setQuery(strGetUserInfo);
	rsGetUserInfo = (Vector)dbBean.go();
	
		if(rsGetUserInfo.size()==1) {
			strUserId = dbBean.getcell(rsGetUserInfo,0,0);
			strName = dbBean.getcell(rsGetUserInfo,3,0);
			strEmail = dbBean.getcell(rsGetUserInfo,4,0);
			strStatus = dbBean.getcell(rsGetUserInfo,10,0);
			strUserDept = dbBean.getcell(rsGetUserInfo,11,0);
		} else {
			strUserId = "0";
			strName = "Error!";
			strEmail = "Error!";
			strStatus = "1";
		}
} else {
	strUserId = "0";
	strName = "";
	strEmail = "";
	strStatus = "1";
}
StringBuffer strBuf = new StringBuffer();
int tokenCount = 0;
if(!strUserDept.equals("")){
	StringTokenizer st = new StringTokenizer(strUserDept, ",");
	while(st.hasMoreTokens()){
		strBuf.insert(tokenCount,st.nextToken());
		tokenCount++;
	}
}
%>
<%!
 public boolean check(String id,StringBuffer strBuf){
 		boolean status = false;
		for(int intCount =0;intCount<strBuf.length();intCount++){
			if(strBuf.indexOf(id) != -1){
				status = true;
			}
		}
	return status;
 }
%>
<script language="JavaScript">
function fillData() {
	document.editUser.action = "editUser.jsp";
	document.editUser.submit();
}
</script>
<%if(strUserId.equals(DBAUserId)){%>
<script>
function chkForm(){
	if(document.editUser.npwd.value!=document.editUser.cpwd.value){
	alert("New password and confirm password must be same or leave both fields blank if you dont want to change the current password.");
	document.editUser.cpwd.focus();
	return false;
	}
	if(document.editUser.Department_id.value == 0){
		alert("Select Division/Department Name");
		document.editUser.Department_id.focus();
		return false;
	}
}
</script>
<%}%>
<p align="center"><span class="mgContentTitle">Manage Users &raquo; Edit User </span><br><br></p>
<form name="editUser" action="editUser_action.jsp" method="post" onsubmit="return chkForm()">

<table width=750 align=center border=1 cellpadding="3" cellspacing="3" style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2">
	<b>Edit User</b>
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Login Username:
	</td>
	<td width="50%">
	<select name="userId" id="userId" onChange="fillData()">
	<% for (int i=0; i<rsGetUser.size();i++) { %>
	<option value="<%=dbBean.getcell(rsGetUser,0,i)%>"<% if (strUserId.equals(dbBean.getcell(rsGetUser,0,i))) {%> selected<%}%>><%=dbBean.getcell(rsGetUser,1,i)%> - (<%=dbBean.getcell(rsGetUser,2,i)%>) </option>
	<% } %>
	</select>
	</td>
</tr>
<tr>
                <td align="right" width="50%">Division/Department</td>
                <td><select name="Department_id" multiple size="6">
						<%if(rsGetDepartment.length>0){%>
						<option value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--Select Department--</option>
						<%for(int k=0;k<rsGetDepartment.length;k++){
						%>
							<option value="<%=rsGetDepartment[k][0]%>" <%if(check(rsGetDepartment[k][0],strBuf)){%>selected<%}%>><%=rsGetDepartment[k][1]%></option>
						<% }
						}%>
						<option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Department</option>
						
					</select><br>
					<span style="color:red;">*Use Ctrl+ to select multiple values </span>
					</td>
			 </tr>
<%if(strUserId.equals(DBAUserId)){%>
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
<%}%>
<tr>
	<td align="right" width="50%">
	Display Name
	</td>
	<td width="50%">
	<input type="text" class="textbox" name="name" value="<%=strName%>">
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Email
	</td>
	<td width="50%">
	<input type="text" class="textbox" name="email" value="<%=strEmail%>">
	</td>
</tr>
<tr>
	<td width="100%" colspan="2" align="center">
	<input type="radio" name="status" value="1"<% if(strStatus.equals("1")) {%> checked<%}%>>Active&nbsp;&nbsp;<input type="radio" name="status" value="0"<% if(strStatus.equals("0")) {%> checked<%}%>>Inactive
	</td>
	
</tr>
<tr>
	<td align="center" align="center" colspan="2">
	<input type="SUBMIT" name="SUBMIT" class="textbox" value="Update User"></td>
</tr>
</form> 
</table>

<br>

<br><br>
<%@ include file="../header/footerInner.jsp" %>
