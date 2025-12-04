<%try{%>
<%
String strEmailQuery = "SELECT COUNT(*) FROM CMS_USER_REQUEST WHERE CUR_UNREAD_READ = 1";
String emailCount ="";
dbBean.setQuery(strEmailQuery);
String rsGetMailListCount[][] = dbBean.getResultSet();
if(rsGetMailListCount.length>0){
	emailCount = rsGetMailListCount[0][0];
}
String User=(String)session.getAttribute("DBAusername");
%>
<%if(strDBAacc != null && !strDBAacc.equals("")){%>
<table width="210" border="0" cellspacing=0 cellpadding=0 style="font-size:11px;">
	<tr>
	<td class="admin_menu_top" align="center" height="40"> ADMIN MENU </td>
		</tr>					
	<%if(strDBAacc.equals("100")){%>	
<%-- 	<tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a  href="<%=strAppPath%>/webadmin/acl/siteConfig.jsp"><b>Manage Site Configuration</b></a>
		</td> 
	</tr> --%>
	
	<!--<tr>
	
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="<%//=strAppPath%>/section/related_links_other.jsp">Related Websites Links</a>
		</td> 
	<%-- </tr>-->
	<tr>
		<td class="admin_menu_td" height="34">
		&raquo;&nbsp;&nbsp;<a href="masters/manageDivisions.jsp"><b>Manage Divisions</b></a>
		</td> 
	</tr>
	<tr>
		<td class="admin_menu_td" height="34">
		&raquo;&nbsp;&nbsp;<a href="masters/manageDepartments.jsp"><b>Manage Departments</b></a>
		</td> 
	</tr> --%>
	
	<!-- For CORE, Manage Groups -->
	
	
<%-- 	<tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="<%=strAppPath%>/webadmin/menumanagement/menumgmnt.jsp"><b>Manage Website Header Links</b></a>
		</td>
	</tr>	 --%>
	<%}%>
	<%if(bIsUserAdmin || strDBAacc.equals("100")){%>
<%-- 	<tr>
		<td class="admin_menu_td" height="34">
		&raquo;&nbsp;&nbsp;<a href="<%=strAppPath%>/webadmin/user/manageUsers.jsp"><b>Manage Users</b></a>
		</td> 
	</tr>	 --%>
<%-- 	<tr>
		<td class="admin_menu_td" height="34">
		&raquo;&nbsp;&nbsp;<a href="<%=strAppPath%>/webadmin/acl/assignUserRights.jsp"><b>Manage User Rights</b></a>
		</td> 
	</tr> --%>
	<%}%>
	
	<%if(bIsUserAdmin || strDBAacc.equals("100")){
		
	
		%>
<%-- 	<tr>
		<td class="admin_menu_td" height="34">
		&raquo;&nbsp;&nbsp;<a href="<%=strAppPath%>/webadmin/user/emailList.jsp"><b>User Request&nbsp;&nbsp;(<%=emailCount%>)</b></a>
		</td> 
		
	</tr> --%>	
	<%}else{
	
		%><%-- 
		<tr>
		<td class="admin_menu_td" height="34">
		&raquo;&nbsp;&nbsp;<a href="<%=strAppPath%>/webadmin/user/userRequest.jsp"><b>Send Request To Administrator</b></a>
		</td> 
	</tr> --%>
	<%}%>
	 
	<tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="<%=strAppPath%>/webadmin/section/section_management.jsp?parent=0&path=0"><b>Manage Website Content</b></a>
		</td>
	</tr>	
	
	<%if(bIsHighlightAdmin || strDBAacc.equals("100")){
		
		%>
	<%-- <tr>
	
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="<%=strAppPath%>/webadmin/tickermgmt/ticker_management.jsp"><b>Manage Scrolling Text</b></a>
		</td>
	</tr> --%>
	<%}%>
	
	<%if(bIsBannerAdmin || strDBAacc.equals("100")){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="bannermgmt/create_banner.jsp"><b>Create Banners</b></a>
		</td>
	</tr>	
	
	<tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="bannermgmt/display_banner.jsp"><b>Map Banners</b></a>
		</td>
	</tr>	
	
	<tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="bannermgmt/remove_banner.jsp"><b>Remove/Delete Banners</b></a>
		</td>
	</tr>	 --%>
	<%}%>
	<%if(make_list_ofid22.indexOf(",269,")>0 || strDBAacc.equals("100")){%>
	<!--<tr>
		<td class="admin_menu_td" height="34" >

		<a href="newsanouncements/section_direct.jsp?id=269">Manage Tenders</a>
		<a href="#">Manage Tenders</a>		</td>
	</tr>	-->

	
	<%}%>
	<%if(bIsTenderNotice || strDBAacc.equals("100")){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >

		&raquo;&nbsp;&nbsp;<a style="color:white;" href="testing_tender/index.jsp?id=<%=session.getId()%>&selectType=1"><b>Manage Tender Notice</b></a>
		</td>
	</tr>	 --%>
	
	<%}%>
	
	<%if(bIsTenderDocument || strDBAacc.equals("100")){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >

		&raquo;&nbsp;&nbsp;<a style="color:white;" href="testing_tender/index.jsp?id=<%=session.getId()%>&selectType=2"><b>Manage Tender Document</b></a>
		</td>
	</tr>	
	 --%>
	<%}%>
	<%if(bIsCorrigendum || strDBAacc.equals("100")){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >

		&raquo;&nbsp;&nbsp;<a href="testing_tender/index.jsp?selectType=3"><b>Manage Corrigendum</b></a>
		</td>
	</tr>	 --%>
	
	<%}%>
	<%if(bIsStoreTender || strDBAacc.equals("100") && !Hname.equals("rcf")){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >

		&raquo;&nbsp;&nbsp;<a href="storetender/storeTender.jsp"><b>Manage Store Tender</b></a>
		</td>
	</tr>	 --%>
	
	<%}%>
	<%if((bIsAwardedTenders || strDBAacc.equals("100")) && !Hname.equals("rcf")){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >

		&raquo;&nbsp;&nbsp;<a style="color:white;" href="tender/index.jsp?id=<%=session.getId()%>&selectType=4"><b>Manage Awarded Tenders</b></a>
		</td>
	</tr>	
	 --%>
	<%}%>
	<%if(bIsBillStatus || strDBAacc.equals("100") ){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >

		&raquo;&nbsp;&nbsp;<a style="color:white;" href="tender/index.jsp?id=<%=session.getId()%>&selectType=5"><b>Manage Bill Status</b></a>
		</td>
	</tr>	 --%>
	
	<%}%>
	<%if(bIsScrapAuctionAdmin || strDBAacc.equals("100") && !Hname.equals("rcf")){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >

		&raquo;&nbsp;&nbsp;<a style="color:white;" href="scrapauction/addScrapAuction.jsp"><b>Scrap Auction</b></a>
		</td>
	</tr>	 --%>
	
	<%}%>
	<%if(strDBAacc.equals("100") || bIsOutturnPositionAdmin){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >&raquo;&nbsp;&nbsp;
		<%if(Hname.equals("rcf")){%>
			<a style="color:white;" href="sales/addsales.jsp"><b>Manage Outturn Position</b></a>
			<a style="color:white;" href="salesh/addsalest.jsp"><b>Manage Outturn Position(Hindi)</b></a>
		<%}else{%>
			<a style="color:white;" href="outturn/addOutturn.jsp"><b>Manage Outturn Position</b></a>
		<%}%>
		</td>
	</tr>	 --%>
	<%}%>
	
	<!-- Following is added for the PB branch .sql uploading -->
	
<!--  Here it ends ---->

	

	
	<%
		String tempId1 = "310";
		if(Hname.equals("nr")){
		 tempId1 = "267";	
		}
	if(make_list_ofid22.indexOf(",310,")>0 || strDBAacc.equals("100")){%>
<%-- 	<tr>
		<td class="admin_menu_td" height="34" >
	&raquo;&nbsp;&nbsp;	<a href="<%=strAppPath%>/webadmin/newsanouncements/section_direct.jsp?id=<%=tempId1%>"><b>Manage News / Announcements</b></a>
		</td>
	</tr>
	<tr>
		<td class="admin_menu_td" height="34" >
	&raquo;&nbsp;&nbsp;	<a href="<%=strAppPath%>/webadmin/newsanouncements/section_direct.jsp?id=607"><b>Update Forms / Notices</b></a>
		</td>
	</tr>	 --%>
	<%}%>
	<%if(make_list_ofid22.indexOf(",311,")>0 || strDBAacc.equals("100")){%>
<%-- 	<tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="newsanouncements/section_direct.jsp?id=311"><b>Manage Press Release</b></a>
		</td>
	</tr> --%>	
	<%}%>
	<%if(make_list_ofid22.indexOf(",268,")>0 || strDBAacc.equals("100")){%>
<%-- 	<tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="newsanouncements/addPublishersInfo.jsp"><b>Manage Press Issuing Officer</b></a>
		</td>
	</tr>	 --%>
	<%}%>
	<%if(make_list_ofid22.indexOf(",304,")>0 || strDBAacc.equals("100")){%>
<%-- 	
	<tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="<%=strAppPath%>/webadmin/newsanouncements/section_direct.jsp?id=324"><b>Manage Photo Gallery</b></a>
		</td>
	</tr> --%>
	<%}%>
	<!-- Only for RCF-->
	
	
	<%if( strDBAacc.equals("100") || bIsAuditTrialAdmin || bIsTenderDownloadLogAdmin || bIsTenderUploadLogAdmin){%>
	<%-- <tr>
		<td class="admin_menu_td" height="34" >
		&raquo;&nbsp;&nbsp;<a href="reports/report.jsp"><b>View All Reports</b></a>
		</td>
	</tr> --%>
	<!-- Add by Saurabh for RWF -->
	
	
	<%}%>
	
	
	
	
		<td class="admin_menu_bottom" align="center" height="40"></td>
	</tr>
</table>
<%}%>
<%}catch(Exception e){
out.print(e);
}
%>