<%@ include file="../header/header1.jsp" %>
 <meta http-equiv="Content-type" content="text/html" charset="utf-16">
 <meta name="description" content="Indian Railway site which helps in enquiry ,travelling,boarding and other railway zonal activities developed by CRIS (Centre For Railway Information).You can get information related to all Zones with their divisions.">

	
 
 
 
 

<%
Vector getinfo = new Vector();
String query_info;
query_info = "SELECT DSM_ID, DLC_LABEL, DSM_PATH, DLC_DESCRIPTION, DSM_TYPE,DSM_PRIORITY, DLC_LANG_ID, DLC_CREATED_BY, DLC_CREATED_DATE, DLC_MODIFIED_BY, DLC_MODIFIED_DATE,DLC_ID FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT WHERE DSM_PARENT = ";
query_info = query_info + request.getParameter("parent")+" AND DSM_ID=DLC_DSM_ID AND DLC_LANG_ID =0  ORDER BY DSM_PRIORITY, DLC_ID";
dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();


Vector getlevel = new Vector();
String query_level;
query_level = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query_level = query_level + " WHERE DSM_ID in ("+request.getParameter("path")+") AND DSM_ID = DLC_DSM_ID AND DLC_LANG_ID =0";
query_level = query_level + " ORDER BY DSM_PATH";
dbBean.setQuery(query_level);
getlevel=(Vector)dbBean.go();


Vector getright = new Vector();
String query_right;
query_right = "SELECT * FROM CMS_INCLUDE_SECTION ";
query_right = query_right + " WHERE DIS_TYPE = 1 and DIS_LANG_ID = 0";
query_right = query_right + " ORDER BY DIS_LABEL";
dbBean.setQuery(query_right);
getright=(Vector)dbBean.go();

%>
<div align="center">
<form name="RTEDemo" action="section_management_unicode_action.jsp" method="post" onsubmit="return submitForm();">
	<input type="hidden" name="path" value="<%=request.getParameter("path")%>">
	<input type="hidden" name="parent" value="<%=request.getParameter("parent")%>">
<br>
<div align="center" class="textn">
Current Level: <a href="section_management.jsp?parent=0&path=0">Top level</a> » 
<% 
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
%>
<a href="section_management.jsp?parent=<%=dbBean.getcell(getlevel,0,i)%>&path=<%=dbBean.getcell(getlevel,2,i)%>" class="link"><%=dbBean.getcell(getlevel,1,i)%></a> » 
<% 
	}
	}
%>
</div>
<br>	
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Manage Sections</b></td>
</tr>
<tr>
	<td align="right" width="50%">Label</td>
	<td width="50%">
	<input type="text" class="textbox" name="label0">
	</td>
</tr>
<tr>
	<td align="right" width="50%">Label (in hindi)</td>
	<td width="50%">
	<input type="text" class="textboxh" name="label1">
	</td>
</tr>
<tr>
	<td align="right">Type</td>
	<td>
	<input type="radio" name="type" value="1" checked>
	<!--- <img src="images/template1" width="25">  --->(Normal) 
	<input type="radio" name="type" value="2"> <!--- <img src="images/template2" width="25"> ---> (Direct)
<input type="radio" name="type" value="3"> (Interaction)<!---<img src="images/template3" width="25">  (other) --->
	</td>
</tr>
<tr>
	<td align="right">
	Include Right
	</td>
	<td>
	<select name="right">	
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
</tr>
<tr>
	<td align="right">Priority</td>
	<td>
	<select class="textbox" name="priority">
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		<option>7</option>
		<option>8</option>
		<option>9</option>
		<option>10</option>
		<option>11</option>
		<option>12</option>
		<option>13</option>
		<option>14</option>
		<option>15</option>
		<option>16</option>
		<option>17</option>
		<option>18</option>
		<option>19</option>
		<option>20</option>
		<option>21</option>
		<option>22</option>
		<option>23</option>
		<option>24</option>
		<option>25</option>
	</select>
	</td>
</tr>
<tr>
	<td align="right">
	Link to Section
	</td>
	<td valign="top">
	<input type="Radio" checked name="choice"  value="1">
<select name="linksection" size="5" class="textbox">
	<%
// this query gets the navigation information to produde "You are here" bar
Vector rslevel = new Vector();
String query;
query = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query = query + " WHERE DLC_LANG_ID =0 ";
query = query + " AND DSM_ID = DLC_DSM_ID and DSM_PARENT <> -1 and DSM_STATUS = 1";
query = query + " ORDER BY DSM_PATH";
dbBean.setQuery(query);
rslevel=(Vector)dbBean.go();
%>

<% 
String setsecurl = "";
int noofcom = 0;
if(rslevel.size()!=0){
for(int i=0;i<rslevel.size();i++){
setsecurl = "viewsection.jsp?id="+dbBean.getcell(rslevel,2,i);
noofcom = 0;

StringTokenizer stDblTicketId= new StringTokenizer(dbBean.getcell(rslevel,2,i),",");
			while(stDblTicketId.hasMoreTokens()){	
			noofcom = noofcom + 1;
			stDblTicketId.nextToken();
			%>
				
<%}
%>
<option value="<%=setsecurl%>"><% if (noofcom==2) {%>»<%}else{
for(int iii=0;iii<noofcom-1;iii++){%>
&nbsp;&nbsp;&nbsp;
<%}}%><%=dbBean.getcell(rslevel,1,i)%></option>
<% 
	}
	}
