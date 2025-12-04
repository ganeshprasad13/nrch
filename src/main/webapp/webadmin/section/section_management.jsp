<%int intPageNo =1;%>
<%@ include file="../header/headerInner.jsp" %>
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
<%
	Vector getinfo = new Vector();
	String query_info;
	query_info = "SELECT DSM_ID, DLC_LABEL, DSM_PATH, DLC_DESCRIPTION, DSM_TYPE,DSM_PRIORITY, DLC_LANG_ID, DLC_CREATED_BY, DLC_CREATED_DATE, DLC_MODIFIED_BY, DLC_MODIFIED_DATE,DLC_ID,DSM_STATUS FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT WHERE DSM_PARENT = ";
	query_info = query_info + request.getParameter("parent")+" AND DSM_ID=DLC_DSM_ID AND DLC_LANG_ID = 0 ORDER BY DSM_PRIORITY, DLC_ID";
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
<script language="JavaScript1.2" src="../../javascripts/ColorPicker2.js" type="text/javascript"></script>

<script language="JavaScript1.2" type="text/javascript">
	var cp = new ColorPicker('window'); // Popup window
	<!--
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
	
	function showDiv(bollean)
	{
	
		var obj = document.getElementById("D1");
		if (bollean == "true")
		{
		   obj.style.display =""; 
		}else{
		   obj.style.display ="none"; 
		}		
	}

	function submitForm()
	{
		alert(document.forms[0].description0.value);
		alert(document.forms[0].description1.value);
		return true;
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
			alert("Enter Label (&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;)");
			document.RTEDemo.label1.focus();	
			return false;			
		}
	}
//-->
</script>
<%
	if(request.getParameter("error") != null && request.getParameter("error").equals("1")){
%>
<script>alert("Child Exist");</script>
<%
	}
%>
<style>
.news a:link
{
color:red;
}
</style>
<form name="RTEDemo" action="section_management_action.jsp" method="post" onsubmit="javascript:return chkform()">
	<input type="hidden" name="path" value="<%=request.getParameter("path")%>">
	<input type="hidden" name="parent" value="<%=request.getParameter("parent")%>">

<table width="100%" class="mgContentTitle"><tr><td align="center" ><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Content &raquo; <a style="color:white;font-size:14px;" href="section_management.jsp?parent=0&path=0">Top level</a> » 
<%	if(getlevel.size()!=0){
		for(int i=0;i<getlevel.size();i++){%>
			<a style="color:white;font-size:14px;" href="section_management.jsp?parent=<%=dbBean.getcell(getlevel,0,i)%>&path=<%=dbBean.getcell(getlevel,2,i)%>" class="link"><%=dbBean.getcell(getlevel,1,i)%></a> » 
<% 		}			// end of For loop
	}			// end of IF Condition
