<%@ page session="true" %><%@ page import="java.util.*" %><%@ page import="java.io.*" %><%@ page import="java.text.*" %><%@ page import="java.sql.*"  %><% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0 
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server %>
<% 
String strSessionChk = (String)session.getAttribute("DBAusername");
if(strSessionChk == null || strSessionChk.equals("")){%>
<jsp:forward page="/webadmin/index.jsp">
<jsp:param name="msgId" value="Invalid%20Session"/>
</jsp:forward>
<%}%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<SCRIPT TYPE="text/javascript" LANGUAGE="javascript">
<!-- PreLoad Wait - Script -->
<!-- 
function waitPreloadPage() { //DOM
	if (document.getElementById){
		document.getElementById('prepage').style.visibility='hidden';
	}else{
		if(document.layers){ //NS4
			document.prepage.visibility = 'hidden';
		}else { //IE4
			document.all.prepage.style.visibility = 'hidden';
		}
	}
}
// End -->
</SCRIPT>
<style type="text/css">
	*
	{
		font-family: Tahoma,Verdana, Geneva, Arial, Helvetica, sans-serif;
		font-size:11px;
		letter-spacing:1px;
	}
	body
	{
		margin:0px 2px 0px 2px;
	}
	#contain
	{
		width:100%;
		padding:10px 0px 20px 0px;
		text-align:center;
		padding-left:10px;
		height:320px;
	}
	#col1, #col2, #col3 , #col4
	{
		float:left;
		width:188px;
		width:24%;
		padding-right:2px;
		text-align:left;
		margin:0px 0px 0px 0px;

	}
	#innerdiv1, #innerdiv2, #innerdiv3, #innerdiv4
	{
		width:188px;
		padding:0px 2px 0px 2px;
		text-align:left;
		height:250px;
		display:none;
		margin:0px 0px 0px 0px;
		position:relative;
		top:-2px;
	}
	.header
	{
		color:#4564A4;
		font-family:Microsoft Sans Serif;
		letter-spacing:0.5px;
		font-size:12px;
		margin:0px 0px 0px 0px;
	}
	.links
	{
		margin:5px 0px 10px -2px;
		list-style-type:none;
		list-style-image: url('images/bullet.gif');
		list-style-position: inside;
	}
	.links li
	{
		margin-bottom:3px;
	}
		.links li a:link,a:visited
	{
		color:#A22221;
		text-decoration:none;
	}
		.links li a:hover
	{
		color:#4564A4;
		text-decoration:underline;
	}

	#footer
	{
		margin-top:20px;
		clear:both;
	}
</style>
<html>
<head>
	<title>Indian Railways Portal :: WCMS / Northern Railways</title>
	<link rel="StyleSheet" href="<%=strAppPath%>/css/styles0.css" type="text/css">
</head>
<BODY onLoad="waitPreloadPage();" topmargin=0 leftmargin=0 marginwidth="0">
<DIV id="prepage" style="position:absolute; font-family:arial; font-size:16; left:0px; top:0px; background-color:white; layer-background-color:white; height:100%; width:100%;"> 
<meta http-equiv="Content-Type" content="text/html; charset=x-user-defined">
<meta name="description" content="Indian Railway site which helps in enquiry ,travelling,boarding and other railway zonal activities developed by CRIS (Centre For Railway Information).You can get information related to all Zones with their divisions.">





<TABLE width=100% bgcolor="ffffcc"><TR><TD align="center" height="200"><B>Please wait!</B></TD></TR></TABLE>
</DIV>
<%
Vector rsGetToplevel = new Vector();
String strGetToplevel = "";
String make_list_ofid = "0";

boolean bIsResponseAdmin = false;
boolean bIsSectionAdmin = false;
boolean bIsDirectContentAdmin = false;
boolean bIsBannerAdmin = false;
boolean bIsInterestAdmin = false;
boolean bIsLocatorAdmin = false;
boolean bIsATMLocatorAdmin = false;
boolean bIsBranchLocatorAdmin = false;
boolean bIsUserAdmin = false;
boolean bIsRightMenuAdmin = false;
boolean bIsHighlightAdmin = false;

boolean bIsForexBranchAdmin = false;
boolean bIsForeignBranchAdmin = false;

