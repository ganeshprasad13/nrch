<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>No Data Available</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #fff5e6;
      color: #cc6600;
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
</head>

<body>
  <%@ include file="header/header.jsp" %>

  <main>
    <div class="message-box">
      <h1>🚧 No Data Available</h1>
      <p class="mt-3">This section is currently under development. Please check back soon.</p>
    </div>
  </main>

  <%@ include file="header/footer.jsp" %>
</body>
</html>
