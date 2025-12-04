<%int intPageNo =4;%>
<%@ include file="../header/headerInner.jsp" %>
<script type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=200,width=550,top=250,left=250');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
</script>
<%
	Vector getinfo = new Vector();
	String query_info;
	query_info = "SELECT CT_ID, CT_LABEL, CT_CONTENT, CT_STATUS, CT_FILE,CT_CONTENT_HINDI CT_MODIFIED_BY, CT_MODIFIED_DATE FROM CMS_TICKER "; 
	dbBean.setQuery(query_info);
	getinfo=(Vector)dbBean.go();
%>
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Scrolling Text&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>
<br>
<div align="center"><br>
<p align="right"><a href="createticker.jsp" style="color:red;">Create New Ticker</a>
	</p>
<table width="100%"  align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1" cellpadding="3" cellspacing="0">
	

<%	if(getinfo.size()!=0){%>
<form name="homepageinfo" action="ticker_management_action.jsp" method="post">
	
	<tr class="tr_bgcolor">
		<td width="10%"><strong>Active Ticker(s)</strong></td>
		<tD width="20%"><strong><script type="text/javascript">loadKeyboardLayouts();</script></strong></td>
		<td width="50%"><strong>Ticker Details</strong></td>
		<td width="70%"><strong>File</strong></td>
	</tr>
<%
			for(int i=0;i<getinfo.size();i++){%>
				<tr>
					<td><input type=checkbox  name="chkTickerId" <% if(dbBean.getcell(getinfo,3,i).equals("1")){%>checked<%}%> VALUE ="<%=dbBean.getcell(getinfo,0,i)%>"></td>
					<td>
						<b>Details in English</b><br>
						<br>Details in Hindi</td>
					<td>
						<input type="text" name="content-<%=dbBean.getcell(getinfo,0,i)%>" size="70" value="<%=dbBean.getcell(getinfo,2,i)%>"><br>
						<br><input type="text" name="contenth-<%=dbBean.getcell(getinfo,0,i)%>" size="70" value="<%=dbBean.getcell(getinfo,5,i)%>" class="LblHAnswer">	
					</td>
					<td>
						<%if(dbBean.getcell(getinfo,4,i) != null && !dbBean.getcell(getinfo,4,i).equals("")){%>
							<a href="../../ticker/<%=dbBean.getcell(getinfo,4,i)%>" title="view upload file" target="_blank"><font color="blue">view upload file</font></a></>&nbsp;&nbsp;/
						<%}%>
						<a href="#" onclick="return popitup('uploadTicker.jsp?ticNo=<%=dbBean.getcell(getinfo,0,i)%>')"><font color="black">Change File</font></a>
					</td>
				</tr>
<%			}%>

	</table>
<br><div align="center">
	<input type="submit" value="Update Ticker">
<%		}else{%>
</form>	
<diV align="center" class="textb">
	<strong>No record(s) found For Ticker management</strong><br>
	<br>
	<a href="javascript:history.back()">Back</a>
	</div>
<%}%>
<br><Br>
</div>
<%@ include file="../header/footerInner.jsp" %>
