<%int intPageNo=1;

%>
<%try{%>
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
	var objEnglish = document.getElementById("fnEnglish");
	var objHindi = document.getElementById("fnHindi");
	if(rtfid==1) {
		objEnglish.className="tabClicked";
		objHindi.className="tab";
		obj1.style.display =""; 
		obj2.style.display ="none"; 		
	} else {
		objEnglish.className="tab";
		objHindi.className="tabClicked";
		obj2.style.display =""; 
		obj1.style.display ="none"; 
	}
}
</SCRIPT>
<%


java.util.Date today = new java.util.Date();
java.util.Calendar c = new GregorianCalendar();
int day   = today.getDate();
int month = today.getMonth()+1;
int year  = c.get(Calendar.YEAR);

Vector getinfo = new Vector();
String query_info;
query_info = "SELECT DDC_ID,DDC_LABEL,DDC_LANG_ID,DDC_DESCRIPTION,DDC_START_DATE,DDC_END_DATE,DDC_CREATED_BY,DDC_CREATED_DATE, DDC_MODIFIED_BY,DDC_MODIFIED_DATE,DDC_IDENTIFIER FROM  CMS_DIRECT_CONTENT WHERE DDC_LANG_ID=0 AND DDC_DSM_ID = "+request.getParameter("id")+" AND DDC_LANG_ID = 0 AND DDC_STATUS <> 2 AND DDC_STATUS <> 3 ORDER BY DDC_ID DESC";



// For Pagination 
	String strDetailsCount = "SELECT COUNT(*) FROM  CMS_DIRECT_CONTENT WHERE DDC_LANG_ID=0 AND DDC_DSM_ID = "+request.getParameter("id")+" AND DDC_LANG_ID = 0 AND DDC_STATUS <> 2 AND DDC_STATUS <> 3 ORDER BY DDC_ID DESC";
	dbBean.setQuery(strDetailsCount);
	String rsGetCount[][] = dbBean.getResultSet();
	
	int TotalCount = 0,TotalPages = 0,Start = 1,Start_Row = 0,displayTo = 0;
	if(rsGetCount.length>0){
		TotalCount = Integer.parseInt(rsGetCount[0][0]);
	}
	TotalPages = TotalCount/10;
	if(TotalCount%10 > 0){
		TotalPages++;
	}
	if(request.getParameter("Start") != null && !request.getParameter("Start").trim().equals("")){
		Start = Integer.parseInt(decrypt(request.getParameter("Start")));
		Start_Row = (Start-1)*10;
	}
	query_info +=" LIMIT "+Start_Row+",10";
	dbBean.setQuery(query_info);
	getinfo=(Vector)dbBean.go();
	
	//out.print(strDetailsCount);
	//out.print(query_info);
//End Pagination
Vector getlevel = new Vector();
String query_level;
query_level = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query_level = query_level + " WHERE DSM_ID = "+request.getParameter("id")+" AND DSM_ID = DLC_DSM_ID AND DLC_LANG_ID =0";
query_level = query_level + " ORDER BY DSM_PATH";
dbBean.setQuery(query_level);
getlevel=(Vector)dbBean.go();



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
	// if(document.RTEDemo.label1.value == "") Comment on 29-12-2010
				// {				
				// alert("Enter Label (in &#2361;&#2367;&#2344;&#2381;&#2342;&#2368;)");
				// document.RTEDemo.label1.focus();	
				// return false;			
				// }
	}
	</script>
<div align="center">
<form action="section_direct_action.jsp" method="post" name="RTEDemo" id="RTEDemo" onsubmit="javascript:return chkform()">
	<input type="hidden" name="id" value="<%=request.getParameter("id")%>">

<span class="mgContentTitle">Manage
<% 
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
%>
<a href="<%=strAppPath%>/webadmin/section/section_management.jsp?parent=<%=dbBean.getcell(getlevel,0,i)%>&path=<%=dbBean.getcell(getlevel,2,i)%>" class="link" style="font-size:14px;font-family:tahoma;"><%=dbBean.getcell(getlevel,1,i)%></a>
<% 
	}
	}
%>
</span>
<br>	<br>
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Manage Content for Direct Section</b></td>
</tr>

<tr>
	<td align="right" width="50%">Label in  <%=strLanguage1%></td>
	<td width="50%">
	<input type="text" class="textbox" name="label0" size="60">
	</td>
