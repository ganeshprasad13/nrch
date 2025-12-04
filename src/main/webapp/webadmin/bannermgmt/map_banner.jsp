<%@ include file="../header/headerInner.jsp" %>

<% 
// get todays date
java.util.Date today = new java.util.Date();
java.util.Calendar c = new GregorianCalendar();
int day   = today.getDate();
int month = today.getMonth()+1;
int year  = c.get(Calendar.YEAR);
String strFileType = "";
%>
	

<div align="center">

<table width=95% align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Map Banner</b></td>
</tr>
</table>
<table width="95%" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts">
<tr bgcolor="#efefef">
	<td align="center"><b>Banner</b></td>
	<td align="center"><b>Type</b></td>
	<td align="center"><b>Link To</b></td>
	<td align="center"><b>Mouse Over Text</b></td>
	<td align="center"><b>File Type</b></td>
	<td align="center"><b>CREATED BY</b></td>
</tr>
<%

Vector getright = new Vector();
String query_right;
query_right = "SELECT DCB_TYPE,DCB_LINK_TYPE,DCB_LINK,DCB_HOVER_ENGLISH,DCB_HOVER_HINDI,DCB_FILE_TYPE,DCB_CREATED_BY,DCB_FILE_NAME,DCB_FILE_SYSNAME,DCB_FILE_SIZE,DCB_FILE_EXT,DCB_ID,DCB_CREATED_DATE, DCB_WIDTH, DCB_HEIGHT FROM CMS_CREATE_BANNER ";
query_right = query_right + " WHERE DCB_ID = "+request.getParameter("id");
dbBean.setQuery(query_right);
//out.println(query_right);
getright=(Vector)dbBean.go();

%>
<%
if (getright.size()!=0){
for (int i=0;i<getright.size();i++){
%>

<tr>
	<td><%
	strFileType = dbBean.getcell(getright,5,i);
	if (strFileType.equals("")) {
		strFileType = "0";
	}
	if (strFileType.equals("0")) { // it is image banner
	if (dbBean.getcell(getright,1,i).equals("2")){%><a href="<%=dbBean.getcell(getright,2,i)%>" class="linkn" target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getright,8,i)%>"  border="0" alt=""></a>
	<%}else{%>
	<a href="<%=newurl%><%=dbBean.getcell(getright,2,i)%>&lang=0" class="linkn"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getright,8,i)%>"  border="0" alt=""></a>
	<%}
	} else { // it is flash banner %>
	 <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" WIDTH="<%=dbBean.getcell(getright,13,i)%>" HEIGHT="<%=dbBean.getcell(getright,14,i)%>" ALIGN="">
<PARAM NAME=movie VALUE="<%=newurl%>bannerfile/<%=dbBean.getcell(getright,8,i)%>">
<PARAM NAME=quality VALUE=high> <PARAM NAME=wmode VALUE=transparent> <PARAM NAME=bgcolor VALUE=#FFFFFF>
<EMBED src="<%=newurl%>bannerfile/<%=dbBean.getcell(getright,8,i)%>" quality=high wmode=transparent bgcolor=#FFFFFF  WIDTH="<%=dbBean.getcell(getright,13,i)%>" HEIGHT="<%=dbBean.getcell(getright,14,i)%>" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
</EMBED>
</OBJECT>
	  <%}%></td>
	<td>
	<%if (dbBean.getcell(getright,0,i).equals("0")){%>
	Top
	<%}else{%>
	Side
	<%}%>
	</td>
	<td>
	<%if (dbBean.getcell(getright,1,i).equals("0")){%>
	Link to Section<br><%=dbBean.getcell(getright,2,i)%>
	<%}else if(dbBean.getcell(getright,1,i).equals("1")){%>
	Link to Direct Content<br><%=dbBean.getcell(getright,2,i)%>
	<%}else{%>
	To URL<br><%=dbBean.getcell(getright,2,i)%>
	<%}%>
	</td>
	<td>
	<font class="textn"><%=dbBean.getcell(getright,3,i)%></font><br>
	<font class="hinditext"><%=dbBean.getcell(getright,3,i)%></font>
	</td>
	<td align="center">
