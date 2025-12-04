<%int intPageNo =4;%>
<%@ include file="../header/headerInner.jsp" %>
<script language="javascript" type="text/javascript" src="../css/HindiTextBox.js"></script>
<script type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=200,width=550,top=250,left=250');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
</script>
<script src="../../js/jquery.js"></script>
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
var cp = new ColorPicker('window'); 

function UpdateSectionImage(sHtml) {
var sDiv = document.getElementById("secImage");
sDiv.innerHTML = sHtml;
}

function UpdateRelatedSection(sHtml) {
var sDiv = document.getElementById("relatedSection");
sDiv.innerHTML = sHtml;
}
</script>
<%PreparedStatement ps= null;
ResultSet rs=null;
String query = "SELECT id, image_file, image_name, mach_name, mach_desc,lang FROM cms_banner ORDER BY id"; 
ps = cn.prepareStatement(query);
rs = ps.executeQuery();%>

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
	<td colspan="6" class="tr_bgcolor" align=center height=23 >
	<b>Site Configuration Parameters</b>
	</td>
</tr>
<%if(request.getParameter("strMSG")!=null){if(request.getParameter("strMSG").equals("1")) {%>

 <tr id="strMsg">
       		<td colspan="6" align="center"><small style="color:green"><b>Deleted Successfully</b></small></td>
	   </tr> 
	   <%}else if(request.getParameter("strMSG").equals("2")){ %>
<tr id="strMsg">
       		<td colspan="6" align="center"><small style="color:red"><b>Some error occurred</b></small></td>
	   </tr> 	   <%}else if(request.getParameter("strMSG").equals("3")){%><tr id="strMsg">
       		<td colspan="6" align="center"><small style="color:green"><b>Updated Successfully</b></small></td>
	   </tr>  <%}} %>
 <tr id="Msg" style="display:none">
       		
	   </tr> 
<tr >
       		<td colspan="6" align="center"><small style="color:red"><b><i>* Please upload all the banner images with same aspect ratio</i></b></small></td>
	   </tr>
<%int i= 1;
while(rs.next()){ %>
<tr>
            <td>
           		<label for="label<%=i%>">Machine Name for Banner <%if(rs.getInt(6)==0){out.print((i/2+1)+" (English)");}else{out.print((i/2)+" (&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;)");} %></label>
            </td>
            <td>
           		<input type="text" name="label<%=i%>" id="label<%=i%>" value="<%=rs.getString(4)%>"/>
            </td>
            <td rowspan="2">
                <input type="file" name="file<%=i%>" id="file<%=i%>" accept="image/*" onchange="ChkfileExt(this);"/> 
            </td>
            <td rowspan="2" id="state<%=i%>" style="color:red">
            	<%if(rs.getString(2).trim().equals("")) {%>N.A.<input type="hidden" name="exist<%=i%>" id="exist<%=i%>" value="0"/><%}else{%><a href="../../images/<%=rs.getString(2)%>" target="_blank" style="color:green"><%=rs.getString(3)%></a><input type="hidden" name="exist<%=i%>" id="exist<%=i%>" value="1"/><%} %>
            </td>
            <td rowspan="2">
            	<input onclick="upload_doc('<%=i%>')" class="btn-xs btn-success" type="button" value="Upload/Modify"/>
            </td>
            <td rowspan="2">
                <button onclick="<%if(!rs.getString(2).trim().equals("")) {%>location.href='bannerDelete.jsp?ref=<%=rs.getString(1)%>'<%} %>" id="del<%=i%>" class="btn-xs btn-danger" <%if(rs.getString(2).trim().equals("")) {%>style="visibility:hidden"<%} %>>Delete</button>
            </td>
        </tr>
        <tr>
        <td>
           		<label for="des<%=i%>">Machine Description for Banner <%if(rs.getInt(6)==0){out.print((i/2+1)+" (English)");}else{out.print((i/2)+" (&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;)");} %></label>
            </td>
            <td>
           		<input type="text" name="des<%=i%>" id="des<%=i%>" value="<%=rs.getString(5)%>"/>
            </td>
        </tr>
        <%i++;} 

        query = "SELECT intro_english,intro_hindi FROM cms_intro_text WHERE id=1";
        ps = cn.prepareStatement(query);
