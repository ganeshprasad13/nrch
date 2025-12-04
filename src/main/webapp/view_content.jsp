<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentId = "";
try {
    Integer.parseInt(request.getParameter("contentid"));
    contentId = request.getParameter("contentid");
} catch (NumberFormatException e) {
   	response.sendRedirect("/nrch/index.jsp");
   	return;
} %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IRPGIMSR | NRCH</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f9f9f9;
      color: #333;
    }

    /* Hero Section */
    .hero-section {
      position: relative;
      background: url('/nrch/images/Bck2.jpg') center/cover no-repeat;
      color: #fff;
      text-align: center;
      padding: 60px 15px;
      overflow: hidden;
    }

    /* Blur effect layer */
    .hero-section::before {
      content: "";
      position: absolute;
      inset: 0;
      background: url('/nrch/images/Bck2.png') center/cover no-repeat;
      filter: blur(6px);
      transform: scale(1.1);
      z-index: 0;
    }

    /* Semi-transparent overlay for better contrast */
    .hero-section::after {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0, 64, 128, 0.5);
      z-index: 1;
    }

    .hero-content {
      position: relative;
      z-index: 2;
    }

    .hero-section h1 {
      font-size: 2.5rem;
      font-weight: bold;
      margin-bottom: 15px;
    }

    .breadcrumb {
      background: transparent;
      justify-content: center;
      margin-bottom: 0;
    }

    .breadcrumb-item a {
      font-style: italic;
    color: #ffffff;      /* normal color */
    text-decoration: none;
    transition: color 0.2s ease;
    }
    .breadcrumb-item a:hover {
    color: #ffd700;      /* on hover → white */
    text-decoration: none;
}
  

    .breadcrumb-item.active {
      font-style:italic;
      font-weight: bold;
      color: #ffd700;
    }
	
	
	/* Change default ">" to "/" */
	.breadcrumb-item + .breadcrumb-item::before {
	    content: ">" !important;
	    color: #ffffff !important;
	}
    /* Content Section */
    .content-section {
      padding: 25px 15px;
      display: flex;
      justify-content: center;
    }

    .card-overview {
      
      background: #fff;
      border: none;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      padding: 40px;
    }

    .card-overview h2 {
      color: #004080;
      font-weight: 600;
      margin-bottom: 20px;
    }

    .card-overview hr {
      width: 80px;
      height: 3px;
      background: #004080;
      border: none;
      opacity: 1;
      margin-bottom: 25px;
    }

    .card-overview p, .card-overview ul {
      line-height: 1.8;
      text-align: justify;
    }

    .card-overview ul {
      margin-left: 20px;
    }

    .overview-img {
      width: 100%;
      border-radius: 10px;
      margin-bottom: 20px;
    }
    .content-section img {
  display: block;
  margin-left: auto;
  margin-right: auto;

}
  </style>
</head>
<body>

<!-- Header include -->
<%@ include file="../header/header.jsp" %>
<%
String queryContent = "SELECT DSM_ID,DSM_PARENT,DSM_PATH,DSM_PRIORITY,DLC_LABEL,DLC_DESCRIPTION FROM "+
"(SELECT DSM_ID,DSM_PARENT, DSM_PATH, DSM_PRIORITY,DSM_STATUS FROM cms_section_management WHERE DSM_ID=? AND DSM_STATUS=1) as management "+
"INNER JOIN "+
"(SELECT DLC_DSM_ID, DLC_LABEL,DLC_DESCRIPTION FROM cms_language_content) as content  "+
"ON management.DSM_ID = content.DLC_DSM_ID";
PreparedStatement psContent = cn.prepareStatement(queryContent);
psContent.setString(1, contentId);
ResultSet rsContent = psContent.executeQuery();
if(rsContent.next()&&rsContent.getString("DLC_DESCRIPTION")!=null&&!rsContent.getString("DLC_DESCRIPTION").trim().equals("")){
	String pathIds[] = rsContent.getString("DSM_PATH").split(",");
	String query_level = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
	query_level = query_level + " WHERE DSM_ID in ( ";
	for(int i=0;i<pathIds.length;i++){
		if(i==0){
			query_level = query_level + " ? ";	
		}else{
			query_level = query_level + " ,? ";
		}
	}
	query_level = query_level + " ) AND DSM_ID = DLC_DSM_ID AND DLC_LANG_ID =0";
	query_level = query_level + " ORDER BY DSM_PATH";

	PreparedStatement ps_level=cn.prepareStatement(query_level);
	for(int i=0;i<pathIds.length;i++){
		ps_level.setString(i+1,pathIds[i]);	
	}

	ResultSet rs_level=ps_level.executeQuery();
%>
<!-- HERO SECTION -->
<section class="hero-section">
  <div class="hero-content">
    <h1><%=rsContent.getString("DLC_LABEL") %></h1>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/nrch/index.jsp">Home</a></li>
        <%while(rs_level.next()) { %>
        	<li class="breadcrumb-item"><a href="view_content.jsp?contentid=<%=rs_level.getString("DSM_ID") %>"><%=rs_level.getString("DLC_LABEL") %></a></li>
        <%} %>
    </ol>
    </nav>
  </div>
  </section>
  
<!-- MAIN CONTENT -->
<section class="container content-section">

  <div class="card-overview">
    <%=rsContent.getString("DLC_DESCRIPTION") %>
  </div>

</section>
<%}else{ %>
<style>

body {
      background-color: #fff5e6;
      font-family: Arial, sans-serif;
      margin: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    /* Make sure content area fills space between header and footer */
    main {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .message-box {
      text-align: center;
    }
</style>
<main>
    <div class="message-box">
      <h1>🚧 No Data Available</h1>
      <p class="mt-3">This section is currently under development. Please check back soon.</p>
    </div>
  </main>
<%} %>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Footer include -->
<%@ include file="../header/footer.jsp" %>

</body>
</html>