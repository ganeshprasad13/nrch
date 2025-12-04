<%int intPageNo =1;%>
<%@ include file="../header/headerInner.jsp" %>
<%//@ include file="mov.js" %>
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
</SCRIPT>


<script language="JavaScript1.2" src="../../javascripts/ColorPicker2.js" type="text/javascript">
<!--
//-->
</script>
<SCRIPT LANGUAGE="JavaScript">
var cp = new ColorPicker('window'); // Popup window
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

function UpdateSectionImage(sHtml) {
var sDiv = document.getElementById("secImage");
sDiv.innerHTML = sHtml;
}

function UpdateRelatedSection(sHtml) {
var sDiv = document.getElementById("relatedSection");
sDiv.innerHTML = sHtml;
}
	function chkform()
	{
		if(document.RTEDemo.label0.value == "")
			{
			alert("Enter Label");
			document.RTEDemo.label0.focus();
			return false;
			}
	if(document.RTEDemo.label1.value == "")
				{				
				alert("Enter Label (in &#2361;&#2367;&#2344;&#2381;&#2342;&#2368;)");
				document.RTEDemo.label1.focus();	
				return false;			
				}
	}
	</script>

<% 
Vector getinfo = new Vector();
	String query_info;
	String emailFrom ="";
	String adminEmail = "";
	query_info = "SELECT DAU_EMAIL, DAU_ID FROM CMS_ADMIN_USER WHERE DAU_ID = "+(String)session.getAttribute("DBAUserId")+" ";
	dbBean.setQuery(query_info);
	getinfo=(Vector)dbBean.go();
	if(getinfo.size()!=0){
		emailFrom =dbBean.getcell(getinfo,0,0);
	}
	query_info = "SELECT CMSSC_DESC  FROM CMS_SITE_CONFIGURATION WHERE CMSSC_TYPE = 11 order by CMSSC_ID desc LIMIT 0,1";
	dbBean.setQuery(query_info);
	getinfo=(Vector)dbBean.go();
	if(getinfo.size()!=0){
		adminEmail =dbBean.getcell(getinfo,0,0);
	}
%>
<div align="center">
<form name="RTEDemo" action="userRequestAction.jsp" method="post" onsubmit="javascript:return chkform()">
	<input type="hidden" name="emailFrom" value="<%=emailFrom%>">
<br>


<br>	
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
	<%if(request.getParameter("strMSG") != null){%>
	<tr>
		<td colspan="2" align="center" nowrap="nowrap">
			<font class="tab"><%=request.getParameter("strMSG")%></font>
		</td>
	</tr>
	<%}%>
	<tr>
		<td colspan="2" align="center" nowrap="nowrap" class="tr_bgcolor">
			<font class="tab">Send email to administrator</font>
		</td>
	</tr>
	<tr>
		<td align="right" width="10%" ><b>From</b></td>
		<td width="100%">&nbsp;<%=emailFrom%></td>
	</tr>
	<tr>
		<td align="right" width="10%" ><b>To</b></td>
		<td width="100%"><input type="text" class="textboxh" name="emailTo" size="100%" value="<%=adminEmail%>" readonly="readonly" title="Enter email address"></td>
	</tr>
	<tr>
		<td align="right" width="10%"><b>Subject</b></td>
		<td width="100%"><input type="text" class="textboxh" name="emailSubject" size="100%"  title="Enter email subject"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<div id="rtf1" style="">
				<table style="font-size:12px;">
					<tr>
						<td align="left"><b>Description</b><br>
							<textarea name="description0" rows=10 cols=50 title="Enter details here"></textarea>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>	
	<tr>
		<td align="center"  colspan="2">
		<input type=submit name="submit" class="textbox" value="Send"></td>
	</tr>
</form> 
</table>
<br><br>
</div>

<script language="JavaScript1.2">
<!--
var sHtml = "None";
UpdateSectionImage(sHtml);

var sRelatedSection = "None";
UpdateRelatedSection(sRelatedSection);

//-->
</script>
<%@ include file="../header/footerInner.jsp" %>

<script>VISUAL=-1;</script>
<script src='../cms/quickbuild.js'></script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=0;changetoIframeEditor(document.forms[0].description0);</script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=0;SECURE=0;changetoIframeEditor(document.forms[0].description1);</script>