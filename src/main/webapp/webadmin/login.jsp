<%@ include file="header_admin.jsp" %>
<%@ include file="../database/dbinit.jsp" %>
<html><head><title>JSP Checks Login Against Parameters</title></head><body><%@ page errorPage="badLogin.jsp"%> <h1>Hello</h1>
<form action='loginCheck.jsp' method="post"  name="login" onsubmit="return chkFrm()">

Username:<input type=text name=usernameFormParam<br>
password:<input type=text name=passwordFormParam<br>
<input type=submit value=Login>
</form>
</body>
</body></html>

<%@ include file="footer_admin.htm" %>

