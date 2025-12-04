      <%int intPageNo =1;%>
<%@ include file="../header/headerInner.jsp" %>
<!-- Place the first <script> tag in your HTML's <head> -->
<script src="/nrch/tinymce/tinymce.min.js"></script>
<!-- Place the following <script> and <textarea> tags your HTML's <body> -->
<script>
tinymce.init({
    selector: '#myEditor',
    height: 1000,
    width:800,
    plugins: [
        'link', 'image', 'code', 'lists', 'table', 'paste', 'wordcount', 'fullscreen', 'textcolor', 'colorpicker', 'importcss'
    ],
    toolbar: `
        undo redo | 
        bold italic underline strikethrough | 
        forecolor backcolor | 
        fontsizeselect fontselect | 
        alignleft aligncenter alignright alignjustify | 
        bullist numlist outdent indent | 
        blockquote | 
        link image table | 
        removeformat | 
        code | 
        fullscreen | 
        spellchecker | 
        wordcount | 
        import | export
    `,

    // File / image upload options
    automatic_uploads: false,   // no drag-drop upload
    images_upload_url: '/nrch/uploadFile',  // servlet for uploads
    images_reuse_filename: true,
    image_uploadtab: false,     // hide upload tab

    // Custom file picker
    file_picker_types: 'image file',
    file_picker_callback: function(cb, value, meta) {
        let input = document.createElement('input');
        input.type = 'file';
        if (meta.filetype === 'image') input.accept = 'image/*';

        input.onchange = function() {
            let file = this.files[0];
            let formData = new FormData();
            formData.append('file', file);

            fetch('/nrch/uploadFile', { method: 'POST', body: formData,headers: { "X-Requested-With": "XMLHttpRequest" } })
            	.then(response => {
				    if (response.status === 401) {
				        alert("Please login to upload files.");
				        window.location.href = "/nrch/index.jsp"; // redirect user
				        return "";
				    }
				    return response.text();
				})
                .then(url => {
                    if (meta.filetype === 'image') cb(url);
                    else cb(url, { text: file.name });
                })
                .catch(err => alert('Upload failed: ' + err.message));
        };
        input.click();
    },

    // Prevent internal drag-drop
    paste_data_images: false,

    // Remove TinyMCE branding
    branding: false,
    relative_urls: false,
    remove_script_host: false,
    convert_urls: true,
    // Additional options
    menubar: true,             // show menu bar
    statusbar: true,           // show status bar
    resize: true,              // allow resizing editor
    paste_as_text: false,       // paste content as plain text
    contextmenu: 'link image inserttable | cell row column deletetable',
    paste_remove_styles_if_webkit: true,
    paste_remove_spans: true,
    paste_strip_class_attributes: "all"
});

</script>

<style>
.tox-promotion{
 display:none;
}
</style>
<%!

public Vector test( ResultSet rs) throws SQLException {
        
ResultSet resultSet = rs;
ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
int cols = resultSetMetaData.getColumnCount();
int rows = 0;
Vector result = new Vector();
while (resultSet.next()) {
	String[] arrstring = new String[cols];
	int n = 1;
	while (n <= cols) {
		arrstring[n - 1] = resultSet.getString(n);
		++n;
	}
	result.addElement(arrstring);
	++rows;
}
resultSet.close();

return result;
}
%>



<%
String strsql= "";
PreparedStatement ps=null;
ResultSet rs_res=null;

try{
strsql = "SELECT DAU_ID FROM cms_admin_user WHERE DAU_ID in (select ACL_USER_ID from CMS_ACL WHERE ACL_USER_ID='"+session.getAttribute("DBAUserId")+"' and ACL_SECTION_ID='"+request.getParameter("id")+"')";
dbBean.setQuery(strsql);
String rsGetResultValid[][] = dbBean.getResultSet();
if(rsGetResultValid.length>0 || strDBAacc.equals("100")){
}else{
	response.sendRedirect("http://"+request.getServerName()+"/cris/webadmin/home.jsp?msg=Access Denied"); 
}
%>
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

<%


Vector getinfo = new Vector();
String query_info;
query_info = "SELECT DSM_ID, DLC_LABEL, DSM_PATH, DLC_DESCRIPTION, DSM_TYPE,DSM_PRIORITY, DLC_LANG_ID, DLC_CREATED_BY, DLC_CREATED_DATE, DLC_MODIFIED_BY, DLC_MODIFIED_DATE,DLC_ID,DSM_RIGHT,DSM_THEME,DSM_USER_FILENAME,DSM_SYS_FILENAME,DSM_FILE_SIZE,DSM_RELATED_LINKS,DSM_RELATED_LINKS2,DSM_OPEN_NEW FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT WHERE DSM_ID = ";
query_info = query_info +"? AND DSM_ID=DLC_DSM_ID order by DLC_LANG_ID";
ps=cn.prepareStatement(query_info);
ps.setString(1,request.getParameter("id"));
rs_res=ps.executeQuery();
getinfo=(Vector)test(rs_res);
//out.println(query_info + "<hr/>");


Vector getlevel = new Vector();
String query_level;
String pathIds[] = request.getParameter("path").split(",");
query_level = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query_level = query_level + " WHERE DSM_ID in ( ";
for(int i=0;i<pathIds.length;i++){
	if(i==0){
		query_level = query_level + " ? ";	
	}else{
		query_level = query_level + " ,? ";
	}
}
query_level = query_level + " ) AND DSM_ID = DLC_DSM_ID AND DLC_LANG_ID =0";
query_level = query_level + " ORDER BY DSM_PATH";

ps=cn.prepareStatement(query_level);
for(int i=0;i<pathIds.length;i++){
	ps.setString(i+1,pathIds[i]);	
}

rs_res=ps.executeQuery();
getlevel=(Vector)test(rs_res);


Vector getright = new Vector();
String query_right;
query_right = "SELECT * FROM CMS_INCLUDE_SECTION ";
query_right = query_right + " WHERE DIS_TYPE = 1 and DIS_LANG_ID = 0";
query_right = query_right + " ORDER BY DIS_LABEL";
dbBean.setQuery(query_right);
getright=(Vector)dbBean.go();


%>
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

	}
	</script>


