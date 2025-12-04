<%@ include file="../header/header1.jsp" %>

<script language="JavaScript" type="text/javascript">
	function chkform()
	{
		if(document.RTEDemo.label0.value == "")
			{
			alert("Enter URL Label");
			document.RTEDemo.label0.focus();
			return false;
			}
	if(document.RTEDemo.label1.value == "")
				{				
				alert("Enter URL Label (in hindi)");
				document.RTEDemo.label1.focus();	
				return false;			
				}
				
	if(document.RTEDemo.linkurl.value == "")
				{				
				alert("Enter URL");
				document.RTEDemo.linkurl.focus();	
				return false;			
				}			
	}
	</script>

<%

Vector getinfo = new Vector();
String query_info;
query_info = "SELECT CRL_LABEL,CRL_URL FROM CMS_RELATED_LINKS where CRL_ID = "+request.getParameter("id");
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();


Vector getinfo2 = new Vector();
String query_info2;
query_info2 = "SELECT CRL_LABEL FROM CMS_RELATED_LINKS where CRL_parent_id = "+request.getParameter("id");
dbBean.setQuery(query_info2);
getinfo2=(Vector)dbBean.go();

%>
<!-- end of chk for admin access level -->
<form name="RTEDemo" action="related_links_other_edit_action.jsp" method="post" onsubmit="javascript:return chkform()">
<input type="Hidden" name="id" value="<%=request.getParameter("id")%>">


<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr><td colspan="2"><b>Edit Related Other Site Link</b></td></tr>

<tr>
	<td align="right" width="50%">URL Label</td>
	<td width="50%">
	<input type="text" class="textbox" name="label0" size="30" value="<%=dbBean.getcell(getinfo,0,0)%>">
	</td>
</tr>
<tr>
	<td align="right" width="50%">URL Label (in hindi)</td>
	<td width="50%">
	<input type="text" class="textboxh" name="label1" size="30" value="<%=dbBean.getcell(getinfo2,0,0)%>">
	</td>
</tr>
<tr>
	<td align="right" width="50%">URL</td>
	<td width="50%">
	<input type="text" class="textbox" name="linkurl" size="50" value="<%=dbBean.getcell(getinfo,1,0)%>">
	</td>
</tr>
<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Edit Related Other Site Link">

</tr>
</TABLE>

<br><br>


<%@ include file="../header/footer.htm" %>