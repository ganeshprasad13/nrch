<%@ include file="../dbConn/dbInit.jsp" %>
<HTML>
	<HEAD>
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta name="description" content="Indian Railway site which helps in enquiry ,travelling,boarding and other railway zonal activities developed by CRIS (Centre For Railway Information).You can get information related to all Zones with their divisions.">

	
	<TITLE>Indian Railways Corporate Portal :: Northern Railways</TITLE>
</HEAD>
<script language="JavaScript" src="<%=strAppPath%>/javascripts/sbankJavascript.js" type="text/javascript"></script>
<%
	String lang="0";
	if(request.getParameter("lang")!=null){
		if(!request.getParameter("lang").equals("")){
			lang =  request.getParameter("lang");
		}else{
			lang = "0";
		}
	}else{
		lang = "0";
	}
	String strSectionSelected = request.getParameter("id");
	if(strSectionSelected==null || "".equals(strSectionSelected)) {
		strSectionSelected = "0";
	}

//chekc for the sectionid if it is correct or not. iof wrong redirect back to home page
	Vector rsChkSectionId = new Vector();
	String strChkSectionId;
	strChkSectionId = "SELECT DSM_PATH,DLC_LABEL FROM CMS_LANGUAGE_CONTENT, CMS_SECTION_MANAGEMENT WHERE DSM_PATH <> '0' AND DLC_DSM_ID = DSM_ID AND DSM_PATH = '" + strSectionSelected + "' AND DSM_STATUS = 1  AND DLC_LANG_ID ="+lang;
	dbBean.setQuery(strChkSectionId);
	rsChkSectionId = (Vector)dbBean.go();
	if(rsChkSectionId.size()==0 && ! strSectionSelected.equals("0")) {%>
	
	<script>
		window.location="index.jsp";
	</script>
<%	}else{
		if (lang.equals("1")){%>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%		}else{%>
			<meta http-equiv="Content-type" content="text/html">
<%		} %>
<script>
function over1(src,num,id){
	if (id==1) {src.bgColor="#FFFFFF";}
	if (id==2) {src.bgColor="#000000";}
	document.getElementById(num).style.visibility='visible';
}

function out1(src,num,id){
	if (id==1) {src.bgColor="#000000";src.style.font.color="#FFFFFF";}
	if (id==2) {src.bgColor="#FFFFFF";}
	document.getElementById(num).style.visibility='hidden';
}
</script>


<link href="<%=strAppPath%>/css/styles0.css" rel="stylesheet" type="text/css">


<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">


	<table border="0" cellspacing="0" width="900" id="table2" cellpadding="0" height="70" align="center">
		<tr>
			<td><img src="images/logo.jpg" width="900"></td>
		</tr>
	</table>

<table cellpadding="0" cellspacing="0" align="center" width="770"><tr><td width="7">
			<img border="0" src="images/navbg.gif" width="7" height="30"></td><td valign="top" bgcolor="#FAA818" class="textw"><%@ include file="../incmenu.jsp" %>&nbsp;</td>
<td width="7"><img border="0" src="images/navbgrt.gif" width="7" height="30"></td></tr></table>
<!-- HEADER ENDS HERE -->


<hr><hr><hr>