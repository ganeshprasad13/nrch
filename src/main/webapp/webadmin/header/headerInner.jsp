<!DOCTYPE html>
<html>
<head>
<%@ page session="true" %><%@ page import="java.util.*" %><%@ page import="java.io.*" %><%@ page import="java.text.*" %><%@ page import="java.sql.*"  %><% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0 
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server%>
<% 
String strSessionChk = (String)session.getAttribute("DBAusername");
//out.print("dddddddd"+strSessionChk);
if(strSessionChk == null || strSessionChk.equals("")){
	//String forwordUrl = strAppPath+"/webadmin/index.jsp";
%>
 <meta http-equiv="Content-type" content="text/html" charset="utf-8">
 <meta name="description" content="Indian Railway site which helps in enquiry ,travelling,boarding and other railway zonal activities developed by CRIS (Centre For Railway Information).You can get information related to all Zones with their divisions.">

 
 
 
<%@ page contentType="text/html; charset=UTF-8" %>

 <%response.sendRedirect("/nrch/webadmin/index.jsp"); 
 }%>
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


.*
{
	font-family:tahoma;
	font-size:11px;
	
	
}
body
{
margin:0px 2px 0px 2px;
}
#contain
{
	width:100%;
	padding:10px 0px 20px 0px;
	text-align:left;
	padding-left:10px;
	height:320px;
}
#col1
{
	float:left;
	width:188px;
	text-align:left;
	margin:0px 5px 0px 0px;
}

#col1 img
{
	margin-bottom:2px;
}
/* will become the MainContent place Holder in the inner pages */
#col2
{
	width:100%;
/*	background-color:#FDFDFD;*/
	margin-left:188px;
	padding-right:2px;
	text-align:left;
	margin:0px 5px 0px 0px;
}
/*-------------------------------------------------------------*/
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
/*the data grid table */
#datagrid
{
	width:100%;
}
#datagrid
{
	border-right:1px solid #CCCCCC;
	border-top:1px solid #CCCCCC;
}
#datagrid tr td
{
	border-left:1px solid #CCCCCC;
	border-bottom:1px solid #CCCCCC;
	padding:2px 3px 2px 3px;
}
.tdpriority
{
	width:40px;
	text-align:center;
}
.tdtype
{
	width:60px;
}
.tdaction
{
	width:120px;
	padding-left:4px;
	text-align:center;
}
.tdaction img
{
	margin-right:5px;
}
.tdHeader
{
	background-color:#EFEFEF;
	color:#333333;
	font-weight:bold;
}
/* Now the Content Drig Title */
.mgContentTitle
{	
	font-family:tahoma;
	color:#FFFFFF;
	width:100%;
	padding:5px 5px 5px 5px;
	font-size:14px;
	font-weight: bold;
	height:20px;
	vertical-align:middle;
align:center;	
}
/*each Seaction Page title can have a different Background */
.mgContentTitle
{
	background-color:#AD0900;
}
.mgMastersTitle
{
	background-color:#0086E9;
}
.mgBannersTitle
{
	background-color:#70D83D;
}
.mgUsersTitle
{
	background-color:#EE7E28;
}
#mainContent
{
	padding:0px 0px 0px 0px;
}
.linknav3
{
color:red;
}
.texts1
{
color:black;
font-size:12px;
font-family:tahoma;
}
.tr_bgcolor
{
background-color:#004488;
color:white;
}

	table.sample {
	border-width: 1px;
	border-spacing: 3px;
	border-style: solid;
	border-color: gray;
	border-collapse: collapse;
	
	font-family:tahoma;
	font-size:12px;
}
table.sample th {
	border-width: 1px;
	padding: 3px;
	border-style: dotted;
	border-color: gray;
	
	-moz-border-radius: 0px 0px 0px 0px;
	background-color:#006699;
	color:white;
}
table.sample td {
	border-width: 1px;
	padding: 3px;
	border-style: dotted;
	border-color: green;
	
	-moz-border-radius: 0px 0px 0px 0px;
}

</style>
<script language="JavaScript">
function HideContent(d) {
document.getElementById(d).style.display = "none";
}
function ShowContent(d) {	
	for(i=1;i<5;i++){
		document.getElementById('innerdiv'+i).style.display = "none";		
	}
	document.getElementById('innerdiv'+d).style.display = "block";
}
</script>
<%/* -- //updated by Aman 07-09-2014
String DepartmentID = "";

if(request.getParameter("Department_id")!=null &&  !request.getParameter("Department_id").trim().equals("")){
	DepartmentID = request.getParameter("Department_id");
}

*/
%>

	<title>Indian Railways Portal :: WCMS / <%=Title%></title>
	<link rel="StyleSheet" href="<%=strAppPath%>/css/styles0.css" type="text/css">
	<script language="javascript" type="text/javascript" src="../css/HindiTextBox.js"></script>
