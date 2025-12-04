<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

<%
response.setHeader( "Pragma", "no-cache" );
response.setHeader( "Cache-Control", "no-cache" );
response.setDateHeader( "Expires", 0 );
%>
<!-- login page -->
	<%/*  
		if(session.getAttribute("DBAusername") !=null && !session.getAttribute("DBAusername").equals("")){
		response.sendRedirect("home.jsp");
		} */
	%>
<%@ include file="../dbConn/dbInit.jsp"%>
<script type="text/javascript" src="../js/commonCheck.js"></script>

<script>
var sAscii = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var sAscii = sAscii + "[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

var sHex = "0123456789ABCDEF";
function hex(i)
{
  h = "";
  for(j = 0; j <= 3; j++)
  {
    h += sHex.charAt((i >> (j * 8 + 4)) & 0x0F) +
         sHex.charAt((i >> (j * 8)) & 0x0F);
  }
  return h;
}

function add(x, y)
{
  return ((x&0x7FFFFFFF) + (y&0x7FFFFFFF)) ^ (x&0x80000000) ^ (y&0x80000000);
}

function R1(A, B, C, D, X, S, T)
{
  q = add(add(A, (B & C) | ((~B) & D)), add(X, T));
  return add((q << S) | (q >>> (32 - S)), B);
}

function R2(A, B, C, D, X, S, T)
{
  q = add(add(A, (B & D) | (C & (~D))), add(X, T));
  return add((q << S) | (q >>> (32 - S)), B);
}

function R3(A, B, C, D, X, S, T)
{
  q = add(add(A, B ^ C ^ D), add(X, T));
  return add((q << S) | (q >>> (32 - S)), B);
}

function R4(A, B, C, D, X, S, T)
{
  q = add(add(A, C ^ (B | (~D))), add(X, T));
  return add((q << S) | (q >>> (32 - S)), B);
}

