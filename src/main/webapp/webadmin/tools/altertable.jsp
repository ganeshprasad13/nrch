<%@ include file="../../dbConn/dbInit.jsp" %>

<%

String query1 = "alter table [dbo].[CMS_SECTION_MANAGEMENT] add  [DSM_QUICK_LINK][int]";
dbBean.setQuery(query1);
dbBean.go1();

String query2 = "UPDATE    CMS_SECTION_MANAGEMENT SET  DSM_QUICK_LINK = 1 WHERE  (DSM_ID IN (1, 203, 3, 8, 5, 4, 9, 10, 16, 17))";
dbBean.setQuery(query2);
dbBean.go1();

%>

<%@ include file="../../dbConn/dbClose.jsp" %>




Ok Done.