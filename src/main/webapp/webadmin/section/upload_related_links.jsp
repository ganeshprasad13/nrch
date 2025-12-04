<%@ page session="true" %><%@ page import="java.util.*" %><%@ page import="java.io.*" %><%@ page import="java.text.*" %><%@ page import="java.sql.*"  %>
<%@ include file="../../dbConn/dbInit.jsp" %>

<% 
String lang="";
if(request.getParameter("langid")!=null){
	if(!request.getParameter("langid").equals("")){
		lang =  request.getParameter("langid");
	}else{
		lang = "0";
	}
}else{
	lang = "0";
}
session.setAttribute("langid",lang);
Vector filesUploaded = (Vector)session.getAttribute("fileDirectUploaded");
if (filesUploaded==null) {
	filesUploaded = new Vector();
}
%>
<html>
<head>
	<title>Upload Image...</title>
	<link rel="StyleSheet" href="<%=strWebAppURL%>/css/styles<%=lang%>.css" type="text/css">
	<script language="JavaScript">
	function updateParent()
	{		
		self.window.close();
	}
	</script>
</head>

<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="4" align="center" bgcolor="#000000">
<tr>
<td class="textn"><font size="2" color="#FFFFFF"><strong>Select And Update Related Sections</strong></font></td>
</tr>
</table>
<form action="upload_related_links_action.jsp" method="post" name="frmUpload" id="frmUpload">
<input type="Hidden" name="id" value="<%=request.getParameter("id")%>">

</body>
</html>

<table align="center" width="85%" border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
<%
Vector rsrl = new Vector();
Vector rslevel = new Vector();
String query;
query = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query = query + " WHERE DLC_LANG_ID = 0 ";
query = query + " AND DSM_ID = DLC_DSM_ID and DSM_PARENT <> -1 and DSM_STATUS = 1";
query = query + " ORDER BY DSM_PATH";
dbBean.setQuery(query);
rslevel=(Vector)dbBean.go();
String setsecurl = "";
int noofcom = 0;

Vector rsRelSec = new Vector();
query = "SELECT DSM_RELATED_LINKS,DSM_RELATED_LINKS2 FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT WHERE DLC_LANG_ID = 0  AND DSM_ID = DLC_DSM_ID and DSM_PARENT <> -1 and DSM_STATUS = 1 and DSM_ID = " + request.getParameter("id") + " ORDER BY DSM_PATH";
dbBean.setQuery(query);
rsRelSec=(Vector)dbBean.go();
%>
<tr>
<td align="right" class="textn" valign="top"><b>Related Sections</b></td>
<td>
	<table width="100%" align="center">
	<tr>
     <td class="textn">
			
			<!--- To populate the all group name in the multiple selection box  --->
<%
int isrl = -1;
String xzxz = ","+dbBean.getcell(rsRelSec,0,0)+",";
String zzzz = "";
if(rslevel.size()!=0){
for(int i=0;i<rslevel.size();i++){
zzzz = ","+dbBean.getcell(rslevel,0,i)+",";
isrl = xzxz.indexOf(zzzz);

noofcom = 0;

StringTokenizer stDblTicketId= new StringTokenizer(dbBean.getcell(rslevel,2,i),",");
			while(stDblTicketId.hasMoreTokens()){	
			noofcom = noofcom + 1;
			stDblTicketId.nextToken();
}

%>		   
<% if (noofcom==2) {%><font color=red><b>»</b></font><%}else{
for(int iii=0;iii<noofcom-1;iii++){%>&nbsp;&nbsp;&nbsp;<%}}%><input type="Checkbox" name="DSM_RELATED_LINKS" <%if (isrl!=-1){%>checked<%}%>  value="<%=dbBean.getcell(rslevel,0,i)%>"><%=dbBean.getcell(rslevel,1,i)%><br>
<% 
	}
	}
%>	             


			</td>
</tr>	

</table>
</td></tr>
<%

Vector getrl = new Vector();
String query_rl;
query_rl = "SELECT CRL_ID,CRL_LABEL,CRL_URL FROM CMS_RELATED_LINKS where CRL_LANG = 0 and CRL_STATUS=1";
dbBean.setQuery(query_rl);
getrl=(Vector)dbBean.go();

%>

<tr>
<td align="right" class="textn" valign="top" ><b>Related Links</b></td>
<td class="textn">
<% 
isrl = -1;
xzxz = ","+dbBean.getcell(rsRelSec,1,0)+",";
zzzz = "";
if(getrl.size()!=0){
for(int i=0;i<getrl.size();i++){
zzzz = ","+dbBean.getcell(getrl,0,i)+",";
isrl = xzxz.indexOf(zzzz);
%>
&nbsp;&nbsp;<input type="Checkbox" name="DSM_RELATED_LINKS_other" <%if (isrl!=-1){%>checked<%}%>  value="<%=dbBean.getcell(getrl,0,i)%>"><%=dbBean.getcell(getrl,1,i)%> (<%=dbBean.getcell(getrl,2,i)%>)<br>
<% 
	}
	}
%>	
</TD>

</TR>
<tr><td colspan="2" align="center"><input type="reset" value="Reset"> <input type="Submit" value="Update"></td></tr>
</td></tr>
</table>
</form>
<%@ include file="../../dbConn/dbClose.jsp" %>