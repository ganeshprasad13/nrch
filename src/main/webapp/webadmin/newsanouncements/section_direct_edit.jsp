<%try{%>

<%int intPageNo=1;%>
<%@ include file="../header/headerInner.jsp" %>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
function popUp(theURL,name,w,h,X,Y) {
if ( X == -1) {
X = screen.availWidth - w ;
X = X/2;
}
if (Y == -1) {
Y = screen.availHeight -h ;
Y = Y/2;
}
p="width=" + w + ",height=" + h + ",toolbar=0,menubar=0,status=0,scrollbars=1,resizable=0,directories=0,screenX=" + X + ",screenY=" + Y + ",left=" + X + ",top=" + Y + ",header=0";
window.open(theURL,name,p);
}
function updateEngFile(arg)
{
	engFiles.document.open();
	engFiles.document.writeln(arg);
	engFiles.document.close();
}
function updateHindiFile(arg)
{
	hindiFiles.document.open();
	hindiFiles.document.writeln(arg);
	hindiFiles.document.close();
}
function showRTF(rtfid) {
	var obj1 = document.getElementById("rtf1");
	var obj2 = document.getElementById("rtf2");
	if(rtfid==1) {
		obj1.style.display =""; 
		obj2.style.display ="none"; 
	} else {
		obj2.style.display =""; 
		obj1.style.display ="none"; 
	}
}
</SCRIPT>


<%
Vector getContent = new Vector();


Vector getinfo = new Vector();
String query_info;
query_info = "SELECT DDC_ID, DDC_LABEL, DDC_LANG_ID, DDC_DESCRIPTION, DDC_START_DATE, DDC_END_DATE, DDC_CREATED_BY, DDC_CREATED_DATE, DDC_MODIFIED_BY, DDC_MODIFIED_DATE, DDC_IDENTIFIER, DDC_RIGHT, DDC_ADDTO_TICKER, DATE_FORMAT(DDC_START_DATE,'%d'), DATE_FORMAT(DDC_START_DATE,'%m'), DATE_FORMAT(DDC_START_DATE,'%Y'), DATE_FORMAT(DDC_END_DATE,'%d'), DATE_FORMAT(DDC_END_DATE,'%m'), DATE_FORMAT(DDC_END_DATE,'%Y'),DDC_TENDERNO,DDC_DIVISIONS_ID,DDC_DEPARTMENTS_ID,DDC_OFFICER_ID,DDC_PRESS_CITY,DDC_PRESS_NEWS_NO FROM  CMS_DIRECT_CONTENT WHERE  DDC_IDENTIFIER = '"+request.getParameter("refid")+"' AND DDC_STATUS <> 2 AND DDC_STATUS <> 3 ORDER BY DDC_LANG_ID";
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();


Vector getlevel = new Vector();
String query_level;
query_level = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query_level = query_level + " WHERE DSM_ID = "+request.getParameter("id")+" AND DSM_ID = DLC_DSM_ID AND DLC_LANG_ID =0";
query_level = query_level + " ORDER BY DSM_PATH";
dbBean.setQuery(query_level);
getlevel=(Vector)dbBean.go();

String strEngTitle = dbBean.getcell(getinfo,1,0);
strEngTitle = strEngTitle.replaceAll("&rsquo;","'");
String strEngDesc = dbBean.getcell(getinfo,3,0);
String strEngFileName="";
String strEngFileSysName = "";
String strHindiTitle = dbBean.getcell(getinfo,1,1);
String strHindiDesc = dbBean.getcell(getinfo,3,1);
String strHindiFileName = "";
String strHindiFileSysName = "";
String strRight= dbBean.getcell(getinfo,11,0);
String strAddToTicker = dbBean.getcell(getinfo,12,0);

String strDay = dbBean.getcell(getinfo,13,0);
String strMon = dbBean.getcell(getinfo,14,0);
String strYear = dbBean.getcell(getinfo,15,0);
String streDay = dbBean.getcell(getinfo,16,0);
String streMon = dbBean.getcell(getinfo,17,0);
String streYear = dbBean.getcell(getinfo,18,0);


String TenderNo = dbBean.getcell(getinfo,19,0);
String Divisions = dbBean.getcell(getinfo,20,0);
String Departments = dbBean.getcell(getinfo,21,0);

int sDay = Integer.parseInt(strDay);
int sMon = Integer.parseInt(strMon);
int sYear = Integer.parseInt(strYear);
int eDay = Integer.parseInt(streDay);
int eMon = Integer.parseInt(streMon);
int eYear = Integer.parseInt(streYear);


Vector getright = new Vector();
String query_right;
query_right = "SELECT * FROM CMS_INCLUDE_SECTION ";
query_right = query_right + " WHERE DIS_TYPE = 1";
query_right = query_right + " ORDER BY DIS_LABEL";
dbBean.setQuery(query_right);
getright=(Vector)dbBean.go();

%>
<script language="JavaScript" type="text/javascript">
	function chkform()
	{
		if(document.RTEDemo.label0.value == "")
			{
			alert("Enter Label");
			document.RTEDemo.label0.focus();
			return false;
			}
	// if(document.RTEDemo.label1.value == "")
				// {				
				// alert("Enter Label (in hindi)");
				// document.RTEDemo.label1.focus();	
				// return false;			
				// }
	}
	function showRTF(rtfid) {
	var obj1 = document.getElementById("rtf1");
	var obj2 = document.getElementById("rtf2");
	if(rtfid==1) {
		obj1.style.display =""; 
		obj2.style.display ="none"; 
	} else {
		obj2.style.display =""; 
		obj1.style.display ="none"; 
	}
}
	</script>

<form action="section_direct_edit_action.jsp" method="post" name="RTEDemo" id="RTEDemo" onsubmit="javascript:return chkform()">
	<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
<br>
<p align="center"><span align="center" class="mgContentTitle">Manage 
<% 
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
%>
<aa href="<%=strAppPath%>/webadmin/section/section_management.jsp?parent=<%=dbBean.getcell(getlevel,0,i)%>&path=<%=dbBean.getcell(getlevel,2,i)%>" class="link" style="font-family:tahoma;font-weight:bold;font-size:14px;color:white;text-decoration:none;"><%=dbBean.getcell(getlevel,1,i)%></a>
<% 
	}
	}
