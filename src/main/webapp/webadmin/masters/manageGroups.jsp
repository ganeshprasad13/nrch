<%@ include file="../header/headerInner.jsp" %>
<% 
	String strMSG = "";
	String strGetUserQuery = "";
	if(request.getParameter("id") != null && request.getParameter("action") != null && !request.getParameter("action").equals("")){
		String strType = request.getParameter("action");
		String strUpdateQuery = "";
		if(strType.equals("Active")){
			strUpdateQuery = "UPDATE CMS_GROUPS SET CMSDEPT_FLAG=1 WHERE CMSDEPT_ID="+request.getParameter("id")+"";
			dbBean.setQuery(strUpdateQuery);
			dbBean.go1();
			strMSG = "Update Successfully";
		}
		if(strType.equals("DeActive")){
			Vector rsGetDiv = new Vector();
			strGetUserQuery = "SELECT  DEPT_ID FROM CMS_NOTICE_MASTER WHERE DEPT_ID = "+request.getParameter("id")+" AND VALID_FROM >= NOW()";
			dbBean.setQuery(strGetUserQuery);
			rsGetDiv = (Vector)dbBean.go();
			 if(rsGetDiv.size()>0){ %>
				<script type="text/javascript">alert("You can't De-Activate because department already in use");</script>
			<%}else{
				strUpdateQuery = "UPDATE CMS_GROUPS SET CMSDEPT_FLAG=0 WHERE CMSDEPT_ID="+request.getParameter("id")+"";
				dbBean.setQuery(strUpdateQuery);
				dbBean.go1();
			}	strMSG = "Update Successfully";
		}
		
	}
%>
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Groups&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>
<br>
<div align="center">

<form action="manageGroupAction.jsp" method="post">
<table width="70%" align=center class="sample">

<tr>
<td>
Project Name
</td>
<td>
<select name="DivisionId">
<%

Vector getright2 = new Vector();
String query_right2;
query_right2 = "SELECT * FROM CMS_DIVISIONS WHERE CMSD_FLAG = 1 ORDER BY CMSD_DIVISIONS ";
dbBean.setQuery(query_right2);
getright2=(Vector)dbBean.go();
//out.println(query_right);
	if (getright2.size()!=0){
		for (int i=0;i<getright2.size();i++){%>
<option value="<%=dbBean.getcell(getright2,0,i)%>"><%=dbBean.getcell(getright2,1,i)%></option>
		<%}}%>
</select>
</td>
</tr>

<tr>
<td>
Group Name
</td>
<td>
<input type="Text" name="Department" size="60">
</td>
</tr>
<tr>
<td>
Group Description
</td>
<td>
<input type="Text" name="DepartmentDescription" size="60">
</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" name="AddDivision" value="Add Group">
</td>
</tr>

</table>
</form>
<br><font color="blue"><%=strMSG%></font><br>
<table width="750" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1" cellpadding="3">
<tr class="tr_bgcolor">
	<td align="center"><b>S. No.</b></td>
	<td align="center"><b>Group Name</b></td><td align="center"><b>Project Name</b></td>
	<td align="center"><b>Description</b></td>
	<td align="center"><b>Edit</b></td>
	<td align="center"><b>Status</b></td>
</tr>
<%

Vector getright = new Vector();
String query_right;
query_right = "SELECT CMS_GROUPS.CMSDEPT_NAME, CMS_GROUPS.CMSDEPT_DESC, CMS_DIVISIONS.CMSD_DIVISIONS,CMS_GROUPS.CMSDEPT_ID,CMS_GROUPS.CMSDEPT_FLAG FROM CMS_GROUPS INNER JOIN CMS_DIVISIONS ON CMS_GROUPS.CMSDEPT_CMSD_ID = CMS_DIVISIONS.CMSD_ID";
dbBean.setQuery(query_right);
getright=(Vector)dbBean.go();
//out.println(query_right);
	if (getright.size()!=0){
		for (int i=0;i<getright.size();i++){%>
			<tr>
			<td align="center"><%=i+1%></td>
				<td>
<%=dbBean.getcell(getright,0,i)%>
				</td><td align="center"><%=dbBean.getcell(getright,2,i)%></td>
				<td>
<%=dbBean.getcell(getright,1,i)%>
				</td>
				<td align="center">
					<a href="editGroup.jsp?editId=<%=dbBean.getcell(getright,3,i)%>"><font color="#0000FF">Edit</font></a>
				</td>
				<%if(dbBean.getcell(getright,4,i).equals("0")){%>
					<td align="center">
						<a href="manageGroups.jsp?id=<%=dbBean.getcell(getright,3,i)%>&action=Active">
						<font color="#0000FF">Activate</font>
						</a>
					</td>
				<%}else{%>
					<td align=center>
						<a href="manageGroups.jsp?id=<%=dbBean.getcell(getright,3,i)%>&action=DeActive">
						<font color="#0000FF">De-Activate</font></a>
					</td>
				<%}%>
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