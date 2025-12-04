<%@ include file="../header/headerInner.jsp" %>

<script language="JavaScript1.2">
function formValidation(theform){	
	var objForm = document.getElementById(theform);	
	var returnval=false //by default, allow form submission
	for (i=0; i<objForm.elements.length; i++){
		if (objForm.elements[i].type=="checkbox" && objForm.elements[i].checked){			
			returnval=true //disallow form submission
			break //end loop. No need to continue.			
		}
	}
	if(!returnval){
		alert("Please check the checkboxes you want to remove");
		return false;
	}	
	objForm.submit();
	
}
</script>

<% 
// get todays date
java.util.Date today = new java.util.Date();
java.util.Calendar c = new GregorianCalendar();
int day   = today.getDate();
int month = today.getMonth()+1;
int year  = c.get(Calendar.YEAR);
String strFileType = "";
boolean isRemove = false;
%>
<div align="center">

<table width=95% align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Remove Top Banner</b></td>
</tr>
</table>
<%
// this query gets the navigation information to produde "You are here" bar
Vector getlevel = new Vector();
String query_level;
query_level = "SELECT CMS_SECTION_MANAGEMENT.DSM_ID, CMS_LANGUAGE_CONTENT.DLC_LABEL, CMS_SECTION_MANAGEMENT.DSM_PATH, TEMPTBL.DCB_LINK, TEMPTBL.DCB_LINK_TYPE, TEMPTBL.DCB_HOVER_ENGLISH, TEMPTBL.DCB_FILE_SYSNAME,DMB_ID, TEMPTBL.DCB_FILE_TYPE, TEMPTBL.DCB_WIDTH, TEMPTBL.DCB_HEIGHT FROM  CMS_LANGUAGE_CONTENT,CMS_SECTION_MANAGEMENT LEFT  JOIN (select * from CMS_CREATE_BANNER,CMS_MAP_BANNER where CMS_MAP_BANNER.DMB_DCB_ID = CMS_CREATE_BANNER.DCB_ID and DMB_LANG_ID = 0 and DMB_FLAG = 1 AND DMB_DCB_TYPE = 0) as TEMPTBL on TEMPTBL.DMB_DSM_ID = CMS_SECTION_MANAGEMENT.DSM_ID where CMS_LANGUAGE_CONTENT.DLC_LANG_ID = 0 and CMS_SECTION_MANAGEMENT.DSM_PARENT = 0 and CMS_SECTION_MANAGEMENT.DSM_ID = CMS_LANGUAGE_CONTENT.DLC_DSM_ID order by DSM_ID";
//out.println(query_level+"<br/>");
dbBean.setQuery(query_level);
getlevel=(Vector)dbBean.go();
%><table width="95%" cellpadding="0" cellspacing="0">

<%

Vector getlevel_h = new Vector();
query_level = "SELECT CMS_SECTION_MANAGEMENT.DSM_ID, CMS_LANGUAGE_CONTENT.DLC_LABEL, CMS_SECTION_MANAGEMENT.DSM_PATH, TEMPTBL.DCB_LINK, TEMPTBL.DCB_LINK_TYPE, TEMPTBL.DCB_HOVER_ENGLISH, TEMPTBL.DCB_FILE_SYSNAME,DMB_ID, TEMPTBL.DCB_FILE_TYPE, TEMPTBL.DCB_WIDTH, TEMPTBL.DCB_HEIGHT FROM  CMS_LANGUAGE_CONTENT,CMS_SECTION_MANAGEMENT LEFT  JOIN (select * from CMS_CREATE_BANNER,CMS_MAP_BANNER where CMS_MAP_BANNER.DMB_DCB_ID = CMS_CREATE_BANNER.DCB_ID and DMB_LANG_ID = 1 and DMB_FLAG=1 AND DMB_DCB_TYPE = 0) as TEMPTBL on TEMPTBL.DMB_DSM_ID = CMS_SECTION_MANAGEMENT.DSM_ID where CMS_LANGUAGE_CONTENT.DLC_LANG_ID = 1 and CMS_SECTION_MANAGEMENT.DSM_PARENT = 0 and CMS_SECTION_MANAGEMENT.DSM_ID = CMS_LANGUAGE_CONTENT.DLC_DSM_ID order by DSM_ID";
//out.println(query_level+"<br/>");
dbBean.setQuery(query_level);
getlevel_h=(Vector)dbBean.go();
%>