<%=dbBean.getcell(getright,10,i)%>
<%
	if(getright.size()!=0){
	String strFileSize=dbBean.getcell(getright,9,i);
	int intFileSize = Integer.parseInt(strFileSize);
	if (intFileSize < 1024) {
		strFileSize = Integer.toString(intFileSize) + " Bytes";
	} else if ((intFileSize >=1024) && (intFileSize < 1048576)) {
		strFileSize = Integer.toString(intFileSize/1024) + " KB";
	} else {
		strFileSize = Integer.toString(intFileSize/1048576) + " MB";	
	}
%>
	<b>(<%=strFileSize%>)</b><%}%>
	</td>
	<td align="center">
	<%=dbBean.getcell(getright,6,i)%><br>
	<%=dbBean.getcell(getright,12,i)%>
	</td>
</tr>
<% 
	}
	}else{
%>
<tr>
	<td colspan="6" align="center">
	No record(s) found
	</td>
</tr>
<% } %>
</table>
<%
// this query gets the navigation information to produde "You are here" bar
Vector getlevel = new Vector();
String query_level;
query_level = "SELECT CMS_SECTION_MANAGEMENT.DSM_ID, CMS_LANGUAGE_CONTENT.DLC_LABEL, CMS_SECTION_MANAGEMENT.DSM_PATH, TEMPTBL.DCB_LINK, TEMPTBL.DCB_LINK_TYPE, TEMPTBL.DCB_HOVER_ENGLISH, TEMPTBL.DCB_FILE_SYSNAME,TEMPTBL.DCB_FILE_TYPE, TEMPTBL.DCB_WIDTH, TEMPTBL.DCB_HEIGHT FROM  CMS_LANGUAGE_CONTENT,CMS_SECTION_MANAGEMENT LEFT JOIN (select * from CMS_CREATE_BANNER,CMS_MAP_BANNER where CMS_MAP_BANNER.DMB_DCB_ID = CMS_CREATE_BANNER.DCB_ID and DMB_LANG_ID = 0 and DMB_FLAG = 1 AND DMB_DCB_TYPE = "+dbBean.getcell(getright,0,0)+") as TEMPTBL on TEMPTBL.DMB_DSM_ID = CMS_SECTION_MANAGEMENT.DSM_ID where CMS_LANGUAGE_CONTENT.DLC_LANG_ID = 0 and CMS_SECTION_MANAGEMENT.DSM_PARENT = 0 and CMS_SECTION_MANAGEMENT.DSM_ID = CMS_LANGUAGE_CONTENT.DLC_DSM_ID order by DSM_ID";

dbBean.setQuery(query_level);
//out.println(query_level);
getlevel=(Vector)dbBean.go();
%>

<br>
<form method="post" name="mapbanner_action" action="map_banner_action.jsp">
<input type="Hidden" name="bid" value="<%=dbBean.getcell(getright,11,0)%>">
<input type="Hidden" name="TYPEID" value="<%=dbBean.getcell(getright,0,0)%>">
<table width="95%" cellpadding="0" cellspacing="0">