%>
</span></p>
<div align="center">
<br>	
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Manage Content for Direct Section</b></td>
</tr>
<tr>
	<td align="right" width="50%">Label in <%=strLanguage1%></td>
	<td width="50%">
	<input type="text" class="textbox" name="label0" size="60" value="<%=strEngTitle%>">
	</td>
</tr>
<tr>
	<td align="right" width="50%">Label (in <%=strLanguage2%>)</td>
	<td width="50%">
	<input type="text" class="textboxh" name="label1" size="60" value="<%=strHindiTitle%>">
	</td>
</tr>



<%if(request.getParameter("id").equals("269")){%>
<tr>
	<td align="right" width="50%">Tender No.</td>
	<td width="50%">
	<input type="text" class="textbox" name="TenderNo" size="60" value="<%=TenderNo%>">
	</td>
</tr>
<%
Vector getDivisions = new Vector();
String query_Divisions;
query_Divisions = "SELECT CMSD_ID, CMSD_DIVISIONS, CMSD_FLAG FROM CMS_DIVISIONS ";
query_Divisions = query_Divisions + " WHERE CMSD_FLAG = 1";
query_Divisions = query_Divisions + " ORDER BY CMSD_DIVISIONS";
dbBean.setQuery(query_Divisions);
getDivisions=(Vector)dbBean.go();
%>
<tr>
	<td align="right" width="50%">Divisions </td>
	<td width="50%">
	 <select name="Divisions" class="textbox" size="1" onChange="replace(this.options.selectedIndex)">
	 <option value="-1">Select</option> 
<% 
Vector getDepartments2 = new Vector();
String query_Departments2;
if(getDivisions.size()!=0){
for(int i=0;i<getDivisions.size();i++){
%>
       <option <%if(dbBean.getcell(getDivisions,0,i).equals(Divisions)){%>selected<%}%> value="<%=dbBean.getcell(getDivisions,0,i)%>"><%=dbBean.getcell(getDivisions,1,i)%></option> 
<%}}%>


   </select> 
	</td>
</tr>
<tr>
	<td align="right" width="50%">Departments</td>
	<td width="50%">
	<select name="Departments" class="textbox" size="1">
	 <option value="-1">Select</option>
	 <%
	 
	 query_Departments2 = "SELECT CMSDEPT_ID , CMSDEPT_NAME , CMSDEPT_FLAG  FROM CMS_DEPARTMENTS";
query_Departments2 = query_Departments2 + " WHERE CMSDEPT_FLAG = 1 and CMSDEPT_CMSD_ID = "+Divisions;
query_Departments2 = query_Departments2 + " ORDER BY CMSDEPT_NAME";
dbBean.setQuery(query_Departments2);
getDepartments2=(Vector)dbBean.go();
if(getDepartments2.size()!=0){
for(int id2=0;id2<getDepartments2.size();id2++){
%>
<option <%if(dbBean.getcell(getDepartments2,0,id2).equals(Departments)){%>selected<%}%> value="<%=dbBean.getcell(getDepartments2,0,id2)%>"><%=dbBean.getcell(getDepartments2,1,id2)%></option> 
<%}}%>
	 </select>
	</td>
</tr>
<script>
var 
  len=document.RTEDemo.Divisions.options.length

var 
  sites=new Array(len)

  for(i=0;i<len;i++)

  sites[i]=new Array() 
sites[0][0]=new Option("Select","-1") 
<% 
Vector getDepartments = new Vector();
String query_Departments;
if(getDivisions.size()!=0){
for(int i=0;i<getDivisions.size();i++){

query_Departments = "SELECT CMSDEPT_ID , CMSDEPT_NAME , CMSDEPT_FLAG  FROM CMS_DEPARTMENTS";
query_Departments = query_Departments + " WHERE CMSDEPT_FLAG = 1 and CMSDEPT_CMSD_ID = "+dbBean.getcell(getDivisions,0,i);
query_Departments = query_Departments + " ORDER BY CMSDEPT_NAME";
dbBean.setQuery(query_Departments);
getDepartments=(Vector)dbBean.go();
if(getDepartments.size()!=0){
for(int id=0;id<getDepartments.size();id++){
%>
  
sites[<%=i+1%>][<%=id%>]=new Option("<%=dbBean.getcell(getDepartments,1,id)%>","<%=dbBean.getcell(getDepartments,0,id)%>") 

<%}}
else{%>
sites[<%=i+1%>][0]=new Option("Select","-1") 
<%}
}}%>
 
var 
  temp=document.RTEDemo.Departments 

  function replace(x){ 

  for (m=temp.options.length-1;m>0;m--)

  temp.options[m]=null

  for(i=0;i<sites[x].length;i++){

  temp.options[i]= new Option(sites[x][i].text,sites[x][i].value)

  }

  temp.options[0].selected=true

  }


 
  function getit(){

  location=temp.options[temp.selectedIndex].value

  }
</script>



<%}%>
<%if(request.getParameter("id").equals("311")){
String strOfficerId = dbBean.getcell(getinfo,22,0);
String strOfficerCity = dbBean.getcell(getinfo,23,0);
String strOfficerNewsNo = dbBean.getcell(getinfo,24,0);
 String strIssueOfficer="SELECT ID,PUB_NAME FROM CMS_PRESS_PUBLISHER_INFO";
Vector getPressOfficer = new Vector();
dbBean.setQuery(strIssueOfficer);
getPressOfficer=(Vector)dbBean.go();%>
	<tr>
	<td align="right">
	Issuing Officer
	</td>
	<td>
	<select name="pubOfficerId">
		<option value="0">-Select Name-</option>
		<%if(getPressOfficer.size()!=0){
		for(int i=0;i<getPressOfficer.size();i++){%>
		<option value="<%=dbBean.getcell(getPressOfficer,0,i)%>" <%if(strOfficerId.equals(dbBean.getcell(getPressOfficer,0,i))){out.print("selected");}%>><%=dbBean.getcell(getPressOfficer,1,i)%></option>
		<%}}%>
	</select>
	</td>
</tr>
<tr>
	<td align="right">Location</td>
	<td><input type="text" name="pubCity" value="<%=strOfficerCity%>"></td>
</tr><tr>
	<td align="right">Press Release Number</td>
	<td><input type="text" name="pubNewsNo" value="<%=strOfficerNewsNo%>"></td>
</tr>
<%}else{%>
<!--<tr>
	<td align="right">
	Include Right
	</td>
	<td>
	<select name="right">
		<option value="0">None</option>
<%
if(getright.size()!=0){
for(int j=0;j<getright.size();j++){
%>	
	<option value="<%=dbBean.getcell(getright,0,j)%>" <%if (dbBean.getcell(getright,0,j).equals(strRight)) {%> selected<%}%>><%=dbBean.getcell(getright,1,j)%></option>
<%
	}
	}
%>
	</select>
	</td>
</tr>-->
<tr>
<%}%>
	<td align="right">Start date</td>
	<td>
