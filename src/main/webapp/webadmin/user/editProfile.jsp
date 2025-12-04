<%int intPageNo =4;%>
<%@ include file="../header/headerInner.jsp" %>

<%
String DBAUserId = "";
if(session.getAttribute("DBAUserId") != null){
	DBAUserId = (String)session.getAttribute("DBAUserId");
}
String strGetUserQuery = "select DAU_ID, DAU_LOGIN, DAU_NAME,DAU_EMAIL,SECRET_QUESTION,ANSWER from CMS_ADMIN_USER WHERE DAU_ID = "+DBAUserId+"";
Vector rsGetUser = new Vector();
dbBean.setQuery(strGetUserQuery);
rsGetUser = (Vector)dbBean.go();
String question = "";
if(dbBean.getcell(rsGetUser,4,0) != null && !dbBean.getcell(rsGetUser,4,0).equals("")){
	question = dbBean.getcell(rsGetUser,4,0);
}
%>

<p align="center"><span class="mgContentTitle">Manage Users &raquo; Edit Profile </span><br><br></p>
<form name="editUser" action="editProfileAction.jsp" method="post" onsubmit="return chkForm()">

<table width=750 align=center border=1 cellpadding="3" cellspacing="3" style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2">
	<b>Edit Profile</b>
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Login Username:
	</td>
	<td width="50%">
		<input type="text" class="textbox" name="userName" value="<%=dbBean.getcell(rsGetUser,1,0)%>" disabled="disabled">
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Email
	</td>
	<td width="50%">
	<input type="text" class="textbox" name="email" value="<%=dbBean.getcell(rsGetUser,3,0)%>" >
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Display Name
	</td>
	<td width="50%">
	<input type="text" class="textbox" name="name" value="<%=dbBean.getcell(rsGetUser,2,0)%>">
	</td>
</tr>
<tr>
	<td align="center"  colspan="2">In case you forget your Username or password...</td>
</tr>
<tr>
	<td align="right" width="50%">
	Secret Question
	</td>
	<td width="50%">
		<select id="question" name="question">
            <option value="" SELECTED >- Select One -</option>
            <option value="1" <%if(question.equals("1")){%>selected<%}%>>Your father name ?</option>                   
            <option value="2" <%if(question.equals("2")){%>selected<%}%>>Your mother name ?</option>                   
            <option value="3" <%if(question.equals("3")){%>selected<%}%>>Your school name ?</option>                   
            <option value="4" <%if(question.equals("4")){%>selected<%}%>>Your friend name ?</option>                   
            <option value="5" <%if(question.equals("5")){%>selected<%}%>>Your pet name ?</option>                   
            <option value="6" <%if(question.equals("6")){%>selected<%}%>>Your favorite place ?</option>  
        </select>
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Your Answer
	</td>
	<td width="50%">
	<input type="text" class="textbox" name="answer" value="<%if(dbBean.getcell(rsGetUser,5,0) != null){out.print(dbBean.getcell(rsGetUser,5,0));}%>">
	</td>
</tr>
<tr>
	<td align="center" align="center" colspan="2">
	<input type="SUBMIT" name="SUBMIT" class="textbox" value="Update Profile"></td>
</tr>
</form> 
</table>

<br>

<br><br>
<%@ include file="../header/footerInner.jsp" %>
