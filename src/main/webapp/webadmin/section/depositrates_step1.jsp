<%@ include file="../header/header1.jsp" %>
<%


String right = "";
Vector getinfo = new Vector();
String query_info;
query_info = "SELECT  DSM_ID,DLC_LABEL FROM  CMS_SECTION_MANAGEMENT,CMS_LANGUAGE_CONTENT where DSM_INTEREST_TYPE = 2 and  DSM_ID = DLC_DSM_ID and DLC_LANG_ID = 0";


dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();



%>
<div align="center">
<form action="section_interact.jsp" method="post" name="RTEDemo" id="RTEDemo">
	<input type="hidden" name="id" value="<%=request.getParameter("id")%>">

<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Manage Deposit Rates</b></td>
</tr>

</table>

<br>

<table width="750" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts">
<tr bgcolor="#efefef"><td><b>Deposit Schemes</b></td>
</tr>
<%
if (getinfo.size()!=0){
for (int i=0;i<getinfo.size();i++){
%>

<tr>
	<td>
		<a href="depositrates_step1.jsp?id=<%=dbBean.getcell(getinfo,0,i)%>"><%=dbBean.getcell(getinfo,1,i)%></a>
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
</table>
<br><br>
</div>
<%@ include file="../header/footer.htm" %>