%></span>&nbsp;&nbsp;&nbsp;</td></tr></table>
<div align="center">
<!-- start of check of admin access level-->
<%
System.out.println(strAdminAccessLevel);
if((strAdminAccessLevel.equals("100")) || (session.getAttribute("DBAcreate").equals("999") && (!request.getParameter("path").equals("0")))){%>	
		<table width=750 align=center border=0 style="border-collapse: collapse" class="textn">
			<tr>
				<td  align=center height=23 colspan="2">	
					<div align="right">
				
<%if(!request.getParameter("parent").equals("0")){%>							
<%					if (htSectionIDs_valid.containsKey(request.getParameter("parent")) || (strAdminAccessLevel.equals("100"))) {%>
						<a href="javascript:showDiv('true')" style="color:red;" >Create a New Section</a>
<%					}%>&nbsp;&nbsp;&nbsp;<a href="javascript:history.back();" style="color:red;">Back</a>
<%}%>
					</div>
				</td>
			</tr>
		</table><br>
		<div align="left" id="D1" style="display:none">
			<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1">
				<tr>
					<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Manage Sections</b><div align="right"><a href="javascript:showDiv('false')" >Close </a></div></td>
				</tr>
				<tr>
					<td align="right" width="50%">Label</td>
					<td width="50%"><input type="text" class="textbox" name="label0"></td>
				</tr>
				<tr>
					<td align="right">Type</td>
					<td><input type="radio" name="type" value="1" checked>&nbsp;(Normal)&nbsp;&nbsp;
					<input type="radio" name="type" value="2">&nbsp;(Direct)&nbsp;&nbsp;<input type="radio" name="type" value="3"> (Interaction)
					</td>
				</tr>
					<input type="Hidden" name="right" value="1">		
				<!--<tr>
					<td align="right">Theme</td>
					<td><input type="text" name="theme" id="theme" size="10" maxlength="7">&nbsp;&nbsp;&nbsp;<A HREF="#" onClick="cp.select(document.RTEDemo.theme,'pick');return false;" NAME="pick" ID="pick"><img src="../../images/bgcolor.gif" alt="Pick a color..." border="0"></a>			
					</td>
				</tr>-->
				<tr>
					<td align="right">Priority</td>
					<td><select class="textbox" name="selpriority">
				       <% for (int x=1;x<=50;x++){%>
						<option value="<%=x%>"><%=x%></option>
						<%}%>
					</select></td>
				</tr>
				<tr>
					<td align="right">Open in new window</td>
					<td>
					<input type="Radio" name="openinnewwindow" value="0" checked>&nbsp;No&nbsp;&nbsp;&nbsp;
					<input type="Radio" name="openinnewwindow" value="1">&nbsp;Yes
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div id="rtf1" style="">
							<table style="font-size:12px;"><tr>
								<td align="center"><b>Description in English</b><br>
									<textarea id="myEditor" name=description0>Coming soon</textarea>
								</td>
							</tr></table>
						</div></td>
				</tr>		
				<tr>
					<td align="center" align="center" colspan="2">
					<input type=submit name="submit" class="textbox" value="Create Section"><!--- <input type="button" name="show" id="show" value="show values" class="textbox" onClick="javascript:submitForm();"> ---></td>
				
				</tr>
			</form> 
			</table>
			
			<div align="center" class="texts1">
				Current Level: <a class="texts1" style="color:red;" href="section_management.jsp?parent=0&path=0">Top level</a> » 
<% 				if(getlevel.size()!=0){
					for(int i=0;i<getlevel.size();i++){%>
					<a class="texts1" style="color:red;" href="section_management.jsp?parent=<%=dbBean.getcell(getlevel,0,i)%>&path=<%=dbBean.getcell(getlevel,2,i)%>" class="link"><%=dbBean.getcell(getlevel,1,i)%></a> » 
<%					}
				}%>
			</div>
	</div>
<% }%>

<!-- end of chk for admin access level -->
<form action="delsection.jsp" method="post">
	<input type="hidden" name="backUrl" id="backUrl" value="<%=request.getRequestURI()%>?<%=request.getQueryString()%>">
	<table width="750" border="1" cellpadding="3" bordercolor="#111111" bgcolor="#FCF9D8" class="texts1" style="border-collapse: collapse" >
	<tr class="tr_bgcolor">
		<td align="center"><b>Label</b></td>
		<td align="center"><b>Priority</b></td>
		<td align="center"><b>Type</b></td>
		<td align="center"><b>Created</b>/<b>Updated</b></td>
		<td align="center"><b>Action</b><br>		
		</td>
	</tr>
