<%int intPageNo =4;%>
<%@ include file="../header/headerInner.jsp" %>
<%
	String strUserDetails = "";
	Vector rslevel = new Vector();
	String query;
	query = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
	query = query + " WHERE DLC_LANG_ID =0 ";
	query = query + " AND DSM_ID = DLC_DSM_ID and DSM_PARENT <> -1";
	query = query + " ORDER BY DSM_PATH";
	dbBean.setQuery(query);
	rslevel=(Vector)dbBean.go();
	
	Vector rsLanguage = new Vector();
	String queryLanguageOption = "Select DAU_ID, IFNULL(DAU_LANGUAGE_OPTION,0) AS DAU_LANGUAGE_OPTION,DAU_LOGIN,DAU_NAME FROM CMS_ADMIN_USER WHERE DAU_ID =  " + request.getParameter("userId");
	dbBean.setQuery(queryLanguageOption);
	rsLanguage=(Vector)dbBean.go();
	String strlanguageType = "0";
	if(rsLanguage.size()>0){
		strlanguageType = dbBean.getcell(rsLanguage,1,0);
		strUserDetails = dbBean.getcell(rsLanguage,3,0)+" [ "+dbBean.getcell(rsLanguage,2,0)+" ]";
	}
	Vector getFeedbackSections = new Vector();
	String query_feedback;
	query_feedback = "SELECT DRD_ID, DRD_DEPT_NAME, DRD_DEPT_EMAIL FROM CMS_RESPONSE_DEPT WHERE DRD_ACTIVE_STATUS=1 order by DRD_DEPT_NAME";
	dbBean.setQuery(query_feedback);
	getFeedbackSections=(Vector)dbBean.go();
	
	String setsecurl = "";
	int noofcom = 0;
	
	bIsResponseAdmin = false;
	bIsSectionAdmin = false;
	bIsDirectContentAdmin = false;
	bIsBannerAdmin = false;
	
	bIsTenderNotice = false;
	bIsTenderDocument = false;
	bIsCorrigendum = false;
	bIsAwardedTenders = false;
	bIsStoreTender = false;
	bIsBillStatus = false;
	bIsTenderNoticeEdit = false;
	bIsTenderNoticeDelete = false;
	bIsTenderDocumentEdit = false;
	
	bIsInterestAdmin = false;
	bIsLocatorAdmin = false;
	bIsATMLocatorAdmin = false;
	bIsBranchLocatorAdmin = false;
	bIsUserAdmin = false;
	bIsRightMenuAdmin = false;
	bIsHighlightAdmin = false;
	bIsContractFinalizedAdmin = false;
	
	bIsManageComplaint = false;
	bIsManageVigilance = false;
	bIsStoresTenderAdmin = false;
	bIsRCFRBLTenderFinalised = false;
	bIsRCFRBLStoresTenderFinalised = false;
	bIsScrapAuctionAdmin = false;
	bIsDesignQualityAdmin = false;
	bIsDesignQualityRcfRbl= false;
	
	//for clw -Anurag
	bIsWarrantyAdmin = false;
	bIsFailFeedAdmin = false;
	//for dlw -Kailash
	bIsdlwWarranty = false;
	bIsdlwMutualtransfer = false;
	bIsdlwDrawing= false;
	
	strGetACL = "select distinct(CMS_ACL.ACL_SECTION_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 1";
	rsGetACLLocator = new Vector();
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
			if (strLocatorTest.equals("2")) {
				bIsForexBranchAdmin = true;
			}
			if (strLocatorTest.equals("3")) {
				bIsForeignBranchAdmin = true;
			}
		}
	}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 2";
	rsGetACLBanner = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLBanner = dbBean.go();
	if (rsGetACLBanner.size()>0) {
		bIsBannerAdmin = true;
	}
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 20";
	rsGetACLTenderNotice = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLTenderNotice = dbBean.go();
	if (rsGetACLTenderNotice.size()>0) {
		bIsTenderNotice = true;
	}
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 21";
	rsGetACLTenderDocument = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLTenderDocument = dbBean.go();
	if (rsGetACLTenderDocument.size()>0) {
		bIsTenderDocument = true;
	}
	
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 771";
	rsGetACLManageComplaint = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLManageComplaint = dbBean.go();
	if (rsGetACLManageComplaint.size()>0) {
		bIsManageComplaint = true;
	}
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 772";
	rsGetACLManageVigilance = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLManageVigilance = dbBean.go();
	if (rsGetACLManageVigilance.size()>0) {
		bIsManageVigilance = true;
	}
	
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 22";
	rsGetACLCorrigendum = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLCorrigendum = dbBean.go();
	if (rsGetACLCorrigendum.size()>0) {
		bIsCorrigendum = true;
	}
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 23";
	rsGetACLAwardedTenders = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLAwardedTenders = dbBean.go();
	if (rsGetACLAwardedTenders.size()>0) {
		bIsAwardedTenders = true;
	}
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 31";
	rsGetACLStoreTender = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLStoreTender = dbBean.go();
	if (rsGetACLStoreTender.size()>0) {
		bIsStoreTender = true;
	}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 32";
	rsGetACLBillStatus = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLBillStatus = dbBean.go();
	if (rsGetACLBillStatus.size()>0) {
		bIsBillStatus = true;
	}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 33";
	rsGetACLTenderNoticeEdit = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLTenderNoticeEdit = dbBean.go();
	if (rsGetACLTenderNoticeEdit.size()>0) {
		bIsTenderNoticeEdit = true;
	}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 34";
	rsGetACLTenderNoticeDelete = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLTenderNoticeDelete = dbBean.go();
	if (rsGetACLTenderNoticeDelete.size()>0) {
		bIsTenderNoticeDelete = true;
	}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 35";
	rsGetACLTenderDocumentEdit = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetACLTenderDocumentEdit = dbBean.go();
	if (rsGetACLTenderDocumentEdit.size()>0) {
		bIsTenderDocumentEdit = true;
	}