</head>
<BODY onLoad="waitPreloadPage();" topmargin=0 leftmargin=0 marginwidth="0">
<DIV id="prepage" style="position:absolute; font-family:arial; font-size:16; left:0px; top:0px; background-color:white; layer-background-color:white; height:100%; width:100%;"> 


<TABLE width="100%" bgcolor="ffffcc"><TR><TD align="center" height="200"><B>Please wait!</B></TD></TR></TABLE>
</DIV>
<%
String strDBAacc = (String)session.getAttribute("DBAacc");

String make_list_ofid22 = "0";
String strGetACL22 = "SELECT ACL_SECTION_ID FROM  CMS_ACL  WHERE ACL_SECTION_TYPE = 0 and ACL_USER_ID =" + session.getAttribute("DBAUserId") + " ";
Vector rsGetACLSection22 = new Vector();
dbBean.setQuery(strGetACL22);
//out.println(strGetACL22 + "<br/>");
rsGetACLSection22 = dbBean.go();
Hashtable htSectionIDs_valid22 = new Hashtable();
for (int i=0;i<rsGetACLSection22.size();i++) {
	//htSectionIDs_valid22.put(dbBean.getcell(rsGetACLSection,0,i), Integer.toString(i));
	make_list_ofid22 = make_list_ofid22 +","+dbBean.getcell(rsGetACLSection22,0,i);
}
	make_list_ofid22 = make_list_ofid22 +",0";


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
boolean bIsTenderNotice = false;
boolean bIsTenderDocument = false;
boolean bIsCorrigendum = false;
boolean bIsStoreTender = false;
boolean bIsBillStatus = false;
boolean bIsAwardedTenders = false;
boolean bIsTenderNoticeEdit = false;
boolean bIsTenderNoticeDelete = false;
boolean bIsTenderDocumentEdit = false;
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
	
	boolean bIsManageComplaint = false;
	boolean bIsManageVigilance = false;
	
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
// For core
	boolean bIsContractFinalizedAdmin = false;
	Vector rsGetACLContractFinalized = new Vector();
//End
//for all
	boolean bIsAuditTrialAdmin = false;
	Vector rsGetACLAuditTrial = new Vector();
	boolean bIsTenderDownloadLogAdmin = false;
	Vector rsGetACLTenderDownloadLog = new Vector();
	boolean bIsTenderUploadLogAdmin = false;
	Vector rsGetACLTenderUploadLog = new Vector();
//End
Vector rsGetACLTenderNotice = new Vector();
Vector rsGetACLTenderDocument = new Vector();

Vector rsGetACLManageComplaint = new Vector();

Vector rsGetACLManageVigilance = new Vector();


Vector rsGetACLCorrigendum = new Vector();
Vector rsGetACLAwardedTenders = new Vector();
Vector rsGetACLStoreTender = new Vector();
Vector rsGetACLBillStatus = new Vector();
Vector rsGetACLTenderNoticeEdit = new Vector();
Vector rsGetACLTenderNoticeDelete = new Vector();
Vector rsGetACLTenderDocumentEdit = new Vector();
//For rcf
boolean bIsStoresTenderAdmin = false;
Vector rsGetStoresTender = new Vector();
boolean bIsScrapAuctionAdmin = false;
Vector rsGetScrapAuction = new Vector();
boolean bIsDesignQualityAdmin = false;
Vector rsGetDesignQuality = new Vector();

// For rcfrbl
boolean bIsRCFRBLTenderFinalised = false;
Vector rsGetRCFRBLTenderFinalised = new Vector();
boolean bIsRCFRBLStoresTenderFinalised = false;
Vector rsGetRCFRBLStoresTenderFinalised = new Vector();
boolean bIsDesignQualityRcfRbl = false;
Vector rsGetDesignQualityRcfRbl = new Vector();

//for clw-Anurag
boolean bIsWarrantyAdmin = false;
Vector rsGetWarranty = new Vector();
boolean bIsFailFeedAdmin = false;
Vector rsGetFailFeed = new Vector();

//for dlw-kailash
boolean bIsdlwWarranty = false;
Vector rsGetdlwWarranty= new Vector();
boolean bIsdlwMutualtransfer = false;
Vector rsGetdlwMutualtransfer = new Vector();
boolean bIsdlwDrawing = false;
Vector rsGetdlwDrawing = new Vector();

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

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 20";
 rsGetACLTenderNotice = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLTenderNotice = dbBean.go();
if (rsGetACLTenderNotice.size()>0) {
		bIsTenderNotice = true;
}

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 21";
 rsGetACLTenderDocument = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLTenderDocument = dbBean.go();
