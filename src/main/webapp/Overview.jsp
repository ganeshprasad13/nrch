<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Overview | NRCH</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f9f9f9;
      color: #333;
    }
   .hero-section {
  position: relative;
  background: url('images/Bck2.jpg') center/cover no-repeat;
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
    .content-section {
      padding: 60px 15px;
      display: flex;
      justify-content: center;
    }
    .card-overview {
      max-width: 900px;
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
    }
    .card-overview ul {
      margin-left: 20px;
    }

  </style>
</head>
<body>
 <%@ include file="header/header.jsp" %> 
  <!-- Hero Section -->
  <section class="hero-section">
    <div class="container hero-content">
      <h1>Overview : Child Development Centre (CDC)</h1>
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-center">
          
          <li class="breadcrumb-item"><a href="#">College</a></li>
          <li class="breadcrumb-item active" aria-current="page">Overview</li>
        </ol>
      </nav>
    </div>
  </section>

  <!-- Main Content -->
  <section class="content-section">
    <div class="card-overview">
      <h2>Overview</h2>
      <hr>
      <p>
        Established in 1958, Maulana Azad Medical College (MAMC) is a premier institution of medical education and research in India. It is affiliated with the University of Delhi and recognised by the Medical Council of India (MCI).  
      </p>
      <p>
        Spread across a large campus and backed by state-of-the-art hospitals, MAMC offers undergraduate, postgraduate and super-specialty courses. It is staffed by highly qualified faculty and hosts major teaching hospitals and research centres.  
      </p>
      <p>
        The institution’s mission is to deliver high-quality healthcare, train tomorrow’s medical professionals, and pursue meaningful research for the benefit of society.
      </p>
      <ul>
        <li>Established – 1958</li>
        <li>Affiliated to – University of Delhi</li>
        <li>Recognised by – MCI</li>
        <li>Mode – Undergraduate, Postgraduate, Super-specialty</li>
      </ul>
      <p>
        Through collaborations with premier hospitals and departments, MAMC continues to build upon its legacy of excellence in medical education, patient care and community service.
      </p>
    </div>
  </section>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <%@ include file="header/footer.jsp" %>
</body>
</html>