// For RCF 
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 36";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLTransferRequest = dbBean.go();
		if (rsGetACLTransferRequest.size()>0) {
				bIsTransferRequestAdmin = true;
		}
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 37";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLNonMovingItems = dbBean.go();
		if (rsGetACLNonMovingItems.size()>0) {
				bIsNonMovingItemsAdmin = true;
		}
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 38";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLManageScrap = dbBean.go();
		if (rsGetACLManageScrap.size()>0) {
				bIsManageScrapAdmin = true;
		}	
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 39";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLRateOfSoldlots = dbBean.go();
		if (rsGetACLRateOfSoldlots.size()>0) {
				bIsRateOfSoldlotsAdmin = true;
		}	
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 40";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLHospitalInformation = dbBean.go();
		if (rsGetACLHospitalInformation.size()>0) {
				bIsHospitalInformationAdmin = true;
		}
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 41";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLVenderDirectory = dbBean.go();
		if (rsGetACLVenderDirectory.size()>0) {
				bIsVenderDirectoryAdmin = true;
		}
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 42";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLContactInformation = dbBean.go();
		if (rsGetACLContactInformation.size()>0) {
				bIsContactInformationAdmin = true;
		}
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 43";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLOutturnPosition = dbBean.go();
		if (rsGetACLOutturnPosition.size()>0) {
				bIsOutturnPositionAdmin = true;
		}
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 44";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLEDTS = dbBean.go();
		if (rsGetACLEDTS.size()>0) {
				bIsEDTSAdmin = true;
		}
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 45";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLMDTS = dbBean.go();
		if (rsGetACLMDTS.size()>0) {
				bIsMDTSAdmin = true;
		}
//for RCF end
//For Core 
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 46";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLContractFinalized = dbBean.go();
		if (rsGetACLContractFinalized.size()>0) {
				bIsContractFinalizedAdmin = true;
		}
//Core End
//For Allow

	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 47";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLAuditTrial = dbBean.go();
		if (rsGetACLAuditTrial.size()>0) {
				bIsAuditTrialAdmin = true;
		}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 48";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLTenderDownloadLog = dbBean.go();
		if (rsGetACLTenderDownloadLog.size()>0) {
				bIsTenderDownloadLogAdmin = true;
		}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 49";
		dbBean.setQuery(strGetACL);
		////out.println(strGetACL + "<br/>");
		rsGetACLTenderUploadLog = dbBean.go();
		if (rsGetACLTenderUploadLog.size()>0) {
				bIsTenderUploadLogAdmin = true;
		}
