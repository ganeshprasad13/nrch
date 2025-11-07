<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Overview – Department of Pediatrics | NRCH</title>
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
      background: url('../images/Bck2.jpg') center/cover no-repeat;
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
  </style>
</head>
<body>
  <%@ include file="/header/header.jsp" %> 

  <!-- Hero Section -->
  <section class="hero-section">
    <div class="container hero-content">
      <h1>Aarogya - The Times of NRCH</h1>
      
    </div>
  </section>

  <!-- Main Content -->
  <section class=" container content-section">
    <div class="card-overview w-100">
     

      <h2>Aarogya </h2>
      <hr>
      <div id="ViEtDeVdIvId" style="POSITION:Relative;FONT-FAMILY:Arial;FONT-SIZE:12px; BACKGROUND-COLOR:white">AAROGYA VOLUME 1<br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549205834-NRCH Aarogya Volume 1 English.pdf">Aarogya Volume 1 English&nbsp;</a><br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549139803-NRCH Aarogya Volume 1 Hindi.pdf">Aarogya Volume 1 Hindi</a><br><br>AAROGYA VOLUME 2<br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549298102-NRCH Aarogya Volume 2 English.pdf">Aarogya Volume 2 English</a><br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549310455-NRCH Aarogya Volume 2 Hindi.pdf">Aarogya Volume 2 Hindi</a><br><br>AAROGYA VOLUME 3<br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549344406-NRCH Aarogya Volume 3 English.pdf">Aarogya Volume 3 English</a><br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549359250-NRCH Aarogya Volume 3 Hindi.pdf">Aarogya Volume 3 Hindi</a><br><br>AAROGYA VOLUME 4<br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549386650-NRCH Aarogya Volume 4 English.pdf">Aarogya Volume 4 English</a><br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549399480-NRCH Aarogya Volume 4 Hindi.pdf">Aarogya Volume 4 Hindi</a><br><br>AAROGYA VOLUME 5<br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549430988-NRCH Aarogya Volume 5 English.pdf">Aarogya Volume 5 English</a><br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1754549442400-NRCH Aarogya Volume 5 Hindi.pdf">Aarogya Volume 5 Hindi<br></a><br>AAROGYA VOLUME 6<br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1760070343440-NRCH Aarogya Volume 6 English.pdf" target="" title="">Aarogya Volume 6 English</a><br><a class="linkn" style="color:black" href="https://nr.indianrailways.gov.in/uploads/files/1760070365912-NRCH Aarogya Volume 6 Hindi.pdf">Aarogya Volume 6 Hindi</a><br><br><br></div>
  </div></section><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
