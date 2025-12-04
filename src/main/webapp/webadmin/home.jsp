
<%@ page session="true" %><%@ page import="java.util.*" %><%@ page import="java.io.*" %><%@ page import="java.text.*" %><%@ page import="java.sql.*"  %><% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0 
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server %>
<% 
String strSessionChk = (String)session.getAttribute("DBAusername");
String strDBAacc = (String)session.getAttribute("DBAacc");
if(strSessionChk == null || strSessionChk.equals("")){%>
<jsp:forward page="index.jsp">
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
	<title>Indian Railways Portal :: WCMS / <%=Title%></title>
	<link rel="StyleSheet" href="<%=strAppPath%>/css/styles05.css" type="text/css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">
</script>
<script>
var testURL = window.location.href;
var first = getUrlVars()["editId"];
function getUrlVars() {
var vars = {};
var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
vars[key] = value;
});
return vars;
}
var newURL = testURL.match(new RegExp("[^?]+"));
window.history.pushState("", "",newURL);

//used for back button
jQuery(document).ready(function($) {

      if (window.history && window.history.pushState) {

        $(window).on('popstate', function() {
          var hashLocation = location.hash;
          var hashSplit = hashLocation.split("#!/");
          var hashName = hashSplit[1];

          if (hashName !== '') {
            var hash = window.location.hash;
            if (hash === '') {
           //   give link url from where link clicked
                 window.location.href = "home.jsp";
                return false;
            }
          }
        });
        window.history.pushState('forward', null, './#forward');
      }

    });

</script>	<script type="text/javascript" language="javascript">   
function disableBackButton()
{
window.history.forward()
}  
disableBackButton();  
window.onload=disableBackButton();  
window.onpageshow=function(evt) { if(evt.persisted) disableBackButton() }  
window.onunload=function() { void(0) }  
</script>
<!--<script>
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>

<script>
    history.forward();
</script>
-->
</head>
<BODY onLoad="waitPreloadPage();" topmargin=0 leftmargin=0   marginwidth="0">
<DIV id="prepage" style="position:absolute; font-family:arial; font-size:16; left:0px; top:0px; background-color:white; layer-background-color:white; height:100%; width:100%;"> 
<meta http-equiv="Content-Type" content="text/html; charset=x-user-defined">
<meta name="description" content="Indian Railway site which helps in enquiry ,travelling,boarding and other railway zonal activities developed by CRIS (Centre For Railway Information).You can get information related to all Zones with their divisions.">



<STYLE TYPE="text/css">
<!-- /* $WEFT -- Created by: a (a) on 10/11/2004 -- */
  @font-face {
    font-family: AkrutiOfficeDynamicPriya;
    font-style:  normal;
    font-weight: normal;
    src: url(<%=strWebAppURL%>/AKRUTIO0.eot);
  }
-->
</STYLE>
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
boolean bIsTenderNotice = false;
boolean bIsTenderDocument = false;
boolean bIsCorrigendum = false;
boolean bIsAwardedTenders = false;
boolean bIsStoreTender = false;
boolean bIsBillStatus = false;

boolean bIsRightMenuAdmin = false;
boolean bIsHighlightAdmin = false;

boolean bIsManageComplaint = false;
boolean bIsManageVigilance = false;
	

boolean bIsForexBranchAdmin = false;
boolean bIsForeignBranchAdmin = false;
Vector rsGetACLTenderNotice = new Vector();
Vector rsGetACLTenderDocument = new Vector();
Vector rsGetACLCorrigendum = new Vector();
Vector rsGetACLAwardedTenders = new Vector();
Vector rsGetACLStoreTender = new Vector();
Vector rsGetACLBillStatus = new Vector();
Vector rsGetACLManageComplaint = new Vector();

Vector rsGetACLManageVigilance = new Vector();
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
//rcf
boolean bIsStoresTenderAdmin = false;
Vector rsGetStoresTender = new Vector();
boolean bIsScrapAuctionAdmin = false;
Vector rsGetScrapAuction = new Vector();
boolean bIsDesignQualityAdmin = false;
Vector rsGetDesignQuality = new Vector();
//End