//End
	strGetACL = "select distinct(ACL_SECTION_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 3";
	rsGetACLResponse = new Vector();
	dbBean.setQuery(strGetACL);
	//out.println(strGetACL + "<br/>");
	rsGetACLResponse = dbBean.go();
	if (rsGetACLResponse.size()>0) {
		bIsResponseAdmin = true;
	}
	htResponse = new Hashtable();
	for (int i=0;i<rsGetACLResponse.size();i++) {
		htResponse.put(dbBean.getcell(rsGetACLResponse,0,i), Integer.toString(i));
		//out.println(dbBean.getcell(rsGetACLSection,0,i) + "<br/>");
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 4";
	rsGetACLinterest = new Vector();
	dbBean.setQuery(strGetACL);
	//out.println(strGetACL + "<br/>");
	rsGetACLinterest = dbBean.go();
	if (rsGetACLinterest.size()>0) {
		bIsInterestAdmin = true;
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 5";
	rsGetACLUser = new Vector();
	dbBean.setQuery(strGetACL);
	//out.println(strGetACL + "<br/>");
	rsGetACLUser = dbBean.go();
	if (rsGetACLUser.size()>0) {
		bIsUserAdmin = true;
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 6";
	rsGetACLRtMenu = new Vector();
	dbBean.setQuery(strGetACL);
	//out.println(strGetACL + "<br/>");
	rsGetACLRtMenu = dbBean.go();
	if (rsGetACLRtMenu.size()>0) {
			bIsRightMenuAdmin = true;
	}
	strGetACL = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE = 7";
	rsGetHighlight = new Vector();
	dbBean.setQuery(strGetACL);
	//out.println(strGetACL + "<br/>");
	rsGetHighlight = dbBean.go();
	if (rsGetHighlight.size()>0) {
			bIsHighlightAdmin = true;
	}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  50";
	rsGetStoresTender = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetStoresTender = dbBean.go();
	if (rsGetStoresTender.size()>0) {
			bIsStoresTenderAdmin = true;
	}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  51";
	rsGetScrapAuction = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetScrapAuction = dbBean.go();
	if (rsGetScrapAuction.size()>0) {
			bIsScrapAuctionAdmin = true;
	}
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  52";
	rsGetDesignQuality = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetDesignQuality = dbBean.go();
	if (rsGetDesignQuality.size()>0) {
			bIsDesignQualityAdmin = true;
	}	
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  53";
	rsGetWarranty = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetWarranty = dbBean.go();
	if (rsGetWarranty.size()>0) {
			bIsWarrantyAdmin = true;
	}	
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  54";
	rsGetFailFeed = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetFailFeed = dbBean.go();
	if (rsGetFailFeed.size()>0) {
			bIsFailFeedAdmin = true;
	}	
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  55";
	rsGetRCFRBLTenderFinalised = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetRCFRBLTenderFinalised = dbBean.go();
	if (rsGetRCFRBLTenderFinalised.size()>0) {
			bIsRCFRBLTenderFinalised = true;
	}
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  56";
	rsGetRCFRBLStoresTenderFinalised = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetRCFRBLStoresTenderFinalised = dbBean.go();
	if (rsGetRCFRBLStoresTenderFinalised.size()>0) {
			bIsRCFRBLStoresTenderFinalised = true;
	}
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  57";
	rsGetdlwWarranty = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetdlwWarranty = dbBean.go();
	if (rsGetdlwWarranty.size()>0) {
			bIsdlwWarranty = true;
	}
	
	strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  58";
	rsGetdlwMutualtransfer = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetdlwMutualtransfer = dbBean.go();
	if (rsGetdlwMutualtransfer.size()>0) {
			bIsdlwMutualtransfer = true;
	}
	
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  60";
	rsGetdlwDrawing = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetdlwDrawing = dbBean.go();
	if (rsGetdlwDrawing.size()>0) {
			bIsdlwDrawing = true;
	}
	
		strGetACL = "select distinct(ACL_ID) from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_SECTION_TYPE =  61";
	rsGetDesignQualityRcfRbl = new Vector();
	dbBean.setQuery(strGetACL);
	////out.println(strGetACL + "<br/>");
	rsGetDesignQualityRcfRbl = dbBean.go();
	if (rsGetDesignQualityRcfRbl.size()>0) {
			bIsDesignQualityRcfRbl = true;
	}	
	
	strGetACL = "SELECT distinct(CMS_ACL.ACL_SECTION_ID) FROM CMS_SECTION_MANAGEMENT INNER JOIN CMS_ACL ON CMS_SECTION_MANAGEMENT.DSM_ID = CMS_ACL.ACL_SECTION_ID WHERE  (CMS_ACL.ACL_USER_ID =" + request.getParameter("userId") + ") order by CMS_ACL.ACL_SECTION_ID";
	rsGetACLSection = new Vector();
	dbBean.setQuery(strGetACL);
	//out.println(strGetACL + "<br/>");
	rsGetACLSection = dbBean.go();
	if (rsGetACLSection.size()>0) {
		bIsSectionAdmin = true;
	}
	
	strGetACL = "SELECT distinct(CMS_ACL.ACL_SECTION_ID) FROM CMS_SECTION_MANAGEMENT INNER JOIN CMS_ACL ON CMS_SECTION_MANAGEMENT.DSM_ID = CMS_ACL.ACL_SECTION_ID WHERE (CMS_SECTION_MANAGEMENT.DSM_TYPE = 2) AND CMS_ACL.ACL_SECTION_TYPE=0 AND (CMS_ACL.ACL_USER_ID =" + request.getParameter("userId") + ")";
	rsGetACLDC = new Vector();
	dbBean.setQuery(strGetACL);
	//out.println(strGetACL + "<br/>");
	rsGetACLDC = dbBean.go();
	if (rsGetACLDC.size()>0) {
		bIsDirectContentAdmin = true;
	}
	htSectionIDs = new Hashtable();
	for (int i=0;i<rsGetACLSection.size();i++) {
		htSectionIDs.put(dbBean.getcell(rsGetACLSection,0,i), Integer.toString(i));
		//out.println(dbBean.getcell(rsGetACLSection,0,i) + "<br/>");
	}
	strGetACL = "select DAU_ACCESS_LEVEL from CMS_ADMIN_USER where DAU_ID = " + request.getParameter("userId");
	Vector rsGetAcessLevel = new Vector();
	dbBean.setQuery(strGetACL);
	//out.println(strGetACL + "<br/>");
	rsGetAcessLevel = dbBean.go();
	strAdminAccessLevel = dbBean.getcell(rsGetAcessLevel,0,0);
	Vector rsCircles = new Vector();
%>
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage User Access Rights &raquo;&nbsp;&nbsp;<b><font color="#FFFFFF"><%=strUserDetails%>&nbsp;&nbsp;&nbsp;</font></b></span></p>
<form action="assignUserRightsAction.jsp" method="post" name="assignUserRights" id="assignUserRights">
<input type="hidden" name="userId" id="userId" value="<%=request.getParameter("userId")%>">
<table width="100%" border=0 style="border-collapse: collapse" bordercolor="#efefef" class="textn" cellspacing="0" cellpadding="0" align="center">
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>&nbsp;Section Management</strong></td>
	</tr>
	<tr>
		<td>
<%		if(rslevel.size()!=0){
			for(int i=0;i<rslevel.size();i++){
				setsecurl = dbBean.getcell(rslevel,2,i);
				noofcom = 0;
				StringTokenizer stDblTicketId= new StringTokenizer(dbBean.getcell(rslevel,2,i),",");
				while(stDblTicketId.hasMoreTokens()){	
					noofcom = noofcom + 1;
					stDblTicketId.nextToken();
				}%>
				<table width="100%" border="0"  style="border-collapse: collapse" bordercolor="#efefef" cellspacing="0" cellpadding="0" align="center" class="textn">
					<tr height="25" bgcolor="<%if(i%2==0){%>#efefef<%}else{%>#dfdfdf<%}%>">				
<%				if (noofcom==2) {%><td align="center" valign="middle" width="2%">»</td>
<%				}else{
					for(int iii=0;iii<noofcom-1;iii++){%><td valign="middle" width="2%">&nbsp;</td>
<%					}
				}%>
						<td>
				<input type="checkbox"<%if (htSectionIDs.containsKey(dbBean.getcell(rslevel,0,i))) {%> checked<%}%> name="section" value="<%=setsecurl%>"><%=dbBean.getcell(rslevel,1,i)%>
						</td>
					</tr>
				</table>	
<% 			}
		}%>	
		</td>
	</tr>
	
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>Banner Management</strong></td>
	</tr>
	<tr>
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
			<input type="checkbox" name="banner" value="1"<%if(bIsBannerAdmin) {%> checked<%}%>>Banner Management
			</td></tr></table>
		</td>
	</tr>
	<%if(Hname.equals("rcf")){%>
		<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Stores Tender Finalised Management</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsStoresTenderAdmin) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsStoresTenderAdmin" value="1"<%if(bIsStoresTenderAdmin) {%> checked<%}%>>Manage Stores Tender Finalised 
				</td></tr></table>
			</td>
		</tr>
	<%}%>
	
	<%if(Hname.equals("rcfrbl")){%>
		<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Tender Finalised Management</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsRCFRBLTenderFinalised) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsRCFRBLTenderFinalised" value="1"<%if(bIsRCFRBLTenderFinalised) {%> checked<%}%>>Manage Tender Finalised 
				</td></tr></table>
			</td>
		</tr>
	<%}%>
	
    <%if(Hname.equals("rcfrbl")){%>
		<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Stores Tender Finalised Management</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsRCFRBLStoresTenderFinalised) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsRCFRBLStoresTenderFinalised" value="1"<%if(bIsRCFRBLStoresTenderFinalised) {%> checked<%}%>>Manage Stores Tender Finalised 
				</td></tr></table>
			</td>
		</tr>
	<%}%>
	
	<%if(Hname.equals("dmw")){%>
		<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Scrap Auction Management</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsScrapAuctionAdmin) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsScrapAuctionAdmin" value="1"<%if(bIsScrapAuctionAdmin) {%> checked<%}%>>Manage Scrap Auction 
				</td></tr></table>
			</td>
		</tr>
	<%}%>
	<%if(Hname.equals("rcf")){%>
		<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Design/Quality Complaints Management</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsDesignQualityAdmin) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsDesignQualityAdmin" value="1"<%if(bIsDesignQualityAdmin) {%> checked<%}%>>Manage Design/Quality Complaints
				</td></tr></table>
			</td>
		</tr>
	<%}%>
	<%if(Hname.equals("rcfrbl")){%>
		<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Design/Quality Complaints Management</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsDesignQualityRcfRbl) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsDesignQualityRcfRbl" value="1"<%if(bIsDesignQualityRcfRbl) {%> checked<%}%>>Manage Design/Quality Complaints
				</td></tr></table>
			</td>
		</tr>
	<%}%>

	<%if(Hname.equals("clw")){%>
		<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Warranty Management</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsWarrantyAdmin) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsWarrantyAdmin" value="1"<%if(bIsWarrantyAdmin) {%> checked<%}%>>Manage Warranty Complaints
				</td></tr></table>
			</td>
		</tr>
	
	<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Failure Feedback Management</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsFailFeedAdmin) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsFailFeedAdmin" value="1"<%if(bIsFailFeedAdmin) {%> checked<%}%>>Manage Failure Feedback
				</td></tr></table>
			</td>
		</tr>
	
	<%}%>
	<%if(Hname.equals("dlw")){%>
		<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Warranty</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsdlwWarranty) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsdlwWarranty" value="1"<%if(bIsdlwWarranty) {%> checked<%}%>>Manage Warranty Complaints
				</td></tr></table>
			</td>
		</tr>
	
	<tr class="tr_bgcolor">
			<td height="25" valign="middle"><strong>Mutual Transfer</strong></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsdlwMutualtransfer) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsdlwMutualtransfer" value="1"<%if(bIsdlwMutualtransfer) {%> checked<%}%>>Manage Mutual Transfer
				</td></tr></table>
			</td>
		</tr>
			<tr>
			<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
					<tr <%if(bIsdlwDrawing) {%> bgcolor="green"<%}else{%>bgcolor="#efefef"<%}%>><td>	
				<input type="checkbox" name="bIsdlwDrawing" value="1"<%if(bIsdlwDrawing) {%> checked<%}%>>DLW Add Drawing to tender
				</td></tr></table>
			</td>
		</tr>
	<%}%>	
	
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>Tender Management</strong></td>
	</tr>
	<tr>
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
			<input type="checkbox" name="TenderNotice" value="1"<%if(bIsTenderNotice) {%> checked<%}%>>Add Tender Notice
			<input type="checkbox" name="TenderNoticeEdit" value="1"<%if(bIsTenderNoticeEdit) {%> checked<%}%>>Edit Tender Notice
			<input type="checkbox" name="TenderNoticeDelete" value="1"<%if(bIsTenderNoticeDelete) {%> checked<%}%>>Delete Tender Notice
			</td></tr></table>
		</td>
	</tr>
	
	<tr>
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
			<input type="checkbox" name="TenderDocument" value="1"<%if(bIsTenderDocument) {%> checked<%}%>>Add Tender Document
			<input type="checkbox" name="TenderDocumentEdit" value="1"<%if(bIsTenderDocumentEdit) {%> checked<%}%>>Edit Tender Document
			</td></tr></table>
		</td>
	</tr>
	
	<tr>
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
			<input type="checkbox" name="Corrigendum" value="1"<%if(bIsCorrigendum) {%> checked<%}%>>Add Corrigendum
			</td></tr></table>
		</td>
	</tr>
	
	<tr>
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
			<input type="checkbox" name="AwardedTenders" value="1"<%if(bIsAwardedTenders) {%> checked<%}%>>Add Awarded Tenders
			</td></tr></table>
		</td>
	</tr>
	
	<tr>
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
			<input type="checkbox" name="storeTenders" value="1"<%if(bIsStoreTender) {%> checked<%}%>>Manage Store Tender
			</td></tr></table>
		</td>
	</tr>
	
	<tr>
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
			<input type="checkbox" name="billStatus" value="1"<%if(bIsBillStatus) {%> checked<%}%>>Manage Bill Status
			</td></tr></table>
		</td>
	</tr>
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>Manage Following</strong></td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsOutturnPositionAdmin" value="1"<%if(bIsOutturnPositionAdmin) {%> checked<%}%>>outturn position
				</td></tr>
			</table>
		</td>
	</tr>
