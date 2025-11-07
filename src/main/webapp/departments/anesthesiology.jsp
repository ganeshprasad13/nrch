<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Department of Surgery | NRCH</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f9f9f9;
      color: #333;
    }

    /* HERO SECTION */
    .hero-section {
      position: relative;
      background: url('images/Bck2.jpg') center/cover no-repeat;
      color: #fff;
      text-align: center;
      padding: 80px 15px;
      overflow: hidden;
    }

    .hero-section::before {
      content: "";
      position: absolute;
      inset: 0;
      background: url('images/Bck2.png') center/cover no-repeat;
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

    /* MAIN CONTENT AREA */
    .content-section {
      padding: 60px 15px;
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

    .card-overview p, 
    .card-overview ul {
      line-height: 1.8;
      font-size: 15px;
    }

    .card-overview ul {
      margin-left: 20px;
    }

    #ntext img {
      max-width: 100%;
      border-radius: 8px;
      margin: 15px 0;
    }
  </style>
</head>

<body>

<!-- Header include -->
<%@ include file="../header/header.jsp" %>

<!-- HERO SECTION -->
<section class="hero-section">
  <div class="hero-content">
    <h1>Department of Surgery</h1>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Surgery</li>
      </ol>
    </nav>
  </div>
  </section>
  
<!-- MAIN CONTENT -->
<section class="container content-section">

  <div class="card-overview">
    <h2>Department of Anesthesiology @ IRPGIMSR</h2>
    <hr>
    
    <div id="ntext" style="font-family:tahoma;font-size:12px; color:black;">
      <p>Anaesthesiologists are doctors, who have special training in giving drugs/other agents to prevent or relieve pain and/or provide controlled unconsciousness during surgery or other procedures. NRCH has currently four senior consultants in Anaesthesia, in addition to a large number of residents. The doctors are assisted by many well-trained nursing staff; OT assistants and other paramedical staff.</p>

      <div style="text-align:center; margin:15px 0;">
        <img src="https://nr.indianrailways.gov.in//uploads/images/1761117671516-Picture1.png" alt="Anesthesiology Image" style="max-width:100%; border-radius:8px;">
      </div>

      <p><b>Dr. Mamta Chadha</b> is Head of Department and has an experience of more than 30 years post MD. An alumni of Lady Harding Medical College, she has a special interest in Pain Management especially in acupuncture. She is also a sports enthusiast.</p>

      <p><b>Dr. A.K. Sharma</b> has headed the department of Anaesthesia at NRCH for a decade till 2023. With over 30 years of experience after postgraduation, he has a wealth of experience in all types of surgeries. His interests are patient safety and ensuring patient comfort during anaesthesia.</p>

      <p><b>Dr. Sushil Krishnan</b> is a senior consultant with over 26 years of experience after postgraduate training from IPGMER, Calcutta University. Apart from provision of anaesthesia in all types of cases, his special interests include regional blocks, acute pain relief and early recovery after anaesthesia.</p>

      <p><b>Dr. Dildeep Singh</b> is a junior consultant with over 4 years of experience after post graduate training from Delhi University. His special interests are Anaesthesia, Intensive Care and teaching. He is interested in sports and has also won many awards in cricket.</p>

      <div style="text-align:center; margin:15px 0;">
        <img src="https://nr.indianrailways.gov.in//uploads/images/1761117950687-Anaesthesia Schedule.png" alt="Anaesthesia Schedule" style="max-width:100%; border-radius:8px;">
      </div>
      
      <div align="right">
        <a href="#" class="linkn"><img src="images/top.gif" height="10" align="right" border="0"></a><br>
        <span class="font_12px" style="font-family:tahoma;color:black">
          <b>Source :</b> Northern Railways / Indian Railways Portal CMS Team Last Reviewed : 27-10-2025 &nbsp;
          <img src="images/sourceiconw.gif" alt="Source Icon">
        </span>
      </div>
    </div>
  </div>

</section>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Footer include -->
<%@ include file="../header/footer.jsp" %>

</body>
</html>