<div align="center">
<form name="RTEDemo" action="section_edit_action.jsp" method="post" onsubmit="javascript:return chkform()">
	<input type="hidden" name="id" value="<%=dbBean.getcell(getinfo,0,0)%>">
	<input type="hidden" name="id0" value="<%=dbBean.getcell(getinfo,11,0)%>">
	<input type="hidden" name="path" value="<%=request.getParameter("path")%>">
<br>

<div align="center" class="textn">
<%if(strAdminAccessLevel.equals("100")){%>
Current Level: <a href="section_management.jsp?parent=0&path=0" style="color:blue;">Top level</a> » 
<% 
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
%>
<a style="color:blue;font-size:11px;font-weight:unbold;" href="section_management.jsp?parent=<%=dbBean.getcell(getlevel,0,i)%>&path=<%=dbBean.getcell(getlevel,2,i)%>" class="link1"><%=dbBean.getcell(getlevel,1,i)%></a> » 
<% 
	}
	}
	}else{
%>
<a href="section_management.jsp?parent=0&path=0">Return to section listing</a>
<% } %>
</div>

<br>	
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Update/Edit Sections</b></td>
</tr>
<%
String strEngTitle=dbBean.getcell(getinfo,1,0);
strEngTitle = strEngTitle.replaceAll("&rsquo;","'");%>
<tr>
	<td align="right" width="50%">Label in <%=strLanguage1%></td>
	<td width="50%" class="textn">
	<input type=text name="label0" size="50" value="<%=strEngTitle%>">
	</td>
</tr>
<tr>
	<td align="right">Type</td>
	<td>
<%	if (dbBean.getcell(getinfo,4,0).equals("1")){
	out.print("Normal");
	}else if(dbBean.getcell(getinfo,4,0).equals("2")){
	out.print("Direct");
	}else{
	out.print("Interaction");
	}
%>
	</td>
</tr>
<%
String rightval = "";
if (dbBean.getcell(getinfo,12,0).equals("")){
rightval = "1";
}else{
rightval = dbBean.getcell(getinfo,12,0);
}
%>
<INPUT type="Hidden" name="right" value="<%=rightval%>">
<!--<tr>
	<td align="right">
	Theme
	</td>
	<td align="left" valign="middle">
	<input type="text" name="theme" id="theme" size="10" maxlength="7" value="<%=dbBean.getcell(getinfo,13,0)%>"><table border="0" cellspacing="0" cellpadding="0" align="left"><tr><td bgcolor="<%=dbBean.getcell(getinfo,13,0)%>"><img src="../../images/spacer.gif" height="18" width="90" alt="Pick a color..." border="0"></td></tr></table>&nbsp;&nbsp;&nbsp;<A HREF="#" onClick="cp.select(document.RTEDemo.theme,'pick');return false;" NAME="pick" ID="pick"><img src="../../images/bgcolor.gif" alt="Pick a color..." border="0"></a>
	</td>
</tr>-->
<tr>
	<td align="right">Priority</td>
	<td>
	<select class="textbox" name="priority">
	<% for (int i=1;i<101;i++){%>
	<option <%if (i==Integer.parseInt(dbBean.getcell(getinfo,5,0))){%>selected<%}%> value ="<%=i%>"><%=i%></option>
	<%}%>
		
	</select>
	</td>
</tr>
<tr>
	<td align="right">Open in new window</td>
	<td>
	<input type="Radio" name="openinnewwindow" value="0" <%if (dbBean.getcell(getinfo,19,0).equals("0")){%>checked<%}%>>&nbsp;No&nbsp;&nbsp;&nbsp;
	<input type="Radio" name="openinnewwindow" value="1" <%if (dbBean.getcell(getinfo,19,0).equals("1")){%>checked<%}%>>&nbsp;Yes
	</td>