<tr>
<td width="49%" valign="top">
<table width="100%" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts" cellpadding="2">
<form action="remove_banner_actionAll.jsp" method="post" name="frmEngTopBanner" id="frmEngTopBanner">
<tr bgcolor="#efefef">
	<td align="center" align="center" colspan="4"><b>English</b></td>
</tr>
<tr bgcolor="#efefef">
	<td align="center"><b>S/N</b></td>
	<td align="center"><b>English Section</b></td>
	<td align="center"><b>Current Banner</b></td>
	<td align="center"><b>Map This</b></td>
</tr>	
<% 
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
%>
<tr>
	<td class="testn"><b><%=i+1%></b></td>
	<td class="testn"><b><%=dbBean.getcell(getlevel,1,i)%></b></td>
	<%--<td align="center"><%=dbBean.getcell(getlevel,1,i)%></b></td>--%>
	<td align="center"><% 	strFileType = dbBean.getcell(getlevel,8,i);
	if (strFileType.equals("")) {
		strFileType = "0";
	}
	if (!dbBean.getcell(getlevel,4,i).equals("")){ 
	if (strFileType.equals("0")) { // it is image banner
	if (dbBean.getcell(getlevel,4,i).equals("2")){ // linked to external url%>
	<a href="<%=dbBean.getcell(getlevel,3,i)%>" class="linkn" target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel,6,i)%>"  border="0" alt="<%=dbBean.getcell(getlevel,5,i)%>"></a>
	<%}else{%>
	<a href="<%=newurl%><%=dbBean.getcell(getlevel,3,i)%>&lang=0" class="linkn"  target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel,6,i)%>"  border="0" alt="<%=dbBean.getcell(getlevel,5,i)%>"></a>
	<%} // end of link type
	  } else { // it is flash banner %><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="<%=dbBean.getcell(getlevel,9,i)%>" height="<%=dbBean.getcell(getlevel,10,i)%>" ALIGN=""><PARAM NAME=movie VALUE="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel,6,i)%>"> <PARAM NAME=quality VALUE=high> <PARAM NAME=wmode VALUE=transparent> <PARAM NAME=bgcolor VALUE=#FFFFFF><EMBED src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel,6,i)%>" quality=high wmode=transparent bgcolor=#FFFFFF  width="<%=dbBean.getcell(getlevel,9,i)%>" height="<%=dbBean.getcell(getlevel,10,i)%>" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED></OBJECT>
	  <%}
	  }	else { // no banner assigned
	%>Not Assigned<%}%>	</td>
	<td align="center">
	<% if (!dbBean.getcell(getlevel,4,i).equals("")){ isRemove = true;%>
	<input type="checkbox" name="chkRemove" id="chkRemove" value="<%=dbBean.getcell(getlevel,7,i)%>">
	<%--<a href="remove_banner_action.jsp?bid=<%=dbBean.getcell(getlevel,7,i)%>">remove</a>--%>
	<% }else{ %>
	---
	<% } %>
	</td>
</tr>
<%
}
	if(isRemove){  // if Condition for Displaying the removebutton%>
		<tr>
			<td colspan="5" align="right"><input type="button" name="btnRemove" value="Remove" onClick="return formValidation('frmEngTopBanner');"></td>
		</tr>
<%	}			// end of If for Remove button
}isRemove = false;
%>
</form>				<!--End of Form for Remove Top banner for English-->
</table>	
</td><td width="2%"></td><td width="49%" valign="top">
<table width="100%" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts" cellpadding="2">	
<form action="remove_banner_actionAll.jsp" method="post" name="frmHindiTopBanner" id="frmHindiTopBanner">
<tr bgcolor="#efefef">
	<td align="center" align="center" colspan="4"><b>Hindi</b></td>
</tr>
<tr bgcolor="#efefef">
	<td align="center"><b>S/N</b></td>
	<td align="center"><b>Hindi Section</b></td>
	<td align="center"><b>Current Banner</b></td>
	<td align="center"><b>Map This</b></td>
</tr>

