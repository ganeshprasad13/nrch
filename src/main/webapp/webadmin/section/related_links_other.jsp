<%int intPageNo =1;%>
<%@ include file="../header/headerInner.jsp" %>
	<script language="JavaScript" >
function showDiv(bollean)
{
	
		var obj = document.getElementById("D1");
		if (bollean == "true")
		{
		   obj.style.display =""; 
		}else{
		   obj.style.display ="none"; 
		}
		
	/*	var obj = document.getElementById("D1");
	//alert(obj.style.display );
		if(obj.style.display ==""){
					obj.style.display ="none"; 
			}else{
					obj.style.display =="";
			}
		*/
			
}</script>
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
query_info = "SELECT * FROM CMS_RELATED_LINKS where CRL_LANG = 0";
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();

%>
<!-- end of chk for admin access level -->

<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Related Links&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>

<div align="center">
<form name="RTEDemo" action="related_links_other_action.jsp" method="post" onsubmit="javascript:return chkform()">
	<input type="hidden" name="path" value="<%=request.getParameter("path")%>">
	<input type="hidden" name="parent" value="<%=request.getParameter("parent")%>">
<table width="100%" align=center border=0 style="border-collapse: collapse" class="textn">
<tr>
	<td  align=center height=23 colspan="2">
<div align="right"><a href="javascript:showDiv('true')" ><font color="#0000FF">Make New Entry</font></a>&nbsp;&nbsp;&nbsp;<a href="javascript:history.back();" ><font color="#0000FF">Back</font></a></div>
</td></tr></table>

<div align="left" id="D1" style="display:none">
<table width="100%" align=center border=1 style="border-collapse: collapse;" bordercolor="#111111" class="textn" >
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Manage Related Other Site Link</b><div align="right"><a href="javascript:showDiv('false')" ><font color="#0000FF">Close</font></a></div></td>
</tr>
<tr>
	<td align="right" width="50%">URL Label</td>
	<td width="50%">
	<input type="text" class="textbox" name="label0" size="30">
	</td>
</tr>
<tr>
	<td align="right" width="50%">URL Label (in hindi)</td>
	<td width="50%">
	<input type="text" class="textboxh" name="label1" size="30">
	</td>
</tr>
<tr>
	<td align="right" width="50%">URL</td>
	<td width="50%">
	<input type="text" class="textbox" name="linkurl" size="50">
	</td>
</tr>
<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Create Related Other Site Link">

</tr>
</TABLE>
<BR><BR>
</div>
<form action="related_links_other_edit.jsp" method="post">
<input type="hidden" name="backUrl" id="backUrl" value="<%=request.getRequestURI()%>?<%=request.getQueryString()%>">
<table class="texts1" width="100%" border="1" cellpadding="2" bordercolor="#111111" bgcolor="#FCF9D8"  style="border-collapse: collapse" align="left">
<tr bgcolor="#004488" style="color:white;"><td colspan="5"><b>List of Related Other Site Link</b></td></tr>
<tr bgcolor="#efefef">
	<td align="center"><b>Label</b></td>
	<td align="center"><b>URL</b></td>
	<!--- <td align="center"><b>Active</b></td> --->
	<td align="center"><b>Created</b>/<b>Updated</b></td>
	<td align="center"><b>Action</b></td>
</tr>
<%
if (getinfo.size()!=0){
for (int i=0;i<getinfo.size();i++){
%>

<tr>
	<td>
		<%=dbBean.getcell(getinfo,1,i)%>
	</td>
	<td>
	<%=dbBean.getcell(getinfo,2,i)%>
	</td>
	<!--- <td>
	<%if (dbBean.getcell(getinfo,3,i).equals("1")){
	out.print("Yes");
	}else{
	out.print("No");
	}
	%>
	</td> --->
	<td align="center">
	<%=dbBean.getcell(getinfo,4,i)+"<br>"+dbBean.getcell(getinfo,5,i)%>/<br>
	<font color="Teal"><% if(!dbBean.getcell(getinfo,6,i).equals("0")) {%>
	<%=dbBean.getcell(getinfo,6,i)+"<br>"+dbBean.getcell(getinfo,7,i)%>
	<% }else{ %>
	-
	<% } %></font>
	</td>
	<td align="left">&nbsp;&nbsp;
	<%if (dbBean.getcell(getinfo,3,i).equals("1")){%>
	<a style="color:red;" href="related_links_other_ststus.jsp?id=<%=dbBean.getcell(getinfo,0,i)%>&action=0">De-activate</a>
	<%}else{%>
	<a style="color:red;" href="related_links_other_ststus.jsp?id=<%=dbBean.getcell(getinfo,0,i)%>&action=1">Activate</a>
	<%}%>
	
	&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a style="color:red;font-size:11px;" href="related_links_other_edit.jsp?id=<%=dbBean.getcell(getinfo,0,i)%>">Edit</a>
	
	</td>
</tr>
<% 
	}
	}else{
%>
<tr>
	<td colspan="6" align="center">
	No record(s) found
	</td>
</tr>
<% } %>

</form>
</table>
<br><Br>
</div>
<%@ include file="../header/footerInner.jsp" %>