// for RCF only
	boolean bIsTransferRequestAdmin = false;
	boolean bIsNonMovingItemsAdmin = false;
	boolean bIsManageScrapAdmin = false;
	boolean bIsRateOfSoldlotsAdmin = false;
	boolean bIsHospitalInformationAdmin = false;
	boolean bIsVenderDirectoryAdmin = false;
	boolean bIsContactInformationAdmin = false;
	boolean bIsOutturnPositionAdmin = false;
	boolean bIsEDTSAdmin = false;
	boolean bIsMDTSAdmin = false;
	
	Vector rsGetACLTransferRequest = new Vector();
	Vector rsGetACLNonMovingItems = new Vector();
	Vector rsGetACLManageScrap = new Vector();
	Vector rsGetACLRateOfSoldlots = new Vector();
	Vector rsGetACLHospitalInformation = new Vector();
	Vector rsGetACLVenderDirectory = new Vector();
	Vector rsGetACLContactInformation = new Vector();
	Vector rsGetACLOutturnPosition = new Vector();	
	Vector rsGetACLEDTS = new Vector();	
	Vector rsGetACLMDTS = new Vector();	
// for RCF only end

String strLanguageOption = "0";		// 1 = all language, 2 only english, 3 = only Marathi..

Vector rsLanguageOption = new Vector();
String strLanguageOptionQry = "SELECT DAU_ID, DAU_LOGIN, IFNULL(DAU_LANGUAGE_OPTION,0) as DAU_LANGUAGE_OPTION FROM CMS_ADMIN_USER WHERE DAU_ID=" + session.getAttribute("DBAUserId");
dbBean.setQuery(strLanguageOptionQry);
rsLanguageOption = dbBean.go();
if(rsLanguageOption.size()>0){
	strLanguageOption = dbBean.getcell(rsLanguageOption,2,0);
}

String strGetACL = "select distinct(CMS_ACL.ACL_SECTION_ID) from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 1";
Vector rsGetACLLocator = new Vector();
dbBean.setQuery(strGetACL);
//out.println(strGetACL + "<br/>");
rsGetACLLocator = dbBean.go();
if (rsGetACLLocator.size()>0) {
	bIsLocatorAdmin = true;
	for (int i=0;i<rsGetACLLocator.size();i++) {
		String strLocatorTest = dbBean.getcell(rsGetACLLocator,0,i);
		if (strLocatorTest.equals("1")) {
			bIsBranchLocatorAdmin = true;
		}
		if (strLocatorTest.equals("0")) {
			bIsATMLocatorAdmin = true;
		}
	}
}

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 2";
Vector rsGetACLBanner = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLBanner = dbBean.go();
if (rsGetACLBanner.size()>0) {
		bIsBannerAdmin = true;
}

strGetACL = "select distinct(ACL_SECTION_ID) from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 3";
Vector rsGetACLResponse = new Vector();
dbBean.setQuery(strGetACL);
//out.println(strGetACL + "<br/>");
rsGetACLResponse = dbBean.go();
if (rsGetACLResponse.size()>0) {
		bIsResponseAdmin = true;
}  

Hashtable htResponse = new Hashtable();
for (int i=0;i<rsGetACLResponse.size();i++) {
	htResponse.put(dbBean.getcell(rsGetACLResponse,0,i), Integer.toString(i));
	//out.println(dbBean.getcell(rsGetACLSection,0,i) + "<br/>");
}

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 4";
Vector rsGetACLinterest = new Vector();
dbBean.setQuery(strGetACL);
//out.println(strGetACL + "<br/>");
rsGetACLinterest = dbBean.go();
if (rsGetACLinterest.size()>0) {
	bIsInterestAdmin = true;
}  

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 5";
Vector rsGetACLUser = new Vector();
dbBean.setQuery(strGetACL);
//out.println(strGetACL + "<br/>");
rsGetACLUser = dbBean.go();
if (rsGetACLUser.size()>0) {
	bIsUserAdmin = true;
} 

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 6";
Vector rsGetACLRtMenu = new Vector();
dbBean.setQuery(strGetACL);
//out.println(strGetACL + "<br/>");
rsGetACLRtMenu = dbBean.go();
if (rsGetACLRtMenu.size()>0) {
	bIsRightMenuAdmin = true;
}

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 7";
Vector rsGetHighlight = new Vector();
dbBean.setQuery(strGetACL);
//out.println(strGetACL + "<br/>");
rsGetHighlight = dbBean.go();
if (rsGetHighlight.size()>0) {
	bIsHighlightAdmin = true;
}   
 