<%if(Hname.equals("core")){%>
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>Manage Contract Finalized</strong></td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsContractFinalizedAdmin" value="1"<%if(bIsContractFinalizedAdmin) {%> checked<%}%>>Add Contract Finalized
				</td></tr>
			</table>
		</td>
	</tr>
<%}%>	
<%if(Hname.equals("rcf")){%>	
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsTransferRequestAdmin" value="1"<%if(bIsTransferRequestAdmin) {%> checked<%}%>>Manage Transfer Request 
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsNonMovingItemsAdmin" value="1"<%if(bIsNonMovingItemsAdmin) {%> checked<%}%>>Manage Non Moving Items  
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsManageScrapAdmin" value="1"<%if(bIsManageScrapAdmin) {%> checked<%}%>>Manage Scrap   
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsRateOfSoldlotsAdmin" value="1"<%if(bIsRateOfSoldlotsAdmin) {%> checked<%}%>>Manage Rate Of Soldlots 
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsHospitalInformationAdmin" value="1"<%if(bIsHospitalInformationAdmin) {%> checked<%}%>>Manage Hospital Information
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsVenderDirectoryAdmin" value="1"<%if(bIsVenderDirectoryAdmin) {%> checked<%}%>>Manage Vender Directory 
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsContactInformationAdmin" value="1"<%if(bIsContactInformationAdmin) {%> checked<%}%>>Manage Contact Information 
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsEDTSAdmin" value="1"<%if(bIsEDTSAdmin) {%> checked<%}%>>Manage Electrical DTS 
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsMDTSAdmin" value="1"<%if(bIsMDTSAdmin) {%> checked<%}%>>Manage Mechanical DTS 
				</td></tr>
			</table>
		</td>
	</tr>
<%}%>
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>View All Reports</strong></td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsAuditTrialAdmin" value="1"<%if(bIsAuditTrialAdmin) {%> checked<%}%>>User Audit Trail Report
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsTenderDownloadLogAdmin" value="1"<%if(bIsTenderDownloadLogAdmin) {%> checked<%}%>>Tender Download Log Report
				</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>	
					<input type="checkbox" name="bIsTenderUploadLogAdmin" value="1"<%if(bIsTenderUploadLogAdmin) {%> checked<%}%>>Tender Upload Log Report 
				</td></tr>
			</table>
		</td>
	</tr>
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>Response Management</strong></td>
	</tr>
	<tr>
		<td>
