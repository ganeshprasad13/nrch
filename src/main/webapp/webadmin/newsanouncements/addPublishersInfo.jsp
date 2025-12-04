 <!-- HEADER STARTS HERE -->
<%@ include file="../header/headerInner.jsp" %>
<p align="center"><span align="center" class="mgContentTitle">Manage Press Releases Officers Information</a></span></p>

<script type="text/javaScript">
function validate(){
    //alert("Now Checking!!");
 
   /* var fileName = document.getElementById("pubSign").value;
	if(fileName.lastIndexOf(".zip")==-1 && fileName.lastIndexOf(".rar")==-1 && fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".jpeg")==-1 && fileName.lastIndexOf(".html")==-1 && fileName.lastIndexOf(".htm")==-1){
		alert("Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
		return false;
	}
	return true; */
	 /*-------------------Updated By Aman 08-05-2014----------------------*/
	var id = document.getElementById('pubSign');
	var id1 = document.getElementById("pubSign").value;

	var img = id.value;
	var n = img.match('.jsp');
	//alert(n);
	if (n == '.jsp') 
	{
	alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
	return false;
	}

	var n = img.match('.php');
	//alert(n);
	if (n == '.php') 
	{
	alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
	return false;
	}

	var n = img.match('.exe');
	//alert(n);
	if (n == '.exe') 
	{
	alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
	return false;
	}

	var n = img.match('.java');

	if (n == '.java') 
	{
	alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
	return false;
	}

	var img2 = id2.value;
	var n2 = img2.match('.jsp');
	//alert(n);
	if (n2 == '.jsp') 
	{
	alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
	return false;
	}

	var n2 = img2.match('.php');
	//alert(n);
	if (n2 == '.php') 
	{
	alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
	return false;
	}

	var n2 = img2.match('.exe');
	//alert(n);
	if (n2 == '.exe') 
	{
	alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
	return false;
	}

	var n2 = img2.match('.java');
	if (n2 == '.java') 
	{
	alert("Not Authorised , Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
	return false;
	}

	var fileName =id1.value;

	if( id1 === "" ) {
	//alert("Please upload any file.");
	}
	else{
	if(fileName.lastIndexOf(".zip")==-1 && fileName.lastIndexOf(".rar")==-1 && fileName.lastIndexOf(".pdf")==-1 && fileName.lastIndexOf(".txt")==-1 && fileName.lastIndexOf(".csv")==-1 && fileName.lastIndexOf(".doc")==-1 && fileName.lastIndexOf(".docx")==-1 && fileName.lastIndexOf(".xls")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".jpeg")==-1 && fileName.lastIndexOf(".html")==-1 && fileName.lastIndexOf(".htm")==-1){
	alert("Only pdf,txt,csv,doc,docx,xls,zip,rar,jpg,jpeg,gif,png,html,htm files can be uploaded");
	return false;
	}
	}
	
}
</script>

<form id="form1"  name="addPublishersInfo" action="addPublishersInfoAction.jsp" method="POST" enctype="multipart/form-data" >
        <table width="60%" border="1" align="center" class="sample">
			<tr>
                <td colspan="2" align="center"><font color="blue">
                   <%if(request.getParameter("strMSG")!=null){
						if(request.getParameter("strMSG").equals("1")){
						%>
						<script type="text/javascript">alert("Con't delete all ready in use.")</script>
						<%
						}else{
							out.print(request.getParameter("strMSG"));
						}
				   }%>
					</font>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="tr_bgcolor">
                    Press Release Issuing Officer Details
                </td>
            </tr>
			<tr>
                <td>Name </td>
				<td><input type="text" name="pubName"></td>
            </tr>
			<tr>
                <td>Designation</td>
				<td><input type="text" name="pubDesignation"></td>
            </tr>
			<tr>
                <td>Signature (Upload)</td>
				<td><input type="file" name="pubSign" id="pubSign" onChange="javascript:return validate();"></td>
            </tr>
            <tr>
				<td>&nbsp;</td>
                <td >
                    <input type="submit" name="Button1" value="Add"  id="Button1" onClick="javascript:return validate();" />&nbsp;&nbsp; &nbsp;&nbsp;
                    <input id="Button2" class="button" type="reset" value="reset"  />
                </td>
            </tr>
         </table>
</form>
<%
int sl=1;
String strOfficerDetails ="SELECT ID,PUB_NAME,PUB_DESIGNATION,PUB_SIGNATURE FROM CMS_PRESS_PUBLISHER_INFO WHERE STATUS = 'Active'";
	Vector officerDetails = new Vector();
	dbBean.setQuery(strOfficerDetails);
	officerDetails=(Vector)dbBean.go();
	if(officerDetails.size()>0){
%>
	<table width="80%" border="1" align="center" style="border-collapse:collapse;font-size:12px;" cellpadding="3">
	<tr>
		<td colspan="5" align="center" class="tr_bgcolor">List Of Officers </td>
    </tr>
	<tr style="background-color:#E4E4E4;"><th>S.No.</th><th>Name</th><th>Designation</th><th>Signature</th><th>Edit&nbsp;/&nbsp;Delete</th></tr>	
	<%for(int i=0;i<officerDetails.size();i++,sl++){%>	
	<tr>
		<td align="center"><%=sl%></td>
		<td><%=dbBean.getcell(officerDetails,1,i)%></td>
		<td><%=dbBean.getcell(officerDetails,2,i)%></td>
		<td><img src=../../signature/<%=dbBean.getcell(officerDetails,3,i)%> height="50" width="90" border="0"></td>
		<td align="center">
			<a href="editPublishersInfo.jsp?officerId=<%=dbBean.getcell(officerDetails,0,i)%>"><font color="black">Edit</font></a>&nbsp;&nbsp;
			/&nbsp;&nbsp;<a href="deletePublishersInfoAction.jsp?officerId=<%=dbBean.getcell(officerDetails,0,i)%>"><font color="black">Delete</font></a>
		</td>
	</tr>
<%}}%>	
	</table>

<%@ include file="../header/footerInner.jsp" %>