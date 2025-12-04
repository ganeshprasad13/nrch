<HTML>
<HEAD>
<TITLE>Create/Edit Links</TITLE>
<%@ include file="../../dbConn/dbInit.jsp" %>
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

String setsecurl = "";
int noofcom = 0;
%>
<LINK REL=stylesheet HREF='./skin/vdev.css' TYPE='text/css'>

<STYLE TYPE="text/css">
input {width:200}
</STYLE>
<script src="./skin/language.js"></script>
<script>
var IE= document.all
var OLDLINK= null	
var aTITLE='', aTARGET=''
function getParentTagA(Range)
{
  var parent=Range(0).parentElement
  while(parent && parent.tagName!='BODY')
  {
    if(parent.tagName=='A'){ return parent }
    parent= parent.parentElement
  }

  return null
}

function initFields(ahref,atitle,atarget,atype)
{
  if(ahref&& ahref.indexOf('://')>=0) ahref= (ahref.split("://"))[1]
  document.forms[0].href.value= ahref
  if(document.forms[0].target) document.forms[0].target.value= atarget
  if(document.forms[0].title) document.forms[0].title.value= atitle
  document.forms[0].type.value= atype
}


function initMoz()
{
  var win= window.opener.document.getElementById(window.opener.FID).contentWindow;
  var sel= win.getSelection()
  var range= sel.getRangeAt(0);
  var container = range.startContainer;
  var el

  if(container.nodeType !=1) el= container.parentNode
  else el= container
    
  var ahref= el.href
  var atarget= el.target
  var atitle= el.title
  var atype
  if(ahref) atype= (ahref.split(":"))[0] + "://"

  if(ahref){ OLDLINK= el; aTITLE= atitle; aTARGET= atarget }
  else{ OLDLINK= null; ahref=""; atarget=""; atitle=""; atype="http://" }
  
  initFields(ahref,atitle,atarget,atype)
}



function init()
{
 if(!IE) return initMoz()

  el= window.dialogArguments; 
  var sel
  sel= el.document.selection;

  var Range;
  Range = sel.createRange()

  var href='', target='', type='', title='', parent;

  if (sel.type=="Control")
  {
    parent= getParentTagA(Range)
    if(!parent) return;
    href= parent.getAttribute('href')
    target= parent.getAttribute('target')
    title= parent.getAttribute('title')
  }
  else
  {
    parent= Range.parentElement();
    if(parent.tagName!='A') return;
    href= parent.href
    target= parent.target
    title= parent.title
  }

  var idx= href.indexOf('://')
  if(idx>=0)
  {
    type= href.substring(0,idx+3);
    href= href.substr(idx+3);
  }

  if(href){ OLDLINK= true; aTITLE= title; aTARGET= target }

  initFields(href,title,target,type)
}



function doCreate()
{
  var el; 
  if(IE) el= window.dialogArguments; 
  else el= window.opener.document.getElementById(window.opener.FID).contentWindow;

  var href= document.forms[0].href.value
  if(href==''){ window.close(); return; }
  if(href.indexOf('://')<0) href= document.forms[0].type.value + href

  var target= document.forms[0].target.value
  var title= document.forms[0].title.value

  if(!IE) // Mozilla
  {
    if(!OLDLINK)
    {
      el.document.execCommand("CreateLink",false,href) 
    }
    else{ OLDLINK.href= href; OLDLINK.target= target; OLDLINK.title= title }
    window.close();
    return
   }
  

  var sel = el.document.selection;
  if(sel==null) return

  var selType= sel.type
  var Range, parent;
  Range= sel.createRange();

  if(selType!='Control')
  {
   el.curword= Range.duplicate();
   if(el.curword.text=='' && Range.parentElement().tagName!='A')
   {
    el.curword.text= href;
    Range.moveEnd("character", href.length);
    el.curword= Range;
    el.curword.select();
   }
  }

  el.document.execCommand("CreateLink",false,href)  

  if(selType!='Control')
  {
   parent= Range.parentElement();
   if(target) parent.target= target
   else parent.removeAttribute('target')
   if(title) parent.title= title
   else parent.removeAttribute('title')
  }
  else
  {
   parent= getParentTagA(Range)
   if(target) parent.setAttribute('target',target);
   else parent.removeAttribute('target')
   if(title) parent.setAttribute('title',title);
   else parent.removeAttribute('title')
  }

  window.close()
  
}



