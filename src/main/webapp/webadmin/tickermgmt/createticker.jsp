<%int intPageNo =1;%>
<%@ include file="../header/headerInner.jsp" %>
<br>
<span class="mgContentTitle">Ticker Management&nbsp;&raquo;Create Ticker</span>
<div align="center"><br>
<table width="100%"  align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn" cellpadding="2" cellspacing="2">
<form name="homepageinfo" action="createticker_action.jsp" method="post">
	
	<tr>
		<td><strong>Ticker Details English</strong></td>
		<td><input type="text" name="txtcontent" size="100" ></td>
	</tr>
	<tr>	
		<tD><strong>Ticker Details Hindi</strong></td>
		<td><input type="text" name="txtTickerLabel"  size="100" class="LblHAnswer"><script type="text/javascript">loadKeyboardLayouts();</script></td>
	</tr>
	<tr>
		<td colspan="2"><strong>Please tick if this is an active ticker</strong><input type="Checkbox" name="chkActive" value="1"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">	<input type="submit" value="Create Ticker"><input type=reset></td>	
	</tr>
</form>	
</table>
<br><Br>
</div>
<%@ include file="../header/footerInner.jsp" %>
