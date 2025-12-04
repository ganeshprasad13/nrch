<%@ include file="../header/header1.jsp" %>
<%
Vector getinfo = new Vector();
String query_info;
query_info = "SELECT DIS_ID,DIS_LABEL,DIS_BODY FROM CMS_INCLUDE_SECTION  ";
query_info = query_info + "WHERE DIS_LANG_ID = 0 AND DIS_TYPE = 0 ";
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();

String str0 = dbBean.getcell(getinfo,2,0);
String id0  = dbBean.getcell(getinfo,0,0);
str0 = str0.replaceAll("\"","").replaceAll("\n","").replaceAll("\r","");

query_info = "SELECT DIS_ID,DIS_LABEL,DIS_BODY FROM CMS_INCLUDE_SECTION  ";
query_info = query_info + "  WHERE DIS_LANG_ID = 1 AND DIS_TYPE = 0 ";
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();

String str1 = dbBean.getcell(getinfo,2,0);
String id1  = dbBean.getcell(getinfo,0,0);
str1 = str1.replaceAll("\"","").replaceAll("\n","").replaceAll("\r","");
%>

<div align="center">
<form name="RTEDemo" action="manage_footer_action.jsp" method="post" onsubmit="return submitForm();">
	<input type="hidden" name="id0" value="<%=id0%>">
	<input type="hidden" name="id1" value="<%=id1%>">
<br>
<br>	
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Update/Edit Footer</b></td>
</tr>
<tr>
	<td colspan="2" align="center"><b>Description</b><br>
<script language="JavaScript" type="text/javascript">
<!--
function submitForm() {

	//make sure hidden and iframe values are in sync before submitting form
	//to sync only 1 rte, use updateRTE(rte)
	//to sync all rtes, use updateRTEs
	//updateRTE('description');
	updateRTEs();
//	alert("description = " + document.RTEDemo.rte1.value);
	
	//change the following line to true to submit form
	
	
	var el = document.RTEDemo.elements;			
		for(var i = 0 ; i < el.length ; ++i) {			
			var getname = el[i].name;
			
			out = "\'";
			add = "&#39;";
			temp = "" + el[i].value;
			while (temp.indexOf(out)>-1) {
			pos= temp.indexOf(out);
			temp = "" + (temp.substring(0, pos) + add + 
			temp.substring((pos + out.length), temp.length));
			}
			outt = "\"";
			addd = "&quot;";
			tempp = "" + temp;
			while (tempp.indexOf(outt)>-1) {
			poss= tempp.indexOf(outt);
			tempp = "" + (tempp.substring(0, poss) + addd + 
			tempp.substring((poss + outt.length), tempp.length));
			}
			el[i].value = tempp;
			//alert(el[i].value);
		
		 }
	
	return true;
}

//Usage: initRTE(imagesPath, includesPath, cssFile)
initRTE("images/", "", "");
//-->
</script>
<noscript><p><b>Javascript must be enabled to use this form.</b></p></noscript>

<script language="JavaScript" type="text/javascript">
<!--
//Usage: writeRichText(fieldname, html, width, height, buttons)
writeRichText('description0', '<%=str0%>', 450, 150, true, false);
document.writeln('</td></tr><tr><td colspan=2 align=center><b>Description in Hindi</b><br>');
writeRichText('description1', '<%=str1%>', 450, 150, true, false);
//-->
</script>
	</td>
</tr>

<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Update Footer"></td>
</tr>
</form> 
</table>
<br><br>
</div>
<%@ include file="../header/footer.htm" %>

