 <!-- HEADER STARTS HERE -->
<%@ include file="../header/headerInner.jsp" %>
<%
String strOfficerDetails ="SELECT ID,PUB_NAME,PUB_DESIGNATION,PUB_SIGNATURE FROM CMS_PRESS_PUBLISHER_INFO WHERE ID="+request.getParameter("officerId")+"";
	Vector officerDetails = new Vector();
	dbBean.setQuery(strOfficerDetails);
	officerDetails=(Vector)dbBean.go();
	if(officerDetails.size()>0){
%>
<p align="center"><span align="center" class="mgContentTitle"><a href="addPublishersInfo.jsp">Manage Press Releases Officers Information</a>>> Edit Information</span></p>
<br><br>

<script type="text/javaScript">
function validate(){
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

<form id="form1"  name="editPublishersInfo" action="editPublishersInfoAction.jsp" method="POST" enctype="multipart/form-data" >
        <input type="hidden" name="officerId" value="<%=dbBean.getcell(officerDetails,0,0)%>">
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
                    Add Publishers Information
                </td>
            </tr>
			<tr>
                <td>Name </td>
				<td><input type="text" name="pubName" value="<%=dbBean.getcell(officerDetails,1,0)%>"></td>
            </tr>
			<tr>
                <td>Designation</td>
				<td><input type="text" name="pubDesignation" value="<%=dbBean.getcell(officerDetails,2,0)%>"></td>
            </tr>
			<tr>
                <td>Signature</td>
				<td><input type="file" name="pubSign" id="pubSign" onChange="javascript:return validate();"><img src=../../signature/<%=dbBean.getcell(officerDetails,3,0)%> height="50" width="90" border="0"></td>
            </tr>
            <tr>
				<td>&nbsp;</td>
                <td ><br /><br />
                    <input type="submit" name="Button1" value="Add"  id="Button1" onClick="javascript:return validate();" />&nbsp;&nbsp; &nbsp;&nbsp;
                    <input id="Button2" class="button" type="reset" value="reset"  />
                </td>
            </tr>
         </table>
</form>
<%}%>

<%@ include file="../header/footerInner.jsp" %>