<%			for(int i=0;i<getFeedbackSections.size();i++){%>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="<%if(i%2==0){%>#efefef<%}else{%>#dfdfdf<%}%>"><td>

<input type="checkbox"<%if (htResponse.containsKey(dbBean.getcell(getFeedbackSections,0,i))) {%> checked<%}%> name="response" value="<%=dbBean.getcell(getFeedbackSections,0,i)%>"><%=dbBean.getcell(getFeedbackSections,1,i)%>
				</td></tr></table>

<% 			}%>
		</td>
	</tr>
	<tr>
		<td>
	<input type="checkbox" name="bIsManageVigilance" value="1" <%if(bIsManageVigilance) {%> checked<%}%>>Manage Vigilance
	</td>
	</tr>
	
	<tr>
		<td>
	<input type="checkbox" name="bIsManageComplaint" value="1" <%if(bIsManageComplaint) {%> checked<%}%>>Manage Complaint
	</td>
	</tr>
	
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>
					<input type="checkbox" name="highlight" value="1"<%if(bIsHighlightAdmin) {%> checked<%}%>>Ticker Management
				</td></tr></table>
		</td>
	</tr>
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>User Management</strong></td>
	</tr>
	<tr>
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>
			<input type="checkbox" name="user" value="1"<%if(bIsUserAdmin) {%> checked<%}%>>User Management
				</td></tr></table>
		</td>
	</tr>
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>Super Admin</strong></td>
	</tr>
	<tr>
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="textn">
				<tr bgcolor="#efefef"><td>
			<input type="checkbox" name="su" value="1"<%if(strAdminAccessLevel.equals("100")) {%> checked<%}%>>Super Admin
			</td></tr></table>
		</td>
	</tr>

