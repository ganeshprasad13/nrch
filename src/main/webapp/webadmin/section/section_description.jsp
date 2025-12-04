<% 
String strSessionChk = (String)session.getAttribute("DBAusername");
if(strSessionChk == null || strSessionChk.equals("")){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<STYLE TYPE="text/css">
<!-- /* $WEFT -- Created by: a (a) on 9/1/2004 -- */
  @font-face {
    font-family: Shusha05;
    font-style:  normal;
    font-weight: normal;
    src: url(../../SHUSHA0.eot);
  }
-->
</STYLE>
<title>Content Management Section!</title>
<link rel="StyleSheet" href="../../css/styles0.css" type="text/css">
<%

Vector getinfo = new Vector();
String query_info;
query_info = "SELECT DLC_DESCRIPTION,DLC_LANG_ID,DLC_LABEL FROM  CMS_LANGUAGE_CONTENT WHERE DLC_ID = ";
query_info = query_info + request.getParameter("id");
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();
%>
<table width="90%" class="texts" align="center">
<tr>
	<td align="center">
<div align="right" class="testn"><a href="javascript:window.close()">Close This Window</a></div>
	</td>
</tr>
</table>	
<table width="90%" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts" align="center">
<tr bgcolor="#efefef">
	<td align="center"><b>Description for "<%if (dbBean.getcell(getinfo,1,0).equals("0")){%>	
	<font class="textn">
	<%}else{%>
	<font class="hinditext">
	<%}%><%=dbBean.getcell(getinfo,2,0)%></font>"</b></td>
</tr>

<tr>
	<%if (dbBean.getcell(getinfo,1,0).equals("0")){%>	
	<td class="textn">
	<%}else{%>
	<td class="hinditext">
	<%}%>
	<%=dbBean.getcell(getinfo,0,0)%>
	</td>
</tr>
</table>	
<table width="90%" class="texts" align="center">
<tr>
	<td align="center">
<div align="right" class="testn"><a href="javascript:window.close()">Close This Window</a></div>
	</td>
</tr>
</table>
<%@ include file="../../dbConn/dbClose.jsp" %>
<%}%>