</tr>
<tr>
	<td align="right" width="50%">Label (in  &#2361;&#2367;&#2344;&#2381;&#2342;&#2368;)</td>
	<td width="50%">
	<input type="text" class="textboxh" name="label1" size="60">
	</td>
</tr>

<%if(request.getParameter("id").equals("269")){%>


<tr>
	<td align="right" width="50%">Tender Ref. Number</td>
	<td width="50%">
	<input type="text" class="textbox" name="TenderNo" size="60">
	</td>
</tr>
<tr>
	<td align="right" width="50%">Tender Subject</td>
	<td width="50%">
	<input type="text" class="textbox" name="txtTSubject" size="60">
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
if(getDivisions.size()!=0){
for(int i=0;i<getDivisions.size();i++){
%>
       <option value="<%=dbBean.getcell(getDivisions,0,i)%>"><%=dbBean.getcell(getDivisions,1,i)%></option> 
<%}}%>


   </select> 
	</td>
</tr>
<tr>
	<td align="right" width="50%">Departments</td>
	<td width="50%">
	<select name="Departments" class="textbox" size="1">
	 <option value="-1">Select</option>
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
 String strIssueOfficer="SELECT ID,PUB_NAME FROM CMS_PRESS_PUBLISHER_INFO";
Vector getPressOfficer = new Vector();
dbBean.setQuery(strIssueOfficer);
getPressOfficer=(Vector)dbBean.go();%>
	<tr>
	<td align="right">
	Press Release Issuing Officer
	</td>
	<td>
	<select name="pubOfficerId">
		<option value="0">-Select Name-</option>
		<%if(getPressOfficer.size()!=0){
		for(int i=0;i<getPressOfficer.size();i++){%>
		<option value="<%=dbBean.getcell(getPressOfficer,0,i)%>"><%=dbBean.getcell(getPressOfficer,1,i)%></option>
		<%}}%>
	</select>
	</td>
</tr>
<tr>
	<td align="right">Location</td>
	<td><input type="text" name="pubCity"></td>
</tr><tr>
	<td align="right">Press Release Number</td>
	<td><input type="text" name="pubNewsNo"></td>
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
	<option value="<%=dbBean.getcell(getright,0,j)%>"><%=dbBean.getcell(getright,1,j)%></option>
<%
	}
	}
%>
	</select>
	</td>
</tr>-->
<%}%>
<tr>
	<td align="right">Start date</td>
	<td>
<select name="sday">
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
<%for(int i=2010;i<=2025;i++){%>
<option value="<%=i%>" <%if(year==i){%>selected<%}%>><%=i%></option>
<%}%>
</select>
	</td>
</tr>
<tr>
	<td  align="right">End date</td>
	<td>
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
<%for(int i=2010;i<=2025;i++){%>
<option value="<%=i%>" <%if(year==i){%>selected<%}%>><%=i%></option>
<%}%>
</select>
	
	</td>
</tr>
<%if(!request.getParameter("id").equals("311") && !request.getParameter("id").equals("264")){%>
<tr>
	<td align="right">Add to Home Page Ticker</td>
	<td><input type="radio" name="addtoticker" value="0" checked>&nbsp;No&nbsp;&nbsp;&nbsp;<input type="radio" name="addtoticker" value="1">&nbsp;Yes</td>
</tr>
<%}%>
<tr>
	<td colspan="2" align="center">
	<font class="tab" id="fnEnglish"><a  style="color:red;" href="javascript:showRTF(1);" class="tablink"><%=strLanguage1%></a></font>&nbsp;&nbsp;<font  id="fnHindi" class="tab"><a style="color:red;" href="javascript:showRTF(2);" class="tablink">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a></font>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
	<div id="rtf1" style="">
		<table style="font-size:12px;"><tr>
		<td align="center"><b>Description in <%=strLanguage1%></b><br>
		<textarea name=description0 rows=10 cols=50><%=strDefaultlangContent1%></textarea>
		</td>
		</tr></table>
	</div></td>
</tr>

<tr><td colspan="2" align="center">
	<div id="rtf2" style="display:none">
		<table style="font-size:12px;"><tr>
		<td align="center"><b>Description in  &#2361;&#2367;&#2344;&#2381;&#2342;&#2368;&nbsp;&nbsp;&nbsp;<a href="#" onClick="MyWindow=window.open('hindi.jsp','MyWindow','toolbar=no,location=no,directories=no,status=no, menubar=no,scrollbars=no,resizable=yes,width=800,height=600'); return false;"><font color=blue>Hindi Keyboard</font></a></b><br>
		<textarea name=description1 rows=10 cols=50><%=strDefaultlangContent2%></textarea>
		</td>
		</tr></table>
	</div></td>
</tr>
<tr>
	<td align="right" width="50%">Document for download text(in English)<br><a style="color:red;" href="javascript:popUp('upload_direct_file.jsp?langid=0','Upload',400,200,-1,-1);" title="Click here to add files....">Attach/ Remove File</a></td>
	<td width="50%">
	<iframe name="engFiles" id="engFiles" width="90%" height="50" marginwidth="0" marginheight="0" hspace="0" vspace="0" align="middle" frameborder="0"></iframe>
	</td>