%>	
	
	</select><br>
	<input type="Radio"  name="choice" value="2">
	<input type="text" name="txtLink" maxlength="50" class="textbox" >
	
	</td>
</tr>
<tr>
	<td colspan="2" align="center"><b>Description in English</b><br>

<script language="JavaScript" type="text/javascript">
<!--
function submitForm() {

	//make sure hidden and iframe values are in sync before submitting form
	//to sync only 1 rte, use updateRTE(rte)
	//to sync all rtes, use updateRTEs
	//updateRTE('description');
	updateRTEs();
//	alert("description = " + document.RTEDemo.rte1.value);
	
	//change the following line to true to submit form
	
	var el = document.RTEDemo.elements;			
		for(var i = 0 ; i < el.length ; ++i) {			
			var getname = el[i].name;
			
			out = "\'";
			add = "&#39;";
			temp = "" + el[i].value;
			while (temp.indexOf(out)>-1) {
			pos= temp.indexOf(out);
			temp = "" + (temp.substring(0, pos) + add + 
			temp.substring((pos + out.length), temp.length));
			}
			outt = "\"";
			addd = "&quot;";
			tempp = "" + temp;
			while (tempp.indexOf(outt)>-1) {
			poss= tempp.indexOf(outt);
			tempp = "" + (tempp.substring(0, poss) + addd + 
			tempp.substring((poss + outt.length), tempp.length));
			}
			el[i].value = tempp;
			//alert(el[i].value);
		
		 }
	
	
	return true;
}

//Usage: initRTE(imagesPath, includesPath, cssFile)
initRTE("images/", "", "");
//-->
</script>
<noscript><p><b>Javascript must be enabled to use this form.</b></p></noscript>

<script language="JavaScript" type="text/javascript">
<!--
//Usage: writeRichText(fieldname, html, width, height, buttons)
writeRichText('description0', 'add information here', 450, 150, true, false);
document.writeln('</td></tr><tr><td colspan=2 align=center><b>Description in Hindi</b><br>');
writeRichText('description1', 'add information here', 450, 150, true, false);
//-->
</script>
	</td>
</tr>
<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Create Section"></td>
</tr>
</form> 
</table>
<form action="delsection.jsp" method="post">
<br>
<div align="center" class="textn">
Current Level: <a href="section_management.jsp?parent=0&path=0">Top level</a> » 
<% 
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
%>
<a href="section_management.jsp?parent=<%=dbBean.getcell(getlevel,0,i)%>&path=<%=dbBean.getcell(getlevel,2,i)%>" class="link"><%=dbBean.getcell(getlevel,1,i)%></a> » 
<% 
	}
	}
%>
</div>
<br>

<table width="750" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts">
<tr bgcolor="#efefef">
	<td align="center"><b>Label</b></td>
	<td align="center"><b>Description</b></td>
	<td align="center"><b>Priority</b></td>
	<td align="center"><b>Type</b></td>
	<td align="center"><b>Created</b></td>
	<td align="center"><b>Updated</b></td>
	<td align="center"><b>Edit</b></td>
</tr>
<%
if (getinfo.size()!=0){
for (int i=0;i<getinfo.size();i++){
%>

<tr>
	<td><input type="Checkbox" name="idval" value="<%=dbBean.getcell(getinfo,0,i)%>">
<%
if (dbBean.getcell(getinfo,6,i).equals("1")){
%>
<a href="section_management.jsp?path=<%=dbBean.getcell(getinfo,2,i)%>&parent=<%=dbBean.getcell(getinfo,0,i)%>" class="linkhindi"><%=dbBean.getcell(getinfo,1,i)%></a>
<%}else{%>
<a href="section_management.jsp?path=<%=dbBean.getcell(getinfo,2,i)%>&parent=<%=dbBean.getcell(getinfo,0,i)%>" class="linkn"><%=dbBean.getcell(getinfo,1,i)%></a>
<% } %>


	</td>
	<td align="center">
	 <a target="_blank" href="section_description.jsp?id=<%=dbBean.getcell(getinfo,11,i)%>&lang=<%=dbBean.getcell(getinfo,6,i)%>">View</a> 
	</td>
	<td>
	<%=dbBean.getcell(getinfo,5,i)%>
	</td>
	<td>
	<%if (dbBean.getcell(getinfo,4,i).equals("1")){
	out.print("Normal");
	}else if(dbBean.getcell(getinfo,4,i).equals("2")){
	out.print("Direct");
	}else{
	out.print("Interaction");
	}
	%>
	</td>
	<td align="center">
	<%=dbBean.getcell(getinfo,7,i)+"<br>"+dbBean.getcell(getinfo,8,i)%>
	</td>
	<td align="center">
	<% if(!dbBean.getcell(getinfo,9,i).equals("0")) {%>
	<%=dbBean.getcell(getinfo,9,i)+"<br>"+dbBean.getcell(getinfo,10,i)%>
	<% }else{ %>
	-
	<% } %>
	</td>
	<td align="center">
	<a href="section_edit.jsp?id=<%=dbBean.getcell(getinfo,0,i)%>&path=<%=dbBean.getcell(getinfo,2,i)%>">Edit</a>
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
<//input type="Submit" value="Delete">
</form>
</table>
<br><br>
</div>
<%@ include file="../header/footer.htm" %>