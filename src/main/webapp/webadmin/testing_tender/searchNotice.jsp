<%try{%>

<%@ include file="../header/headerInner.jsp" %>

<script type="text/javascript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/default.css" type="text/css" media="screen"></link>
<SCRIPT src="ktdv.js"></script>

<script type="text/javascript">
  	function submit_self()
	{
		var data = document.Tender.Division_id.value;
		var data1 = document.Tender.Tender_Type.value;
		var data2 = document.Tender.Department_id.value;
		document.Tender.action='searchNotice.jsp?Division_id='+data+'&Tender_Type='+data1+'&Department_id='+data2;
		document.Tender.submit();
		
	}
</script>
<% // For delete Notice
String strComMess ="";
	if(request.getParameter("action") != null && request.getParameter("action").equals("del")){
		String strNotId = request.getParameter("N_ID");
		String strTenderDelete = "UPDATE CMS_NOTICE_MASTER_NEW SET STATUS ='DeActive' WHERE T_ID ="+strNotId+"";
		
		//out.print(strTenderDelete);
		dbBean.setQuery(strTenderDelete);
		dbBean.go1();
		strComMess = "Record Deleted Successfully";
		String actype = "0";
	String acmsg = "DeleteNotice";
	String acdescription =  session.getAttribute("DBAusername") + " login for Delete Notice information ";
	String acSqlQuery = strTenderDelete;
	%>
	<%@ include file="../createlog.jsp" %>
<%}%>
<%
String strDivId  = "-100";
if(request.getParameter("Division_id")!=null &&  !request.getParameter("Division_id").trim().equals("")){
	strDivId = request.getParameter("Division_id");
}
String strDeptId  = "-100";
if(request.getParameter("Department_id")!=null &&  !request.getParameter("Department_id").trim().equals("")){
	strDeptId = request.getParameter("Department_id");
}
String strTenTypeId  = "-100";
if(request.getParameter("Tender_Type")!=null &&  !request.getParameter("Tender_Type").trim().equals("")){
	strTenTypeId = request.getParameter("Tender_Type");
}
// Select Tender Type
String strTenType = "";
	strTenType = "SELECT TypeID,TENDER_TYPE FROM CMS_TENDER_TYPE_NEW";
	dbBean.setQuery(strTenType);
	String rsGetTenType[][] = dbBean.getResultSet();
// Select Tender Division 
String strDivision = "";
	strDivision = "SELECT CMSD_ID,CMSD_DIVISIONS FROM CMS_DIVISIONS ORDER BY CMSD_DIVISIONS";
	dbBean.setQuery(strDivision);
	String rsGetDivision[][] = dbBean.getResultSet();
// Select tender Department
String strDepartmentId = (String)session.getAttribute("DEPT_ID");
String strDepartment = "";
	if(session.getAttribute("DBAacc") != null && !session.getAttribute("DBAacc").equals("100")){
		strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE CMSDEPT_ID IN ("+strDepartmentId+") AND CMSDEPT_CMSD_ID ="+strDivId+"";
	}else{
		strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE  CMSDEPT_CMSD_ID ="+strDivId+"";
	}
	dbBean.setQuery(strDepartment);
	String rsGetDepartment[][] = dbBean.getResultSet();
	
//SearchFilter
String SearchFilter = "2";
if(request.getParameter("SearchFilter")!=null){
	SearchFilter = request.getParameter("SearchFilter");
}
%>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;<a href="index.jsp?selectType=1">Manage Tender Notice</a>
&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;Search Tender Notice</span></p>
<form id="TenderSearch"  name="TenderSearch" action="searchNotice.jsp" METHOD="POST" ><br>
<table width="100%" border="0" class="tender_font" cellpadding="5" style="font-size:12px;">
	<tr>
		<td style="border:1px solid #4787CD;background-color:#C7DAEF;">
		<b>Search Notice by Keyword</b><br>
		<table width="80%" border="0" align="left" class="tender_font" style="font-size:12px;">
			<tr>
                <td>Please enter search keyword : </td>
				<td><input type="text" name="SearchTender" size="40" value="<%if(request.getParameter("SearchTender")!=null){out.print(request.getParameter("SearchTender"));}%>"></td>
				<td><input type="submit" value="Search" name="Search"></td>
            </tr>
		</table>
		
		
		</td>
	</tr>
</table>
		
</form>
<form id="form1"  name="Tender" action="searchNotice.jsp" METHOD="POST" >
<table width="100%" border="0" class="tender_font" cellpadding="5" style="font-size:12px;">
			<tr>
                <td colspan="2" align="center"><font color="blue">
                   <%if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }if(!strComMess.equals("")){
				   		out.print(strComMess);
				   }%>
					</font>
                </td>
            </tr>
	<tr>
		<td style="border:1px solid #C74303;background-color:#FFF1EC;">
		<b>Search Tender type, Division and Departments</b><br><br>
		<table width="100%" border="0" align="center" class="tender_font" style="font-size:12px;">
            
			<tr>
				<td>Search Filter</td>
				<td>
					<input type="radio" name="SearchFilter" value="1" <%if(SearchFilter.equals("1")){%>checked<%}%> onclick="javascript:submit_self()"/> &nbsp; Show All 
					<input type="radio" name="SearchFilter" value="2" <%if(SearchFilter.equals("2")){%>checked<%}%> onclick="javascript:submit_self()"/> &nbsp; Active  
					<input type="radio" name="SearchFilter" value="3" <%if(SearchFilter.equals("3")){%>checked<%}%> onclick="javascript:submit_self()"/> &nbsp; Archive 
				</td>
			</tr>
			<tr>
                <td>Tender Type</td>
                <td><select name="Tender_Type" onchange="javascript:submit_self()">
			  			<option value="">--Select Tender Type--</option>
						<%if(rsGetTenType.length>0){
							for(int i=0;i<rsGetTenType.length;i++){%>
							<option value="<%=rsGetTenType[i][0]%>" <%if(strTenTypeId.equals(rsGetTenType[i][0])){%>selected<%}%>><%=rsGetTenType[i][1]%></option>
						<%	}
						}%>
						
					</select></td>
			 </tr>
			 <tr>
                <td>Division</td>
                <td><select name="Division_id" onchange="javascript:submit_self()">
			  				<%if(rsGetDivision.length>0){%>
								<option value="">--Select Division--</option>
							<%
							for(int j=0;j<rsGetDivision.length;j++){%>
							<option value="<%=rsGetDivision[j][0]%>" <%if(strDivId.equals(rsGetDivision[j][0])){%>selected<%}%>><%=rsGetDivision[j][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
             <tr>
                <td>Department</td>
                <td><select name="Department_id" >
						<%if(rsGetDepartment.length>0){%>
						<option value="">--Select Department--</option>
						<%for(int k=0;k<rsGetDepartment.length;k++){%>
							<option value="<%=rsGetDepartment[k][0]%>" <%if(strDeptId.equals(rsGetDepartment[k][0])){%>selected<%}%>><%=rsGetDepartment[k][1]%></option>
						<%}%>
							
						<%
						}%>
					</select></td>
			 </tr>
             <tr>
                <td align="center" colspan="4" class="style1"><br /><br />
				   <input type="hidden" name="lang" value="<%=request.getParameter("lang")%>"/>
				   <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                    <input type="submit" name="Button1" value="Show"  />&nbsp;
                    &nbsp; &nbsp;
                </td>
            </tr>
         </table>
		
		
		</td>
	</tr>
</table>



        
</form>

<%
//Select Tender Details
String strTenderCount = "SELECT COUNT(*) FROM CMS_NOTICE_MASTER_NEW AS TM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = TM.DEPT_ID AND DIVI.CMSD_ID = TM.DIV_ID AND STATUS = 'Active'";
String strTenderDetails = "";
String condition = "";
boolean Flag = true;
	strTenderDetails = "SELECT NM.T_ID, DIVI.CMSD_DIVISIONS, DEPT.CMSDEPT_NAME, NM.T_REF_NO, DATE_FORMAT(NM.T_BID_OPEN_DATE,'%d-%m-%Y'),NM.T_DESC FROM CMS_NOTICE_MASTER_NEW AS NM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI  WHERE DEPT.CMSDEPT_ID = NM.DEPT_ID AND DIVI.CMSD_ID = NM.DIV_ID  AND STATUS = 'Active'";
	if(SearchFilter.equals("2")){
		condition +="AND DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= T_BID_OPEN_DATE";
	}
	if(SearchFilter.equals("3")){
		condition +=" AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') > T_BID_OPEN_DATE";
	}
	if(strTenTypeId != null){
		condition += " AND T_TENDER_TYPE = "+strTenTypeId+"";
	}
	if(strDivId != null ){
		condition += " AND DIV_ID = "+strDivId+"";
	}
	if(strDeptId != null && !strDeptId.equals("-2")){
		condition += " AND DEPT_ID = "+strDeptId+"";
	}
	if(condition.equals("")){
		condition = " AND DIV_ID=-100";
	}
	strTenderCount +=condition;
	strTenderDetails =strTenderDetails+condition;
	if(strDivId.equals("-1")){
		Flag = false;
		String ConditionNoDivDept = "";
		if(SearchFilter.equals("2")){
			ConditionNoDivDept = "  AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= NM.T_BID_OPEN_DATE";
		}
		if(SearchFilter.equals("3")){
			ConditionNoDivDept =" AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= NM.T_BID_OPEN_DATE";
		}
		strTenderDetails = "SELECT TM.ID,TM.TENDER_NO,TM.APPROXIMATE_COST,TM.DESCRIPTION FROM CMS_TENDER_MASTER_NEW AS TM WHERE   STATUS = 'Active' AND DEPT_ID = '-1' AND DIV_ID = '-1' "+ConditionNoDivDept+"";
	}
	if(request.getParameter("Search")!=null && request.getParameter("Search").equals("Search")){
		String TenderSearch = ""; 
		TenderSearch= request.getParameter("SearchTender")!=null?request.getParameter("SearchTender"):"";
         TenderSearch = TenderSearch.replaceAll("'","''");
		strTenderDetails = "SELECT TM.T_ID, DIVI.CMSD_DIVISIONS, DEPT.CMSDEPT_NAME, TM.T_REF_NO, DATE_FORMAT(TM.T_BID_OPEN_DATE,'%d-%m-%Y'),TM.T_DESC FROM  CMS_NOTICE_MASTER_NEW AS TM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = TM.DEPT_ID AND DIVI.CMSD_ID = TM.DIV_ID  AND STATUS = 'Active' AND (T_DESC LIKE '%"+TenderSearch+"%' OR T_REF_NO like '%"+TenderSearch+"%') AND  DEPT.CMSDEPT_ID IN("+strDepartmentId+")";
	}
	strTenderDetails +=" ORDER BY T_PUB_DATE";
	
//Count Query
	dbBean.setQuery(strTenderCount);
	String rsGetCount[][] = dbBean.getResultSet();
	int TotalCount = 0,TotalPages = 0,Start = 1,Start_Row = 0;
	if(rsGetCount.length>0){
		TotalCount = Integer.parseInt(rsGetCount[0][0]);
	}
	TotalPages = TotalCount/10;
	if(TotalCount%10 > 0){
		TotalPages++;
	}
	if(request.getParameter("Start") != null && !request.getParameter("Start").trim().equals("")){
		Start = Integer.parseInt(request.getParameter("Start"));
		Start_Row = (Start-1)*10;
	}
	strTenderDetails +=" LIMIT "+Start_Row+",10";
	dbBean.setQuery(strTenderDetails);
	String rsGetNoticDetails[][] = dbBean.getResultSet();
	
%>
<%
//if(request.getParameter("Button1") != null || request.getParameter("Search") != null){
if(rsGetNoticDetails.length>0){%>
<table border="1" align="center" class="sample" width="100%">
	<%if(Flag){%>
		<tr>
			<th>Division</th><th>Department</th><th>Tender Ref. No.</th><th>Tender Open Date</th><th>Name Of Work</th><th>Edit</th><th>Delete</th>
		</tr>
		<%for(int l=0;l<rsGetNoticDetails.length;l++){%>
		<tr>
		    <td><%=rsGetNoticDetails[l][1]%></td><td><%=rsGetNoticDetails[l][2]%></td><td><%=rsGetNoticDetails[l][3]%></td>
			<td><%=rsGetNoticDetails[l][4]%></td>
			<td><%=rsGetNoticDetails[l][5]%></td>
			<%if(bIsTenderNoticeEdit || strDBAacc.equals("100")){%>
				<td><a href="editNotice.jsp?N_ID=<%=rsGetNoticDetails[l][0]%>&type_id=<%=strTenTypeId%>"><font color="black">Edit</font></a></td>
			<%}else{%><td>No permission</td><%}%>
			<%if(bIsTenderNoticeDelete || strDBAacc.equals("100")){%>
				<td><a href="searchNotice.jsp?N_ID=<%=rsGetNoticDetails[l][0]%>&action=del"><font color="black" onclick="return confirm('Are you sure you want to delete?')">Delete</font></a></td>
			<%}else{%><td>No permission</td><%}%>
		</tr>
		<%}
	}else {%>
		<tr>
			<th>Tender No.</th><th>Tender Open Date</th><th>Name Of Work</th>
		</tr>
		<%for(int l=0;l<rsGetNoticDetails.length;l++){%>
		<tr>
		    <td><%=rsGetNoticDetails[l][1]%></td>
			<td><%=rsGetNoticDetails[l][2]%></td>
			<td><a href="TenderDetailsNoDivDept.jsp?T_ID=<%=rsGetNoticDetails[l][0]%>&type_id=<%=strTenTypeId%>"><%=rsGetNoticDetails[l][3]%></a></td>
		</tr>
		<%}}%>
</table>
<%}else{%>
		<table border="1" align="center" class="sample" width="100%">
			<tr><td align="center">No record found for this search</td></tr>
		</table>
<%}
//}%>

<%if(TotalPages > 1){%>
<table align="center">
	<tr>
		<%if(Start > 1){%>
		<td><a href="searchNotice.jsp?Start=<%=Start-1%>&Division_id=<%=strDivId%>&Department_id=<%=strDeptId%>&Tender_Type=<%=strTenTypeId%>&SearchFilter=<%=SearchFilter%>"></P><font color="red">Previous</font></a>&nbsp;&nbsp;</td>
		<%}if(TotalPages > 1 && Start < TotalPages){%>
		<td>&nbsp;&nbsp;<a href="searchNotice.jsp?Start=<%=Start+1%>&Division_id=<%=strDivId%>&Department_id=<%=strDeptId%>&Tender_Type=<%=strTenTypeId%>&SearchFilter=<%=SearchFilter%>"><font color="red">Next</font></a></td>
		<%}%>
	</tr>
</table>
<%}%>
<%@ include file="../header/footerInner.jsp" %>

<%}catch(Exception e){out.print(e);}%>