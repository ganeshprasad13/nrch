<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>

<%
String userId = request.getParameter("userId");
String [] strSections = request.getParameterValues("section");
String[] strLocators = request.getParameterValues("locator");
String[] strCircles = request.getParameterValues("chkCirclesId");
String strCirclesIds ="0";
String strAllSQL = "";

if(strCircles!= null){
	for(int i=0;i<strCircles.length;i++){
		strCirclesIds = strCirclesIds+","+strCircles[i];
	}
}
strCirclesIds = strCirclesIds+",0";


String strBanner = request.getParameter("banner");

String strTenderNotice = request.getParameter("TenderNotice");

String strTenderDocument = request.getParameter("TenderDocument");

String strManageVigilance = request.getParameter("bIsManageVigilance");
String strManageComplaint = request.getParameter("bIsManageComplaint");


String strCorrigendum = request.getParameter("Corrigendum");
String strAwardedTenders = request.getParameter("AwardedTenders");
String strStoreTender = request.getParameter("storeTenders");
String strBillStatus = request.getParameter("billStatus");

String strTenderNoticeEdit = request.getParameter("TenderNoticeEdit");
String strTenderNoticeDelete = request.getParameter("TenderNoticeDelete");
String strTenderDocumentEdit = request.getParameter("TenderDocumentEdit");

String[] strResponses = request.getParameterValues("response");
//String strResponse = request.getParameter("response");
String strInterest = request.getParameter("interest");
String strUser = request.getParameter("user");
String strRightMenu = request.getParameter("rightmenu");
String strHighlight = request.getParameter("highlight");
//For RCF
	String bIsTransferRequestAdmin  = request.getParameter("bIsTransferRequestAdmin");
	String bIsNonMovingItemsAdmin  = request.getParameter("bIsNonMovingItemsAdmin");
	String bIsManageScrapAdmin  = request.getParameter("bIsManageScrapAdmin");
	String bIsRateOfSoldlotsAdmin  = request.getParameter("bIsRateOfSoldlotsAdmin");
	String bIsHospitalInformationAdmin  = request.getParameter("bIsHospitalInformationAdmin");
	String bIsVenderDirectoryAdmin  = request.getParameter("bIsVenderDirectoryAdmin");
	String bIsContactInformationAdmin  = request.getParameter("bIsContactInformationAdmin");
	String bIsOutturnPositionAdmin  = request.getParameter("bIsOutturnPositionAdmin");
	String bIsEDTSAdmin   = request.getParameter("bIsEDTSAdmin");
	String bIsMDTSAdmin   = request.getParameter("bIsMDTSAdmin");
//For RCF End
//For Core
String bIsContractFinalizedAdmin   = request.getParameter("bIsContractFinalizedAdmin");
//For Core End
//Eor All
String bIsAuditTrialAdmin   = request.getParameter("bIsAuditTrialAdmin");
String bIsTenderDownloadLogAdmin   = request.getParameter("bIsTenderDownloadLogAdmin");
String bIsTenderUploadLogAdmin   = request.getParameter("bIsTenderUploadLogAdmin");
String bIsStoresTenderAdmin = request.getParameter("bIsStoresTenderAdmin");
String bIsRCFRBLTenderFinalised = request.getParameter("bIsRCFRBLTenderFinalised");
String bIsRCFRBLStoresTenderFinalised = request.getParameter("bIsRCFRBLStoresTenderFinalised");
String bIsScrapAuctionAdmin = request.getParameter("bIsScrapAuctionAdmin");
String bIsDesignQualityAdmin = request.getParameter("bIsDesignQualityAdmin");
String bIsDesignQualityRcfRbl = request.getParameter("bIsDesignQualityRcfRbl");
//End

//for clw
String bIsWarrantyAdmin = request.getParameter("bIsWarrantyAdmin");
String bIsFailFeedAdmin = request.getParameter("bIsFailFeedAdmin");
//for dlw
String bIsdlwWarranty = request.getParameter("bIsdlwWarranty");
String bIsdlwMutualtransfer = request.getParameter("bIsdlwMutualtransfer");
String bIsdlwDrawing = request.getParameter("bIsdlwDrawing");

String strAllowCreate = "0";

if(request.getParameter("allowCreate")!= null){
	strAllowCreate = "999";
}