<select name="sday">
<option value="01" <%if(sDay==01){%>selected<%}%>>1</option>
<option value="02" <%if(sDay==02){%>selected<%}%>>2</option>
<option value="03" <%if(sDay==03){%>selected<%}%>>3</option>
<option value="04" <%if(sDay==04){%>selected<%}%>>4</option>
<option value="05" <%if(sDay==05){%>selected<%}%>>5</option>
<option value="06" <%if(sDay==06){%>selected<%}%>>6</option>
<option value="07" <%if(sDay==07){%>selected<%}%>>7</option>
<option value="08" <%if(sDay==8){%>selected<%}%>>8</option>
<option value="09" <%if(sDay==9){%>selected<%}%>>9</option>
<option value="10" <%if(sDay==10){%>selected<%}%>>10</option>
<option value="11" <%if(sDay==11){%>selected<%}%>>11</option>
<option value="12" <%if(sDay==12){%>selected<%}%>>12</option>
<option value="13" <%if(sDay==13){%>selected<%}%>>13</option>
<option value="14" <%if(sDay==14){%>selected<%}%>>14</option>
<option value="15" <%if(sDay==15){%>selected<%}%>>15</option>
<option value="16" <%if(sDay==16){%>selected<%}%>>16</option>
<option value="17" <%if(sDay==17){%>selected<%}%>>17</option>
<option value="18" <%if(sDay==18){%>selected<%}%>>18</option>
<option value="19" <%if(sDay==19){%>selected<%}%>>19</option>
<option value="20" <%if(sDay==20){%>selected<%}%>>20</option>
<option value="21" <%if(sDay==21){%>selected<%}%>>21</option>
<option value="22" <%if(sDay==22){%>selected<%}%>>22</option>
<option value="23" <%if(sDay==23){%>selected<%}%>>23</option>
<option value="24" <%if(sDay==24){%>selected<%}%>>24</option>
<option value="25" <%if(sDay==25){%>selected<%}%>>25</option>
<option value="26" <%if(sDay==26){%>selected<%}%>>26</option>
<option value="27" <%if(sDay==27){%>selected<%}%>>27</option>
<option value="28" <%if(sDay==28){%>selected<%}%>>28</option>
<option value="29" <%if(sDay==29){%>selected<%}%>>29</option>
<option value="30" <%if(sDay==30){%>selected<%}%>>30</option>
<option value="31" <%if(sDay==31){%>selected<%}%>>31</option>
</select>
<select name="smon">
<option value="01" <%if(sMon==01){%>selected<%}%>> Jan </option>
<option value="02" <%if(sMon==02){%>selected<%}%>> Feb </option>
<option value="03" <%if(sMon==03){%>selected<%}%>> Mar </option>
<option value="04" <%if(sMon==04){%>selected<%}%>> Apr </option>
<option value="05" <%if(sMon==05){%>selected<%}%>> May </option>
<option value="06" <%if(sMon==06){%>selected<%}%>> Jun </option>
<option value="07" <%if(sMon==07){%>selected<%}%>> Jul </option>
<option value="08" <%if(sMon==8){%>selected<%}%>> Aug </option>
<option value="09" <%if(sMon==9){%>selected<%}%>> Sep </option>
<option value="10" <%if(sMon==10){%>selected<%}%>> Oct </option>
<option value="11" <%if(sMon==11){%>selected<%}%>> Nov </option>
<option value="12" <%if(sMon==12){%>selected<%}%>> Dec </option>
</select>

