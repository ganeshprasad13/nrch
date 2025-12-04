
<%@ include file="../header/headerInner.jsp" %>

<%
String strGetUserQuery = "SELECT DISTINCT USER_NAME FROM cms_login_details ORDER BY USER_NAME";
Vector rsGetUser = new Vector();
dbBean.setQuery(strGetUserQuery);
rsGetUser = (Vector)dbBean.go();

//userId OR strUserId is actually user name---Anurag
String strUserId = "";
if(request.getParameter("userId") != null ){
strUserId = request.getParameter("userId");
}
%>

<script type="text/javascript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>

<p align="center"><span align="center" class="mgContentTitle"><a href="../reports/report.jsp">Reports</a>&nbsp;&nbsp;&raquo;&nbsp;&nbsp;User Login Success Log</span></p>



<br>
<form name="userLoginSuccessLog" action="userLoginSuccess_log.jsp" method="post" >
	<table width="50%" border="1" align="center" class="sample">
		<tr class="tr_bgcolor">
                <td colspan="7" align="center">
                    <b>See User Success Log</b>

                </td>
            </tr>
		<tr>
			<td>UserName</td>
			<td> 
				<select name="userId" id="userId">
						<option value="">--select--</option>
						<% for (int i=0; i<rsGetUser.size();i++) { %>
						<option value="<%=dbBean.getcell(rsGetUser,0,i)%>"<% if (strUserId.equals(dbBean.getcell(rsGetUser,0,i))) {%> selected<%}%>><%=dbBean.getcell(rsGetUser,0,i)%> </option>
						<% } %>
				</select>
			</td>
			
			<td>Date </td>
			<td> <input type="text" name="byDate" id="byDate" value="<%if(request.getParameter("byDate") != null){out.print(request.getParameter("byDate"));}%>"><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'userLoginSuccessLog',
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
	String strDate = "";
	String condition = "";
	
	String strUserFailCount = "SELECT COUNT(*) FROM cms_login_details";
	String strUserFailDetail ="SELECT ID, USER_NAME, DATE_FORMAT(LAST_LOGIN,'%d-%m-%Y %H:%i'), IP_ADDRESS FROM cms_login_details ";
	
	if(request.getParameter("userId") != null && !request.getParameter("userId").equals("")){
		strUserId = request.getParameter("userId");
		
		condition = " WHERE USER_NAME = '"+strUserId+"'";
	}
	
	if(request.getParameter("byDate") != null && !request.getParameter("byDate").equals("")){
		strDate = request.getParameter("byDate");
		if(!condition.equals("")){
			condition += "  AND DATE_FORMAT(LAST_LOGIN,'%d-%m-%Y') = '"+strDate+"'";
		}else{
			condition = " WHERE DATE_FORMAT(LAST_LOGIN,'%d-%m-%Y') = '"+strDate+"'";
		}
	}
	strUserFailCount +=condition;
	strUserFailDetail +=condition +" ORDER BY ID desc";
	dbBean.setQuery(strUserFailCount);
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
	
	strUserFailDetail +=" LIMIT "+Start_Row+",10";
	
	//out.print(strUserFailDetail);
	dbBean.setQuery(strUserFailDetail);
	String rsGetNoticDetails[][] = dbBean.getResultSet();
	
%>
<%
if(rsGetNoticDetails.length>0){%>
<table border="1" align="center" class="sample" width="100%">
	
		<tr>
			<th>Sl.No.</th><th>User Name</th><th>Date</th><th>IP Address</th>
		</tr>
		<%for(int l=0;l<rsGetNoticDetails.length;l++){
			displayTo = Start_Row+l+1;
		%>
		<tr>
		    
			<td><%=Start_Row+l+1%></td>
			<td><%=rsGetNoticDetails[l][1]%></td>
			<td nowrap="nowrap"><%=rsGetNoticDetails[l][2]%></td>
			<td><%=rsGetNoticDetails[l][3]%></td>
			
			
		</tr>
		<%}%>
	
</table>

<table align="center">
	<tr>
		<td align="left"><b><%=Start_Row+1%>&nbsp;-&nbsp;<%=displayTo%>&nbsp;&nbsp;Of&nbsp;&nbsp;(<%=TotalCount%>)</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	
<%if(TotalPages > 1){%>
	<%if(Start > 1){%>
		<td><a href="userLoginSuccess_log.jsp?Start=<%=encrypt("1")%>&byDate=<%=strDate%>&userId=<%=strUserId%>"><font color="black"><b>First</b></font></a>&nbsp;&nbsp;</td>
		<td><a href="userLoginSuccess_log.jsp?Start=<%=encrypt(Integer.toString(Start-1))%>&byDate=<%=strDate%>&userId=<%=strUserId%>"><font color="black"><b>Previous</b></font></a>&nbsp;&nbsp;</td>
		<%}if(TotalPages > 1 && Start < TotalPages){%>
		<td>&nbsp;&nbsp;<a href="userLoginSuccess_log.jsp?Start=<%=encrypt(Integer.toString(Start+1))%>&byDate=<%=strDate%>&userId=<%=strUserId%>"><font color="black"><b>Next</font></b></a></td>
		<td>&nbsp;&nbsp;<a href="userLoginSuccess_log.jsp?Start=<%=encrypt(Integer.toString(TotalPages))%>&byDate=<%=strDate%>&userId=<%=strUserId%>"><font color="black"><b>Last</font></b></a></td>
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
