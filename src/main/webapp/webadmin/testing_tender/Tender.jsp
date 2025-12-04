<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
<script type="text/javascript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<SCRIPT src="ktdv.js"></script>

<script type="text/javascript">
  	function submit_self()
	{
		var data = document.Tender.Division_id.value;
		var data1 = document.Tender.Tender_Type.value;
		var data2 = document.Tender.Department_id.value;
		document.Tender.action='Tender.jsp?Division_id='+data+'&Tender_Type='+data1+'&Department_id='+data2;
		document.Tender.submit();
		
	}
</script>
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
	strTenType = "SELECT ID,TENDER_TYPE FROM CMS_TENDER_TYPE";
	dbBean.setQuery(strTenType);
	String rsGetTenType[][] = dbBean.getResultSet();
// Select Tender Division 
String strDivision = "";
	strDivision = "SELECT CMSD_ID,CMSD_DIVISIONS FROM CMS_DIVISIONS ORDER BY CMSD_DIVISIONS";
	dbBean.setQuery(strDivision);
	String rsGetDivision[][] = dbBean.getResultSet();
// Select tender Department
String strDepartment = "";
	strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE CMSDEPT_CMSD_ID IN("+strDivId+") ORDER BY CMSDEPT_NAME";
	dbBean.setQuery(strDepartment);
	String rsGetDepartment[][] = dbBean.getResultSet();
	
//SearchFilter
String SearchFilter = "2";
if(request.getParameter("SearchFilter")!=null){
	SearchFilter = request.getParameter("SearchFilter");
}
%>
<form id="TenderSearch"  name="TenderSearch" action="Tender.jsp" METHOD="POST" >
		<table width="50%" border="1" align="center">
			<tr>
                <td>Search Tender </td>
				<td><input type="text" name="SearchTender"></td>
				<td><input type="submit" value="Search" name="Search"></td>
            </tr>
		</table>
</form>
<form id="form1"  name="Tender" action="Tender.jsp" METHOD="POST" >
        <table width="50%" border="1" align="center">
            <tr>
                <td colspan="2" align="center">Show Tender    </td>
            </tr>
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
						}else{%>
						<option value="-1" selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Division</option>
						<%}%>
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
							<option value="-2" <%if(strDeptId.equals("-2")){%>selected<%}%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Department</option>
						<%
						}else{%>
						<option value="-1" selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Department</option>
						<%}%>
					</select></td>
			 </tr>
             <tr>
                <td align="center" colspan="4" class="style1"><br /><br />
                    <input type="submit" name="Button1" value="Show"  />&nbsp;
                    <input  type="reset" value="Reset"  />&nbsp; &nbsp;
                </td>
            </tr>
         </table>
</form>

