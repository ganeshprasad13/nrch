<%@ include file="../header/headerInner.jsp" %>

<script type="text/javascript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/default.css" type="text/css" media="screen"></link>
<SCRIPT src="ktdv.js"></script>

<script type="text/javascript">
  	function submit_self()
	{
		var data = document.corriSearch.Division_id.value;
		var data1 = document.corriSearch.Department_id.value;
		document.corriSearch.action='searchCorri.jsp';
		document.corriSearch.submit();
		
	}
	function checkType(id){
		if(id == 1){
			document.getElementById("nid").style.display="";
			document.getElementById("tid").style.display="none";
		}
		if(id == 2){
			document.getElementById("nid").style.display="none";
			document.getElementById("tid").style.display="";
		}
	}
	function popitup(url) {
		newwindow=window.open(url,'name','height=200,width=550,top=250,left=250');
		if (window.focus) {
			newwindow.focus()
		}
		return false;
	}
</script>
<% // For delete Corrigendum
String strComMess ="";
	if(request.getParameter("action") != null && request.getParameter("action").equals("del")){
		String strNotId = request.getParameter("corriId");
		String strTenderDelete = "UPDATE CMS_CORRIGENDUM_NEW SET STATUS ='DeActive' WHERE ID ="+strNotId+"";
		dbBean.setQuery(strTenderDelete);
		dbBean.go1();
		strComMess = "Record Deleted Successfully";
		String actype = "0";
	String acmsg = "DeleteCorrigendum";
	String acdescription =  session.getAttribute("DBAusername") + " login for Delete Corrigendum information ";
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
String noticeId  = "-100";
if(request.getParameter("noticeId")!=null &&  !request.getParameter("noticeId").trim().equals("")){
	noticeId = request.getParameter("noticeId");
}
String tenderId  = "-100";
if(request.getParameter("tenderId")!=null &&  !request.getParameter("tenderId").trim().equals("")){
	tenderId = request.getParameter("tenderId");
}
String Corri_Type  = "-100";
if(request.getParameter("Corri_Type")!=null &&  !request.getParameter("Corri_Type").trim().equals("")){
	Corri_Type = request.getParameter("Corri_Type");
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

%>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;<a href="index.jsp?selectType=3">Manage Corrigendum</a>
&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;Search Corrigendum</span></p>
<form id="Tender"  name="Tender" action="#" method="post" ><br>

</form>
<form id="form1"  name="corriSearch" action="searchCorri.jsp" METHOD="POST" >
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
			<b>Search Corrigendum Division and Departments</b><br><br>
			<table width="100%" border="0" align="center" class="tender_font" style="font-size:12px;">
				 <tr>
					<td>Division</td>
					<td><select id="Division_id" name="Division_id" onchange="javascript:submit_self()">
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
					<td><select name="Department_id" onchange="javascript:submit_self()">
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
					<td><font color="red"><b>*&nbsp;</b></font>Corrigendum For </td>
					<td><input type="radio"  name="Corri_Type" value="1" onclick="checkType('1')" <%if(Corri_Type.equals("1")){out.print("checked");}%>>Notice &nbsp;&nbsp;
						<input type="radio" name="Corri_Type" value="2" onclick="checkType('2')" <%if(Corri_Type.equals("2")){out.print("checked");}%>>Tender &nbsp;&nbsp;
					</td>
				</tr>
				 <%
					String strNotice = "SELECT T_ID,DIV_ID,DEPT_ID,T_REF_NO FROM CMS_NOTICE_MASTER_NEW WHERE DIV_ID="+strDivId+" AND DEPT_ID="+strDeptId+" AND STATUS = 'Active' ORDER BY T_REF_NO";
					dbBean.setQuery(strNotice);
					//out.print(strNotice);
					String rsGetNoticDetails[][] = dbBean.getResultSet();
					String strTender = "SELECT ID,DIV_ID,DEPT_ID,TENDER_NO FROM CMS_TENDER_MASTER_NEW WHERE DIV_ID="+strDivId+"  AND DEPT_ID="+strDeptId+" AND STATUS = 'Active' ORDER BY TENDER_NO";
					dbBean.setQuery(strTender);
					//out.print(strTender);
					String rsGetTenderDetails[][] = dbBean.getResultSet();
				 %>
				 <tr id="nid" <%if(request.getParameter("Corri_Type") != null && request.getParameter("Corri_Type").equals("1")){%><%}else{%>style="display:none"<%}%>>
					<td>Notice NO.</td>
					<td><select name="noticeId" >
							<%if(rsGetNoticDetails.length > 0){%>
							<option value="">-Select Notice No-</option>
							<%for(int k=0;k<rsGetNoticDetails.length;k++){%>
								<option value="<%=rsGetNoticDetails[k][0]%>" <%if(noticeId.equals(rsGetNoticDetails[k][0])){%>selected<%}%>><%=rsGetNoticDetails[k][3]%></option>
							<%}}%>
						</select></td>
				 </tr>
				 <tr id="tid" <%if(request.getParameter("Corri_Type") != null && request.getParameter("Corri_Type").equals("2")){%><%}else{%>style="display:none"<%}%>>
					<td>Tender No.</td>
					<td><select name="tenderId" >
							<%if(rsGetTenderDetails.length > 0){%>
							<option value="">-Select Tender No.-</option>
							<%for(int k=0;k<rsGetTenderDetails.length;k++){%>
								<option value="<%=rsGetTenderDetails[k][0]%>" <%if(tenderId.equals(rsGetTenderDetails[k][0])){%>selected<%}%>><%=rsGetTenderDetails[k][3]%></option>
							<%}}%>
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
	//out.print(request.getParameter("Corri_Type"));
	String strCorri = "SELECT * FROM CMS_CORRIGENDUM_NEW WHERE NOTICE_TENDER_ID = "+noticeId+" ";
		if(request.getParameter("Corri_Type") != null && request.getParameter("Corri_Type").equals("1")){
			strCorri = "SELECT ID,FILE_ENG,DATE_FORMAT(CREATED_ON,'%d-%m-%Y') FROM CMS_CORRIGENDUM_NEW WHERE NOTICE_TENDER_ID = "+noticeId+" AND TYPE_ID = "+Corri_Type+" AND STATUS = 'Active'";
		}
		if(request.getParameter("Corri_Type") != null && request.getParameter("Corri_Type").equals("2")){
			strCorri = "SELECT ID,FILE_ENG,DATE_FORMAT(CREATED_ON,'%d-%m-%Y') FROM CMS_CORRIGENDUM_NEW WHERE NOTICE_TENDER_ID = "+tenderId+" AND TYPE_ID = "+Corri_Type+" AND STATUS = 'Active'";
		}
	dbBean.setQuery(strCorri);
	//out.print(strCorri);
	String rsGetCorriDetails[][] = dbBean.getResultSet();
%>
<table border="1" align="center" class="sample" width="100%">
	<tr>
		<th>View file</th><th>Upload Date</th><th>Edit</th><th>Delete</th>
	</tr>
	<%
		if(request.getParameter("Corri_Type") != null && !request.getParameter("Corri_Type").equals("")){
		if(rsGetCorriDetails.length>0){
			for(int l=0;l<rsGetCorriDetails.length;l++){%>
			<tr>
				<td><a href="../../<%=Hname%>/corrigendum/<%=rsGetCorriDetails[l][1]%>" target="_blank"><font color="black">View Upload File</font></a></td>
				<td><%=rsGetCorriDetails[l][2]%></td>
				<td><a href="#" onclick="return popitup('editCorrigendum.jsp?corriId=<%=rsGetCorriDetails[l][0]%>')"><font color="black">Edit</font></a></td>
				<td><a href="searchCorri.jsp?corriId=<%=rsGetCorriDetails[l][0]%>&action=del"><font color="black">Delete</font></a></td>
			</tr>
			<%}
	}}%>
</table>
        



<%@ include file="../header/footerInner.jsp" %>