<%	String strCreateStatus = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + request.getParameter("userId") + " and ACL_INFO = '999'";
	Vector strCreateStatus_rs = new Vector();
	dbBean.setQuery(strCreateStatus);
	strCreateStatus_rs = (Vector)dbBean.go();
%>

	<tr>
		<td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="textn">
				<tr bgcolor="#efefef"><td>
			<input type="checkbox" name="allowCreate" value="1" <%if(strCreateStatus_rs.size() !=0) {%> checked<%}%>><strong>Allow user to create sections</strong></td></tr></table>
		</td>
	</tr>
	<tr class="tr_bgcolor">
		<td height="25" valign="middle"><strong>Assign Language to Users</strong></td>
	</tr>
	<tr>
		<td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="textn">
				<tr bgcolor="#efefef">
					<td>Please choose the appropriate Option</td>
					<td>
			<input type="Radio" name="rdLanguage" id="rdLanguage" value="1" <%if(strlanguageType.equals("1")){out.print(" Checked");}%>>Both English & Hindi&nbsp;&nbsp;&nbsp;
			<input type="Radio" name="rdLanguage" id="rdLanguage" value="2" <%if(strlanguageType.equals("2")){out.print(" Checked");}%>>English Only&nbsp;&nbsp;&nbsp;
			<input type="Radio" name="rdLanguage" id="rdLanguage" value="3" <%if(strlanguageType.equals("3")){out.print(" Checked");}%>>Hindi Only	
			</td></tr></table>
		</td>		
	</TR>
	<tr>
		<td align="center" valign="middle" height="40">
			<input type="submit" name="submit" id="submit" value="Assign Rights to User">
		</td>
	</tr>
</table>
</form>
<%@ include file="../header/footerInner.jsp" %>