String strrdLanguage = request.getParameter("rdLanguage");
if(strrdLanguage == null || "".equals(strrdLanguage)) strrdLanguage = "0";
	Vector rsSetSectionACL = new Vector();
	String query = "";
	String strInsertQuery = "";
	String strLanguageUpdate = "";
	String strSuperAdmin = request.getParameter("su");
	
	
	query = "delete from  CMS_ACL where ACL_USER_ID = " + userId;
	dbBean.setQuery(query);
	dbBean.go1();
	strAllSQL = query;
	
	if (strSuperAdmin !=null) {
// change the access level of the user to 100 in the main user table
		query = "update CMS_ADMIN_USER set DAU_ACCESS_LEVEL = 100 where DAU_ID =" + userId ;
		dbBean.setQuery(query);
		dbBean.go1();
		strAllSQL += "<hr>"+query;
		
		String strDelete = "DELETE FROM CMS_ACL_DETAILS WHERE ACLD_USER_ID = "+userId + " AND ACLD_SECTION_ID = 1";
		dbBean.setQuery(strDelete);
		dbBean.go1();
		strAllSQL += "<hr>"+strDelete;
		
		if (strLocators!=null) {
			for (int i=0;i<strLocators.length;i++) {
				strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE,ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strLocators[i] + ",1,'"+ strAllowCreate +"',now())";
				dbBean.setQuery(strInsertQuery);
				dbBean.go1();
				strAllSQL += "<hr>"+strInsertQuery;
				
				if(strLocators[i].equals("1")){
					String strACLDetails = "INSERT INTO CMS_ACL_DETAILS (ACLD_USER_ID, ACLD_SECTION_ID, ACLD_DETAIL_IDS,ACL_CREATION_DATE) VALUES (" + userId + "," + strLocators[i] + ",'"+strCirclesIds+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
			}
		}
		
		if(!strrdLanguage.equals("0")){
			strLanguageUpdate = "UPDATE CMS_ADMIN_USER SET DAU_LANGUAGE_OPTION ="+strrdLanguage+" WHERE DAU_ID ="+userId;
			dbBean.setQuery(strLanguageUpdate);
			dbBean.go1();
			strAllSQL += "<hr>"+strLanguageUpdate;
		}
		
	}else {
		query = "update CMS_ADMIN_USER set DAU_ACCESS_LEVEL = 200 where DAU_ID =" + userId ;
		dbBean.setQuery(query);	
		dbBean.go1();
		strAllSQL += "<hr>"+query;
		
		if (strSections!=null) {
			for (int i=0;i<strSections.length;i++) {
				query = "SELECT DSM_ID FROM CMS_SECTION_MANAGEMENT";
				query = query + " WHERE (DSM_PATH = '" + strSections[i] + "') AND DSM_PARENT <> -1 ORDER BY DSM_ID";
				dbBean.setQuery(query);				
				rsSetSectionACL=(Vector)dbBean.go();
				
				for (int j=0;j<rsSetSectionACL.size();j++) {
					strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + dbBean.getcell(rsSetSectionACL,0,j) + ",0,'"+ strAllowCreate +"',now())";
					 dbBean.setQuery(strInsertQuery);
					 dbBean.go1();
					 strAllSQL += "<hr>"+strInsertQuery;
				}
			}
		}
		String strDelete = "DELETE FROM CMS_ACL_DETAILS WHERE ACLD_USER_ID = "+userId + " AND ACLD_SECTION_ID = 1";	
		dbBean.setQuery(strDelete);
		dbBean.go1();
		strAllSQL += "<hr>"+strDelete;
		
		if (strLocators!=null) {
			for (int i=0;i<strLocators.length;i++) {
				strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE,ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strLocators[i] + ",1,'"+ strAllowCreate +"',now())";
				dbBean.setQuery(strInsertQuery);
				dbBean.go1();
				strAllSQL += "<hr>"+strInsertQuery;
				
				if(strLocators[i].equals("1")){
					String strACLDetails = "INSERT INTO CMS_ACL_DETAILS (ACLD_USER_ID, ACLD_SECTION_ID, ACLD_DETAIL_IDS,ACL_CREATION_DATE) VALUES (" + userId + "," + strLocators[i] + ",'"+strCirclesIds+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
			}
		}
	
	
		if (strBanner!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strBanner + ",2,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}

if (strTenderNotice!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strTenderNotice + ",20,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		
		if (strTenderDocument!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strTenderDocument + ",21,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		
		if (strManageVigilance!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strManageVigilance + ",771,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		
		if (strManageComplaint!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strManageComplaint + ",772,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		
		
		
		if (strCorrigendum!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strCorrigendum + ",22,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		
		
		if (strAwardedTenders!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strAwardedTenders + ",23,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (strStoreTender!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strAwardedTenders + ",31,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (strBillStatus!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strAwardedTenders + ",32,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}//edit delete
		if (strTenderNoticeEdit!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strAwardedTenders + ",33,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (strTenderNoticeDelete!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strAwardedTenders + ",34,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (strTenderDocumentEdit!=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strAwardedTenders + ",35,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsTransferRequestAdmin !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsTransferRequestAdmin  + ",36,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsNonMovingItemsAdmin  !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsNonMovingItemsAdmin   + ",37,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsManageScrapAdmin   !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsManageScrapAdmin    + ",38,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsRateOfSoldlotsAdmin    !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsRateOfSoldlotsAdmin + ",39,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsHospitalInformationAdmin !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsHospitalInformationAdmin + ",40,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsVenderDirectoryAdmin  !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsVenderDirectoryAdmin + ",41,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsContactInformationAdmin   !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsContactInformationAdmin + ",42,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsOutturnPositionAdmin    !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsOutturnPositionAdmin + ",43,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsContractFinalizedAdmin !=null ) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsContractFinalizedAdmin + ",46,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsEDTSAdmin  !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsEDTSAdmin  + ",44,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
			strInsertQuery = "UPDATE CMS_ADMIN_USER SET DAU_ACCESS_LEVEL = 51 WHERE DAU_ID ="+userId;
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsMDTSAdmin  !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsMDTSAdmin   + ",45,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
			strInsertQuery = "UPDATE CMS_ADMIN_USER SET DAU_ACCESS_LEVEL = 52 WHERE DAU_ID ="+userId;
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsAuditTrialAdmin !=null ) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsAuditTrialAdmin + ",47,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsTenderDownloadLogAdmin !=null ) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsTenderDownloadLogAdmin + ",48,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsTenderUploadLogAdmin !=null ) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsTenderUploadLogAdmin + ",49,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (strResponses!=null) {
			for (int i=0;i<strResponses.length;i++) {
				strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strResponses[i] + ",3,'"+ strAllowCreate +"',now())";
				dbBean.setQuery(strInsertQuery);
				dbBean.go1();
				strAllSQL += "<hr>"+strInsertQuery;
			}
		}
		if (strInterest!=null) {
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE,ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strInterest + ",4,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
	
		if (strUser!=null) {
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE,ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strUser + ",5,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (strRightMenu!=null) {
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE,ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strRightMenu + ",6,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (strHighlight!=null) {
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE,ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + strHighlight + ",7,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsStoresTenderAdmin !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsStoresTenderAdmin + ",50,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}

		if (bIsScrapAuctionAdmin !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsScrapAuctionAdmin + ",51,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsDesignQualityAdmin !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsDesignQualityAdmin + ",52,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		
		if (bIsWarrantyAdmin !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsWarrantyAdmin + ",53,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		
		if (bIsFailFeedAdmin !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsFailFeedAdmin + ",54,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}

		if (bIsRCFRBLTenderFinalised !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsRCFRBLTenderFinalised + ",55,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsRCFRBLStoresTenderFinalised !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsRCFRBLStoresTenderFinalised + ",56,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}		
		if (bIsdlwWarranty !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsdlwWarranty + ",57,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsdlwMutualtransfer !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsdlwMutualtransfer + ",58,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsdlwDrawing !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsdlwDrawing + ",60,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
		if (bIsDesignQualityRcfRbl !=null) {	
			strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (" + userId + "," + bIsDesignQualityRcfRbl + ",61,'"+ strAllowCreate +"',now())";
			dbBean.setQuery(strInsertQuery);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}		
		
		if(!strrdLanguage.equals("0")){
			strLanguageUpdate = "UPDATE CMS_ADMIN_USER SET DAU_LANGUAGE_OPTION = "+strrdLanguage+" WHERE DAU_ID ="+userId;
			dbBean.setQuery(strLanguageUpdate);
			dbBean.go1();
			strAllSQL += "<hr>"+strInsertQuery;
		}
	} 

	String actype = "1";
	String acmsg = "EditAdminUserRights";
	String acdescription =  userId + " users access rights updated";
	String acSqlQuery = strAllSQL;
	
	%>
	<%//=strAllSQL%>
	<%@ include file="../createlog.jsp" %>
	<%@ include file="../../dbConn/dbClose.jsp" %>
	<% 
		response.sendRedirect("../home.jsp?msg=User%20rights%20updated");
}
%>