<%@ include file="../../dbConn/dbInit.jsp" %>
<%
	String id=request.getParameter("id");
	if(!id.equals("")){
	String strQuery = "SELECT DAU_LOGIN FROM CMS_ADMIN_USER WHERE  DAU_LOGIN='"+id+"' ";
	//out.println(strQuery);
	dbBean.setQuery(strQuery);
	Vector getinfo = new Vector();
	getinfo = (Vector)dbBean.go();
	
	if(getinfo.size()>0){
		out.print("This username is not Available !!!");
	}
	else{
		out.print("This username is Available !!!");
	}
	}else {
		out.print("This username is not Available !!!");
	}
%>

<%@ include file="../../dbConn/dbClose.jsp" %>
