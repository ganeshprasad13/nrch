<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Department of Pediatrics | NRCH</title>
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
      <h1>Department of Pediatrics</h1>
      
    </div>
  </section>

  <!-- Main Content -->
  <section class=" container content-section">
    <div class="card-overview w-100">
     

      <h2>Department of Pediatrics @ IRPGIMSR</h2>
      <hr>

      <p>
        The Comprehensive Pediatrics Unit at NRCH provides specialized care for children from birth to 14 years of age. Our team is equipped to manage a wide range of cases: from preterm newborns to children with complex cardiac diseases, hepatic failures, and challenging endocrine disorders.
      </p>

      <p>
        The Department of Pediatrics runs a daily Outpatient Department (OPD) with an average footfall of 110-130 patients per day. In addition to routine OPD services, the department operates several Specialty Clinics catering to specific pediatric and neonatal needs. These include clinics for Endocrinology, Cardiology, Nephrology, Neurology, Nutrition, Asthma, Hematology, and High-Risk Newborn follow-up, among others.
      </p>

      <p>
        These specialized services ensure comprehensive evaluation, targeted treatment, and long-term management of a wide spectrum of pediatric and neonatal disorders. The Pediatric team actively participates in school health camps conducted periodically, carrying out screening for common diseases and promoting preventive Pediatric Medicine in Railway Schools.
      </p>
        <img src="/nrch/images/pediatrics1.jpg" alt="Pediatrics Department" class="overview-img">
      

      <p>
        Beyond hospital-based care, the department actively participates in community health initiatives including: Health Awareness Programs aimed at disease prevention and health promotion; encouraging good health practices within the hospital premises as well as in the surrounding community; Pulse Polio Vaccination Drives across Railway Colonies and major railway stations of Delhi; and Mission Indradhanush catch-up vaccination drives.
      </p>

      <p>
        With a bed strength of 30, the department caters to both emergency and inpatient pediatric cases. In addition to routine medical care, surgical cases are managed in close collaboration with the surgical team to ensure optimal outcomes.
      </p>
       <img src="/nrch/images/pediatrics2.jpg" alt="Pediatric Care" class="overview-img">
      <p>
        A variety of essential procedures are regularly performed within the department, including pleural tapping, ascitic tapping, bone marrow aspiration, lumbar puncture, and central line insertion.
      </p>

     <!--  <img src="../images/pediatrics3.jpg" alt="NICU" class="overview-img"> -->

      <p>
        The Pediatric Intensive Care Unit (PICU) is equipped to manage critically ill children requiring advanced respiratory support such as High-Flow Nasal Cannula (HFNC) and mechanical ventilation. In addition, the department offers screening echocardiography and provides comprehensive management of pediatric cardiac cases referred from far-flung areas, not only within the Northern Railways system but also from other zones.
      </p>

      <p>
        Our Newborn Care Unit (NICU) is a 10-bedded, state-of-the-art facility, fully equipped to deliver world-class neonatal care. The unit is fitted with T-Piece Resuscitators for advanced neonatal resuscitation, ventilators and CPAP machines for respiratory support, phototherapy units, open care systems, and transport incubators for critically ill newborns.
      </p>
     <img src="/nrch/images/pediatrics4.jpg" alt="Pediatrics Team" class="overview-img">
      <p>
        The Special Newborn Care Unit (SNCU) routinely performs major neonatal procedures such as Exogenous Surfactant Therapy, Total Parenteral Nutrition, Exchange Transfusion, Fortified Enteral Nutrition, and Comprehensive Neonatal Screening. The unit also handles resuscitation and postnatal care of all in-house births, ensuring thermal regulation, feeding establishment, infection control, and early developmental follow-up.
      </p>
 
      <p>
        Our unit is a proud signatory of the <strong>Baby-Friendly Hospital Initiative (BFHI)</strong> and runs the <strong>Delhi Government's NEEV Program</strong>, focusing on promoting optimal newborn care and active parental involvement.
      </p>

      <p>
        The department operates a dedicated <strong>Immunization Centre</strong> that provides comprehensive vaccination services to both Railway and Non-Railway beneficiary children. All vaccines under the Universal Immunization Program (UIP) are administered safely and systematically, supported by the <strong>UWIN digital platform</strong> for tracking and reminders.
      </p>
      <img src="/nrch/images/pediatrics5.jpg" alt="Pediatrics Team" class="overview-img">
      <p>
        In addition to routine immunization, optional vaccines recommended by the Indian Academy of Pediatrics (IAP) are available for high-risk children. The centre also manages adolescent and adult vaccinations, including COVID-19 immunization drives.
      </p>

      <p>
        The Department also runs a <strong>DNB (Diplomate of National Board) Program</strong> under NBEMS, engaging in teaching and research activities.
      </p>

     

      <h2>Our Team</h2>
      <hr>

      <p><strong>Dr. Tanushree Joshi</strong> – An alumnus of G.S.V.M. Medical College, Kanpur, instrumental in establishing the accredited Special Care Newborn Unit (SNCU). Certified NRP trainer and expert in Neonatology & Developmental Pediatrics. Published 15+ research papers and contributed to the “Handbook of Neonatal Clinical Practices.”</p>

      <p><strong>Dr. Kathakali Das</strong> – Graduate of Assam Medical College, Dibrugarh. Trained in Pediatric Echocardiography, Nutrition, and Ventilation. Active in pediatric cardiac diagnosis and has authored several case reports.</p>

      <p><strong>Dr. Zeeshan Rafi</strong> – Alumnus of Aligarh Muslim University and LHMC, New Delhi. Specialist in Neonatal Critical Care, Parenteral Nutrition, and Echocardiography. Holds fellowships and certifications from NNF, Boston, and Europe; NRP trainer for NNF.</p>
       <img src="../images/pediatrics6.jpg" alt="Pediatrics Team" class="overview-img">
        <img src="../images/pediatrics7.jpg" alt="Pediatrics Team" class="overview-img">
    </div>
  </section>

  <%@ include file="/header/footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
