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

<!-- Header include -->
<%@ include file="../header/header.jsp" %>

<!-- HERO SECTION -->
<section class="hero-section">
  <div class="hero-content">
    <h1>Department of Surgery</h1>
    <nav aria-label="breadcrumb">
      
    </nav>
  </div>
  </section>

<!-- MAIN CONTENT -->
<section class="container content-section">
  <div class="card-overview w-100">
    <h2>Department of Orthopaedics @ IRPGIMSR</h2>
    <hr>

    <div id="ntext">
      <p>
        The Department of <strong>Orthopaedics</strong> stands as a center of excellence under the dynamic leadership of <span style="color:#EF48C9;"><strong>Dr. Rushama Tandon</strong></span>, supported by a highly skilled team, including <span style="color:#EF48C9;"><strong>Dr. Surya Prakash Sharma</strong></span> and <span style="color:#EF48C9;"><strong>Dr. Ashutosh Kapoor</strong></span>. With six DNB residents, four senior residents, and one junior resident, the department fosters an environment of academic rigor and clinical innovation.
      </p>

      <p>
        The Department of <strong>Orthopaedics</strong> at NRCH offers a comprehensive spectrum of orthopedic care, supported by a state-of-the-art <span style="color:#EF48C9;"><strong>Physiotherapy Center</strong></span> and <span style="color:#EF48C9;"><strong>Artificial Limb Centre</strong></span> to ensure holistic rehabilitation. The department specializes in spine surgeries, including disc prolapse, spinal tuberculosis, deformities, tumors, and degenerative disorders.
      </p>

      <p>
        The <span style="color:#EF48C9;"><strong>Arthroplasty Unit</strong></span> performs primary and revision total hip and knee replacements, integrating cutting-edge implant technologies and advanced surgical techniques. Equipped with a 3D C-arm, neuro-monitoring systems, navigation-assisted spine surgery, and a spine endoscopy system, NRCH serves as a referral center for North and East India.
      </p>

      <p>
        The department offers a comprehensive range of <strong>Spine Surgeries</strong>, from endoscopic and minimally invasive procedures to complex deformity corrections. At the forefront of arthroscopy and sports medicine, it excels in managing ligament injuries of the knee and shoulder.
      </p>

      <p>
        The department also provides <span style="color:#EF48C9;"><strong>Comprehensive Trauma Care</strong></span>, treating simple fractures to complex polytrauma. Advanced intraoperative imaging and fixation technologies ensure precise interventions and faster recovery.
      </p>

      <p>
        Expertise extends to deformity correction using modern methods like <strong>Ilizarov</strong> fixators, LRS, & hexapod systems. Regenerative Medicine with PRP & BMAC is applied for cartilage restoration, tendon repair, nonunion fractures, and avascular necrosis.
      </p>

      <p>
        <img src="https://nr.indianrailways.gov.in//uploads/images/1761041607469-Picture1.png" class="img-fluid rounded my-3">
      </p>

      <p>
        The <span style="color:#EF48C9;"><strong>Trauma Surgery Unit</strong></span> delivers rapid, life-saving interventions with precision. 24/7 readiness ensures a cornerstone of emergency orthopedic care.
      </p>

      <p>
        Committed to excellence, the department minimizes referrals to private centers and serves as a regional referral hub. The <u>Artificial Limbs Centre</u> (est. 1984) provides prosthetic and orthotic services. The <u>Physiotherapy Department</u> restores mobility and quality of life through advanced techniques, with satellite centers at S.P. Marg and Noida Health Unit.
      </p>

      <p>
        <img src="https://nr.indianrailways.gov.in//uploads/images/1761042187670-Untitled design (1).png" class="img-fluid rounded my-3">
      </p>

      <p>
        With a strong foundation in clinical excellence, technological innovation, & academic mentorship, the Department of <strong>Orthopaedics</strong> at NRCH enhances mobility, alleviates pain, and restores quality of life.
      </p>

      <p>
        <span style="color:#EF48C9;"><strong>Dr. Rushama Tandon</strong></span> is a highly experienced spine surgeon with over 30 years of expertise. <span style="color:#EF48C9;"><strong>Dr. Surya Prakash Sharma</strong></span> specializes in sports medicine and joint arthroplasty. <span style="color:#EF48C9;"><strong>Dr. Ashutosh Kapoor</strong></span> focuses on spine surgery, trauma, and joint arthroplasty.
      </p>

      <p>
        <img src="https://nr.indianrailways.gov.in//uploads/images/1731923547659-Orthopaedics Schedule.png" class="img-fluid rounded my-3">
      </p>

     
    </div>
  </div>
</section>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Footer include -->
<%@ include file="../header/footer.jsp" %>

</body>
</html>