</tr>
<!--<tr>
	<td align="right">Section Image</td>
	<td><div id="secImage"></div><br><br>
<%if(strAdminAccessLevel.equals("100")){%>	
	<a href="javascript:popUp('upload_section_image.jsp?langid=0&id=<%=request.getParameter("id")%>','Upload_Section_Image',400,200,-1,-1);" title="Click here to update section image....">Update Section Image</a><%}%><br><br>
	</td>
</tr>-->
<%
Vector rslevel = new Vector();
String query;
query = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query = query + " WHERE DLC_LANG_ID = 0 ";
query = query + " AND DSM_ID = DLC_DSM_ID and DSM_PARENT <> -1 and DSM_STATUS = 1 and DSM_ID IN (?)";
query = query + " ORDER BY DSM_PATH";
ps=cn.prepareStatement(query);
ps.setString(1,dbBean.getcell(getinfo,17,0));
rs_res=ps.executeQuery();
rslevel=(Vector)test(rs_res);
String setsecurl = "";
int noofcom = 0;
%>
<!--<tr>
	<td align="right" valign="top">Related Sections</td>
	<td>	
		<table width="100%" align="center">
		<tr>
            <td class="textn">
				<div id="relatedSection"></div><br>
<%					if(strAdminAccessLevel.equals("100")){%>	
					<a style="color:red;" href="javascript:popUp('upload_related_links.jsp?langid=0&id=<%=request.getParameter("id")%>&rlids=<%=dbBean.getcell(getinfo,17,0)%>','Update_Related_Sections',750,450,-1,-1);" title="Click here to update section image....">Update Related Sections</a><%}%>
			</td>
		</tr>
		</table>	
	</td>
</tr>-->
<tr>
	<td colspan="2" align="center"><%
String str0 = dbBean.getcell(getinfo,3,0);


//str0 = str0.replaceAll("\"","").replaceAll("\n","").replaceAll("\r","");
%>
	<div id="rtf1" style="">
<%		if(strLanguageOption.equals("1") || strLanguageOption.equals("2")){
	// out.println("strLanguageOption =======================     "+strLanguageOption);
	 %>
			<table width="10" align="center" style="font-size:12px;"><tr>
			<td align="center"><b>Description in English</b><br>
					<textarea id="myEditor" name="description0" ><%=str0%></textarea>
			</td>
			</tr></table>
<%		}%>
	</div>	
	</td>
</tr>

<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Update Section"></td>
</tr>
</form> 
</table>
<br><br>
</div>
<%
Vector rsrl = new Vector();
String queryrl;
queryrl = "SELECT CRL_LABEL, CRL_URL from CMS_RELATED_LINKS ";
queryrl = queryrl + " WHERE CRL_STATUS = 1 ";
queryrl = queryrl + " and CRL_ID IN ("+dbBean.getcell(getinfo,18,0)+")";
queryrl = queryrl + " ORDER BY CRL_LABEL";
dbBean.setQuery(queryrl);
rsrl=(Vector)dbBean.go();
%>
<script language="JavaScript1.2">
<!--
var sHtml = "<%if (!dbBean.getcell(getinfo,16,0).equals("")){ if (!dbBean.getcell(getinfo,16,0).equals("0")){%><img src=\"../../uploads/sectionbanner/<%=dbBean.getcell(getinfo,15,0)%>\" border=\"0\" alt=\"\"><%}else{%>None<%}%><%}else{%>None<%}%>";
UpdateSectionImage(sHtml);

var sRelatedSection = "<%if(rslevel.size()!=0 || rsrl.size()!=0){for(int i=0;i<rslevel.size();i++){setsecurl = "viewsection.jsp?id="+dbBean.getcell(rslevel,2,i);noofcom = 0;StringTokenizer stDblTicketId= new StringTokenizer(dbBean.getcell(rslevel,2,i),",");while(stDblTicketId.hasMoreTokens()){noofcom = noofcom + 1;stDblTicketId.nextToken();}if (noofcom==2) {%>»<%}else{for(int iii=0;iii<noofcom-1;iii++){%>&nbsp;&nbsp;&nbsp;<%}}%><%=dbBean.getcell(rslevel,1,i)%><br><% }%><br><%for(int ii=0;ii<rsrl.size();ii++){out.print(dbBean.getcell(rsrl,0,ii)+" ("+dbBean.getcell(rsrl,1,ii)+")<br>");}%><%}else{%>None<%}%>";
UpdateRelatedSection(sRelatedSection);

//-->
</script>


<%}catch(Exception e){
	e.printStackTrace();
}
finally{
	 try{
		 if(rs_res!=null){
			 rs_res.close();
		 }
		 if(ps!=null){
			 ps.close();
		 }
	 }catch(Exception e){
		 
	 }
}
%>
<%@ include file="../header/footerInner.jsp" %>

<script>VISUAL=-1;</script>
<script src='../cms/quickbuild.js'></script>