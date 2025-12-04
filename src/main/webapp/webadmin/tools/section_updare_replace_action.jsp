<%@ include file="../../dbConn/dbInit.jsp" %>

<%

String strreplace2 = "";
String query1 = "";

Vector getright = new Vector();
String query_right;
query_right = "select DLC_ID,DLC_DESCRIPTION from CMS_LANGUAGE_CONTENT";
dbBean.setQuery(query_right);
getright=(Vector)dbBean.go();

if(getright.size()!=0){
for(int i=0;i<getright.size();i++){

strreplace2 = dbBean.getcell(getright,1,i).replaceAll(request.getParameter("str1"),request.getParameter("str2"));

query1 = "UPDATE CMS_LANGUAGE_CONTENT set DLC_DESCRIPTION = '"+strreplace2+"'  WHERE DLC_ID =  "+dbBean.getcell(getright,0,i);
dbBean.setQuery(query1);
dbBean.go1();
out.println(dbBean.getcell(getright,0,i)+"<hr>");
}
}



Vector getright2 = new Vector();
String query_right2;
query_right2 = "select DDC_ID,DDC_DESCRIPTION from CMS_DIRECT_CONTENT";
dbBean.setQuery(query_right2);
getright2=(Vector)dbBean.go();

if(getright2.size()!=0){
for(int i2=0;i2<getright2.size();i2++){

strreplace2 = dbBean.getcell(getright2,1,i2).replaceAll(request.getParameter("str1"),request.getParameter("str2"));

query1 = "UPDATE CMS_DIRECT_CONTENT set DDC_DESCRIPTION = '"+strreplace2+"'  WHERE DDC_ID =  "+dbBean.getcell(getright2,0,i2);
dbBean.setQuery(query1);
dbBean.go1();
out.println(dbBean.getcell(getright2,0,i2)+"<hr>");
}
}


%>

<%@ include file="../../dbConn/dbClose.jsp" %>




Ok Done.