<select name="syear">
<%for(int i=2010;i<=2025;i++){%>
<option value="<%=i%>" <%if(sYear==i){%>selected<%}%>><%=i%></option>
<%}%>
</select>
	</td>
</tr>
<tr>
	<td  align="right">End date</td>
	<td>
<select name="eday">
<option value="01" <%if(eDay==01){%>selected<%}%>>1</option>
<option value="02" <%if(eDay==02){%>selected<%}%>>2</option>
<option value="03" <%if(eDay==03){%>selected<%}%>>3</option>
<option value="04" <%if(eDay==04){%>selected<%}%>>4</option>
<option value="05" <%if(eDay==05){%>selected<%}%>>5</option>
<option value="06" <%if(eDay==06){%>selected<%}%>>6</option>
<option value="07" <%if(eDay==07){%>selected<%}%>>7</option>
<option value="08" <%if(eDay==8){%>selected<%}%>>8</option>
<option value="09" <%if(eDay==9){%>selected<%}%>>9</option>
<option value="10" <%if(eDay==10){%>selected<%}%>>10</option>
<option value="11" <%if(eDay==11){%>selected<%}%>>11</option>
<option value="12" <%if(eDay==12){%>selected<%}%>>12</option>
<option value="13" <%if(eDay==13){%>selected<%}%>>13</option>
<option value="14" <%if(eDay==14){%>selected<%}%>>14</option>
<option value="15" <%if(eDay==15){%>selected<%}%>>15</option>
<option value="16" <%if(eDay==16){%>selected<%}%>>16</option>
<option value="17" <%if(eDay==17){%>selected<%}%>>17</option>
<option value="18" <%if(eDay==18){%>selected<%}%>>18</option>
<option value="19" <%if(eDay==19){%>selected<%}%>>19</option>
<option value="20" <%if(eDay==20){%>selected<%}%>>20</option>
<option value="21" <%if(eDay==21){%>selected<%}%>>21</option>
<option value="22" <%if(eDay==22){%>selected<%}%>>22</option>
<option value="23" <%if(eDay==23){%>selected<%}%>>23</option>
<option value="24" <%if(eDay==24){%>selected<%}%>>24</option>
<option value="25" <%if(eDay==25){%>selected<%}%>>25</option>
<option value="26" <%if(eDay==26){%>selected<%}%>>26</option>
<option value="27" <%if(eDay==27){%>selected<%}%>>27</option>
<option value="28" <%if(eDay==28){%>selected<%}%>>28</option>
<option value="29" <%if(eDay==29){%>selected<%}%>>29</option>
<option value="30" <%if(eDay==30){%>selected<%}%>>30</option>
<option value="31" <%if(eDay==31){%>selected<%}%>>31</option>
</select>
<select name="emon">
<option value="01" <%if(eMon==01){%>selected<%}%>> Jan </option>
<option value="02" <%if(eMon==02){%>selected<%}%>> Feb </option>
<option value="03" <%if(eMon==03){%>selected<%}%>> Mar </option>
<option value="04" <%if(eMon==04){%>selected<%}%>> Apr </option>
<option value="05" <%if(eMon==05){%>selected<%}%>> May </option>
<option value="06" <%if(eMon==06){%>selected<%}%>> Jun </option>
<option value="07" <%if(eMon==07){%>selected<%}%>> Jul </option>
<option value="08" <%if(eMon==8){%>selected<%}%>> Aug </option>
<option value="09" <%if(eMon==9){%>selected<%}%>> Sep </option>
<option value="10" <%if(eMon==10){%>selected<%}%>> Oct </option>
<option value="11" <%if(eMon==11){%>selected<%}%>> Nov </option>
<option value="12" <%if(eMon==12){%>selected<%}%>> Dec </option>
</select>

