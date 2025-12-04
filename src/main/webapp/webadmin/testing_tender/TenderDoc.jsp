<%try{%>

<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
<script type="text/javascript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<SCRIPT src="ktdv.js"></script>

<script type="text/javascript">
  	function submit_self()
	{
		var data = document.AddTenderDoc.Division_id.value;
		var data1 = document.AddTenderDoc.Tender_Type.value;
		var data2 = document.AddTenderDoc.Department_id.value;
		document.AddTenderDoc.action='TenderDoc.jsp?Division_id='+data+'&Tender_Type='+data1+'&Department_id='+data2;
		document.AddTenderDoc.submit();
		
	}
	function CheckForm(){
		if(document.AddTenderDoc.Tender_Type.value == 0){
			alert("Please select Tender Type ");
			return false
		}
		if(document.AddTenderDoc.Division_id.value == 0){
			alert("Please select Dividion ");
			return false
		}
		if(document.AddTenderDoc.Department_id.value == 0){
			alert("Please select Department ");
			return false
		}
		if(document.AddTenderDoc.Notice_id.value == 0){
			alert("Please select Notice No. ");
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
//Select tender no
String strNoticeNo = "";
	String condition = "";
	
	if(Hname.equals("swr") || Hname.equals("ner")){
		strNoticeNo = "SELECT NM.T_ID,NM.T_REF_NO FROM CMS_NOTICE_MASTER_NEW as NM WHERE  NM.STATUS = 'Active' AND T_BID_OPEN_DATE >= now()";
	}else{
	
	strNoticeNo = "SELECT NM.T_ID,NM.T_REF_NO FROM CMS_NOTICE_MASTER_NEW as NM WHERE  NM.T_ID NOT IN ( SELECT NOTICE_ID FROM cms_tender_master_new) AND NM.STATUS = 'Active'";
	
	}
	if(strTenTypeId != null){
		condition += " AND T_TENDER_TYPE = "+strTenTypeId+"";
	}
	if(strDivId != null){
		condition += " AND DIV_ID = "+strDivId+"";
	}
	if(strDeptId != null){
		condition += " AND DEPT_ID = "+strDeptId+"";
	}
	if(condition.equals("")){
		condition = " AND DIV_ID=-100";
	}
	
	if(strDivId.equals("-1")){
		condition = " AND DEPT_ID = '-1' AND DIV_ID = '-1'";
	}
	strNoticeNo =strNoticeNo+condition+ " ORDER BY NM.T_REF_NO";
	dbBean.setQuery(strNoticeNo);
	String rsGetNoticeNo[][] = dbBean.getResultSet();

%>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;<a href="index.jsp?selectType=2">Manage Tender Document</a>
&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;Add Tender Document</span></p>

<%if(Hname.equals("rlda")){%>
<form id="form1"  name="AddTenderDoc" action="SpecialAddTenderDoc.jsp" METHOD="POST" onsubmit="return CheckForm();">

<%}else{%>
<form id="form1"  name="AddTenderDoc" action="AddTenderDoc.jsp" METHOD="POST" onsubmit="return CheckForm();">
 <%}%>       
		
		
		<table width="50%" border="1" align="center" class="sample">
			<tr>
                <td colspan="2" align="center"><font color="blue">
                   <%if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }%>
					</font>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="tr_bgcolor">
                    Add Tender Document
                </td>
            </tr>
			<tr>
                <td><font color="red"><b>*&nbsp;</b></font>Tender Type</td>
                <td><select name="Tender_Type"  onchange="javascript:submit_self()">
			  			<option value="0">--Select Tender Type--</option>
						<%if(rsGetTenType.length>0){
							for(int i=0;i<rsGetTenType.length;i++){%>
							<option value="<%=rsGetTenType[i][0]%>" <%if(strTenTypeId.equals(rsGetTenType[i][0])){%>selected<%}%>><%=rsGetTenType[i][1]%></option>
						<%	}
						}%>
						
					</select></td>
			 </tr>
			 <tr>
                <td><font color="red"><b>*&nbsp;</b></font>Division</td>
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
                <td><font color="red"><b>*&nbsp;</b></font>Department</td>
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
                <td><font color="red"><b>*&nbsp;</b></font>Notice No.</td>
                <td><select name="Notice_id">
						<option value="0">--Select Notice--</option>
						<%if(rsGetNoticeNo.length>0){
							for(int i=0;i<rsGetNoticeNo.length;i++){%>
							<option value="<%=rsGetNoticeNo[i][0]%>"><%=rsGetNoticeNo[i][1]%></option>
							<%}}%>
					</select></td>
			 </tr>
			 
             <tr>
                <td align="center" colspan="4" class="style1"><br /><br />
                    <input type="submit" name="Button1" value="Add Document"  id="Button1"  />&nbsp;
                    &nbsp; &nbsp;
					<font color="red"><b>*&nbsp; Mandatory Fields</b></font>
                </td>
            </tr>
         </table>
</form>
<%@ include file="../header/footerInner.jsp" %>
<%}catch(Exception e){out.print(e);}%>