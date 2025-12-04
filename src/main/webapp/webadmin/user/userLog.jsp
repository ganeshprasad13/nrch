<%int intPageNo =4;%>
<%@ include file="../header/headerInner.jsp" %>
<%
String strGetUserQuery = "select DAU_ID, DAU_LOGIN, DAU_NAME from CMS_ADMIN_USER";
Vector rsGetUser = new Vector();
dbBean.setQuery(strGetUserQuery);
rsGetUser = (Vector)dbBean.go();
String strUserId = "";
if(request.getParameter("userId") != null ){
strUserId = request.getParameter("userId");
}
%>
<script type="text/javascript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<link rel="stylesheet" href="../css/thickbox.css" type="text/css" media="screen" />
<script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../css/thickbox.js"></script>
<p align="center"><span align="center" class="mgContentTitle"><a href="../reports/report.jsp">Reports</a>&nbsp;&nbsp;&raquo;&nbsp;&nbsp;User Log</span></p>
<br>
<form name="userLog" action="userLog.jsp" method="post" >
	<table width="50%" border="1" align="center" class="sample">
		<tr class="tr_bgcolor">
                <td colspan="5" align="center">
                    <b>See User Log</b>

                </td>
            </tr>
		<tr>
			<td>UserName</td>
			<td> 
				<select name="userId" id="userId" onChange="fillData()">
						<option value="0">--select--</option>
						<% for (int i=0; i<rsGetUser.size();i++) { %>
						<option value="<%=dbBean.getcell(rsGetUser,1,i)%>"<% if (strUserId.equals(dbBean.getcell(rsGetUser,1,i))) {%> selected<%}%>><%=dbBean.getcell(rsGetUser,1,i)%> - (<%=dbBean.getcell(rsGetUser,2,i)%>) </option>
						<% } %>
				</select>
			</td>
			<td>Date </td>
			<td> <input type="text" name="byDate" id="byDate" value="<%if(request.getParameter("byDate") != null){out.print(request.getParameter("byDate"));}%>"><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'userLog',
                                                 // input name
                                                 'controlname': 'byDate'
                                           });
                    </script>
			</td>
			<td><input type="submit" name="sava" value="Search"></td>
			
		</tr>
	</table>
</form>
<br><br> 
<%
	
%>
<%
	String strDate = "";
	String condition = "";
	String strTenderCount = "SELECT COUNT(*) FROM CMS_ADMIN_LOG";
	String strTenderDetails ="SELECT CAL_CAU_LOGIN,CAL_TITLE,CAL_DESCRIPTION,CAL_SQLQUERY,DATE_FORMAT(CAL_CREATED_DATE,'%d-%m-%Y %H:%i'),CAL_ID FROM CMS_ADMIN_LOG ";
	if(request.getParameter("userId") != null && !request.getParameter("userId").equals("")){
		strUserId = request.getParameter("userId");
		condition = " WHERE CAL_CAU_LOGIN = '"+strUserId+"'";
	}
	if(request.getParameter("byDate") != null && !request.getParameter("byDate").equals("")){
		strDate = request.getParameter("byDate");
		if(!condition.equals("")){
			condition += "  AND DATE_FORMAT(CAL_CREATED_DATE,'%d-%m-%Y') = '"+strDate+"'";
		}else{
			condition = " WHERE DATE_FORMAT(CAL_CREATED_DATE,'%d-%m-%Y') = '"+strDate+"'";
		}
	}
	strTenderCount +=condition;
	strTenderDetails +=condition +" ORDER BY CAL_ID desc";
	dbBean.setQuery(strTenderCount);
	String rsGetCount[][] = dbBean.getResultSet();
	int TotalCount = 0,TotalPages = 0,Start = 1,Start_Row = 0,displayTo = 0;
	if(rsGetCount.length>0){
		TotalCount = Integer.parseInt(rsGetCount[0][0]);
	}
	TotalPages = TotalCount/10;
	if(TotalCount%10 > 0){
		TotalPages++;
	}
	if(request.getParameter("Start") != null && !request.getParameter("Start").trim().equals("")){
		Start = Integer.parseInt(decrypt(request.getParameter("Start")));
		Start_Row = (Start-1)*10;
	}
	//out.print(strTenderCount);
	//out.print(strTenderDetails);
	strTenderDetails +=" LIMIT "+Start_Row+",10";
	dbBean.setQuery(strTenderDetails);
	String rsGetNoticDetails[][] = dbBean.getResultSet();
	//out.print(strTenderDetails);
%>
<%
if(rsGetNoticDetails.length>0){%>
<table border="1" align="center" class="sample" width="100%">
	
		<tr>
			<th>Sl.No.</th><th>User Name</th><th>Date</th><th>Action</th><!--<th>Description</th>--><th>Details</th>
		</tr>
		<%for(int l=0;l<rsGetNoticDetails.length;l++){
			displayTo = Start_Row+l+1;
		%>
		<tr>
		    <td><%=Start_Row+l+1%></td>
			<td><%=rsGetNoticDetails[l][0]%></td>
			<td nowrap="nowrap"><%=rsGetNoticDetails[l][4]%></td>
			<td><%=rsGetNoticDetails[l][1]%></td>
			<!--<td><%//=rsGetNoticDetails[l][2]%></td>-->
			<td><a href="userLogDetails.jsp?id=<%=rsGetNoticDetails[l][5]%>&keepThis=true&TB_iframe=true&height=500&width=600" class="thickbox"><font color="black">View Details</font></a></td>
			
		</tr>
		<%}%>
	
</table>
<table align="center">
	<tr>
		<td align="left"><b><%=Start_Row+1%>&nbsp;-&nbsp;<%=displayTo%>&nbsp;&nbsp;Of&nbsp;&nbsp;(<%=TotalCount%>)</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	
<%if(TotalPages > 1){%>
	<%if(Start > 1){%>
		<td><a href="userLog.jsp?Start=<%=encrypt("1")%>&byDate=<%=strDate%>&userId=<%=strUserId%>"><font color="black"><b>First</b></font></a>&nbsp;&nbsp;</td>
		<td><a href="userLog.jsp?Start=<%=encrypt(Integer.toString(Start-1))%>&byDate=<%=strDate%>&userId=<%=strUserId%>"><font color="black"><b>Previous</b></font></a>&nbsp;&nbsp;</td>
		<%}if(TotalPages > 1 && Start < TotalPages){%>
		<td>&nbsp;&nbsp;<a href="userLog.jsp?Start=<%=encrypt(Integer.toString(Start+1))%>&byDate=<%=strDate%>&userId=<%=strUserId%>"><font color="black"><b>Next</font></b></a></td>
		<td>&nbsp;&nbsp;<a href="userLog.jsp?Start=<%=encrypt(Integer.toString(TotalPages))%>&byDate=<%=strDate%>&userId=<%=strUserId%>"><font color="black"><b>Last</font></b></a></td>
		<%}%>
<%}%>
</tr>
</table>
<%}else{%>
		<table border="1" align="center" class="sample" width="100%">
			<tr><td align="center">No record found for this search</td></tr>
		</table>
<%}%>
<%@ include file="../header/footerInner.jsp" %>