function doUnLink()
{
  if(IE)
  {
   var el= window.dialogArguments; 
   el.document.execCommand("UnLink",false,null)  
  }
  else
  {
   if(!OLDLINK) return       
   var parent= OLDLINK.parentNode
   
   var fchild= OLDLINK.firstChild
   var eclone= fchild.cloneNode(true)
   parent.insertBefore(eclone, OLDLINK);


   var nchild
   while(nchild= fchild.nextSibling)
   {
    eclone= nchild.cloneNode(true)
    parent.insertBefore(eclone, OLDLINK);
    fchild= nchild
   }

   parent.removeChild(OLDLINK)

   window.close()
   
  }
}
function updateLink()
{
 var urlVal = document.forms[0].intLink.options[document.forms[0].intLink.selectedIndex].value
 urlVal = "<%=strWebAppURL%>/" + urlVal
 document.forms[0].href.value = urlVal
 document.forms[0].href.readonly = true
}
function getFileLink() 
{
	<% 
	String strFileURL = request.getParameter("fileURL");
	if (strFileURL != null && !strFileURL.trim().equals("")){
		strFileURL = strWebAppURL + strFileURL; %>
	var fileURL = "<%=strFileURL%>"
	document.forms[0].href.value = fileURL
	<%
	}%>
}
</script>

</HEAD>

<body scroll=no class=vdev onload="getFileLink();">
<center>
<form>
<table width="100%" border="1" cellspacing="0" cellpadding="2">
<tr>
<td class="vdevtext2">Internal Link</td>
<td>
<select name="intLink" id="intLink" size="15" onChange="javascript:updateLink()" class="vdev" style="width:100%">
<%if(rslevel.size()!=0){
for(int i=0;i<rslevel.size();i++){
setsecurl = "view_section.jsp?id="+dbBean.getcell(rslevel,2,i);
noofcom = 0;

StringTokenizer stDblTicketId= new StringTokenizer(dbBean.getcell(rslevel,2,i),",");
			while(stDblTicketId.hasMoreTokens()){	
			noofcom = noofcom + 1;
			stDblTicketId.nextToken();
}
%>
<option value="<%=setsecurl%>"><% if (noofcom==2) {%>»<%}else{
for(int iii=0;iii<noofcom-1;iii++){%>&nbsp;&nbsp;&nbsp;<%}}%><%=dbBean.getcell(rslevel,1,i)%></option>
<% 
	}
	}
%>	
<%@ include file="../hardcodedlinks.jsp"%>
</select>
</td>
</tr>
<tr>
<td class=vdevtext2 align=right><script>document.writeln(TYPE)</script>/<script>document.writeln(URL)</script>
<td><select name=type class=vdev style="width:55">
<option value="">
<option value="http://" selected>http
<option value="https://">https
<option value="ftp://">ftp
<option value="mailto://">mailto
<option value="file://">file
<option value="telnet://">telnet
<option value="news://">news
<option value="gopher://">gopher
<option value="wais://">wais
</select><input name=href value="">
</tr>

<script>
init();

if(IE || OLDLINK)
{
document.writeln('<tr><td class=vdevtext2 align=right>' + LINKTITLE + '<td><input name=title value=""></tr>');
document.writeln('<tr><td class=vdevtext2 align=right>' + TARGET + '<td><select name=target><option value=_self selected>Self</option><option value=_blank>New window</option></select></td></tr>');
}		 
else
{
document.writeln('<tr><td class=vdevtext2 align=right>' + LINKTITLE + '<td class=vdevtext2>'+ EDITTABLE + '</tr>');
document.writeln('<tr><td class=vdevtext2 align=right>' + TARGET + '<td><select name=target><option value=_self selected>Self</option><option value=_blank>New window</option></select></td></tr>');
}

document.forms[0].title.value= aTITLE
document.forms[0].target.value= aTARGET
</script>
	

<tr>
<td colspan=2 align=middle>
<BUTTON class=vdev onclick="doCreate()" class=vdev><script>document.writeln(APPLY)</script></button>
<BUTTON class=vdev onclick="window.close()" class=vdev><script>document.writeln(CLOSE)</script></button>


<script>
if(OLDLINK)
document.writeln('<BUTTON onclick="doUnLink()" class=vdev>' + UNLINK + '</BUTTON>')
</script>
</tr>
</table>
</form>
</center>
</BODY>
</HTML>