if (rsGetACLTenderDocument.size()>0) {
		bIsTenderDocument = true;
}

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 771";
 rsGetACLManageComplaint = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLManageComplaint = dbBean.go();
if (rsGetACLManageComplaint.size()>0) {
		bIsManageVigilance = true;
}

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 772";
 rsGetACLManageVigilance = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLManageVigilance = dbBean.go();
if (rsGetACLManageVigilance.size()>0) {
		bIsManageComplaint = true;
}




strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 22";
 rsGetACLCorrigendum = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLCorrigendum= dbBean.go();
if (rsGetACLCorrigendum.size()>0) {
		bIsCorrigendum = true;
}

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 23";
 rsGetACLAwardedTenders = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLAwardedTenders = dbBean.go();
if (rsGetACLAwardedTenders.size()>0) {
		bIsAwardedTenders = true;
} 

strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 31";
 rsGetACLStoreTender = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLStoreTender = dbBean.go();
if (rsGetACLStoreTender.size()>0) {
		bIsStoreTender = true;
} 
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 32";
 rsGetACLBillStatus = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLBillStatus = dbBean.go();
if (rsGetACLBillStatus.size()>0) {
		bIsBillStatus = true;
} //for edit delete
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 33";
 rsGetACLTenderNoticeEdit = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLTenderNoticeEdit = dbBean.go();
if (rsGetACLTenderNoticeEdit.size()>0) {
		bIsTenderNoticeEdit = true;
}
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 34";
 rsGetACLTenderNoticeDelete = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLTenderNoticeDelete = dbBean.go();
if (rsGetACLTenderNoticeDelete.size()>0) {
		bIsTenderNoticeDelete = true;
}
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 35";
rsGetACLTenderDocumentEdit = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLTenderDocumentEdit = dbBean.go();
if (rsGetACLTenderDocumentEdit.size()>0) {
		bIsTenderDocumentEdit = true;
}
// For RCF 
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 36";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLTransferRequest = dbBean.go();
if (rsGetACLTransferRequest.size()>0) {
		bIsTransferRequestAdmin = true;
}
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 37";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLNonMovingItems = dbBean.go();
if (rsGetACLNonMovingItems.size()>0) {
		bIsNonMovingItemsAdmin = true;
}
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 38";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLManageScrap = dbBean.go();
if (rsGetACLManageScrap.size()>0) {
		bIsManageScrapAdmin = true;
}	
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 39";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLRateOfSoldlots = dbBean.go();
if (rsGetACLRateOfSoldlots.size()>0) {
		bIsRateOfSoldlotsAdmin = true;
}	
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 40";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLHospitalInformation = dbBean.go();
if (rsGetACLHospitalInformation.size()>0) {
		bIsHospitalInformationAdmin = true;
}
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 41";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLVenderDirectory = dbBean.go();
if (rsGetACLVenderDirectory.size()>0) {
		bIsVenderDirectoryAdmin = true;
}
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 42";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLContactInformation = dbBean.go();
if (rsGetACLContactInformation.size()>0) {
		bIsContactInformationAdmin = true;
}
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 43";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLOutturnPosition = dbBean.go();
if (rsGetACLOutturnPosition.size()>0) {
		bIsOutturnPositionAdmin = true;
}
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 44";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLEDTS = dbBean.go();
if (rsGetACLEDTS.size()>0) {
		bIsEDTSAdmin = true;
}
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 45";
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLMDTS = dbBean.go();
if (rsGetACLMDTS.size()>0) {
		bIsMDTSAdmin = true;
}
//for RCF end
//for CORE
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 46";
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLContractFinalized = dbBean.go();
	if (rsGetACLContractFinalized.size()>0) {
			bIsContractFinalizedAdmin = true;
	}