<select name="eyear">
<%for(int i=2010;i<=2025;i++){%>
<option value="<%=i%>" <%if(eYear==i){%>selected<%}%>><%=i%></option>
<%}%>
</select>
	
	</td>
</tr>
<%if(!request.getParameter("id").equals("311") && !request.getParameter("id").equals("264")){%>
<tr>
	<td align="right">Add to Home Page Ticker</td>
	<td>
	<input type="radio" name="addtoticker" value="0"<%if (strAddToTicker.equals("0")){%> checked<%}%>>&nbsp;No&nbsp;&nbsp;&nbsp;<input type="radio" name="addtoticker" value="1" <%if (strAddToTicker.equals("1")){%> checked<%}%>>&nbsp;Yes
	</td>
</tr>
<%}%>
<tr>
	<td colspan="2" align="center">
	<font class="tab"><a style="color:red;" href="javascript:showRTF(1);" class="tablink"><%=strLanguage1%></a></font>&nbsp;&nbsp;<font class="tab"><a style="color:red;" href="javascript:showRTF(2);" class="tablink">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a></font>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
	<div id="rtf1" style="">
		<table style="font-size:12px;"><tr>
		<td align="center"><b>Description in <%=strLanguage1%></b><br>
		<textarea name=description0 rows=10 cols=50><%=strEngDesc%></textarea>
		</td>
		</tr></table>
	</div></td>
</tr>

