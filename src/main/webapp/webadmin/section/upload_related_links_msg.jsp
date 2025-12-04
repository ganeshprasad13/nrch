
<%@ page language="java" import="jakarta.servlet.*,java.util.*,java.io.*,org.apache.commons.fileupload.*" %>

<%@ include file="../../dbConn/dbInit.jsp" %>
<%

Vector rslevel = new Vector();
String query;
query = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT WHERE DLC_LANG_ID = 0  AND DSM_ID = DLC_DSM_ID and DSM_PARENT <> -1 and DSM_STATUS = 1 and DSM_ID IN ("+request.getParameter("secRel")+") ORDER BY DSM_PATH";
dbBean.setQuery(query);
rslevel=(Vector)dbBean.go();
String setsecurl = "";
int noofcom = 0;


Vector rsrl = new Vector();
String queryrl;
queryrl = "SELECT CRL_LABEL, CRL_URL from CMS_RELATED_LINKS ";
queryrl = queryrl + " WHERE CRL_STATUS = 1 ";
queryrl = queryrl + " and CRL_ID IN ("+request.getParameter("secRel2")+")";
queryrl = queryrl + " ORDER BY CRL_LABEL";
dbBean.setQuery(queryrl);
rsrl=(Vector)dbBean.go();


%>
<html><head>
	<title>Upload Image...</title>
	<link rel="StyleSheet" href="../../css/styles<%=request.getParameter("lang")%>.css" type="text/css">
	<script language="JavaScript">
	function updateParent()
	{	
		var sRelatedSection = "<%if(rslevel.size()!=0 || rsrl.size()!=0){for(int i=0;i<rslevel.size();i++){setsecurl = "viewsection.jsp?id="+dbBean.getcell(rslevel,2,i);noofcom = 0;StringTokenizer stDblTicketId= new StringTokenizer(dbBean.getcell(rslevel,2,i),",");while(stDblTicketId.hasMoreTokens()){noofcom = noofcom + 1;stDblTicketId.nextToken();}if (noofcom==2) {%>»<%}else{for(int iii=0;iii<noofcom-1;iii++){%>&nbsp;&nbsp;&nbsp;<%}}%><%=dbBean.getcell(rslevel,1,i)%><br><% }%><br><%for(int ii=0;ii<rsrl.size();ii++){out.print(dbBean.getcell(rsrl,0,ii)+" ("+dbBean.getcell(rsrl,1,ii)+")<br>");}%><%}else{%>None<%}%>";
		window.opener.UpdateRelatedSection(sRelatedSection);
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
<br><br>
<table align="center" width="85%" border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
<td class="textn" align="center">Related Sections Updated</td>
</tr>
<tr>
<td class="textn" align="center"><a href="javascript:updateParent();">Close This Window</a></td>
</tr>

</table>
<%@ include file="../../dbConn/dbClose.jsp" %>

</body>
</html>