<%
// new code added to implement new version of ACL
if(1==1){
	if(getinfo.size()!=0){
		for (int i=0;i<getinfo.size();i++){%>
			<tr>
				<td><%=dbBean.getcell(getinfo,1,i)%></td>
				<td align="center"><%=dbBean.getcell(getinfo,5,i)%></td>
				<td>
<%					if(dbBean.getcell(getinfo,4,i).equals("1")){
						out.print("Normal");
					}else if(dbBean.getcell(getinfo,4,i).equals("2")){
						out.print("Direct");
					}else{
						out.print("Interaction");
					}%>
				</td>
				<td align="center"><%=dbBean.getcell(getinfo,7,i)+"<br>"+dbBean.getcell(getinfo,8,i)%>/<br><font color="Teal">
<%					if(!dbBean.getcell(getinfo,9,i).equals("0")) {
						out.print(dbBean.getcell(getinfo,9,i)+"<br>"+dbBean.getcell(getinfo,10,i));
					}else{ out.print("-");
					}%></font>
				</td>
				<td align="left" >
				<table  border="0"  >
				<tr>
				<td align="left">
					<a style="color:red;font-size:11px;" target="_blank" href="section_description.jsp?id=<%=dbBean.getcell(getinfo,11,i)%>&lang=<%=dbBean.getcell(getinfo,6,i)%>"><!--<img src="../images/document_add.gif" alt="Preview this Section..." width="24" height="24" border="0">-->Preview</a>&nbsp;&nbsp;&nbsp;|
				</td><td align="center"><%					
if((htSectionIDs.containsKey(dbBean.getcell(getinfo,0,i))) || (strAdminAccessLevel.equals("100"))){
						if(htSectionIDs_valid.containsKey(dbBean.getcell(getinfo,0,i)) || (strAdminAccessLevel.equals("100"))){
							if(dbBean.getcell(getinfo,12,i).equals("1")){%>
								<a  style="color:red;font-size:11px;" href="section_status.jsp?id=<%=dbBean.getcell(getinfo,0,i)%>&action=0&path=<%=request.getParameter("path")%>&parent=<%=request.getParameter("parent")%>"><!--<img src="../images/document_delete.gif" alt="De-activate this Section..." border="0">-->De-activate</a>&nbsp;&nbsp;&nbsp;|
<%							}else{			// else of IF for dbBean.getcell(getinfo,12,i).equals("1")%>
								<a style="color:red;font-size:11px;"  href="section_status.jsp?id=<%=dbBean.getcell(getinfo,0,i)%>&action=1&path=<%=request.getParameter("path")%>&parent=<%=request.getParameter("parent")%>"><!--<img src="../images/document_activate.gif" alt="Activate this section..." border="0">-->Activate</a>&nbsp;&nbsp;&nbsp;|
<%							}			// end of IF for dbBean.getcell(getinfo,12,i).equals("1")%>
</td><td align="center"><a style="color:red;font-size:11px;"  href="section_edit.jsp?id=<%=dbBean.getcell(getinfo,0,i)%>&path=<%=dbBean.getcell(getinfo,2,i)%>"><!--<img src="../images/document_edit.gif" alt="Edit this Section..." border="0">-->Edit</a>&nbsp;&nbsp;&nbsp;|
</td><td align="center">
<%						}			// end of IF for htSectionIDs_valid.containsKey(dbBean.getcell(getinfo,0,i))
						if(dbBean.getcell(getinfo,4,i).equals("2")){%>
							<a style="color:red;font-size:11px;" href="section_management.jsp?parent=<%=dbBean.getcell(getinfo,0,i)%>&path=<%=dbBean.getcell(getinfo,2,i)%>" class="linkn"><!--<img src="../images/document_add.gif" alt="Create New Sub-section..." border="0">-->View Sub-section</a>&nbsp;&nbsp;&nbsp;
<%						}else{%>
							<a style="color:red;font-size:11px;" href="section_management.jsp?path=<%=dbBean.getcell(getinfo,2,i)%>&parent=<%=dbBean.getcell(getinfo,0,i)%>" class="linkn"><!--<img src="../images/document_add.gif" alt="Create New Sub-section..." border="0">-->View Sub-section</a>&nbsp;&nbsp;&nbsp;
<%						}			 // end of IF for dbBean.getcell(getinfo,4,i).equals("2")
%>
						</td>
						<%if(!request.getParameter("parent").equals("0") && strDBAacc.equals("100")){%>
							<td align="center">
								<a style="color:red;font-size:11px;"  href="section_management_delete.jsp?id=<%=dbBean.getcell(getinfo,0,i)%>&parent=<%=dbBean.getcell(getinfo,0,i)%>&path=<%=dbBean.getcell(getinfo,2,i)%>" onclick="return confirm('Are you sure you want to delete');">|&nbsp;&nbsp;&nbsp;Delete</a>&nbsp;&nbsp;&nbsp;
							</td>
						<%}%>
<%
					}			// end of IF for htSectionIDs.containsKey(dbBean.getcell(getinfo,0,i))
					
					%>
				</td></tr></table></td>
			</tr>
<%		}			// End of For loop
	}else{			//else for IF of getinfo.size()%>
		<tr>
			<td colspan="6" align="center">
			No record(s) found
			</td>
		</tr>
<%	}			// ensd of IF for getinfo.size()
}else{			// else of if(1==1)
	Vector getNonSuperUserInfo_rs = new Vector();
	String getNonSuperUserInfo = "SELECT DSM_ID, DLC_LABEL, DSM_PATH, DLC_DESCRIPTION, DSM_TYPE,DSM_PRIORITY, DLC_LANG_ID, DLC_CREATED_BY, DLC_CREATED_DATE, DLC_MODIFIED_BY, DLC_MODIFIED_DATE,DLC_ID,DSM_STATUS FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT, CMS_ACL WHERE ACL_USER_ID = "+session.getAttribute("DBAUserId")+" AND ACL_SECTION_ID = DLC_DSM_ID AND DSM_ID = DLC_DSM_ID AND DLC_LANG_ID = 0";
	dbBean.setQuery(getNonSuperUserInfo);
	getNonSuperUserInfo_rs = (Vector)dbBean.go();	
	if(getNonSuperUserInfo_rs.size()!=0){
		for(int i=0;i<getNonSuperUserInfo_rs.size();i++){%>
			<tr>
				<td><%=dbBean.getcell(getNonSuperUserInfo_rs,1,i)%></td>
				<td><%=dbBean.getcell(getNonSuperUserInfo_rs,5,i)%></td>
				<td>

<%					if (dbBean.getcell(getNonSuperUserInfo_rs,4,i).equals("1")){
						out.print("Normal");
					}else if(dbBean.getcell(getNonSuperUserInfo_rs,4,i).equals("2")){
						out.print("Direct");
					}else{
						out.print("Interaction");
}%>	
				</td>
				<td><%=dbBean.getcell(getNonSuperUserInfo_rs,7,i)+"<br>"+dbBean.getcell(getNonSuperUserInfo_rs,8,i)%>/<br>
	<font color="Teal">
<%					if(!dbBean.getcell(getNonSuperUserInfo_rs,9,i).equals("0")) {
						out.print(dbBean.getcell(getNonSuperUserInfo_rs,9,i)+"<br>"+dbBean.getcell(getNonSuperUserInfo_rs,10,i));
					}else{ 
						out.print(" - ");
					}%></font>	
				</td>
				<td>
					<a target="_blank" href="section_description.jsp?id=<%=dbBean.getcell(getNonSuperUserInfo_rs,11,i)%>&lang=<%=dbBean.getcell(getNonSuperUserInfo_rs,6,i)%>"><img src="../../images/preview.gif" alt="Preview this Section..." border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp; <a  href="section_edit.jsp?id=<%=dbBean.getcell(getNonSuperUserInfo_rs,0,i)%>&path=<%=dbBean.getcell(getNonSuperUserInfo_rs,2,i)%>"><img src="../../images/edit16.gif" alt="Edit this Section..." border="0"></a>&nbsp;&nbsp;	
				</td>
			</tr>
<%		}			// end of For loop
	}			// end of IF for getNonSuperUserInfo_rs.size()
}			// end of if(1==1)
%>
</form>
</table>
<br><br>
</div>
<%@ include file="../header/footerInner.jsp" %>
<%// if (strAdminAccessLevel.equals("100")) {%>	
<script>VISUAL=-1;</script>
<script src='../cms/quickbuild.js'></script>
<%//}%>