<tr><td colspan="2" align="center">
	<div id="rtf2" style="display:none">
		<table style="font-size:12px;"><tr>
		<td align="center"><b>Description in &#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</b><br>
		<textarea name=description1 rows=10 cols=50><%=strHindiDesc%></textarea>
		</td>
		</tr></table>
	</div></td>
</tr>
<%
String queryGetFiles = "SELECT    DDF_ID, DDF_DDC_ID, DDF_LANG_ID, DDF_USER_FILENAME, DDF_SYS_FILENAME, DDF_FILE_SIZE, DDF_FILE_EXT, DDF_LABEL FROM CMS_DIRECT_FILE where DDF_DDC_ID="+dbBean.getcell(getinfo,0,0);
Vector rsGetFilesEng = new Vector();
dbBean.setQuery(queryGetFiles);
rsGetFilesEng=(Vector)dbBean.go();
queryGetFiles = "SELECT    DDF_ID, DDF_DDC_ID, DDF_LANG_ID, DDF_USER_FILENAME, DDF_SYS_FILENAME, DDF_FILE_SIZE, DDF_FILE_EXT, DDF_LABEL FROM CMS_DIRECT_FILE where DDF_DDC_ID="+dbBean.getcell(getinfo,0,1);
Vector rsGetFilesHin = new Vector();
dbBean.setQuery(queryGetFiles);
rsGetFilesHin=(Vector)dbBean.go();
%>
<tr>
	<td align="right" width="50%">Document for download (<%=strLanguage1%>)<br><a style="color:red;" href="javascript:popUp('upload_direct_file.jsp?langid=0','Upload',400,200,-1,-1);" title="Click here to add files....">Attach/ Remove New File</a></td>
	<td width="50%">
	<%if(rsGetFilesEng.size()>0){
	for(int i=0;i<rsGetFilesEng.size();i++) {%>
	<a style="color:blue;" href="<%=strWebAppURL%>/uploads/directcontent/<%=dbBean.getcell(rsGetFilesEng,4,i)%>" target="_blank"><%=dbBean.getcell(rsGetFilesEng,3,i)%></a>&nbsp;&nbsp;[<a style="color:red" href="remove_file.jsp?id=<%=request.getParameter("id")%>&fileid=<%=dbBean.getcell(rsGetFilesEng,0,i)%>&refid=<%=request.getParameter("refid")%>">Remove</a>]<br/>
	<%}} else {%>
	No files were attached.
	<%}%>
	<iframe name="engFiles" id="engFiles" width="90%" height="50" marginwidth="0" marginheight="0" hspace="0" vspace="0" align="middle" frameborder="0"></iframe>
	</td>
</tr>
<tr>
	<td align="right" width="50%">Document for download (<%=strLanguage2%>)<br><a style="color:red;" href="javascript:popUp('upload_direct_file.jsp?langid=1','Upload',400,200,-1,-1);" title="Click here to add files....">Attach/ Remove New File</a></td>
	<td width="50%">
	<%if(rsGetFilesHin.size()>0){
	for(int i=0;i<rsGetFilesHin.size();i++) {%>
	<a style="color:blue;" href="<%=strWebAppURL%>/uploads/directcontent/<%=dbBean.getcell(rsGetFilesHin,4,i)%>" target="_blank"><%=dbBean.getcell(rsGetFilesHin,3,i)%></a>&nbsp;&nbsp;[<a style="color:red" href="remove_file.jsp?id=<%=request.getParameter("id")%>&fileid=<%=dbBean.getcell(rsGetFilesHin,0,i)%>&refid=<%=request.getParameter("refid")%>">Remove</a>]<br/>
	<%}} else {%>
	No files were attached.
	<%}%>
	<iframe name="hindiFiles" id="hindiFiles" width="90%" height="50" marginwidth="0" marginheight="0" hspace="0" vspace="0" align="middle" frameborder="0"></iframe>
	</td>
</tr>

<input type="hidden" name="refid" id="refid" value="<%=request.getParameter("refid")%>">
<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Update Content">&nbsp;&nbsp;<input type=button name="Back" class="textbox" value="Back" onclick="javascript:history.back();"></td>
</tr>
</form> 
</table>


<br><br>
</div>
<%@ include file="../header/footerInner.jsp" %>
<script>VISUAL=-1;</script>
<script src='../cms/quickbuild.js'></script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=0;changetoIframeEditor(document.forms[0].description0);</script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=0;changetoIframeEditor(document.forms[0].description1);</script>
<%}catch(Exception e){out.print(e);}%>