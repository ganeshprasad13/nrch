<%@ include file="../header/headerInner.jsp" %>


<%
String lang = "0";
// this query gets the navigation information to produde "You are here" bar
Vector getlevel = new Vector();
String query_level;
query_level = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query_level = query_level + " WHERE DLC_LANG_ID =0";
query_level = query_level + " AND DSM_ID = DLC_DSM_ID and DSM_PARENT <> -1 and DSM_STATUS = 1";
query_level = query_level + " ORDER BY DSM_PATH, DSM_PRIORITY";
dbBean.setQuery(query_level);
getlevel=(Vector)dbBean.go();
%>
<!--- get body information ---->


<!-- navigation information completed -->
<form name="movesection" action="movesection_action.jsp">
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" bordercolor="7272D7">
<tr>
	<td valign="top" width="45%">
	<table width="97%" cellpadding="2" cellspacing="0" border="0" align="left">
	<tr><td>Move this section</td></tr>
	<tr><td>.</td></tr>
<% 
int noofcom = 0;
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
noofcom = 0;
%>
<tr>
	<td width="100%" align="left">
<%
StringTokenizer stDblTicketId= new StringTokenizer(dbBean.getcell(getlevel,2,i),",");
			while(stDblTicketId.hasMoreTokens()){	
			noofcom = noofcom + 1;
			stDblTicketId.nextToken();
		}
if (noofcom==2) {%>
<hr noshade><b><%}else{
for(int iii=0;iii<noofcom-1;iii++){%>
&nbsp; &nbsp; &nbsp; 
<%}}%>
<input type="Radio" name="movethis" value="<%=dbBean.getcell(getlevel,0,i)%>"><a href="../../viewsection.jsp?lang=<%=lang%>&id=<%=dbBean.getcell(getlevel,2,i)%>" class="linknav"><% if (noofcom==2) {%><b><%}%><%=dbBean.getcell(getlevel,1,i)%><% if (noofcom==2) {%></b><%}%></a>
	</td>
</tr>
<%
	}
%>
<tr>
	<td background="images/linehor.gif"><img SRC="../../images/spacer.gif" WIDTH=1 HEIGHT=1></td>
</tr> 
<%
	}
%>	
	</table>
	<br><br><br>
	</td>
	<td class="textn" width="10%" background="images/linevert.gif"></td>	
	
	<td valign="top" width="45%">
	<table width="97%" cellpadding="2" cellspacing="0" border="0" align="left">
	<tr><td>Under Section</td></tr>
	<tr><td><input type="Radio" name="under" value="0"> Root</td></tr>
<% 
noofcom = 0;
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
noofcom = 0;
%>
<tr>
	<td width="100%" align="left">
<%
StringTokenizer stDblTicketId= new StringTokenizer(dbBean.getcell(getlevel,2,i),",");
			while(stDblTicketId.hasMoreTokens()){	
			noofcom = noofcom + 1;
			stDblTicketId.nextToken();
		}
if (noofcom==2) {%>
<hr noshade><b><%}else{
for(int iii=0;iii<noofcom-1;iii++){%>
&nbsp; &nbsp; &nbsp; 
<%}}%>
<input type="Radio" name="under" value="<%=dbBean.getcell(getlevel,0,i)%>"><a href="viewsection.jsp?lang=<%=lang%>&id=<%=dbBean.getcell(getlevel,2,i)%>" class="linknav"><% if (noofcom==2) {%><b><%}%><%=dbBean.getcell(getlevel,1,i)%><% if (noofcom==2) {%></b><%}%></a>
	</td>
</tr>
<%
	}
%>
<tr>
	<td background="images/linehor.gif"><img SRC="../../images/spacer.gif" WIDTH=1 HEIGHT=1></td>
</tr> 
<%
	}
%>	
	</table>
	<br><br><br>
	</td>
	
</tr>
<tr><td colspan="3" align="center"><input type="Submit" value="Move Section"></td></tr>
</table>

</form>
<%@ include file="../header/footer.jsp" %>