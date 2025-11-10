<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Kumbh Gallery | NRCH</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8f9fa;
      color: #333;
    }

    /* Hero Section */
    .hero-section {
      position: relative;
      background: url('../images/Bck2.jpg') center/cover no-repeat;
      color: #fff;
      text-align: center;
      padding: 80px 15px;
      overflow: hidden;
    }

    .hero-section::before {
      content: "";
      position: absolute;
      inset: 0;
      background: url('../images/Bck2.jpg') center/cover no-repeat;
      filter: blur(6px);
      transform: scale(1.1);
      z-index: 0;
    }

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
      margin-bottom: 10px;
    }

    /* Gallery Section */
    .gallery-section {
      padding: 60px 15px;
    }

    .gallery-section h2 {
      color: #004080;
      text-align: center;
      margin-bottom: 40px;
      font-weight: 600;
    }

    .gallery-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
    }

    .gallery-item {
      position: relative;
      overflow: hidden;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      transition: transform 0.4s ease, box-shadow 0.3s ease;
      background-color: #fff;
    }

    .gallery-item img {
      width: 100%;
      height: 220px;
      object-fit: cover;
      transition: transform 0.5s ease;
      border-radius: 12px;
    }

    .gallery-item:hover img {
      transform: scale(1.1);
    }

    .gallery-item:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    }

    .gallery-item::after {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0, 64, 128, 0.2);
      opacity: 0;
      transition: opacity 0.3s ease;
      border-radius: 12px;
    }

    .gallery-item:hover::after {
      opacity: 1;
    }

  </style>
</head>
<body>

<!-- Header -->
<%@ include file="../header/header.jsp" %>

<!-- HERO SECTION -->
<section class="hero-section">
  <div class="hero-content">
    <h1>Kumbh@NRCH</h1>
  </div>
</section>

<!-- GALLERY SECTION -->
<section class="container gallery-section">
  <h2>Memorable Moments at Kumbh</h2>
  <div class="gallery-grid">
    <% for(int i = 1; i <= 13; i++) { %>
      <div class="gallery-item">
        <img src="images/kumbh/Picture<%=i%>.png" 
             onerror="this.onerror=null;this.src='images/kumbh/Picture<%=i%>.jpg';" 
             alt="Kumbh Image <%=i%>">
      </div>
    <% } %>
  </div>
</section>

<!-- Footer -->
<%@ include file="../header/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