//End Core
strGetACL = "select distinct(ACL_SECTION_ID) from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 3";
Vector rsGetACLResponse = new Vector();
dbBean.setQuery(strGetACL);
//out.println(strGetACL + "<br/>");
rsGetACLResponse = dbBean.go();
if (rsGetACLResponse.size()>0) {
		bIsResponseAdmin = true;
}  
//For all
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 47";
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLAuditTrial = dbBean.go();
	if (rsGetACLAuditTrial.size()>0) {
			bIsAuditTrialAdmin = true;
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 48";
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLTenderDownloadLog = dbBean.go();
	if (rsGetACLTenderDownloadLog.size()>0) {
			bIsTenderDownloadLogAdmin = true;
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 49";
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLTenderUploadLog = dbBean.go();
	if (rsGetACLTenderUploadLog.size()>0) {
			bIsTenderUploadLogAdmin = true;
	}
//End
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
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 50";
	rsGetStoresTender = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetStoresTender = dbBean.go();
	if (rsGetStoresTender.size()>0) {
			bIsStoresTenderAdmin = true;
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 51";
	rsGetScrapAuction = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetScrapAuction = dbBean.go();
	if (rsGetScrapAuction.size()>0) {
			bIsScrapAuctionAdmin = true;
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 52";
	rsGetDesignQuality = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetDesignQuality = dbBean.go();
	if (rsGetDesignQuality.size()>0) {
			bIsDesignQualityAdmin = true;
	}
 
 strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 53";
	rsGetWarranty = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetWarranty = dbBean.go();
	if (rsGetWarranty.size()>0) {
			bIsWarrantyAdmin = true;
	}
 
 strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 54";
	rsGetFailFeed = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetFailFeed = dbBean.go();
	if (rsGetFailFeed.size()>0) {
			bIsFailFeedAdmin = true;
	}
 strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 55";
	rsGetRCFRBLTenderFinalised = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetRCFRBLTenderFinalised = dbBean.go();
	if (rsGetRCFRBLTenderFinalised.size()>0) {
			bIsRCFRBLTenderFinalised = true;
	}

 strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 56";
	rsGetRCFRBLStoresTenderFinalised = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetRCFRBLStoresTenderFinalised = dbBean.go();
	if (rsGetRCFRBLStoresTenderFinalised.size()>0) {
			bIsRCFRBLStoresTenderFinalised = true;
	}
	 strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 57";
	rsGetdlwWarranty = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetdlwWarranty = dbBean.go();
	if (rsGetdlwWarranty.size()>0) {
			bIsdlwWarranty = true;
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 58";
	rsGetdlwMutualtransfer = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetdlwMutualtransfer = dbBean.go();
	if (rsGetdlwMutualtransfer.size()>0) {
			bIsdlwMutualtransfer = true;
	}
	
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 60";
	rsGetdlwDrawing = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetdlwDrawing = dbBean.go();
	if (rsGetdlwDrawing.size()>0) {
			bIsdlwDrawing = true;
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 61";
	rsGetDesignQualityRcfRbl = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetDesignQualityRcfRbl = dbBean.go();
	if (rsGetDesignQualityRcfRbl.size()>0) {
			bIsDesignQualityRcfRbl = true;
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
if (strAdminAccessLevel != null && strAdminAccessLevel.equals("100")) {
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
// get info for all sections marked as DIRECT CONTENT
Vector rsdirect = new Vector();
String querydirect;
querydirect = "SELECT DSM_ID, DLC_LABEL FROM CMS_SECTION_MANAGEMENT, ";
querydirect = querydirect + " CMS_LANGUAGE_CONTENT WHERE DSM_ID=DLC_DSM_ID AND ";
querydirect = querydirect + " DSM_TYPE = 2 AND DLC_LANG_ID=0 ";
dbBean.setQuery(querydirect);
rsdirect=(Vector)dbBean.go(); 

// this is the post-login screen which alters the links shown to the user 
// depending on the authorization level of the user signing in
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/admin.css" />
</head>
<body>
	<table width="100%" border="0" cellpadding=0 cellspacing=0>
		<tr>
			<td width="86"><img src="<%=strAppPath%>/webadmin/images/titlebar_begin.gif"></td>
			<td class="top_img" style="color:white;font-family:tahoma;">
				<table width="100%" border="0">
					<tr>
						<td style="color:white;font-size:14px;" width="30%"> <%=Title%></td>
						<td style="color:yellow;font-size:11px;">Welcome to WCMS Admin Console</td>
						<td align="right" style="color:yellow;font-size:11px;">
						<a style="color:white;" href="<%=strAppPath%>/webadmin/home.jsp" ><%=session.getAttribute("DBAusername") %>'s Admin Home</a> | <a style="color:white;" href="<%=strAppPath%>/webadmin/user/chgpassword.jsp" >Change password</a> | <a style="color:white;" href="<%=strAppPath%>/index.jsp"   target="_blank">Launch site</a> | 
	<a style="color:white;" href="<%=strAppPath%>/webadmin/logout.jsp"  >Logout</a>
						</td>
					</tr>
				</table>
				
			</td>
			<td align="center" ></td>

		</tr>
	</table>
 <div align=center class="textn">
<font color=red>
<% if (request.getParameter("msg")!=null){%><%=request.getParameter("msg")%><%}%>
</font>
</div>

	<table width="100%" border="0" align="center" height="80%" valign="top" class="table_border">
		<tr>
			<td valign="top" width="100%">
				<table width="100%" border="0">
					<tr>
						<td width="210" valign="top">
						<%//
						
						//updated By Aman Kumar 07-09-2014
						//if(DepartmentID.equals("1")){} else{%>
								 
								<%@ include file="../menu.jsp"%>
						<%//}%>
							
						</td>
						<td valign="top" height="100%">