</tr>
<tr>
	<td align="right" width="50%">Document for download text (in  &#2361;&#2367;&#2344;&#2381;&#2342;&#2368;)<br><a style="color:red;" href="javascript:popUp('upload_direct_file.jsp?langid=1','Upload',400,200,-1,-1);" title="Click here to add files....">Attach/ Remove File</a></td>
	<td width="50%">
	<iframe name="hindiFiles" id="hindiFiles" width="90%" height="50" marginwidth="0" marginheight="0" hspace="0" vspace="0" align="middle" frameborder="0"></iframe>
	</td>
</tr>


<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Create Content"></td>
</tr>
</form> 
</table>

<br>
<div align="center" class="textn"><b>
Current Level: <!--- <aa href="section_management.jsp?parent=0&path=0">Top level</a> » ---> 
<% 
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
%>
<aa href="section_management.jsp?parent=<%=dbBean.getcell(getlevel,0,i)%>&path=<%=dbBean.getcell(getlevel,2,i)%>" class="link" style="font-size:11px;"><%=dbBean.getcell(getlevel,1,i)%></a> » 
<% 
	}
	}
%>
</b></div>
<br>

<table width="750" border=1 style="border-collapse: collapse;font-size:12px;" bordercolor="#111111" cellpadding="3">
<tr bgcolor="#efefef">
	<td align="center"><b>Label</b></td>
	<!--<td align="center"><b>View</b></td>-->
	<td align="center"><b>Start Date</b></td>
	<td align="center"><b>End date</b></td>
	<td align="center"><b>Created</b></td>
	<td align="center"><b>Updated</b></td>
	<td align="center"><b>Edit</b></td>
	<td align="center"><b>Delete</b></td>
</tr>
<%
if (getinfo.size()!=0){
for (int i=0;i<getinfo.size();i++){
displayTo = Start_Row+i+1;
%>

<tr>
	<td>	<%=dbBean.getcell(getinfo,1,i)%>	</td>
	<!--<td>
	View
	</td>-->
	<td>
	<%String strStartDate = dbBean.getcell(getinfo,4,i);
	strStartDate = strStartDate.trim();
	strStartDate = strStartDate.substring(0,strStartDate.length()-10);
	out.print(strStartDate.trim());%>
	</td>
	<td>
	<%String strEndDate = dbBean.getcell(getinfo,5,i);
	strEndDate = strEndDate.trim();
	if(!strEndDate.equals(null)&&!strEndDate.equals(""))
	strEndDate = strEndDate.substring(0,strEndDate.length()-10);
	out.print(strEndDate.trim());%>
	</td>
	<td align="center">	<%=dbBean.getcell(getinfo,6,i)+"<br>"+dbBean.getcell(getinfo,7,i)%>	</td>
	<td align="center">
	<% if(!dbBean.getcell(getinfo,8,i).equals("0")) {%>
	<%=dbBean.getcell(getinfo,8,i)+"<br>"+dbBean.getcell(getinfo,9,i)%>
	<% }else{ %>
	-
	<% } %>
	</td>
	<td><a style="color:red;" href="section_direct_edit.jsp?refid=<%=dbBean.getcell(getinfo,10,i)%>&id=<%=request.getParameter("id")%>" title="Edit...">Edit</a></td>
	<td><a style="color:red;" href="section_direct_delete.jsp?refid=<%=dbBean.getcell(getinfo,10,i)%>&id=<%=request.getParameter("id")%>" title="Delete...">Delete</a></td>
</tr>
<% 
	}
	}else{
%>
<tr>
	<td colspan="7" align="center">
	No record(s) found
	</td>
</tr>
<% } %>
</table>
<table align="center">
	<tr>
		<td align="left"><b><%=Start_Row+1%>&nbsp;-&nbsp;<%=displayTo%>&nbsp;&nbsp;Of&nbsp;&nbsp;(<%=TotalCount%>)</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	
<%if(TotalPages > 1){%>
	<%if(Start > 1){%>
		<td><a href="section_direct.jsp?Start=<%=encrypt("1")%>&id=<%=request.getParameter("id")%>"><font color="black"><b>First</b></font></a>&nbsp;&nbsp;</td>
		<td><a href="section_direct.jsp?Start=<%=encrypt(Integer.toString(Start-1))%>&id=<%=request.getParameter("id")%>"><font color="black"><b>Previous</b></font></a>&nbsp;&nbsp;</td>
		<%}if(TotalPages > 1 && Start < TotalPages){%>
		<td>&nbsp;&nbsp;<a href="section_direct.jsp?Start=<%=encrypt(Integer.toString(Start+1))%>&id=<%=request.getParameter("id")%>"><font color="black"><b>Next</font></b></a></td>
		<td>&nbsp;&nbsp;<a href="section_direct.jsp?Start=<%=encrypt(Integer.toString(TotalPages))%>&id=<%=request.getParameter("id")%>"><font color="black"><b>Last</font></b></a></td>
		<%}%>
<%}%>

</tr>
</table>
<br><br>
</div>


<%@ include file="../header/footerInner.jsp" %>

<%}catch(Exception e){
e.printStackTrace(new java.io.PrintWriter(out));
  
}
%>
<script>VISUAL=-1;</script>
<script src='../cms/quickbuild.js'></script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=0;SECURE=0;changetoIframeEditor(document.forms[0].description0);</script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=0;SECURE=0;changetoIframeEditor(document.forms[0].description1);</script>
