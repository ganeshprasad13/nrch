<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %><br>
<script type="text/javascript">
  	function submit_self()
	{
		var data = document.AwardShow.Division_id.value;
		var data1 = document.AwardShow.Department_id.value;
		document.AwardShow.action='Awarded.jsp?Division_id='+data+'&Department_id='+data1;
		document.AwardShow.submit();
		
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
String Tender_id  = "-100";
if(request.getParameter("Tender_id")!=null &&  !request.getParameter("Tender_id").trim().equals("")){
	Tender_id = request.getParameter("Tender_id");
}
// Select Tender Division 
String strDivision = "";
	strDivision = "SELECT CMSD_ID,CMSD_DIVISIONS FROM CMS_DIVISIONS ORDER BY CMSD_DIVISIONS";
	dbBean.setQuery(strDivision);
	String rsGetDivision[][] = dbBean.getResultSet();
// Select tender Department
String strDepartment = "";
	if(session.getAttribute("DBAacc") != null && !session.getAttribute("DBAacc").equals("100")){
		strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE CMSDEPT_ID IN ("+strDepartmentId+") AND CMSDEPT_CMSD_ID ="+strDivId+"";
	}else{
		strDepartment = "SELECT CMSDEPT_ID,CMSDEPT_NAME FROM CMS_DEPARTMENTS WHERE  CMSDEPT_CMSD_ID ="+strDivId+"";
	}
	dbBean.setQuery(strDepartment);
	String rsGetDepartment[][] = dbBean.getResultSet();
String condition = "";
	//Select tender no
	if(strDivision != null){
		condition += " AND TA.DIV_ID = "+strDivId+"";
	}
	if(strDepartment != null){
		condition += " AND TA.DEPT_ID = "+strDeptId+"";
	}
	if(condition.equals("")){
		condition = " AND TA.DIV_ID=-100";
	}
	if(strDivId.equals("-1")){
		condition = " AND TA.DEPT_ID = '-1' AND TA.DIV_ID = '-1'";
	}
	
// Select Tender
String strTenderNo = "";
	strTenderNo = "SELECT TA.TENDER_ID,TM.TENDER_NO FROM  CMS_TENDER_AWARD_NEW AS TA,CMS_TENDER_MASTER_NEW AS TM WHERE TA.TENDER_ID = TM.ID AND DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= TA.CLOSED_ON AND TA.STATUS = 'Active'";
	strTenderNo = strTenderNo+condition;
	dbBean.setQuery(strTenderNo);
	String rsGetTenderNo[][] = dbBean.getResultSet();
%>
 

<form id="form1" name="AwardShow" action="Awarded.jsp" METHOD="POST" >
<table width="50%" border="1" align="center" class="textn">
		  	
            <tr>
                <td colspan="2"  align="center">Tender Awarded Details</td>
            </tr>
			<tr>
                <td>Division</td>
                <td><select name="Division_id" onchange="javascript:submit_self()">
			  			<option value="">--Select Division--</option>
						<%if(rsGetDivision.length>0){
							for(int i=0;i<rsGetDivision.length;i++){%>
							<option value="<%=rsGetDivision[i][0]%>" <%if(strDivId.equals(rsGetDivision[i][0])){%>selected<%}%>><%=rsGetDivision[i][1]%></option>
						<%	}
						}%>
					</select>
				</td>
			 </tr>
             <tr>
                <td>Department</td>
                <td><select name="Department_id" onchange="javascript:submit_self()">
						<%if(rsGetDepartment.length>0){%>
						<option value="">--Select Department--</option>
						<%
							for(int i=0;i<rsGetDepartment.length;i++){%>
							<option value="<%=rsGetDepartment[i][0]%>" <%if(strDeptId.equals(rsGetDepartment[i][0])){%>selected<%}%>><%=rsGetDepartment[i][1]%></option>
						<%	}
						}%>
					</select></td>
			 </tr>
					<td>Tender No.</td>
				 	<td><select name="Tender_id">
						<option value="" >--Select Tender--</option>
						<%if(rsGetTenderNo.length>0){
							for(int i=0;i<rsGetTenderNo.length;i++){%>
							<option value="<%=rsGetTenderNo[i][0]%>" <%if(Tender_id.equals(rsGetTenderNo[i][0])){%>selected<%}%>><%=rsGetTenderNo[i][1]%></option>
						<%}}%>
					</select></td>
			 </tr>
			                  
            <tr><td>&nbsp;</td>
                <td >
                    <input type="submit" name="View" value="View" onclick="" id="btnAdd"/>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    <input id="Button2"  type="reset" value="reset"  />&nbsp; &nbsp;
                </td>
            </tr>
               
        </table>
</form>
<%if(request.getParameter("View") !=null && request.getParameter("View").trim().equals("View")){
	String strAwardedDetails = "";
	strAwardedDetails = "SELECT TM.TENDER_NO,TA.AWARDED_TO,DATE_FORMAT(TA.AWARDED_ON,'%d-%m-%Y'),TA.DESCRIPTION_ENG,TA.COST,DATE_FORMAT(TA.CLOSED_ON,'%d-%m-%Y'),TA.BILL_STATUS FROM  CMS_TENDER_AWARD_NEW AS TA,CMS_TENDER_MASTER_NEW AS TM WHERE TA.TENDER_ID = TM.ID AND DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= TA.CLOSED_ON AND TA.STATUS = 'Active'";
	strAwardedDetails = strAwardedDetails+condition+" AND TENDER_ID = "+Tender_id;
	dbBean.setQuery(strAwardedDetails);
	String rsGetAwardedDetails[][] = dbBean.getResultSet();
	if(rsGetAwardedDetails.length>0){
	%>
	<table align="center" border="1" width="50%">
		<tr>
			<td>Tender Name</td><td><%=rsGetAwardedDetails[0][0]%></td>
		</tr>
		<tr>
			<td>Awarded To</td><td><%=rsGetAwardedDetails[0][1]%></td>
		</tr>
		<tr>
			<td>Awarded Date</td><td><%=rsGetAwardedDetails[0][2]%></td>
		</tr>
		<tr>
			<td>Description</td><td><%=rsGetAwardedDetails[0][3]%></td>
		</tr>
		<tr>
			<td>Tender Cost</td><td><%=rsGetAwardedDetails[0][4]%></td>
		</tr>
		<tr>
			<td>Closing Date</td><td><%=rsGetAwardedDetails[0][5]%></td>
		</tr><br>
		<tr>
			<td>Bill Status</td><td><%=rsGetAwardedDetails[0][6]%></td>
		</tr>
	<%}%>
	</table>
<%}%>
<%@ include file="../header/footerInner.jsp" %>
