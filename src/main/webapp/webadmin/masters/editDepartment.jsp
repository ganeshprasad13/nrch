<%@ include file="../header/headerInner.jsp" %>
<% 
	String strMSG = "",strQuery="",strDivision="",strDept="",strDesc="",strID=request.getParameter("editId");
	String rsGetDept[][] =null;
	if(strID!=null){
		strQuery = "SELECT * FROM CMS_DEPARTMENTS WHERE CMSDEPT_ID ="+strID;
		dbBean.setQuery(strQuery);
		rsGetDept = dbBean.getResultSet();
		if(rsGetDept.length>0){
			strDept = rsGetDept[0][2];
			strDivision = rsGetDept[0][1];
			strDesc = rsGetDept[0][3]==null?"":rsGetDept[0][3];
		}
	}
	
%>
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Departments&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>
<br>
<div align="center">

<form action="editDepartmentAction.jsp" method="post">
<table width="70%" align=center class="sample">

<tr>
<td>
Division Name
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
<option value="<%=dbBean.getcell(getright2,0,i)%>" <%if(dbBean.getcell(getright2,0,i).equals(strDivision)){%> selected<%}%>><%=dbBean.getcell(getright2,1,i)%></option>
		<%}}%>
</select>
</td>
</tr>

<tr>
<td>
Department Name
</td>
<td>
<input type="Text" name="Department" size="60" value="<%=strDept%>">
</td>
</tr>
<tr>
<td>
Department Description
</td>
<td>
<input type="Text" name="DepartmentDescription" size="60" value="<%=strDesc%>">
</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="hidden" name="editId" value="<%=strID%>">
<input type="submit" name="edit" value="Edit Department">
</td>
</tr>

</table>
</form>
<br><font color="blue"><%=strMSG%></font><br>
<table width="750" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1" cellpadding="3">
<tr class="tr_bgcolor">
	<td align="center"><b>S. No.</b></td>
	<td align="center"><b>Department Name</b></td><td align="center"><b>Division Name</b></td>
	<td align="center"><b>Description</b></td>
	<td align="center"><b>Edit</b></td>
	<td align="center"><b>Status</b></td>
</tr>
<%

Vector getright = new Vector();
String query_right;
query_right = "SELECT CMS_DEPARTMENTS.CMSDEPT_NAME, CMS_DEPARTMENTS.CMSDEPT_DESC, CMS_DIVISIONS.CMSD_DIVISIONS,CMS_DEPARTMENTS.CMSDEPT_ID,CMS_DEPARTMENTS.CMSDEPT_FLAG FROM CMS_DEPARTMENTS INNER JOIN CMS_DIVISIONS ON CMS_DEPARTMENTS.CMSDEPT_CMSD_ID = CMS_DIVISIONS.CMSD_ID";
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
					<a href="editDepartment.jsp?editId=<%=dbBean.getcell(getright,3,i)%>"><font color="#0000FF">Edit</font></a>
				</td>
				<%if(dbBean.getcell(getright,4,i).equals("0")){%>
					<td align="center">
						<a href="manageDepartments.jsp?id=<%=dbBean.getcell(getright,3,i)%>&action=Active">
						<font color="#0000FF">Activate</font>
						</a>
					</td>
				<%}else{%>
					<td align=center>
						<a href="manageDepartments.jsp?id=<%=dbBean.getcell(getright,3,i)%>&action=DeActive">
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