rs = ps.executeQuery();
if(rs.next()){%>
</table>
<form action="siteConfigAction.jsp" method="post">
<table width="750" align=center border=0 class="sample">

<tr>
	<td align="right" ><b>Public site intro text (English)</td>
	<td colspan="5"><textarea name=description0 rows=25 cols=50 ><%=rs.getString(1) %></textarea></td>
</tr>
<tr>
	<td align="right" ><b>Select KeyBoard</td>
	<td colspan="5"><script type="text/javascript">loadKeyboardLayouts();</script></td>
</tr>
<tr>
	<td align="right" ><b>&#2360;&#2366;&#2352;&#2381;&#2357;&#2332;&#2344;&#2367;&#2325; &#2360;&#2366;&#2311;&#2335; &#2346;&#2352;&#2367;&#2330;&#2351; &#2346;&#2366;&#2336; &#40;&#2361;&#2367;&#2306;&#2342;&#2368;&#41;</td>
	<td colspan="5"><textarea rows=25 cols=50 name="description1" class="LblHAnswer"><%=rs.getString(2) %></textarea></td>
</tr>
<%} %>
<tr>
	<td align="center" align="center" colspan="6">
	<input type=submit name="submit" class="textbox" value="Submit website Intro Text"></td>
</tr> 
</table>
</form>
<script>
function upload_doc(no)
{   $(".err").remove();
$('#strMsg').remove();
$('#Msg').css("display","none")
    var fd = new FormData();
    var files = $('#file'+no)[0].files[0];
    if(files!=null){
    var fname = files.name;
    }
    var label = $('#label'+no).val();
    var des = $('#des'+no).val();
    var exist = $('#exist'+no).val();
    if(label.trim()==""){
    	$('#label'+no).after('<div class="err"><small style="color:red"><i>Please fill!</i></small></div>');
    	return false;
    }
    if(des.trim()==""){
    	$('#des'+no).after('<div class="err"><small style="color:red"><i>Please fill!</i></small></div>');
    	return false;
    }
    if(files==null&&exist.trim()=="0"){
    	$('#file'+no).after('<div class="err"><small style="color:red"><i>Please Select a File!</i></small></div>');
    return false;
    }else{
    fd.append('file', files);
    fd.append('label',label);
    fd.append('des',des);
    fd.append('refNo',no);
    if(files!=null){
    $("#state"+no).html("Uploading...");
    $("#state"+no).css("color","orange");
    $("#state"+no).css("display","");
    }
    $.ajax({
        url: 'bannerUpload.jsp',
        type: 'post',
        data: fd,
        cache: false,
        enctype : 'multipart/form-data',
        contentType: false,
        processData: false,
        success: function (response) {
        	var res = response.split("#");
        	if(res[0]==1){
            $("#state"+no).html('<a href="../../images/'+res[2]+'" target="_blank" style="color:green">'+fname+'</a><input type="hidden" name="exist'+no+'" id="exist'+no+'" value="1"/>');
            $("#state"+no).css("color","green");
            $("#del"+no).attr("onclick", "location.href='bannerDelete.jsp?ref="+res[1]+"'");
            $("#del"+no).css("visibility","visible");
        	}
        	else if(res[0]==2){
        		$('#Msg').html('<td colspan="6" align="center"><small style="color:green"><b>Updated Successfully</b></small></td>');
        		$('#Msg').css("display","")
        	}else{
        	$('#Msg').html('<td colspan="6" align="center"><small style="color:red"><b>Some error occured</b></small></td>');
        	$('#Msg').css("display","")
        	}
        },
    });
    }
}
function ChkfileExt(id){
	var file =id.files[0].name
	var lastdot = file.lastIndexOf(".");
	var firstdot = file.indexOf(".");
	var fileName = file.substring(0, lastdot);
	var ext = file.substring(firstdot+1);
	var pattern = /[^a-zA-Z0-9_]/;
	if(pattern.test(fileName)){
		alert("File Name should not contain any special character or spaces");
		id.value="";
		return false; 
	}else if(ext.toLowerCase()!="jpg"&&ext.toLowerCase()!="jpeg"&&ext.toLowerCase()!="png"){
		alert("Only jpg/jpeg or png  files can be uploaded");
		id.value="";
	   return false; 
	}
	return true;
}
</script>
<br><br><br>
<%@ include file="../header/footerInner.jsp" %>
<script>VISUAL=-1;</script>
<script src='../cms/quickbuild.js'></script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=0;SECURE=0;changetoIframeEditor(document.forms[0].description0);</script>
<script>FULLCTRL=1;USEFORM=1;UNICODE=0;SECURE=0;changetoIframeEditor(document.forms[0].description1);</script>