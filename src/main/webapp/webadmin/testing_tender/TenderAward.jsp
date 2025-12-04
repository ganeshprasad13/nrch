<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %><br>
<script type="text/javascript">
  	function submit_self()
	{
		var data = document.AwardTender.Division_id.value;
		var data1 = document.AwardTender.Department_id.value;
		document.AwardTender.action='TenderAward.jsp?Division_id='+data+'&Department_id='+data1;
		document.AwardTender.submit();
		
	}
	function CheckForm(){
		if(document.AwardTender.Division_id.value == 0){
			alert("Please select Dividion ");
			return false
		}
		if(document.AwardTender.Department_id.value == 0){
			alert("Please select Department ");
			return false
		}
		if(document.AwardTender.Tender_id.value == 0){
			alert("Please select Tender No. ");
			return false
		}
		return true;
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
String condition = "";
	//Select tender no
	if(strDivision != null){
		condition += " AND DIV_ID = "+strDivId+"";
	}
	if(strDepartment != null){
		condition += " AND DEPT_ID = "+strDeptId+"";
	}
	if(condition.equals("")){
		condition = " AND DIV_ID=-100";
	}
	if(strDivId.equals("-1")){
		condition = " AND DEPT_ID = '-1' AND DIV_ID = '-1'";
	}
// Select Tender
String strTenderNo = "";
	strTenderNo = "SELECT ID,TENDER_NO FROM  CMS_TENDER_MASTER_NEW WHERE  DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') >= TENDER_OPEN_DATE AND ID NOT IN (SELECT TENDER_ID FROM CMS_TENDER_AWARD_NEW) AND STATUS = 'Active'";
	strTenderNo = strTenderNo+condition;
	
	dbBean.setQuery(strTenderNo);
	String rsGetTenderNo[][] = dbBean.getResultSet();
%>
 
<SCRIPT src="ktdv.js"></script>
<p align="center"><span class="mgContentTitle"><a href="index.jsp?selectType=4">&nbsp;&nbsp;&nbsp;Manage Awarded Tenders&nbsp;&nbsp;&nbsp;</span></a></p>

<form id="form1" name="AwardTender" action="AddTenderAward.jsp" METHOD="POST" onsubmit="return CheckForm();">
<table width="50%" border="1" align="center" class="sample">
		  	<tr> 
				<td colspan="2"  align="center"><font color="blue">
						<%if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }%></font>
				</td>
			</tr>
            <tr>
                <td colspan="2"  align="center" class="tr_bgcolor"><b>Award Tender</b></td>
            </tr>
			<tr>
                <td>Division</td>
                <td><select name="Division_id" onchange="javascript:submit_self()">
			  			<option value="0">--Select Division--</option>
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
						<option value="0">--Select Department--</option>
						<%
							for(int i=0;i<rsGetDepartment.length;i++){%>
							<option value="<%=rsGetDepartment[i][0]%>" <%if(strDeptId.equals(rsGetDepartment[i][0])){%>selected<%}%>><%=rsGetDepartment[i][1]%></option>
						<%	}
						}%>
						
					</select></td>
			 </tr>
			 <tr>
				 <td>Tender No.</td>
				 	<td><select name="Tender_id">
						<option value="0" >--Select Tender--</option>
						<%if(rsGetTenderNo.length>0){
							for(int i=0;i<rsGetTenderNo.length;i++){%>
							<option value="<%=rsGetTenderNo[i][0]%>"><%=rsGetTenderNo[i][1]%></option>
						<%}}%>
					</select></td>
			 </tr>
			               
            <tr><td>&nbsp;</td>
                <td >
                    <input type="submit" name="btnAdd" value="Award This Tender" onclick="" id="btnAdd"/>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    &nbsp; &nbsp;
                </td>
            </tr>
               
        </table>
</form>

<%@ include file="../header/footerInner.jsp" %>