<% 
if(getlevel_h.size()!=0){
for(int i=0;i<getlevel_h.size();i++){
%>
<tr>
	<td class="textn"><b><%=i+1%></b></td>
	<td class="hinditext"><b><%=dbBean.getcell(getlevel_h,1,i)%></b></td>
	<td align="center"><% 	strFileType = dbBean.getcell(getlevel_h,8,i);
	if (strFileType.equals("")) {
		strFileType = "0";
	}
	if (!dbBean.getcell(getlevel_h,4,i).equals("")){ 
	if (strFileType.equals("0")) { // it is image banner
	if (dbBean.getcell(getlevel_h,4,i).equals("2")){ // linked to external url%>
	<a href="<%=dbBean.getcell(getlevel_h,3,i)%>" class="linkn" target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel_h,6,i)%>"  border="0" alt="<%=dbBean.getcell(getlevel_h,5,i)%>"></a>
	<%}else{%>
	<a href="<%=newurl%><%=dbBean.getcell(getlevel_h,3,i)%>&lang=0" class="linkn"  target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel_h,6,i)%>"  border="0" alt="<%=dbBean.getcell(getlevel_h,5,i)%>"></a>
	<%} // end of link type
	  } else { // it is flash banner %><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="<%=dbBean.getcell(getlevel_h,9,i)%>" height="<%=dbBean.getcell(getlevel_h,10,i)%>" ALIGN=""><PARAM NAME=movie VALUE="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel_h,6,i)%>"> <PARAM NAME=quality VALUE=high> <PARAM NAME=wmode VALUE=transparent> <PARAM NAME=bgcolor VALUE=#FFFFFF><EMBED src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel_h,6,i)%>" quality=high wmode=transparent bgcolor=#FFFFFF  width="<%=dbBean.getcell(getlevel_h,9,i)%>" height="<%=dbBean.getcell(getlevel_h,10,i)%>" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED></OBJECT>
	  <%}
	  }	else { // no banner assigned
	%>Not Assigned<%}%>	</td>
	<td align="center">
	<% if (!dbBean.getcell(getlevel_h,4,i).equals("")){ isRemove = true;%>
	<input type="checkbox" name="chkRemove" id="chkRemove" value="<%=dbBean.getcell(getlevel_h,7,i)%>">
	<%--<a href="remove_banner_action.jsp?bid=<%=dbBean.getcell(getlevel_h,7,i)%>">remove</a>--%>
	<% }else{ %>
	---
	<% } %>
	</td>
</tr>	
<%
}	// end of for loop
	if(isRemove){  // if Condition for Displaying the removebutton%>
		<tr>
			<td colspan="5" align="right"><input type="button" name="btnRemove" value="Remove" onClick="return formValidation('frmHindiTopBanner');"></td>
		</tr>
<%	}			// end of If For Remove Button
	
}	// end of if for record count check
//end for if the banner type is HOME
isRemove = false;
%>
</form>				<!--End of Form for Remove Top banner for Hindi-->
</table>	
	</td>
</tr>
<tr>
	<td colspan="3" align="center" class="textn">
	
	</td>
</tr>
</table>


<br><br>
<table width=95% align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Remove Side Banner</b></td>
</tr>
</table>
<%
// this query gets the navigation information to produde "You are here" bar

Vector getleve2 = new Vector();
query_level = "SELECT CMS_SECTION_MANAGEMENT.DSM_ID, CMS_LANGUAGE_CONTENT.DLC_LABEL, CMS_SECTION_MANAGEMENT.DSM_PATH, TEMPTBL.DCB_LINK, TEMPTBL.DCB_LINK_TYPE, TEMPTBL.DCB_HOVER_ENGLISH, TEMPTBL.DCB_FILE_SYSNAME,DMB_ID, TEMPTBL.DCB_FILE_TYPE, TEMPTBL.DCB_WIDTH, TEMPTBL.DCB_HEIGHT FROM  CMS_LANGUAGE_CONTENT,CMS_SECTION_MANAGEMENT LEFT  JOIN (select * from CMS_CREATE_BANNER,CMS_MAP_BANNER where CMS_MAP_BANNER.DMB_DCB_ID = CMS_CREATE_BANNER.DCB_ID and DMB_LANG_ID = 0 and DMB_FLAG = 1 AND DMB_DCB_TYPE = 1) as TEMPTBL on TEMPTBL.DMB_DSM_ID = CMS_SECTION_MANAGEMENT.DSM_ID where CMS_LANGUAGE_CONTENT.DLC_LANG_ID = 0 and CMS_SECTION_MANAGEMENT.DSM_PARENT = 0 and CMS_SECTION_MANAGEMENT.DSM_ID = CMS_LANGUAGE_CONTENT.DLC_DSM_ID order by DSM_ID";

dbBean.setQuery(query_level);
getleve2=(Vector)dbBean.go();
%>
<table width="95%" cellpadding="0" cellspacing="0">

<%

