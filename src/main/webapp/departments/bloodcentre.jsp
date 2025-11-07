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
    .breadcrumb-item a {
      color: #ffd700;
      text-decoration: none;
    }
    .breadcrumb-item.active {
      color: #fff;
    }
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
    }
    .card-overview ul {
      margin-left: 20px;
    }
 .content-section img {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
  </style>
</head>
<body>
 <%@ include file="../header/header.jsp" %> 
  <!-- Hero Section -->
  <section class="hero-section">
    <div class="container hero-content">
      <h1>Blood Centre</h1>
    </div>
  </section>

  <!-- Main Content -->
  <section class="container content-section">
    <div class="card-overview w-100">
      <h2>Department of Blood Centre</h2>
      <hr>
      <div id="ViEtDeVdIvId" style="POSITION:Relative;FONT-FAMILY:Arial;FONT-SIZE:12px; BACKGROUND-COLOR:white"><div style="font-size: 12px;"><font class="font_12px" style="color:black;" face="Arial"><img src="https://nr.indianrailways.gov.in//uploads/images/1754549846939-Picture1.png"><br></font></div><div style="font-size: 12px;"><font class="font_12px" style="color:black;" face="Arial"><br></font></div><div style="">The Blood Centre at NRCH is the only dedicated Blood Centre in the Northern Railway zone, providing critical support to railway beneficiaries in need of blood transfusions. Whether for patients admitted at NRCH or those visiting Northern Railway Divisional Hospital (NRDH), our centre ensures timely and safe availability of blood and blood components.</div><div style=""><font class="font_12px" style="color:black;" face="Arial"><br></font></div><div style=""><span style="font-family: Arial;">Every donor is screened through a comprehensive protocol to ensure the highest standards of safety. Rigorous testing for transfusion-transmitted infections (TTIs) is performed on all donations, utilizing both ELISA (Inhouse) and Nucleic Acid Testing (NAT - outsourced) methods for enhanced sensitivity and reliability.</span></div><div style=""><font class="font_12px" style="color:black;" face="Arial"><br></font></div><div style=""><font class="font_12px" style="color:black;" face="Arial">We are equipped to perform advanced apheresis procedures, enabling the preparation of plasma and single donor platelets (SDP) for patients requiring specialized transfusion support.&nbsp;</font></div><div style=""><font class="font_12px" style="color:black;" face="Arial"><br></font></div><div style=""><span style="font-family: Arial;">Our centre organizes numerous voluntary blood donation camps throughout the year, fostering a culture of altruism and community participation.&nbsp;</span></div><div style=""><span style="font-family: Arial;"><br></span></div><div style=""><span style="font-family: Arial;">We are committed to ensuring that <b style="">no patient is ever denied blood due to non-availability</b>. We actively encourage healthy individuals to step forward and donate blood, as each donation has the power to save lives.</span></div><div style="font-size: 12px;"><span style="font-size: 12px; font-family: Arial;"><br></span></div><div style="font-size: 12px;"><span style="font-size: 12px; font-family: Arial;"><img src="https://nr.indianrailways.gov.in//uploads/images/1754547585870-Honble MR donating blood.png"><br></span></div><div style="font-size: 12px; text-align: center;"><span style="font-family: Arial;"><b style="">Our honorable MR, Shri Ashwini Vaishnaw Ji donating blood at Blood Centre/ NRCH</b></span></div></div>
    </div>
  </section>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <%@ include file="../header/footer.jsp" %>
</body>
</html>