<%
int getlevel_hcount = 0;
if(!dbBean.getcell(getright,0,0).equals("2")){

Vector getlevel_h = new Vector();
query_level = "SELECT CMS_SECTION_MANAGEMENT.DSM_ID, CMS_LANGUAGE_CONTENT.DLC_LABEL, CMS_SECTION_MANAGEMENT.DSM_PATH, TEMPTBL.DCB_LINK, TEMPTBL.DCB_LINK_TYPE, TEMPTBL.DCB_HOVER_ENGLISH, TEMPTBL.DCB_FILE_SYSNAME, TEMPTBL.DCB_FILE_TYPE, TEMPTBL.DCB_WIDTH, TEMPTBL.DCB_HEIGHT FROM  CMS_LANGUAGE_CONTENT,CMS_SECTION_MANAGEMENT LEFT JOIN (select * from CMS_CREATE_BANNER,CMS_MAP_BANNER where CMS_MAP_BANNER.DMB_DCB_ID = CMS_CREATE_BANNER.DCB_ID and DMB_LANG_ID = 1 and DMB_FLAG=1 AND DMB_DCB_TYPE = "+dbBean.getcell(getright,0,0)+") as TEMPTBL on TEMPTBL.DMB_DSM_ID = CMS_SECTION_MANAGEMENT.DSM_ID where CMS_LANGUAGE_CONTENT.DLC_LANG_ID = 1 and CMS_SECTION_MANAGEMENT.DSM_PARENT = 0 and CMS_SECTION_MANAGEMENT.DSM_ID = CMS_LANGUAGE_CONTENT.DLC_DSM_ID order by DSM_ID";

dbBean.setQuery(query_level);
getlevel_h=(Vector)dbBean.go();
getlevel_hcount = getlevel_h.size();
%>



<tr>
<td width="49%" valign="top">
<table width="100%" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts" cellpadding="2">
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
	<td align="center"><% 	strFileType = dbBean.getcell(getlevel,7,i);
	if (strFileType.equals("")) {
		strFileType = "0";
	}
	if (!dbBean.getcell(getlevel,4,i).equals("")){ 
	if (strFileType.equals("0")) { // it is image banner
	if (dbBean.getcell(getlevel,4,i).equals("2")){ // linked to external url
%><a href="<%=dbBean.getcell(getlevel,3,i)%>" class="linkn" target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel,6,i)%>"  border="0" alt="<%=dbBean.getcell(getlevel,5,i)%>"></a>
	<%} else { //linked to internal content%> 
	<a href="<%=newurl%><%=dbBean.getcell(getlevel,3,i)%>&lang=0" class="linkn"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel,6,i)%>"  border="0" alt="<%=dbBean.getcell(getlevel,5,i)%>"></a>
	<%} // end of link type
	  } else { // it is flash banner %><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="<%=dbBean.getcell(getlevel,8,i)%>" height="<%=dbBean.getcell(getlevel,9,i)%>" ALIGN=""><PARAM NAME=movie VALUE="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel,6,i)%>"> <PARAM NAME=quality VALUE=high> <PARAM NAME=wmode VALUE=transparent> <PARAM NAME=bgcolor VALUE=#FFFFFF><EMBED src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel,6,i)%>" quality=high wmode=transparent bgcolor=#FFFFFF  width="<%=dbBean.getcell(getlevel,8,i)%>" height="<%=dbBean.getcell(getlevel,9,i)%>" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED></OBJECT>
	  <%}
	  }	else { // no banner assigned
	%>Not Assigned<%}%>	</td>
	<td align="center"><b><INPUT type="Checkbox" name="side" value="<%=dbBean.getcell(getlevel,0,i)%>" id="<%=i%>"></b></td>
</tr>	
<%
}}
%>

</table>	
</td><td width="2%"></td><td width="49%" valign="top">
<table width="100%" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts" cellpadding="2">	
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
	<td class="textn">
	<b><%=i+1%></b>
	</td>
	<td >
	<b><FONT face=APS-C-DV-Prakash size=4><%=dbBean.getcell(getlevel_h,1,i)%></font></b>
	</td>
	<td align="center"><% 	strFileType = dbBean.getcell(getlevel_h,7,i);
	if (strFileType.equals("")) {
		strFileType = "0";
	}
	if (!dbBean.getcell(getlevel_h,4,i).equals("")){ 
	if (strFileType.equals("0")) { // it is image banner
	if (dbBean.getcell(getlevel_h,4,i).equals("2")){ // linked to external url
%><a href="<%=dbBean.getcell(getlevel_h,3,i)%>" class="linkn" target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel_h,6,i)%>"  border="0" alt="<%=dbBean.getcell(getlevel_h,5,i)%>"></a>
	<%} else { //linked to internal content%> 
	<a href="<%=newurl%><%=dbBean.getcell(getlevel_h,3,i)%>&lang=0" class="linkn"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel_h,6,i)%>"  border="0" alt="<%=dbBean.getcell(getlevel_h,5,i)%>"></a>
	<%} // end of link type
	  } else { // it is flash banner %><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="<%=dbBean.getcell(getlevel_h,8,i)%>" height="<%=dbBean.getcell(getlevel_h,9,i)%>" ALIGN=""><PARAM NAME=movie VALUE="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel_h,6,i)%>"> <PARAM NAME=quality VALUE=high> <PARAM NAME=wmode VALUE=transparent> <PARAM NAME=bgcolor VALUE=#FFFFFF><EMBED src="<%=newurl%>bannerfile/<%=dbBean.getcell(getlevel_h,6,i)%>" quality=high wmode=transparent bgcolor=#FFFFFF  width="<%=dbBean.getcell(getlevel_h,8,i)%>" height="<%=dbBean.getcell(getlevel_h,9,i)%>" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED></OBJECT>
	  <%}
	  }	else { // no banner assigned
	%>Not Assigned<%}%>	</td>
	<td align="center">
	<b><INPUT type="Checkbox" name="sidh" value="<%=dbBean.getcell(getlevel_h,0,i)%>" id="<%=i+100000%>"></b>
	</td>
</tr>	

<%
}	// end of for loop

%>