<%
//Select Tender Details
String strTenderCount = "SELECT COUNT(*) FROM CMS_TENDER_MASTER_NEW AS TM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = TM.DEPT_ID AND DIVI.CMSD_ID = TM.DIV_ID ";
String strTenderDetails = "";
String condition = "";
boolean Flag = true;
	strTenderDetails = "SELECT TM.ID,DIVI.CMSD_DIVISIONS,DEPT.CMSDEPT_NAME,TM.TENDER_NO,TM.APPROXIMATE_COST,TM.TENDER_TITLE_ENG FROM  CMS_TENDER_MASTER_NEW AS TM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = TM.DEPT_ID AND DIVI.CMSD_ID = TM.DIV_ID  AND STATUS = 'Active'";
	if(SearchFilter.equals("2")){
		condition +="AND DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') >= TENDER_OPEN_DATE AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= TENDER_CLOSE_DATE";
	}
	if(SearchFilter.equals("3")){
		condition +=" AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') > TENDER_CLOSE_DATE";
	}
	if(strTenTypeId != null){
		condition += " AND TENDER_TYPE_ID = "+strTenTypeId+"";
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
			ConditionNoDivDept = " AND DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') >= TM.TENDER_OPEN_DATE AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= TM.TENDER_CLOSE_DATE";
		}
		if(SearchFilter.equals("3")){
			ConditionNoDivDept =" AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') > TM.TENDER_CLOSE_DATE";
		}
		strTenderDetails = "SELECT TM.ID,TM.TENDER_NO,TM.APPROXIMATE_COST,TM.TENDER_TITLE_ENG FROM CMS_TENDER_MASTER_NEW AS TM WHERE   STATUS = 'Active' AND DEPT_ID = '-1' AND DIV_ID = '-1' "+ConditionNoDivDept+"";
	}
	if(request.getParameter("Search")!=null && request.getParameter("Search").equals("Search")){
		String TenderSearch = ""; 
		TenderSearch= request.getParameter("SearchTender")!=null?request.getParameter("SearchTender"):"";
		strTenderDetails = "SELECT TM.ID,DIVI.CMSD_DIVISIONS,DEPT.CMSDEPT_NAME,TM.TENDER_NO,TM.APPROXIMATE_COST,TM.TENDER_TITLE_ENG FROM  CMS_TENDER_MASTER_NEW AS TM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = TM.DEPT_ID AND DIVI.CMSD_ID = TM.DIV_ID AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') >= TENDER_OPEN_DATE AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= TENDER_CLOSE_DATE AND STATUS = 'Active' and TENDER_NO ='"+TenderSearch+"'";
	}
	strTenderDetails +=" ORDER BY TENDER_CLOSE_DATE";
	
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
	String rsGetTenderDetails[][] = dbBean.getResultSet();
	
%>
<%if(rsGetTenderDetails.length>0){%>
<table border="1" align="center">
	<%if(Flag){%>
		<tr>
			<th>Division</th><th>Department</th><th>Tender No.</th><th>Approximate Cost</th><th>Name Of Work</th>
		</tr>
		<%for(int l=0;l<rsGetTenderDetails.length;l++){%>
		<tr>
		    <td><%=rsGetTenderDetails[l][1]%></td><td><%=rsGetTenderDetails[l][2]%></td><td><%=rsGetTenderDetails[l][3]%></td>
			<td><%=rsGetTenderDetails[l][4]%></td><td><a href="TenderDetails.jsp?T_ID=<%=rsGetTenderDetails[l][0]%>"><%=rsGetTenderDetails[l][5]%></a></td>
		</tr>
		<%}
	}else {%>
		<tr>
			<th>Tender No.</th><th>Approximate Cost</th><th>Name Of Work</th>
		</tr>
		<%for(int l=0;l<rsGetTenderDetails.length;l++){%>
		<tr>
		    <td><%=rsGetTenderDetails[l][1]%></td>
			<td><%=rsGetTenderDetails[l][2]%></td>
			<td><a href="TenderDetailsNoDivDept.jsp?T_ID=<%=rsGetTenderDetails[l][0]%>"><%=rsGetTenderDetails[l][3]%></a></td>
		</tr>
		<%}}%>
</table>
<%}%>
<%if(TotalPages > 1){%>
<table align="center">
	<tr>
		<%if(Start > 1){%>
		<td><a href="Tender.jsp?Start=<%=Start-1%>&Division_id=<%=strDivId%>&Department_id=<%=strDeptId%>&Tender_Type=<%=strTenTypeId%>&SearchFilter=<%=SearchFilter%>"></P>Previous</a>&nbsp;&nbsp;</td>
		<%}if(TotalPages > 1 && Start < TotalPages){%>
		<td>&nbsp;&nbsp;<a href="Tender.jsp?Start=<%=Start+1%>&Division_id=<%=strDivId%>&Department_id=<%=strDeptId%>&Tender_Type=<%=strTenTypeId%>&SearchFilter=<%=SearchFilter%>">Next</a></td>
		<%}%>
	</tr>
</table>
<%}%>
<%@ include file="../header/footerInner.jsp" %>