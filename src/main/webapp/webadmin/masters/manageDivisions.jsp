<%@ include file="../header/headerInner.jsp" %>
<%

%>
<% 
	String strMSG = "";
	String strGetUserQuery = "";
	if(request.getParameter("id") != null && request.getParameter("action") != null && !request.getParameter("action").equals("")){
		String strType = request.getParameter("action");
		String strUpdateQuery = "";
		if(strType.equals("Active")){
			strUpdateQuery = "UPDATE CMS_DIVISIONS SET CMSD_FLAG=1 WHERE CMSD_ID="+request.getParameter("id")+"";
			dbBean.setQuery(strUpdateQuery);
			dbBean.go1();
			strMSG = "Update Successfully";
		}
		boolean flag = false;
		if(strType.equals("DeActive")){
			Vector rsGetDiv = new Vector();
			strGetUserQuery = "SELECT  DIV_ID FROM CMS_NOTICE_MASTER WHERE DIV_ID = "+request.getParameter("id")+" AND VALID_FROM >= NOW()";
			dbBean.setQuery(strGetUserQuery);
			rsGetDiv = (Vector)dbBean.go();
			 if(rsGetDiv.size()>0){ %>
				<script type="text/javascript">alert("You can't De-Activate because division already in use");</script>
			<%}else{
				strUpdateQuery = "UPDATE CMS_DIVISIONS SET CMSD_FLAG=0 WHERE CMSD_ID="+request.getParameter("id")+"";
				dbBean.setQuery(strUpdateQuery);
				dbBean.go1();
				strMSG = "Update Successfully";
			}
		}
		
	}
%>
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Divisions&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>
<br>
<div align="center">



<form action="manageDivisionAction.jsp" method="post">
<table width=750 align=center border=0 style="border-collapse: collapse" bordercolor="#111111" class="texts1">

<TR>
<TD>
Division Name
</TD>
<TD>
<input type="Text" name="Division" size="60">
</TD>
</TR>
<TR>
<TD>
Division Description
</TD>
<TD>
<input type="Text" name="DivisionDescription" size="60">
</TD>
</TR>
<TR>
<TD colspan="2" align="center">
<input type="submit" name="AddDivision" value="Add Division">
</TD>
</TR>

</table>
</form>
<br><font color="blue"><%=strMSG%></font><br>
<table width="750" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1" cellpadding="3">
<tr class="tr_bgcolor">
	<td align="center"><b>S. No.</b></td>
	<td align="center"><b>Division Name</b></td>
	<td align="center"><b>Division Description</b></td>
	<td align="center"><b>Edit</b></td>
	<td align="center"><b>Status</b></td>
</tr>
<%

Vector getright = new Vector();
String query_right;
query_right = "SELECT * FROM CMS_DIVISIONS ORDER BY CMSD_DIVISIONS ";
dbBean.setQuery(query_right);
getright=(Vector)dbBean.go();
//out.println(query_right);
	if (getright.size()!=0){
		for (int i=0;i<getright.size();i++){%>
			<tr>
			<td align="center"><%=i+1%></td>
				<td>
					<%=dbBean.getcell(getright,1,i)%>
				</td>
				<td>
					<%=dbBean.getcell(getright,2,i)%>
				</td>
				<td>
					<a href="editDivision.jsp?editId=<%=dbBean.getcell(getright,0,i)%>"><font color="#0000FF">Edit</font></a>
				</td>
				<%if(dbBean.getcell(getright,5,i).equals("0")){%>
					<td align="center">
						<a href="manageDivisions.jsp?id=<%=dbBean.getcell(getright,0,i)%>&action=Active">
						<font color="#0000FF">Activate</font>
						</a>
					</td>
				<%}else{%>
					<td align=center>
						<a href="manageDivisions.jsp?id=<%=dbBean.getcell(getright,0,i)%>&action=DeActive">
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