strGetACL = "SELECT DSM_PATH,DSM_ID FROM CMS_SECTION_MANAGEMENT INNER JOIN CMS_ACL ON CMS_SECTION_MANAGEMENT.DSM_ID = CMS_ACL.ACL_SECTION_ID WHERE (CMS_SECTION_MANAGEMENT.DSM_TYPE = 1) AND CMS_ACL.ACL_SECTION_TYPE=0 AND (CMS_ACL.ACL_USER_ID =" + session.getAttribute("DBAUserId") + ") order by DSM_PATH";
Vector rsGetACLSection = new Vector();
dbBean.setQuery(strGetACL);
//out.println(strGetACL + "<br/>");
rsGetACLSection = dbBean.go();
Hashtable htSectionIDs_valid = new Hashtable();
for (int i=0;i<rsGetACLSection.size();i++) {
	htSectionIDs_valid.put(dbBean.getcell(rsGetACLSection,1,i), Integer.toString(i));
	make_list_ofid = make_list_ofid +","+dbBean.getcell(rsGetACLSection,0,i);
}
	make_list_ofid = make_list_ofid +",0";
strGetToplevel = "select distinct(CMS_SECTION_MANAGEMENT.DSM_ID) from CMS_SECTION_MANAGEMENT where DSM_ID in ("+make_list_ofid+")";
dbBean.setQuery(strGetToplevel);
rsGetToplevel = dbBean.go();

if (rsGetToplevel.size()>0) {
		bIsSectionAdmin = true;
}

strGetACL = "SELECT distinct(CMS_ACL.ACL_SECTION_ID) FROM CMS_SECTION_MANAGEMENT INNER JOIN CMS_ACL ON CMS_SECTION_MANAGEMENT.DSM_ID = CMS_ACL.ACL_SECTION_ID WHERE (CMS_SECTION_MANAGEMENT.DSM_TYPE = 2) AND CMS_ACL.ACL_SECTION_TYPE=0 AND (CMS_ACL.ACL_USER_ID =" + session.getAttribute("DBAUserId") + ")";
Vector rsGetACLDC = new Vector();
dbBean.setQuery(strGetACL);
//out.println(strGetACL + "<br/>");
rsGetACLDC = dbBean.go();
if (rsGetACLDC.size()>0) {
		bIsDirectContentAdmin = true;
}
Hashtable htSectionIDs = new Hashtable();
for (int i=0;i<rsGetToplevel.size();i++) {
	htSectionIDs.put(dbBean.getcell(rsGetToplevel,0,i), Integer.toString(i));
	//out.println(dbBean.getcell(rsGetACLSection,0,i) + "<br/>");
}

String strAdminAccessLevel = (String) session.getAttribute("DBAacc");
if (strAdminAccessLevel.equals("100")) {
	bIsResponseAdmin = true;
	bIsSectionAdmin = true;
	bIsDirectContentAdmin = true;
	bIsBannerAdmin = true;
	bIsInterestAdmin = true;
	bIsLocatorAdmin = true;
	bIsATMLocatorAdmin = true;
	bIsBranchLocatorAdmin = true;
	bIsUserAdmin = true;
	bIsRightMenuAdmin = true;
	bIsHighlightAdmin = true;
}
%>

<div align=center class="textn">
<font color=red>
<% if (request.getParameter("msg")!=null){%><%=request.getParameter("msg")%><%}%>
</font>
</div>


<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/admin.css" />
</head>
<body>
	<table width="100%" border="0" cellpadding=0 cellspacing=0>
		<tr>
			<td width="86"><img src="../images/titlebar_begin.gif"></td>
			<td class="top_img" style="color:white;font-family:arial;font-size:16px;">
				<table width="100%" border="0">
					<tr>
						<td style="color:white;font-size:14px;">Northern Railway</td>
						<td style="color:yellow;">Welcome to WCMS Admin Console</td>
						<td style="color:#A4CCFF;font-size:12px;font-family:arial;" align="right">
						<a href="<%=strAppPath%>/webadmin/home.jsp" class="linknav3"><%=session.getAttribute("DBAusername") %>'s Admin Home</a> | <a href="<%=strAppPath%>/webadmin/user/chgpassword.jsp" class="linknav3">Change password</a> | <a href="<%=strAppPath%>/index.jsp"  class="linknav3" target="_blank">Launch site</a> | 
	<a href="<%=strAppPath%>/webadmin/logout.jsp"  class="linknav3">Logout</a>
						</td>
					</tr>
				</table>
				
			</td>

		</tr>
	</table>
	<table width="100%" border="0" align="center" height="80%" valign="top" class="table_border">
		
		
		<tr>
			<td valign="top">
				<table width="100%" border="0">
					<tr>
						<td style="border-right:1px dotted gray;background-color:#004488;" width="20%" valign="top">
							

						</td>
						<td valign="top" height="100%">


 