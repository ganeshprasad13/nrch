<%
	dbBean.commit();
try{
	dbBean.close();
}catch(Exception exClose){
	strErrorMessage = "There was an exception while closing database connection on page \'" + strPageUrl + "' at time '" + timeconn + "'. The error message is : " + exClose.getMessage();
	System.out.println(strErrorMessage);
}
%>