<script>
function chkAllHindi(){

<% 
if (getlevel_hcount!=0){
for(int i=0;i<getlevel_hcount;i++){
%>

var iii = <%=i%>;
var somename = document.getElementById(<%=i+100000%>);
if(document.mapbanner_action.selectAllHindi.checked == true){
somename.checked = true;
}else{
somename.checked = false;
}

<% 
	}
	}
%>
}
</script>	

<%
}	// end of if for record count check


}	//end for if the banner type is HOME
%>

</table>	
<script>
function chkAll(){
//alert ("here");
<% 
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
%>

var somename = document.getElementById(<%=i%>);
if(document.mapbanner_action.selectAll.checked == true){
somename.checked = true;
}else{
somename.checked = false;
}

<% 
	}
	}
%>
}
</script>	


	</td>
</tr>
<tr>
	<td colspan="3" align="center" class="textn">
	<br>
	Select All English <input type="checkbox" name="selectAll" onclick="javascript:chkAll();">
	Select All Hindi <input type="checkbox" name="selectAllHindi" onclick="javascript:chkAllHindi();">
<input type="hidden" name="sday" id="sday" value="1">
<input type="hidden" name="smon" id="smon" value="1">
<input type="hidden" name="syear" id="syear" value="1970">
<input type="hidden" name="eday" id="sday" value="1">
<input type="hidden" name="emon" id="smon" value="1">
<input type="hidden" name="eyear" id="syear" value="1970">
	<br><br>
<%--	<!--- From <select name="sday">
<option value="01" <%if(day==01){%>selected<%}%>>1</option>
<option value="02" <%if(day==02){%>selected<%}%>>2</option>
<option value="03" <%if(day==03){%>selected<%}%>>3</option>
<option value="04" <%if(day==04){%>selected<%}%>>4</option>
<option value="05" <%if(day==05){%>selected<%}%>>5</option>
<option value="06" <%if(day==06){%>selected<%}%>>6</option>
<option value="07" <%if(day==07){%>selected<%}%>>7</option>
<option value="08" <%if(day==8){%>selected<%}%>>8</option>
<option value="09" <%if(day==9){%>selected<%}%>>9</option>
<option value="10" <%if(day==10){%>selected<%}%>>10</option>
<option value="11" <%if(day==11){%>selected<%}%>>11</option>
<option value="12" <%if(day==12){%>selected<%}%>>12</option>
<option value="13" <%if(day==13){%>selected<%}%>>13</option>
<option value="14" <%if(day==14){%>selected<%}%>>14</option>
<option value="15" <%if(day==15){%>selected<%}%>>15</option>
<option value="16" <%if(day==16){%>selected<%}%>>16</option>
<option value="17" <%if(day==17){%>selected<%}%>>17</option>
<option value="18" <%if(day==18){%>selected<%}%>>18</option>
<option value="19" <%if(day==19){%>selected<%}%>>19</option>
<option value="20" <%if(day==20){%>selected<%}%>>20</option>
<option value="21" <%if(day==21){%>selected<%}%>>21</option>
<option value="22" <%if(day==22){%>selected<%}%>>22</option>
<option value="23" <%if(day==23){%>selected<%}%>>23</option>
<option value="24" <%if(day==24){%>selected<%}%>>24</option>
<option value="25" <%if(day==25){%>selected<%}%>>25</option>
<option value="26" <%if(day==26){%>selected<%}%>>26</option>
<option value="27" <%if(day==27){%>selected<%}%>>27</option>
<option value="28" <%if(day==28){%>selected<%}%>>28</option>
<option value="29" <%if(day==29){%>selected<%}%>>29</option>
<option value="30" <%if(day==30){%>selected<%}%>>30</option>
<option value="31" <%if(day==31){%>selected<%}%>>31</option>
</select>
<select name="smon">
<option value="01" <%if(month==01){%>selected<%}%>> Jan </option>
<option value="02" <%if(month==02){%>selected<%}%>> Feb </option>
<option value="03" <%if(month==03){%>selected<%}%>> Mar </option>
<option value="04" <%if(month==04){%>selected<%}%>> Apr </option>
<option value="05" <%if(month==05){%>selected<%}%>> May </option>
<option value="06" <%if(month==06){%>selected<%}%>> Jun </option>
<option value="07" <%if(month==07){%>selected<%}%>> Jul </option>
<option value="08" <%if(month==8){%>selected<%}%>> Aug </option>
<option value="09" <%if(month==9){%>selected<%}%>> Sep </option>
<option value="10" <%if(month==10){%>selected<%}%>> Oct </option>
<option value="11" <%if(month==11){%>selected<%}%>> Nov </option>
<option value="12" <%if(month==12){%>selected<%}%>> Dec </option>
</select>

