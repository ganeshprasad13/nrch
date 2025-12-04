<%int intPageNo =4;%>
<%@ include file="../header/headerInner.jsp" %>
<%

if(strDBAacc!=null){
	if(!strDBAacc.equals("100"))  {
		response.sendRedirect("http://"+request.getServerName()+"/works/webadmin/home.jsp"); 
}
}
%>

<%
String strGetUserQuery = "select DAU_ID, DAU_LOGIN, DAU_NAME from CMS_ADMIN_USER where DAU_STATUS=1";
Vector rsGetUser = new Vector();
dbBean.setQuery(strGetUserQuery);
rsGetUser = (Vector)dbBean.go();
%>
<form name="assignUserRights" action="assignUserRights_select.jsp" method="post">
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage User Rights&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>
<br>
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1">
<tr class="tr_bgcolor">
	<td align=center height=23 colspan="2">
	<b>Assign User Rights</b>
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Select a user :
	</td>
	<td width="50%">
	<select name="userId" id="userId">
	<% for (int i=0; i<rsGetUser.size();i++) { %>
	<option value="<%=dbBean.getcell(rsGetUser,0,i)%>"><%=dbBean.getcell(rsGetUser,1,i)%> - (<%=dbBean.getcell(rsGetUser,2,i)%>) </option>
	<% } %>
	</select>
	</td>
</tr>


<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Select User"></td>
</tr>
</form> 
</table>
<br><br><br>
<%@ include file="../header/footerInner.jsp" %>