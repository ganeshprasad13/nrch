<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Indian Railway Post Graduate Institute of Medical Sciences and Research</title>
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
      padding: 80px 15px;
      overflow: hidden;
    }

    /* Blur effect layer */
    .hero-section::before {
      content: "";
      position: absolute;
      inset: 0;
      background: url('images/Bck2.png') center/cover no-repeat;
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
      color: #ffd700;
      text-decoration: none;
    }

    .breadcrumb-item.active {
      color: #fff;
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
/* Vision Section */
.vision-wrapper {
  display: flex;
  justify-content: center;
  margin: 40px auto;
}

.vision-box {
  background: #ffffff;
  border-left: 6px solid #0056a3;
  border-radius: 8px;
  padding: 40px 30px;
  max-width: 900px;
  width: 100%;
  box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
  transition: 0.3s ease-in-out;
}

.vision-title {
  text-align: center;
  font-size: 2rem;
  font-weight: 700;
  color: #0056a3;
  margin-bottom: 20px;
  letter-spacing: 1px;
  text-transform: uppercase;
}

.vision-text {
  font-size: 1.2rem;
  line-height: 1.9;
  color: #444;
  text-align: center;
  padding: 10px;
  font-weight: 500;
}

.vision-box:hover {
  transform: translateY(-4px);
  box-shadow: 0 6px 25px rgba(0,0,0,0.12);
}

  </style>
</head>

<body>
  <%@ include file="/header/header.jsp" %> 

  <!-- Hero Section -->
  <section class="hero-section">
    <div class="container hero-content">
      <h1>Vision & Mission</h1>
      
    </div>
  </section>

  <!-- Main Content -->
 <section class=" container content-section">
    <div class="card-overview w-100">
     

     <div class="vision-wrapper">
  <div class="vision-box">
    <div class="vision-title">Our Vision & Mission</div>
    <div class="vision-text">
      Total Patient Satisfaction <br>
      Through Humane Approach & Shared Commitment of <br>
      Every Single Doctor and Paramedic <br>
      to Provide Quality Health Care <br>
      Using Modern & Cost-Effective <br>
      Techniques & Technologies.
    </div>
  </div>
</div>

 </div>
  </section>

  <%@ include file="/header/footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
