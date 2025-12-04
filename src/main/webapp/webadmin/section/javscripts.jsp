
<link rel="StyleSheet" href="css/style.css" type="text/css">

<%
session.setAttribute("desc0",request.getParameter("desc0"));
session.setAttribute("desc1",request.getParameter("desc1"));
out.print(request.getParameter("desc0"));
%>

<body topmargin="0" bgcolor="#ffffff">
<SCRIPT language=javascript>


function sendToParent(){

window.opener.location="section_management.jsp?parent=0&path=0&link="+document.frm.txtLink.value;
window.close();
}

</script>
<form name="frm">
<input type="Button" onclick="sendToParent();" value="click">
<input type="text"  value="" name="txtLink">
</form>
