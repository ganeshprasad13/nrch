<%int intPageNo =3;%>
<%@ include file="../header/headerInner.jsp" %>
<script language="JavaScript">
function showDiv(n)
{
	var obj = document.getElementById("flashProp");
		if (n == 1 )
		{
		   obj.style.display =""; 
		}else{
		   obj.style.display ="none"; 
		}
}

function validate(){

/* -------------------Updated By Aman Kumar 09-05-2014 -------------------------------*/
	
var id = document.getElementById('filename1');
var id1 = document.getElementById("filename1").value;


var img = id.value;
var n = img.match('.jsp');
//alert(n);
if (n == '.jsp') 
{
alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, xlsx ,jpg files can be uploaded");
return false;
}

var n = img.match('.php');
//alert(n);
if (n == '.php') 
{
alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, xlsx ,jpg files can be uploaded");
return false;
}

var n = img.match('.exe');
//alert(n);
if (n == '.exe') 
{
alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, xlsx ,jpg files can be uploaded");
return false;
}

var n = img.match('.java');

if (n == '.java') 
{
alert("Not Authorised , Only pdf, txt, csv, doc, docx, xls, xlsx ,jpg files can be uploaded");
return false;
}


var fileName =id1.value;

if( id1 === "" ) {
//alert("Please upload any file.");
}
else{
if(fileName.lastIndexOf(".gif")==-1 && fileName.lastIndexOf(".jpg")==-1 && fileName.lastIndexOf(".png")==-1 && fileName.lastIndexOf(".swf")==-1 ){
alert("Only pdf, txt, csv, doc, docx, xls, xlsx ,jpg files can be uploaded");
return false;
}
}	
}
</script>
<div align="center">
<form action="create_banner_action.jsp" method="post" enctype="multipart/form-data" name="bannercreate" >

<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Create Banner</b></td>
</tr>

<tr>
	<td align="right" width="50%">Banner Type</td>
	<td width="50%">
	<!--
<input type="radio" name="bannertype" value="0" checked class="textbox"> 
Top(220 <b>x</b> 60) -->
&nbsp;&nbsp;&nbsp;
<input type="radio" name="bannertype" value="1" class="textbox" checked> Side(150 width x 130 height)
&nbsp;&nbsp;&nbsp;
<!--- <input type="radio" name="bannertype" value="2" class="textbox"> Homepage (160 x 160) --->
	</td>
</tr>
<tr bgcolor="#FEE6AB">
	<td align="right" width="50%">Link to Section</td>
	<td width="50%">
<input type="radio" name="linktype" value="0" class="textbox" checked>&nbsp;<select name="linksection" size="7" class="textbox">
	<%
// this query gets the navigation information to produde "You are here" bar
Vector getlevel = new Vector();
String query_level;
query_level = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query_level = query_level + " WHERE DLC_LANG_ID =0 ";
query_level = query_level + " AND DSM_ID = DLC_DSM_ID and DSM_PARENT <> -1 and DSM_STATUS = 1";
query_level = query_level + " ORDER BY DSM_PATH";
dbBean.setQuery(query_level);
getlevel=(Vector)dbBean.go();
%>

<% 
String setsecurl = "";
int noofcom = 0;
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
setsecurl = "view_section.jsp?id="+dbBean.getcell(getlevel,2,i);
noofcom = 0;

StringTokenizer stDblTicketId= new StringTokenizer(dbBean.getcell(getlevel,2,i),",");
			while(stDblTicketId.hasMoreTokens()){	
			noofcom = noofcom + 1;
			stDblTicketId.nextToken();
			%>
				
<%}
%>
<option value="<%=setsecurl%>"><% if (noofcom==2) {%>»<%}else{
for(int iii=0;iii<noofcom-1;iii++){%>
&nbsp;&nbsp;&nbsp;
<%}}%><%=dbBean.getcell(getlevel,1,i)%></option>
<% 
	}
	}
%>	
	
	</select>
	
	</td>
</tr>

<tr bgcolor="#FEE6AB">
	<td align="right" width="50%">Or Link to Direct Content</td>
	<td width="50%">
<input type="radio" name="linktype" value="1" class="textbox">&nbsp;<select name="linkdirect" size="7" class="textbox">
	<%
// this query gets the navigation information to produde "You are here" bar
String query_info;
Vector getinfo = new Vector();
query_info = "SELECT DDC_ID,DDC_LABEL,DDC_LANG_ID,DSM_ID,DSM_PATH,DLC_LABEL FROM  CMS_DIRECT_CONTENT,CMS_SECTION_MANAGEMENT,CMS_LANGUAGE_CONTENT WHERE DDC_DSM_ID = DSM_ID AND DLC_DSM_ID = DDC_DSM_ID and DDC_STATUS <> 2 AND DDC_STATUS <> 3 and DDC_LANG_ID = 0 and dlc_lang_id = 0 and (DDC_END_DATE > now() or DDC_END_DATE = now())ORDER BY DSM_PATH";
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();
String setdirurl = "";

if (getinfo.size()!=0){
for (int i=0;i<getinfo.size();i++){
setdirurl = "viewdetail.jsp?dcd="+dbBean.getcell(getinfo,0,i)+"&id="+dbBean.getcell(getinfo,4,i);
%>
<option value="<%=setdirurl%>"><%=dbBean.getcell(getinfo,5,i)%>--<%=dbBean.getcell(getinfo,1,i)%></option>
	
<% } } %>
	
	</select>
	
	</td>
</tr>

<tr bgcolor="#FEE6AB">
	<td align="right" width="50%">Or To URL</td>
	<td width="50%">
	<input type="radio" name="linktype" value="2" class="textbox">&nbsp;<input type="Text" name="linkurl" class="textbox" size="70" maxlength="255"></td>
</tr>




	

<tr>
	<td align="right" width="50%">Mouse over text for English</td>
	<td width="50%">
	<input type="text" class="textbox" name="filelabel0" size="70" maxlength="255">
	</td>
</tr>
<tr>
	<td align="right" width="50%">Mouse over text for Hindi</td>
	<td width="50%">	
	<input type="text" class="textboxh" name="filelabel1" size="70" maxlength="255">
	</td>
</tr>

<tr>
	<td align="right" width="50%">Banner File Type</td>
	<td width="50%">
	<input type="radio" name="filetype" value="0" checked class="textbox" onClick="showDiv(0)">&nbsp;(gif/jpg/png)&nbsp;&nbsp;&nbsp;<input type="radio" name="filetype" value="1" class="textbox" onClick="showDiv(1)">&nbsp;(flash) 
<br/><div align="left" id ="flashProp" style="display:none">Width : <input class="textbox" type="text" name="width" id="width" size="23" maxlength="3">&nbsp;&nbsp;Height : <input type="text" name="height" id="height" class="textbox" size="23" maxlength="3"></div>
	</td>
</tr>

<tr>
	<td align="right" width="50%">Attach File</td>
	<td width="50%"><input type="file" name="filename1" id="filename1" accept="image/gif,image/jpeg,image/tiff" class="textbox" size="70" onChange="javascript: return validate();">
	</td>
</tr>

<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Create Banner" onClick="javascript: return validate();"></td>
</tr>
</form> 
</table>

<br><br>
</div>
<%@ include file="../header/footer.jsp" %>