/* main entry point */
function calcMD5(sInp) {

  /* Calculate length in machine words, including padding */
  wLen = (((sInp.length + 8) >> 6) + 1) << 4;
  var X = new Array(wLen);

  /* Convert string to array of words */
  j = 4;
  for (i = 0; (i * 4) < sInp.length; i++)
  {
    X[i] = 0;
    for (j = 0; (j < 4) && ((j + i * 4) < sInp.length); j++)
    {
      X[i] += (sAscii.indexOf(sInp.charAt((i * 4) + j)) + 32) << (j * 8);
    }
  }

  /* Append padding bits and length */
  if (j == 4)
  {
    X[i++] = 0x80;
  }
  else
  {
    X[i - 1] += 0x80 << (j * 8);
  }
  for(; i < wLen; i++) { X[i] = 0; }
  X[wLen - 2] = sInp.length * 8;

  /* hard coded initial values */
  a = 0x67452301;
  b = 0xefcdab89;
  c = 0x98badcfe;
  d = 0x10325476;

  /* Process each 16 word block in turn */
  for (i = 0; i < wLen; i += 16) {
    aO = a;
    bO = b;
    cO = c;
    dO = d;

    a = R1(a, b, c, d, X[i+ 0], 7 , 0xd76aa478);
    d = R1(d, a, b, c, X[i+ 1], 12, 0xe8c7b756);
    c = R1(c, d, a, b, X[i+ 2], 17, 0x242070db);
    b = R1(b, c, d, a, X[i+ 3], 22, 0xc1bdceee);
    a = R1(a, b, c, d, X[i+ 4], 7 , 0xf57c0faf);
    d = R1(d, a, b, c, X[i+ 5], 12, 0x4787c62a);
    c = R1(c, d, a, b, X[i+ 6], 17, 0xa8304613);
    b = R1(b, c, d, a, X[i+ 7], 22, 0xfd469501);
    a = R1(a, b, c, d, X[i+ 8], 7 , 0x698098d8);
    d = R1(d, a, b, c, X[i+ 9], 12, 0x8b44f7af);
    c = R1(c, d, a, b, X[i+10], 17, 0xffff5bb1);
    b = R1(b, c, d, a, X[i+11], 22, 0x895cd7be);
    a = R1(a, b, c, d, X[i+12], 7 , 0x6b901122);
    d = R1(d, a, b, c, X[i+13], 12, 0xfd987193);
    c = R1(c, d, a, b, X[i+14], 17, 0xa679438e);
    b = R1(b, c, d, a, X[i+15], 22, 0x49b40821);

    a = R2(a, b, c, d, X[i+ 1], 5 , 0xf61e2562);
    d = R2(d, a, b, c, X[i+ 6], 9 , 0xc040b340);
    c = R2(c, d, a, b, X[i+11], 14, 0x265e5a51);
    b = R2(b, c, d, a, X[i+ 0], 20, 0xe9b6c7aa);
    a = R2(a, b, c, d, X[i+ 5], 5 , 0xd62f105d);
    d = R2(d, a, b, c, X[i+10], 9 ,  0x2441453);
    c = R2(c, d, a, b, X[i+15], 14, 0xd8a1e681);
    b = R2(b, c, d, a, X[i+ 4], 20, 0xe7d3fbc8);
    a = R2(a, b, c, d, X[i+ 9], 5 , 0x21e1cde6);
    d = R2(d, a, b, c, X[i+14], 9 , 0xc33707d6);
    c = R2(c, d, a, b, X[i+ 3], 14, 0xf4d50d87);
    b = R2(b, c, d, a, X[i+ 8], 20, 0x455a14ed);
    a = R2(a, b, c, d, X[i+13], 5 , 0xa9e3e905);
    d = R2(d, a, b, c, X[i+ 2], 9 , 0xfcefa3f8);
    c = R2(c, d, a, b, X[i+ 7], 14, 0x676f02d9);
    b = R2(b, c, d, a, X[i+12], 20, 0x8d2a4c8a);

    a = R3(a, b, c, d, X[i+ 5], 4 , 0xfffa3942);
    d = R3(d, a, b, c, X[i+ 8], 11, 0x8771f681);
    c = R3(c, d, a, b, X[i+11], 16, 0x6d9d6122);
    b = R3(b, c, d, a, X[i+14], 23, 0xfde5380c);
    a = R3(a, b, c, d, X[i+ 1], 4 , 0xa4beea44);
    d = R3(d, a, b, c, X[i+ 4], 11, 0x4bdecfa9);
    c = R3(c, d, a, b, X[i+ 7], 16, 0xf6bb4b60);
    b = R3(b, c, d, a, X[i+10], 23, 0xbebfbc70);
    a = R3(a, b, c, d, X[i+13], 4 , 0x289b7ec6);
    d = R3(d, a, b, c, X[i+ 0], 11, 0xeaa127fa);
    c = R3(c, d, a, b, X[i+ 3], 16, 0xd4ef3085);
    b = R3(b, c, d, a, X[i+ 6], 23,  0x4881d05);
    a = R3(a, b, c, d, X[i+ 9], 4 , 0xd9d4d039);
    d = R3(d, a, b, c, X[i+12], 11, 0xe6db99e5);
    c = R3(c, d, a, b, X[i+15], 16, 0x1fa27cf8);
    b = R3(b, c, d, a, X[i+ 2], 23, 0xc4ac5665);

    a = R4(a, b, c, d, X[i+ 0], 6 , 0xf4292244);
    d = R4(d, a, b, c, X[i+ 7], 10, 0x432aff97);
    c = R4(c, d, a, b, X[i+14], 15, 0xab9423a7);
    b = R4(b, c, d, a, X[i+ 5], 21, 0xfc93a039);
    a = R4(a, b, c, d, X[i+12], 6 , 0x655b59c3);
    d = R4(d, a, b, c, X[i+ 3], 10, 0x8f0ccc92);
    c = R4(c, d, a, b, X[i+10], 15, 0xffeff47d);
    b = R4(b, c, d, a, X[i+ 1], 21, 0x85845dd1);
    a = R4(a, b, c, d, X[i+ 8], 6 , 0x6fa87e4f);
    d = R4(d, a, b, c, X[i+15], 10, 0xfe2ce6e0);
    c = R4(c, d, a, b, X[i+ 6], 15, 0xa3014314);
    b = R4(b, c, d, a, X[i+13], 21, 0x4e0811a1);
    a = R4(a, b, c, d, X[i+ 4], 6 , 0xf7537e82);
    d = R4(d, a, b, c, X[i+11], 10, 0xbd3af235);
    c = R4(c, d, a, b, X[i+ 2], 15, 0x2ad7d2bb);
    b = R4(b, c, d, a, X[i+ 9], 21, 0xeb86d391);

    a = add(a, aO);
    b = add(b, bO);
    c = add(c, cO);
    d = add(d, dO);
  }
  return hex(a) + hex(b) + hex(c) + hex(d);
}

</script>


