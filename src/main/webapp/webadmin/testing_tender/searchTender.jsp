<%try{%>
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
		document.Tender.action='searchTender.jsp?Division_id='+data+'&Tender_Type='+data1+'&Department_id='+data2;
		document.Tender.submit();
		
	}
</script>
<% // For delete Notice
	String strComMess ="";
	if(request.getParameter("action") != null && request.getParameter("action").equals("del")){
		String strTenId = request.getParameter("T_ID");
		//for log
		 String strTenderDelete = "INSERT INTO cms_tender_master_log SELECT * FROM cms_tender_master_new WHERE ID ="+strTenId+"";
		 dbBean.setQuery(strTenderDelete);
		 dbBean.go1();
		
		strTenderDelete = "delete from CMS_TENDER_MASTER_NEW WHERE ID ="+strTenId+"";
		dbBean.setQuery(strTenderDelete);
		dbBean.go1();
		strComMess = "Record Deleted Successfully";
		String actype = "0";
	String acmsg = "DeleteTender";
	String acdescription =  session.getAttribute("DBAusername") + " login for Delete Tender information ";
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
String strDepartment = "";
String strDepartmentId = (String)session.getAttribute("DEPT_ID");
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
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;<a href="index.jsp?selectType=2">Manage Tender Document</a>
&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;Search Tender </span></p>
<form id="TenderSearch"  name="TenderSearch" action="searchTender.jsp" METHOD="POST" >
		<table width="100%" border="0" class="tender_font" cellpadding="5" style="font-size:12px;">
	<tr>
		<td style="border:1px solid #4787CD;background-color:#C7DAEF;">
		<b>Search Tender by Keyword</b><br>
		<table  style="font-size:12px;" width="80%" border="0" align="left" class="tender_font">
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
<form id="form1"  name="Tender" action="searchTender.jsp" METHOD="POST" >
        <table  style="font-size:12px;" width="100%" border="0" align="center" class="tender_font">
			<tr>
                <td colspan="2" align="center"><font color="blue">
                   <%
				   if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }if(!strComMess.equals("")){
				   		out.print(strComMess);
				   }
				   %>
					</font>
                </td>
            </tr>
            <tr>
                <td style="border:1px solid #C74303;background-color:#FFF1EC;">
				<b>Search Tender type, Division and Departments</b><br><br>
            <table  style="font-size:12px;" width="100%" border="0" align="center" class="tender_font">
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
							
						<%
						}else{%>
						<option value="-1" selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Department</option>
						<%}%>
					</select></td>
			 </tr>
             <tr>
                <td align="center" colspan="4" class="style1"><br /><br />
                    <input type="submit" name="Button1" value="Show"  />&nbsp;
                    &nbsp; &nbsp;
                </td>
            </tr>
			</table>
		  </tr>
        </table>
</form>

