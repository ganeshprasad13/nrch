<%@ include file="dbsettings.jsp"%><%@ page import="com.ideActive.dbUtils.*"%>
<jsp:useBean id="dbBean" class="com.ideActive.dbUtils.JDBCBean" scope="page">	
</jsp:useBean>
<jsp:useBean id="dataFormatter" class="com.ideActive.utils.DataFormatter" scope="page">	
</jsp:useBean>

<%
	dbBean.setClassname(JDBC_DRIVER);
	dbBean.setUrl(JDBC_URL);
	Connection cn;
	Connection cn1;
     Class.forName("com.mysql.jdbc.Driver"); 

	 cn= DriverManager.getConnection("jdbc:mysql://10.64.29.248:3306/cris-nrch?useUnicode=yes&characterEncoding=UTF-8","mysql", "03Knight1z991@"); 
	String profile_user = "" ;
	String profile_actionby = "";
	String profile_info = "";
	String profile_type = ""; 
	String profile_more = "";
	String updateprofile = "";
	
	String strPageUrl = request.getRequestURL().toString();
	String strErrorMessage ="";
	
	if ( request.getQueryString() != null){
		strPageUrl = strPageUrl + "?" + request.getQueryString();
	}
	
	try{
		dbBean.connect();
		dbBean.setAutoCommit(false);
	}catch(Exception e){
		out.print("Inside error<hr>"+e);
		strErrorMessage = "There was an exception while opening database connection on page \'" + strPageUrl + "' at time '" + timeconn + "'. The error message is : " + e.getMessage();
		System.out.println(strErrorMessage);
		//out.println(strErrorMessage);
	}
	
	Vector rsGetTitle = new Vector();
	String strGetUserQueryTitle = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=4 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID limit 0,1";
	String Title = "";
	dbBean.setQuery(strGetUserQueryTitle);
	rsGetTitle = (Vector)dbBean.go();
	if(rsGetTitle.size()>0){ 
		Title = dbBean.getcell(rsGetTitle,0,0); 
	} 
	
	strGetUserQueryTitle = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=13 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID limit 0,1";
	String TitleH = "";
	dbBean.setQuery(strGetUserQueryTitle);
	rsGetTitle = (Vector)dbBean.go();
	if(rsGetTitle.size()>0){ 
		TitleH = dbBean.getcell(rsGetTitle,0,0); 
	} 
	if(request.getParameter("lang") != null && !request.getParameter("lang").equals("")){
		if(request.getParameter("lang").equals("1")){
			Title = TitleH ;
		}
	}
%>