<script language="JavaScript">
function chk()
{

if(document.login.username.value=="")
{
alert("Please Enter Login name! ");
document.login.username.focus();
return false;
}

if(document.login.password.value=="")
{
alert("Please Enter Password ! ");
document.login.password.select();
return false;
}

document.login.password.value = calcMD5(document.login.password.value);

}
</script>

 <!-- added by rajpal kamboj  ------>
<script type = "text/javascript" >
    history.pushState(null, null, 'index.jsp');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'index.jsp');
    });
 </script>
<!-- ends here ----->

<body leftmargin=0 topmargin=0>
<link rel=stylesheet type="text/css" href="<%=strAppPath%>/css/styles0.css">
<link rel="stylesheet" type="text/css" href="<%=strAppPath%>/css/admin.css" />

<br><br>




<form name="login" action='chkAuth/chkAuth.jsp' method="post" onsubmit="return chk();">

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/admin.css" />
</head>

<body>
	<table width="980" border="0" align="center" height="80%" valign="top" class="table_border" style="margin-top:-45px;">
		<tr>
			<td valign="top" >
				<img src="images/left_top_img.jpg">
			</td>
		</tr>
		<tr>
			<td valign="top" style="background-color:#DCDCDE;font-family:arial;font-size:12px;font-weight:bold;text-align:center;vertical-align:middle">
				Administrator Login
			</td>
		</tr>
		<tr>
			<td>
				<table>
					<tr>
						<td style="border-right:1px dotted gray;"><img src="images/left_img.png"></td>
						<td style="padding-left:20px;">
							<div style="background-color:#DCDCDE;font-family:arial;font-size:14px;font-weight:bold;text-align:center;vertical-align:middle"><%=Title%> </div>
							<table cellpadding="3" border="0"  class="admin_bg" height="230" width="325">
								<tr>
									<td colspan="2" height="20"><p><b><br>&nbsp;&nbsp;&nbsp;Enter Login details:</b></p></td>
								</tr>
								<tr>
									<td height="20">&nbsp;&nbsp;&nbsp;User name:</td><td><input type="text" name="username" size="18" onkeyup="checkInputString(this,100);" onblur="checkInputString(this,100);"></td>
								</tr>
								<tr>
									<td height="20">&nbsp;&nbsp;&nbsp;Password:</td><td><input type="password" name="password" size="19" AUTOCOMPLETE="off" onkeyup="checkInputString(this,100);" onblur="checkInputString(this,100);"></td>
								</tr>
								<!--
								<tr>
									<td height="20">&nbsp;&nbsp;&nbsp;Select Division:</td><td><select><option>--Select Division--</option>
									</select></td>
								</tr>
								-->
								
								<tr>
									<td valign="top" colspan="2">
									<%	/*String strMSG="testing";

									if(!strMSG.equals(""))
									{
										out.print("<div><font color='#FF0000' size='+1'><strong>"+strMSG+"</strong></font><br><br></div>");
									}
									*/%>
									&nbsp;&nbsp;&nbsp;<strong>Please enter the string shown in the image:</strong></td></tr>
									<tr>
									<td align="center" nowrap colspan="2">
									&nbsp;&nbsp;&nbsp;<img src="Cap_Img.jsp" width="100px">
									&nbsp;&nbsp;<input type="text" name="txtShownImg" id="txtShownImg" size="10" maxlength="20" onkeyup="checkInputString(this,100);" onblur="checkInputString(this,100);">
									</td>
								</tr>
								
								
								
								<tr>
									<td></td><td align="center" style="padding-right:0px;text-decoration:none;"><input type=image src="images/login1.gif" class="textbox" value="Sign In" border=0></a></td>
								</tr>
							</table>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="recovery.jsp" style="color:#2B63CE;">Forgot Password?</a>
							<br>
							<div align=center><font face=arial size=2 color=red><% if (request.getParameter("msg")!=null){%>
								<%=formatSQLInput(request.getParameter("msg"))%>
								<%}%></font>
							</div>
						</td>
					</tr>
				</table>
			
			</td>
		</tr>
		<tr>
			<td style="color:#004488;font-family:tahoma;font-size:11px;text-align:center;border-top:1px solid gray;"><br>
				&copy; 2010. All rights reserved.<br><br>

This is the Portal of Indian Railways, developed with an objective to enable a single window access to information and services being provided by the various Indian Railways entities. The content in this Portal is the result of a collaborative effort of various Indian Railways Entities and Departments Maintained by CRIS, Ministry of Railways, Government of India. 			</td>
		</tr>
		
	</table>

</body>

</html>

</form>


<%@ include file="../dbConn/dbClose.jsp"%>