<%
//Select Tender Details
String strTenderCount = "SELECT COUNT(*) FROM CMS_TENDER_MASTER_NEW AS TM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = TM.DEPT_ID AND DIVI.CMSD_ID = TM.DIV_ID AND STATUS = 'Active'";
String strTenderDetails = "";
String condition = "";
boolean Flag = true;
	strTenderDetails = "SELECT TM.ID,DIVI.CMSD_DIVISIONS,DEPT.CMSDEPT_NAME,TM.TENDER_NO,DATE_FORMAT(TM.TENDER_OPEN_DATE,'%d-%m-%Y'),TM.TENDER_TITLE_ENG FROM  CMS_TENDER_MASTER_NEW AS TM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = TM.DEPT_ID AND DIVI.CMSD_ID = TM.DIV_ID  AND STATUS = 'Active'";
	if(SearchFilter.equals("2")){
		condition +="AND DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= TENDER_OPEN_DATE ";
	}
	if(SearchFilter.equals("3")){
		condition +=" AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') > TENDER_OPEN_DATE";
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
			ConditionNoDivDept = " AND DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= TM.TENDER_OPEN_DATE ";
		}
		if(SearchFilter.equals("3")){
			ConditionNoDivDept =" AND  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') > TM.TENDER_OPEN_DATE";
		}
		strTenderDetails = "SELECT TM.ID,TM.TENDER_NO,DATE_FORMAT(TM.TENDER_OPEN_DATE,'%d-%m-%Y'),TM.TENDER_TITLE_ENG FROM CMS_TENDER_MASTER_NEW AS TM WHERE   STATUS = 'Active' AND DEPT_ID = '-1' AND DIV_ID = '-1' "+ConditionNoDivDept+"";
	}
	if(request.getParameter("Search")!=null && request.getParameter("Search").equals("Search")){
		String TenderSearch = ""; 
		TenderSearch= request.getParameter("SearchTender")!=null?request.getParameter("SearchTender"):"";
		strTenderDetails = "SELECT TM.ID,DIVI.CMSD_DIVISIONS,DEPT.CMSDEPT_NAME,TM.TENDER_NO,TM.APPROXIMATE_COST,TM.TENDER_TITLE_ENG FROM  CMS_TENDER_MASTER_NEW AS TM, CMS_DEPARTMENTS AS DEPT,CMS_DIVISIONS AS DIVI WHERE DEPT.CMSDEPT_ID = TM.DEPT_ID AND DIVI.CMSD_ID = TM.DIV_ID AND STATUS = 'Active' AND (TENDER_NO LIKE '%"+TenderSearch+"%' OR TENDER_TITLE_ENG  LIKE '%"+TenderSearch+"%') AND  DEPT.CMSDEPT_ID IN("+strDepartmentId+")";
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
	//out.print(strTenderDetails);
%>
<%if(rsGetTenderDetails.length>0){%>
<table border="1" align="center" class="sample" width="100%">
	<%if(Flag){%>
		<tr>
			<th>Division</th><th>Department</th><th>Tender No.</th><th>Tender Open Date</th><th>Name Of Work</th><th>Edit</th><th>Delete</th>
		</tr>
		<%for(int l=0;l<rsGetTenderDetails.length;l++){%>
		<tr>
		    <td><%=rsGetTenderDetails[l][1]%></td><td><%=rsGetTenderDetails[l][2]%></td><td><%=rsGetTenderDetails[l][3]%></td>
			<td><%=rsGetTenderDetails[l][4]%></td>
			<td><%=rsGetTenderDetails[l][5]%></td>
			<%if(bIsTenderDocumentEdit || strDBAacc.equals("100")){%>
				<td><a href="editTenderDoc.jsp?T_ID=<%=rsGetTenderDetails[l][0]%>"><font color="black">Edit</font></a></td>
			<%}else{%><td>No permission</td><%}%>
			<td><a href="searchTender.jsp?T_ID=<%=rsGetTenderDetails[l][0]%>&action=del" onclick="return confirm('Are you sure you want to delete?')"><font color="black">Delete</font></a></td>
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
		<td><a href="searchTender.jsp?Start=<%=Start-1%>&Division_id=<%=strDivId%>&Department_id=<%=strDeptId%>&Tender_Type=<%=strTenTypeId%>&SearchFilter=<%=SearchFilter%>"></P><font color="red">Previous</font></a>&nbsp;&nbsp;</td>
		<%}if(TotalPages > 1 && Start < TotalPages){%>
		<td>&nbsp;&nbsp;<a href="searchTender.jsp?Start=<%=Start+1%>&Division_id=<%=strDivId%>&Department_id=<%=strDeptId%>&Tender_Type=<%=strTenTypeId%>&SearchFilter=<%=SearchFilter%>"><font color="red">Next</font></a></td>
		<%}%>
	</tr>
</table>
<%}%>
<%@ include file="../header/footerInner.jsp" %>
<% }catch(Exception e){out.print(e);} %>