<select name="syear">
<option value="2003" <%if(year==2003){%>selected<%}%>>2003</option>
<option value="2004" <%if(year==2004){%>selected<%}%>>2004</option>
<option value="2005" <%if(year==2005){%>selected<%}%>>2005</option>
<option value="2006" <%if(year==2006){%>selected<%}%>>2006</option>
<option value="2007" <%if(year==2007){%>selected<%}%>>2007</option>
</select>
 To 
 <select name="eday">
<option value="01" <%if(day==01){%>selected<%}%>>1</option>
<option value="02" <%if(day==02){%>selected<%}%>>2</option>
<option value="03" <%if(day==03){%>selected<%}%>>3</option>
<option value="04" <%if(day==04){%>selected<%}%>>4</option>
<option value="05" <%if(day==05){%>selected<%}%>>5</option>
<option value="06" <%if(day==06){%>selected<%}%>>6</option>
<option value="07" <%if(day==07){%>selected<%}%>>7</option>
<option value="08" <%if(day==8){%>selected<%}%>>8</option>
<option value="09" <%if(day==9){%>selected<%}%>>9</option>
<option value="10" <%if(day==10){%>selected<%}%>>10</option>
<option value="11" <%if(day==11){%>selected<%}%>>11</option>
<option value="12" <%if(day==12){%>selected<%}%>>12</option>
<option value="13" <%if(day==13){%>selected<%}%>>13</option>
<option value="14" <%if(day==14){%>selected<%}%>>14</option>
<option value="15" <%if(day==15){%>selected<%}%>>15</option>
<option value="16" <%if(day==16){%>selected<%}%>>16</option>
<option value="17" <%if(day==17){%>selected<%}%>>17</option>
<option value="18" <%if(day==18){%>selected<%}%>>18</option>
<option value="19" <%if(day==19){%>selected<%}%>>19</option>
<option value="20" <%if(day==20){%>selected<%}%>>20</option>
<option value="21" <%if(day==21){%>selected<%}%>>21</option>
<option value="22" <%if(day==22){%>selected<%}%>>22</option>
<option value="23" <%if(day==23){%>selected<%}%>>23</option>
<option value="24" <%if(day==24){%>selected<%}%>>24</option>
<option value="25" <%if(day==25){%>selected<%}%>>25</option>
<option value="26" <%if(day==26){%>selected<%}%>>26</option>
<option value="27" <%if(day==27){%>selected<%}%>>27</option>
<option value="28" <%if(day==28){%>selected<%}%>>28</option>
<option value="29" <%if(day==29){%>selected<%}%>>29</option>
<option value="30" <%if(day==30){%>selected<%}%>>30</option>
<option value="31" <%if(day==31){%>selected<%}%>>31</option>
</select>
<select name="emon">
<option value="01" <%if(month==01){%>selected<%}%>> Jan </option>
<option value="02" <%if(month==02){%>selected<%}%>> Feb </option>
<option value="03" <%if(month==03){%>selected<%}%>> Mar </option>
<option value="04" <%if(month==04){%>selected<%}%>> Apr </option>
<option value="05" <%if(month==05){%>selected<%}%>> May </option>
<option value="06" <%if(month==06){%>selected<%}%>> Jun </option>
<option value="07" <%if(month==07){%>selected<%}%>> Jul </option>
<option value="08" <%if(month==8){%>selected<%}%>> Aug </option>
<option value="09" <%if(month==9){%>selected<%}%>> Sep </option>
<option value="10" <%if(month==10){%>selected<%}%>> Oct </option>
<option value="11" <%if(month==11){%>selected<%}%>> Nov </option>
<option value="12" <%if(month==12){%>selected<%}%>> Dec </option>
</select>

<select name="eyear">
<option value="2003" <%if(year==2003){%>selected<%}%>>2003</option>
<option value="2004" <%if(year==2004){%>selected<%}%>>2004</option>
<option value="2005" <%if(year==2005){%>selected<%}%>>2005</option>
<option value="2006" <%if(year==2006){%>selected<%}%>>2006</option>
<option value="2007" <%if(year==2007){%>selected<%}%>>2007</option>
</select> --->--%>

	</td>
</tr>
<tr>
	<td colspan="3" align="center">
	<br><input type="Submit" name="Map Banner" value="Map Selected Section" class="textbox">

	</td>
</tr>
</table>

</form>
<br><br>
</div>


<%@ include file="../header/footer.jsp" %>