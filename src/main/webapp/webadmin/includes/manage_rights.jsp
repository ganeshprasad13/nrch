<%@ include file="../header/header1.jsp" %>
<%
Vector getinfo = new Vector();
String query_info;
query_info = "SELECT DIS_ID,DIS_LABEL,DIS_BODY FROM CMS_INCLUDE_SECTION  ";
query_info = query_info + "WHERE DIS_LANG_ID = 0 AND DIS_TYPE = 1 ";

query_info = "SELECT TEMPTBL.DIC_ID, CMS_LANGUAGE_CONTENT.DLC_LABEL,TEMPTBL.DIC_BODY, CMS_SECTION_MANAGEMENT.DSM_PARENT, TEMPTBL.DIC_LABEL FROM (SELECT     CMS_INCLUDE_SECTION.DIS_ID AS AA, CMS_INCLUDE_CONTENT.DIC_LABEL, CMS_INCLUDE_CONTENT.DIC_BODY, CMS_INCLUDE_CONTENT.DIC_LANG_ID, CMS_INCLUDE_CONTENT.DIC_ID FROM CMS_INCLUDE_SECTION, CMS_INCLUDE_CONTENT WHERE  CMS_INCLUDE_SECTION.DIS_ID = CMS_INCLUDE_CONTENT.DIC_DIS_ID AND CMS_INCLUDE_CONTENT.DIC_LANG_ID = 0) TEMPTBL RIGHT OUTER JOIN CMS_SECTION_MANAGEMENT INNER JOIN CMS_LANGUAGE_CONTENT ON CMS_SECTION_MANAGEMENT.DSM_ID = CMS_LANGUAGE_CONTENT.DLC_DSM_ID ON TEMPTBL.AA = CMS_SECTION_MANAGEMENT.DSM_RIGHT WHERE     (CMS_SECTION_MANAGEMENT.DSM_PATH = '0,135') AND (CMS_LANGUAGE_CONTENT.DLC_LANG_ID = 0)";
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();

String str0 = dbBean.getcell(getinfo,2,0);
String id0  = dbBean.getcell(getinfo,0,0);
str0 = str0.replaceAll("\"","").replaceAll("\n","").replaceAll("\r","");

query_info = "SELECT DIS_ID,DIS_LABEL,DIS_BODY FROM CMS_INCLUDE_SECTION  ";
query_info = query_info + "  WHERE DIS_LANG_ID = 1 AND DIS_TYPE = 1 ";
query_info = "SELECT TEMPTBL.DIC_ID, CMS_LANGUAGE_CONTENT.DLC_LABEL,TEMPTBL.DIC_BODY, CMS_SECTION_MANAGEMENT.DSM_PARENT, TEMPTBL.DIC_LABEL FROM (SELECT     CMS_INCLUDE_SECTION.DIS_ID AS AA, CMS_INCLUDE_CONTENT.DIC_LABEL, CMS_INCLUDE_CONTENT.DIC_BODY, CMS_INCLUDE_CONTENT.DIC_LANG_ID, CMS_INCLUDE_CONTENT.DIC_ID FROM CMS_INCLUDE_SECTION, CMS_INCLUDE_CONTENT WHERE  CMS_INCLUDE_SECTION.DIS_ID = CMS_INCLUDE_CONTENT.DIC_DIS_ID AND CMS_INCLUDE_CONTENT.DIC_LANG_ID = 1) TEMPTBL RIGHT OUTER JOIN CMS_SECTION_MANAGEMENT INNER JOIN CMS_LANGUAGE_CONTENT ON CMS_SECTION_MANAGEMENT.DSM_ID = CMS_LANGUAGE_CONTENT.DLC_DSM_ID ON TEMPTBL.AA = CMS_SECTION_MANAGEMENT.DSM_RIGHT WHERE     (CMS_SECTION_MANAGEMENT.DSM_PATH = '0,135') AND (CMS_LANGUAGE_CONTENT.DLC_LANG_ID = 1)";
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();

String str1 = dbBean.getcell(getinfo,2,0);
String id1  = dbBean.getcell(getinfo,0,0);
str1 = str1.replaceAll("\"","").replaceAll("\n","").replaceAll("\r","");

%>

<div align="center">
<form name="RTEDemo" action="manage_right_action.jsp" method="post">
	<input type="hidden" name="id0" value="<%=id0%>">
	<input type="hidden" name="id1" value="<%=id1%>">
<br>
<br>	
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Update/Edit Rights</b></td>
</tr>
<tr>
	<td colspan="2" align="center"><b>English Description</b><br>
		<textarea name=description0 rows=10 cols=50><%=str0%></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center"><br><br><br><br></td>
</tr>
<tr>
	<td colspan="2" align="center"><b>Hindi Description</b><br>
	<textarea name=description1 rows=10 cols=50><%=str1%></textarea>
	</td>
</tr>
<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Update Right"></td>
</tr>
</form> 
</table>
<br><br>
</div>
<%@ include file="../header/footer.htm" %>
<script>VISUAL=-1;</script>
<script src='../cms/quickbuild.js'></script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=0;changetoIframeEditor(document.forms[0].description0);</script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=1;changetoIframeEditor(document.forms[0].description1);</script>