//For rcfrbl
boolean bIsRCFRBLTenderFinalised = false;
Vector rsGetRCFRBLTenderFinalised = new Vector();
boolean bIsRCFRBLStoresTenderFinalised = false;
Vector rsGetRCFRBLStoresTenderFinalised = new Vector();
boolean bIsRCFRBLAwardTenderFinalised = false;
Vector rsGetRCFRBLAwardTenderFinalised = new Vector();
boolean bIsDesignQualityRcfRbl = false;
Vector rsGetDesignQualityRcfRbl = new Vector();

//for clw
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
strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 30";
 rsGetACLBillStatus = new Vector();
dbBean.setQuery(strGetACL);
////out.println(strGetACL + "<br/>");
rsGetACLBillStatus = dbBean.go();
if (rsGetACLBillStatus.size()>0) {
		bIsBillStatus = true;
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
//For CORE	
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 46";
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLContractFinalized = dbBean.go();
	if (rsGetACLContractFinalized.size()>0) {
			bIsContractFinalizedAdmin = true;
	}
	//for CORE end
//For All
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
	
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + session.getAttribute("DBAUserId") + " and ACL_SECTION_TYPE = 80";
	rsGetRCFRBLAwardTenderFinalised = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetRCFRBLAwardTenderFinalised = dbBean.go();
	if (rsGetRCFRBLAwardTenderFinalised.size()>0) {
			bIsRCFRBLAwardTenderFinalised = true;
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
	//out.print(make_list_ofid);
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
	//out.print(make_list_ofid22);

%>



<html>
<head>
<link rel="stylesheet" type="text/css" href="css/admin.css" />
</head>
<body>
	<table width="100%" border="0" cellpadding=0 cellspacing=0>
		<tr>
			<td width="86"><img src="images/titlebar_begin.gif"></td>
			<td class="top_img" style="color:white;font-family:arial;font-size:16px;">
				<table width="100%" border="0">
					<tr>
						<td style="color:white;font-size:14px;" width="30%"><%=Title%></td>
						<td style="color:yellow;">Welcome to WCMS Admin Console</td>
						<td align="right" style="color:yellow;">
						<a style="color:white;" href="<%=strAppPath%>/webadmin/home.jsp" ><%=session.getAttribute("DBAusername") %>'s Admin Home</a> | <a style="color:white;" href="<%=strAppPath%>/webadmin/user/chgpassword.jsp" >Change password</a> | <a style="color:white;" href="<%=strAppPath%>/index.jsp"   target="_blank">Launch site</a> | 
	<a style="color:white;" href="<%=strAppPath%>/webadmin/logout.jsp"  >Logout</a>
						</td>
					</tr>
				</table>
				
			</td>
			<td align="center" ></td>

		</tr>
	</table>
	<table width="100%" border="0" align="center" height="80%" valign="top">
		
		
		<tr>
			<td valign="top" width=210 height="100%">
				<table width="100%" border="0" >
					<tr>
						<td style="border-right:0px dotted gray; height="100%" valign="top" class="table_border">
							<%@ include file="menu.jsp" %>

						</td>
						<td valign="top" height="100%">


<div align=center class="textn">
<font color=red>
<% if (request.getParameter("msg")!=null){%><%=request.getParameter("msg")%><%}%>
</font>
</div>


<script language="JavaScript">
function HideContent(d) {
	document.getElementById(d).style.display = "none";
}
function ShowContent(d) {
	document.getElementById(d).style.display = "block";
}
</script>

<img src="images/admin_banner.jpg" border="0" width="770">
							<br>	
							<table width="98%" align="center" border="1" class="admin_user_details" cellpadding="10" style="border-collapse:collapse;border-color:#B7D0EC;">
									<tr>
										<td colspan="2"><b>User Login Details : </b>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:yellow;">Application User Manual [ <a target="_blank" style="color:yellow;" href="../images/User Manual Ver 1.1.pdf">Download</a> ]</span>
										</td>
										<td rowspan="4" width="10%"><img src="../images/cms.jpg"></td>
									
								</tr>		
<% String strLogDetails="SELECT USER_NAME,DATE_FORMAT(LAST_LOGIN,'%W %D-%M-%Y %H:%i'), IP_ADDRESS FROM CMS_LOGIN_DETAILS WHERE USER_ID="+(String)session.getAttribute("DBAUserId")+" ORDER BY ID DESC LIMIT 1,1";
	Vector rs = new Vector();
	//out.print(strLogDetails);
	dbBean.setQuery(strLogDetails);
	rs=(Vector)dbBean.go();
	if(rs.size()!=0){
%>								
								<tr>
										<td>User Name : </td>
										<td><%=dbBean.getcell(rs,0,0)%></td>										
								</tr>

								<tr>
										<td>Last Login Date & Time : </td>
										<td><%=dbBean.getcell(rs,1,0)%></td>										
								</tr>		

								<tr>
										<td>Last Login IP Address : </td>
										<td><%=dbBean.getcell(rs,2,0)%></td>										
								</tr>	
<%}%>								
							</table><br>
							<table width="99%" border="1" align="center" cellpadding="10" class="admin_manage">
								<tr>
									<td align="center" width="33%" valign="top">
										<table width="100%" class="admin_profile" border="1" cellpadding="5">
												<tr>
													<td class="admin_bg_profile">MANAGE PROFILE</td>
												</tr>
<tr>
													<td height="100">For viewing/updating your profile. <a style="color:blue;text-decoration:none;" href="<%=strAppPath%>/webadmin/user/editProfile.jsp">Click here</a> to edit/update your profile.</td>
												</tr>												
										</table>
									</td>
									<td align="center"  width="33%" valign="top">
<table width="100%" class="admin_profile" border="1" cellpadding="5">
												<tr>
													<td class="admin_bg_profile">CHANGE PASSWORD</td>
												</tr>
<tr>
													<td  height="100">To change your password. <a  style="color:blue;" href="<%=strAppPath%>/webadmin/user/chgpassword.jsp">Click here</a></td>
												</tr>												
										</table>									
									</td>		
									<td align="center"  width="33%" valign="top">
<table width="100%" class="admin_profile" border="1" cellpadding="5">
												<tr>
													<td class="admin_bg_profile">LOGIN HISTORY</td>
												</tr>
<tr>
													<td  height="100">You can view your login history details e.g. the last Login IP address, Login date & time. <a  style="color:blue;" href="<%=strAppPath%>/webadmin/user/logDetails.jsp">Click here</a></td>
												</tr>												
										</table>									
									</td>
								</tr>
							</table>
							

							
	<!-- Anurag -->		<!--
<br><br>	
	<fieldset>
	<legend style="background-color:#006699;color:white;">Important Note:</legend>
	<table border="" align="center" class="sample1" width="100%" style="font-family:tahoma;font-size:12px;border-collapse:collapse;" cellspacing="3" cellpadding="3">
	<tr>
		<td style="background-color:#E4E4E4;color:black;">
		
		As per directive of Govt. of India publication of tender notice has become mendatory on Central Public Procurement Portal.Accordingly filling of Form in new format is mendatory.
		<br>
		
		<a href="/works/webadmin/testing_tender/index_cpp.jsp"><font color="red">Click here to upload Tender in new format</font></a>
		
		</td>
	</tr>
	
	
	</table>
	</fieldset>						
							
		-->					
							
							
							
							
							
							
							
							
							<!--
<div id="contain">
	<div id="col1">
		<img src="images/manage_content.jpg" border="0" onmouseover="javascript:ShowContent('innerdiv1');" onmouseout="HideContent('innerdiv1');">
		<div id="innerdiv1" style="border:2px solid #AD0900;" onmouseover="javascript:ShowContent('innerdiv1');" onmouseout="HideContent('innerdiv1');">
			<span class="header">Section Management</span>
			<ul class="links">
				<li><a href="section/section_management.jsp?parent=0&path=0" class="linkn">Manage section content</a></li>
<%				if(strAdminAccessLevel.equals("100")){%>
					<li><a href="tickermgmt/ticker_management.jsp" class="linkn">Manage ticker</a></li>
<%				}%>
			</ul>		
<%				if(rsdirect.size()!=0){	%>
					<span class="header">Manage Direct Content</span>
					<ul class="links">						
<%						for(int i=0;i<rsdirect.size();i++){							
						String strDCId = dbBean.getcell(rsdirect,0,i);
						boolean bIsThisAdmin = false;
						for (int j=0;j<rsGetACLDC.size();j++) {
							if (strDCId.equals(dbBean.getcell(rsGetACLDC,0,j))) {
								bIsThisAdmin = true;
								//continue;
							}
						}
						if (strAdminAccessLevel.equals("100")) {
							bIsThisAdmin = true;
						}
						if (bIsThisAdmin){%>							
							<li><a class="linkn" href="newsanouncements/section_direct.jsp?id=<%=dbBean.getcell(rsdirect,0,i)%>"><%=dbBean.getcell(rsdirect,1,i)%></a></li>								
<%						}
					}
					out.print("</ul>");
				}				
				if(strAdminAccessLevel.equals("100")){%>			
					<span class="header">Manage Related Other Site Link</span>
					<ul class="links">
						<li><a class="linkn" href="section/related_links_other.jsp">Related Links (Other www)</a></li>									
					</ul>	
<%				}%>
		</div>
	</div>
	

	<div id="col2">
		<img src="images/manage_masters.jpg" border="0" onmouseover="javascript:ShowContent('innerdiv2');" onmouseout="HideContent('innerdiv2');">
		<div id="innerdiv2" style="border:2px solid #0085E8;"onmouseover="javascript:ShowContent('innerdiv2');" onmouseout="HideContent('innerdiv2');">
<%			if(strAdminAccessLevel.equals("100") || bIsBranchLocatorAdmin){%>			
				<span class="header">Branch Management</span>
				<ul class="links">
					<li><a href="locator/branch_management.jsp" class="linkn">Branch Details</a></li>
					<li><a class="linkn" href="locator/branch_modify.jsp?search0=&search1=&search2=">Modify Branch</a></li>
				</ul>
				<span class="header">ATM Management</span>
				<ul class="links">
					<li><a class="linkn" href="locator/atm_management.jsp"> ATM Details</a></li>
					<li><a class="linkn" href="locator/atm_modify.jsp?search0=&search1=&search2=">Modify ATM Details</a></li>			
				</ul>
				<span class="header">Menu Management</span>
				<ul class="links">
					<li><a href="menumanagement/menumgmnt.jsp" class="linkn">Home Page Menu </a></li>							
				</ul>
<%			}else{%>
				<span class="header">You are not authorize to Manage Masters</span>
<%			}%>
		</div>	
	</div>
	<div id="col3">
		<img src="images/manage_banners.jpg" border="0" onmouseover="javascript:ShowContent('innerdiv3');" onmouseout="HideContent('innerdiv3');">
		<div id="innerdiv3" style="border:2px solid #70D73C;" onmouseover="javascript:ShowContent('innerdiv3');" onmouseout="HideContent('innerdiv3');">
<%	if(bIsBannerAdmin) {%>  
			<span class="header">Banner Management</span>
			<ul class="links">
				<li><a class="linkn" href="bannermgmt/create_banner.jsp">Create Banner</a></li>
				<li><a class="linkn" href="bannermgmt/display_banner.jsp">Map Banner</a></li>
				<li><a class="linkn" href="bannermgmt/remove_banner.jsp">Remove Banner</a></li>				
			</ul>
<%	}else{%>						
		<span class="header">You are note authorized to manage Banners</span>
<%}%>
		</div>	
	</div>
	<div id="col4">
		<img src="images/manage_users.jpg" border="0" onmouseover="javascript:ShowContent('innerdiv4');" onmouseout="HideContent('innerdiv4');">
		<div id="innerdiv4" style="border:2px solid #EF7E28;" onmouseover="javascript:ShowContent('innerdiv4');" onmouseout="HideContent('innerdiv4');">
<%			if (bIsUserAdmin) {%>
			<span class="header">User Management</span>
			<ul class="links">
				<li><a class="linkn" href="user/editUser.jsp">Edit User</a</li>
				<li><a class="linkn" href="acl/assignUserRights.jsp">Assign/ Edit User Rights</a></li>
				<li><a class="linkn" href="reports/viewLogs.jsp">View Admin Action log</a></li>				
			</ul>
<%}			else{%>	
			<span class="header">You are note authorized to Management Users</span>					
<%}%>
		</div>	
	</div>	
</div>
--->
<%@ include file="header/footer.jsp" %>
