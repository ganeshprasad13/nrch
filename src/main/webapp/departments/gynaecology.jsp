<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Overview â Department of Pediatrics | NRCH</title>
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

  <h2>Department of Obstetrics & Gynaecology @ IRPGIMSR</h2>
  <hr>

  <div id="ntext">

    <p>The Department of Obstetrics and <strong>Gynaecology</strong> at NRCH is dedicated to providing round-the-clock advanced antenatal and gynaecological services through a team of experienced doctors.</p>

    <p>Outpatient services are available six days a week, offering comprehensive care in various domains. A variety of OPD-based procedures are performed, including Copper-T and Mirena insertions, hysterosalpingography, Pap smear and HPV testing, cervical cancer vaccination, endometrial aspiration, and cervical biopsies.</p>

    <img src="https://nr.indianrailways.gov.in//uploads/images/1761040593604-Picture6.png" class="img-fluid rounded">

    <p>Antenatal services include routine checkups, management of high-risk pregnancies, obstetric ultrasounds (except NT and Level-2 scans), preconception counselling, dietary guidance, and counselling regarding breastfeeding and contraception.</p>

    <p>The <strong>labour room</strong> at NRCH is a well-equipped three-bedded unit with CTG monitoring, multipara monitors, and facilities for instrumental deliveries using vacuum and forceps.</p>

    <p>The department also provides a wide range of <strong>gynaecological services</strong>, including management of abnormal uterine bleeding, transvaginal sonography, infertility evaluation and management with ovulation induction, intrauterine insemination, and follicular monitoring.</p>

    <p>Operative facilities include minor surgeries such as dilatation and curettage, endometrial aspiration, Bartholin cyst procedures, cervical and endometrial biopsies, and <strong>transobturator tape repair</strong> for stress urinary incontinence.</p>

    <img src="https://nr.indianrailways.gov.in//uploads/images/1761040560509-Picture7.png" class="img-fluid rounded">

    <h5 class="mt-4 text-primary fw-bold">Dr. Anita Bansal</h5>
    <p>Chief Gynecologist at NRCH. An alumnus of MAMC, she completed MBBS, DGO, and DNB at NRCH. She has made significant contributions to gynecology and laparoscopic surgery and served as a trainer at Karl Storz Laparoscopic Training Centre. She also chaired the DACC, Central Delhi (2020–2023).</p>

    <h5 class="mt-4 text-primary fw-bold">Dr. Anita Chandrayan</h5>
    <p>MBBS from Patliputra Medical College, DGO from MGM Jamshedpur, DNB from NRCH. She has 19 years of experience in Railways healthcare and is a lifelong member of AOGD, FOGSI, and HSI.</p>

    <h5 class="mt-4 text-primary fw-bold">Dr. Shuchi Sharma</h5>
    <p>18 years of experience in Obstetrics & Gynecology. MBBS from GSVM Kanpur and MS from SNMC Agra. Special interest in ultrasound, fetal medicine, oncology, minimal access surgery, and infertility.</p>

    <h5 class="mt-4 text-primary fw-bold">Dr. Neeti Nisha</h5>
    <p>Graduated from Jamnagar, MS & DNB from RNTMC (2017), Senior Residency from LHMC, and Fellowship in Obstetrics USG. Known for compassionate patient care and expertise in high-risk pregnancies.</p>

    <h5 class="mt-4 text-primary fw-bold">Dr. Dipali Maurya</h5>
    <p>MBBS from VSS Medical College, MS from SMS Medical College (2021). Experience across Surya Hospital Jaipur & Central Hospital Hubli. Special focus on Preventive Oncology and Minimal Access Surgery.</p>

    <img src="https://nr.indianrailways.gov.in//uploads/images/1754473008224-ObG%20Schedule.png" class="img-fluid rounded mt-4">

   

  </div>
</div>


</section>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Footer include -->
<%@ include file="../header/footer.jsp" %>

</body>
</html>