Vector getleve2_h = new Vector();
query_level = "SELECT CMS_SECTION_MANAGEMENT.DSM_ID, CMS_LANGUAGE_CONTENT.DLC_LABEL, CMS_SECTION_MANAGEMENT.DSM_PATH, TEMPTBL.DCB_LINK, TEMPTBL.DCB_LINK_TYPE, TEMPTBL.DCB_HOVER_ENGLISH, TEMPTBL.DCB_FILE_SYSNAME,DMB_ID, TEMPTBL.DCB_FILE_TYPE, TEMPTBL.DCB_WIDTH, TEMPTBL.DCB_HEIGHT FROM  CMS_LANGUAGE_CONTENT,CMS_SECTION_MANAGEMENT LEFT  JOIN (select * from CMS_CREATE_BANNER,CMS_MAP_BANNER where CMS_MAP_BANNER.DMB_DCB_ID = CMS_CREATE_BANNER.DCB_ID and DMB_LANG_ID = 1 and DMB_FLAG=1 AND DMB_DCB_TYPE = 1) as TEMPTBL on TEMPTBL.DMB_DSM_ID = CMS_SECTION_MANAGEMENT.DSM_ID where CMS_LANGUAGE_CONTENT.DLC_LANG_ID = 1 and CMS_SECTION_MANAGEMENT.DSM_PARENT = 0 and CMS_SECTION_MANAGEMENT.DSM_ID = CMS_LANGUAGE_CONTENT.DLC_DSM_ID order by DSM_ID";

dbBean.setQuery(query_level);
getleve2_h=(Vector)dbBean.go();
%>
<tr>
<td width="49%" valign="top">
<table width="100%" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts" cellpadding="2">
<form action="remove_banner_actionAll.jsp" method="post" name="frmEnglishLeftBanner" id="frmEnglishLeftBanner">
<tr bgcolor="#efefef">
	<td align="center" align="center" colspan="4"><b>English</b></td>
</tr>
<tr bgcolor="#efefef">
	<td align="center"><b>S/N</b></td>
	<td align="center"><b>English Section</b></td>
	<td align="center"><b>Current Banner</b></td>
	<td align="center"><b>Map This</b></td>
</tr>	
<% 
if(getleve2.size()!=0){
for(int i=0;i<getleve2.size();i++){
%>
<tr>
	<td class="testn"><b><%=i+1%></b></td>
	<td class="testn"><b><%=dbBean.getcell(getleve2,1,i)%></b></td>
	<td align="center"><% 	strFileType = dbBean.getcell(getleve2,8,i);
	if (strFileType.equals("")) {
		strFileType = "0";
	}
	if (!dbBean.getcell(getleve2,4,i).equals("")){ 
	if (strFileType.equals("0")) { // it is image banner
	if (dbBean.getcell(getleve2,4,i).equals("2")){ // linked to external url%>
	<a href="<%=dbBean.getcell(getleve2,3,i)%>" class="linkn" target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getleve2,6,i)%>"  border="0" alt="<%=dbBean.getcell(getleve2,5,i)%>"></a>
	<%}else{%>
	<a href="<%=newurl%><%=dbBean.getcell(getleve2,3,i)%>&lang=0" class="linkn"  target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getleve2,6,i)%>"  border="0" alt="<%=dbBean.getcell(getleve2,5,i)%>"></a>
	<%} // end of link type
	  } else { // it is flash banner %><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="<%=dbBean.getcell(getleve2,9,i)%>" height="<%=dbBean.getcell(getleve2,10,i)%>" ALIGN=""><PARAM NAME=movie VALUE="<%=newurl%>bannerfile/<%=dbBean.getcell(getleve2,6,i)%>"> <PARAM NAME=quality VALUE=high> <PARAM NAME=wmode VALUE=transparent> <PARAM NAME=bgcolor VALUE=#FFFFFF><EMBED src="<%=newurl%>bannerfile/<%=dbBean.getcell(getleve2,6,i)%>" quality=high wmode=transparent bgcolor=#FFFFFF  width="<%=dbBean.getcell(getleve2,9,i)%>" height="<%=dbBean.getcell(getleve2,10,i)%>" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED></OBJECT>
	  <%}
	  }	else { // no banner assigned
	%>Not Assigned<%}%>	</td>
	<td align="center">
	<%if (!dbBean.getcell(getleve2,4,i).equals("")){ isRemove = true;%>
	<input type="checkbox" name="chkRemove" id="chkRemove" value="<%=dbBean.getcell(getleve2,7,i)%>">
	<%--<a href="remove_banner_action.jsp?bid=<%=dbBean.getcell(getleve2,7,i)%>">remove</a>--%>
	<% }else{ %>
	---
	<% }%>
	</td>
