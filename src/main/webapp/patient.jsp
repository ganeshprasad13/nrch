<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NRCH</title>
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
  </style>
</head>
<body>

<!-- Header include -->
<%@ include file="../header/header.jsp" %>

<!-- HERO SECTION -->
<section class="hero-section">
  <div class="hero-content">
    <h1>Patient Services</h1>
    <nav aria-label="breadcrumb">
      
    </nav>
  </div>
  </section>
  
<!-- MAIN CONTENT -->
<section class="container content-section">

  <div class="card-overview">
    <h2>Patient Services</h2>
    <hr>
    <div class="container py-4">

    <p class="mb-3">
        The hospital is committed to providing patient-centred care supported by efficient, hygienic, and accessible facilities that ensure comfort and convenience for all visitors. A comprehensive range of amenities has been developed within the hospital premises to enhance patient experience and support the smooth functioning of medical services.
    </p>
    <p>
        Potable drinking water and clean washroom facilities are available throughout the hospital to maintain hygiene and patient comfort. The hospital premises house two canteens that operate round the clock, providing affordable and hygienic meals to patients, attendants, and staff members at all hours. Additionally, an on-site ATM machine ensures convenience for especially out station patients so that financial transactions can be carried out conveniently without the need to leave the hospital campus.
    </p>
    <p>
        For the convenience of patient relatives, a designated Rest House has been established. It provides safe and comfortable accommodation for attendants who need to stay near their patients during ongoing treatment. 
    </p>
	<p>
        The infrastructure of the hospital is designed to be inclusive and barrier-free, featuring gentle ramps and side railings to ensure ease of movement for trolleys, stretchers, and wheelchair-bound patients.
    </p>
    <p>
        Trained health attendants and Safai Mitras provide round-the-clock services to maintain cleanliness, support patient transport, and assist in various non-clinical aspects of patient care. Their contribution ensures a clean, organized, and patient-friendly environment across all hospital sections.
    </p>
	<p>
        Recognizing the needs of the elderly, the hospital operates a dedicated Senior Citizen OPD that caters exclusively to retired individuals and senior citizens. This specialized facility includes a separate blood collection unit and pharmacy, located conveniently within the senior citizen OPD premises to minimize movement and waiting time for elderly patients.
    </p>
    <p>
        In addition, emergency diagnostic support is available adjacent to the casualty area, including 24-hour emergency laboratory and X-ray facilities, enabling rapid investigation and immediate medical intervention.
    </p>

    <p class="mt-4">
        Through these well-integrated patient welfare facilities, the hospital strives to deliver compassionate, accessible, and efficient healthcare services that prioritize the comfort and dignity of all patients and their families.
    </p>
</div>
    
    
  </div>

</section>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Footer include -->
<%@ include file="../header/footer.jsp" %>

</body>
</html>