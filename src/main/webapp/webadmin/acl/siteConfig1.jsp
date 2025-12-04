<%int intPageNo =4;%>
<%@ include file="../header/headerInner.jsp" %>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=200,width=550,top=250,left=250');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
</script>

<%
Vector rsGetUser1 = new Vector();
String strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=1 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
dbBean.setQuery(strGetUserQuery);
rsGetUser1 = (Vector)dbBean.go();

Vector rsGetUser2 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=2 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser2 = (Vector)dbBean.go();

Vector rsGetUser3 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=3 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser3 = (Vector)dbBean.go();

Vector rsGetUser4 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=4 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser4 = (Vector)dbBean.go();

Vector rsGetUser5 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=5 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser5 = (Vector)dbBean.go();

Vector rsGetUser6 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=6 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser6 = (Vector)dbBean.go();

Vector rsGetUser7 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=7 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser7 = (Vector)dbBean.go();

Vector rsGetUser8 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=8 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser8 = (Vector)dbBean.go();

Vector rsGetUser9 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=9 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser9 = (Vector)dbBean.go();

Vector rsGetUser10 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=10 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser10 = (Vector)dbBean.go();

Vector rsGetUser11 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=11 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser11 = (Vector)dbBean.go();

Vector rsGetUser12 = new Vector();
strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=12 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser12 = (Vector)dbBean.go();
%>
<form action="siteConfigAction.jsp" method="post"  name="siteConfig" id="siteConfig">
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Site Configuration&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>
<br>
<table width="750" align=center border=0 class="sample">
<tr>
	<td class="tr_bgcolor" align=center height=23 colspan="2">
	<b>Site Configuration Parameters</b>
	</td>
</tr>
<!--<tr>
	<td width="300" align="right" >Site Name</td>
	<td ><input type=text size=50 name="SiteName" value="<% if(rsGetUser1.size()>0){ out.print(dbBean.getcell(rsGetUser1,0,0)); } %>"></td>
</tr>
<tr>
	<td align="right" >By line</td>
	<td ><input type=text size=50 name="Byline" value="<% if(rsGetUser2.size()>0){ out.print(dbBean.getcell(rsGetUser2,0,0)); } %>"></td>
</tr>-->
<tr>
	<td align="right" >Site logo</td>
	<td >
		<input type=text size=50 name="Sitelogo" value="<% if(rsGetUser3.size()>0){ out.print(dbBean.getcell(rsGetUser3,0,0)); } %>">
		<a href="#" onclick="return popitup('uploadConfig.jsp?imgNo=4')"><font color="black">Change Image</font></a>
	</td>
</tr>

<!--<tr>
	<td align="right" >Site Template</td>
	<td ><select name="publictitle6"><option value="1">Divisional Railways Template</option></select></td>
</tr>-->
<tr>
	<td align="right" >Public site title</td>
	<td ><input type=text size=50 name="publictitle" value="<% if(rsGetUser4.size()>0){ out.print(dbBean.getcell(rsGetUser4,0,0)); } %>"></td>
</tr>



<tr>
	<td align="right" >Home image 1</td>
	<td >
		<input type="text" name="publictitle3" size="50" value="<% if(rsGetUser5.size()>0){ out.print(dbBean.getcell(rsGetUser5,0,0)); } %>">
		<a href="#" onclick="return popitup('uploadConfig.jsp?imgNo=1')"><font color="black">Change Image</font></a>
	</td>
</tr>

<tr>
	<td align="right" >Home image 2</td>
	<td >
		<input type=text size=50 name="publictitle4" value="<% if(rsGetUser6.size()>0){ out.print(dbBean.getcell(rsGetUser6,0,0)); } %>">
		<a href="#" onclick="return popitup('uploadConfig.jsp?imgNo=2')"><font color="black">Change Image</font></a>
	</td>
</tr>

<tr>
	<td align="right" >Home image 3</td>
	<td >
		<input type=text size=50 name="publictitle5" value="<% if(rsGetUser7.size()>0){ out.print(dbBean.getcell(rsGetUser7,0,0)); } %>">
		<a href="#" onclick="return popitup('uploadConfig.jsp?imgNo=3')"><font color="black">Change Image</font></a>
	</td>
</tr>


<tr>
	<td align="right" >Public site intro text (English)</td>
	<td ><textarea rows=8 cols=80 name="publicintro"><% if(rsGetUser9.size()>0){ out.print(dbBean.getcell(rsGetUser9,0,0)); } %></textarea></td>
</tr>
<tr>
	<td align="right" >&#2360;&#2366;&#2352;&#2381;&#2357;&#2332;&#2344;&#2367;&#2325; &#2360;&#2366;&#2311;&#2335; &#2346;&#2352;&#2367;&#2330;&#2351; &#2346;&#2366;&#2336; &#40;&#2361;&#2367;&#2306;&#2342;&#2368;&#41;</td>
	<td ><textarea rows=8 cols=80 name="publicintroh"><% if(rsGetUser10.size()>0){ out.print(dbBean.getcell(rsGetUser10,0,0)); } %></textarea></td>
</tr>
<tr>
	<td align="right" >Website Feedback E-mail should be sent to : </td>
	<td ><input type=text size=50 name="userFeedBack" value="<% if(rsGetUser11.size()>0){ out.print(dbBean.getcell(rsGetUser11,0,0)); } %>"></td>
</tr>
<!--<tr>
	<td align="right" >User Creation E-mail</td>
	<td ><input type=text size=50 name="userCreation" value="<% if(rsGetUser12.size()>0){ out.print(dbBean.getcell(rsGetUser12,0,0)); } %>"></td>
</tr>-->
<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Submit Site Configuration Parameters"></td>
</tr>
</form> 
</table>
<br><br><br>
<%@ include file="../header/footerInner.jsp" %>