</tr>	
<%
}
	if(isRemove){  // if Condition for Displaying the removebutton%>
		<tr>
			<td colspan="5" align="right"><input type="button" name="btnRemove" value="Remove" onClick="return formValidation('frmEnglishLeftBanner');"></td>
		</tr>
<%	}			// end of If for Remove Button

}
isRemove = false;
%>
</form>
</table>	
</td><td width="2%"></td><td width="49%" valign="top">
<table width="100%" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts" cellpadding="2">	
<form action="remove_banner_actionAll.jsp" method="post" name="frmHindiLeftBanner" id="frmHindiLeftBanner">
<tr bgcolor="#efefef">
	<td align="center" align="center" colspan="4"><b>Hindi</b></td>
</tr>
<tr bgcolor="#efefef">
	<td align="center"><b>S/N</b></td>
	<td align="center"><b>Hindi Section</b></td>
	<td align="center"><b>Current Banner</b></td>
	<td align="center"><b>Map This</b></td>
</tr>

<% 
if(getleve2_h.size()!=0){
for(int i=0;i<getleve2_h.size();i++){
%>
<tr>
	<td class="textn"><b><%=i+1%></b></td>
	<td class="hinditext"><b><%=dbBean.getcell(getleve2_h,1,i)%></b></td>
	<td align="center"><% 	strFileType = dbBean.getcell(getleve2_h,8,i);
	if (strFileType.equals("")) {
		strFileType = "0";
	}
	if (!dbBean.getcell(getleve2_h,4,i).equals("")){ 
	if (strFileType.equals("0")) { // it is image banner
	if (dbBean.getcell(getleve2_h,4,i).equals("2")){ // linked to external url%>
	<a href="<%=dbBean.getcell(getleve2_h,3,i)%>" class="linkn" target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getleve2_h,6,i)%>"  border="0" alt="<%=dbBean.getcell(getleve2_h,5,i)%>"></a>
	<%}else{%>
	<a href="<%=newurl%><%=dbBean.getcell(getleve2_h,3,i)%>&lang=0" class="linkn"  target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getleve2_h,6,i)%>"  border="0" alt="<%=dbBean.getcell(getleve2_h,5,i)%>"></a>
	<%} // end of link type
	  } else { // it is flash banner %><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="<%=dbBean.getcell(getleve2_h,9,i)%>" height="<%=dbBean.getcell(getleve2_h,10,i)%>" ALIGN=""><PARAM NAME=movie VALUE="<%=newurl%>bannerfile/<%=dbBean.getcell(getleve2_h,6,i)%>"> <PARAM NAME=quality VALUE=high> <PARAM NAME=wmode VALUE=transparent> <PARAM NAME=bgcolor VALUE=#FFFFFF><EMBED src="<%=newurl%>bannerfile/<%=dbBean.getcell(getleve2_h,6,i)%>" quality=high wmode=transparent bgcolor=#FFFFFF  width="<%=dbBean.getcell(getleve2_h,9,i)%>" height="<%=dbBean.getcell(getleve2_h,10,i)%>" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED></OBJECT>
	  <%}
	  }	else { // no banner assigned
	%>Not Assigned<%}%>	</td>
	<td align="center">
	<% if (!dbBean.getcell(getleve2_h,4,i).equals("")){ isRemove = true;%>	
	<input type="checkbox" name="chkRemove" id="chkRemove" value="<%=dbBean.getcell(getleve2_h,7,i)%>">
	<%--<a href="remove_banner_action.jsp?bid=<%=dbBean.getcell(getleve2_h,7,i)%>">remove</a>--%>
	<% }else{ %>
	---
	<% } %>
	</td>
</tr>	
<%
}	// end of for loop
	if(isRemove){  // if Condition for Displaying the removebutton%>
<tr>
	<td colspan="5" align="right"><input type="button" name="btnRemove" value="Remove" onClick="return formValidation('frmHindiLeftBanner');"></td>
</tr>
<%
	}			// end of IF for Remove Button
}	// end of if for record count check
//end for if the banner type is HOME
isRemove = false;
%>
</form>
</table>	
	</td>
</tr>
<tr>
	<td colspan="3" align="center" class="textn">
	
	</td>
</tr>
</table>

<br><br>
</div>


<%@ include file="../header/footer.jsp" %>