<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Department of Anesthesiology | NRCH</title>
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
    <h1>Department of Anesthesiology</h1>
    <nav aria-label="breadcrumb">
      
    </nav>
  </div>
  </section>
  
<!-- MAIN CONTENT -->
<section class="container content-section">

  <div class="card-overview">
    <h2>Department of Anesthesiology @ IRPGIMSR</h2>
    <hr>
    
    <div id="ntext" style="font-family:tahoma;font-size:12px; color:black;">
      <p>
	  Anaesthesiologists are doctors who have special training in giving drugs or other agents to prevent or relieve pain and/or provide controlled unconsciousness during surgery or other procedures. 
	  NRCH currently has five senior consultants in Anaesthesia, in addition to a large number of residents. The doctors are assisted by many well-trained nursing staff, OT assistants, and other paramedical staff.
	</p>

      <div style="text-align:center; margin:15px 0;">
        <img src="https://nr.indianrailways.gov.in//uploads/images/1761117671516-Picture1.png" alt="Anesthesiology Image" style="max-width:100%; border-radius:8px;">
      </div>

     <p><b>Dr. Mamta Chadha</b> is Head of Department and has an experience of more than 30 years post MD. An alumna of Lady Hardinge Medical College, she has a special interest in Pain Management, especially in acupuncture. She is also a sports enthusiast.</p>
	
	<p><b>Dr. A.K. Sharma</b> is Sr Consultant and has been Head of the Department of Anaesthesia at NRCH for nearly a decade – till 2023. An alumnus of UCMS, Delhi and PG from Safdarjung Hospital, he has over 30 years of experience after postgraduation. He has a wealth of experience in all types of surgeries. His interests are patient safety and ensuring patient comfort during anaesthesia.</p>
	
	<p><b>Dr. Sushil Krishnan</b> is a Senior Consultant with over 27 years of experience post MD (Anesth) from IPGMER, Calcutta University. Apart from the provision of anaesthesia in all types of cases, his special interests include regional blocks, acute pain relief and early recovery after anaesthesia.</p>
	
	<p><b>Dr. Rakesh Kumar</b> is a Senior Anesthesiologist with more than 25 years of experience. An alumnus of UCMS, Delhi and PG from Safdarjung Hospital, he completed his DNB from Railway Hospital. His special interest is in continuously updating knowledge and participating in all kinds of academic activities.</p>
	
	<p><b>Dr. Dildeep Singh</b> is a Junior Consultant with over 5 years of experience after postgraduate training from Army Hospital (R&R), Delhi Cantt. (Delhi University). His special interests are Anaesthesia, Intensive Care, and teaching. He is interested in sports and has also won many awards in cricket.</p>
	
	<h4>Various Activities in Department of Anesthesiology</h4>
	
	<h5>Day Care Services in Operation Theater</h5>
	<ul>
	  <li>Preoperative assessment and counseling</li>
	  <li>Minimally invasive procedures (e.g., hernia repair, cataract surgery, endoscopies)</li>
	  <li>Anesthesia: usually local or regional, sometimes conscious sedation</li>
	  <li>Pain clinic with procedures (RFA, Facet joint blocks, Root blocks, PRP, USG guided blocks)</li>
	  <li>Postoperative recovery in a designated observation area</li>
	  <li>Discharge once stable and criteria are met</li>
	  <li>Follow-up instructions and outpatient care</li>
	</ul>
	
	<h5>Inpatient Services in Operation Theater</h5>
	<ul>
	  <li>Comprehensive preoperative assessment</li>
	  <li>General anesthesia or regional anesthesia</li>
	  <li>Major or complex surgeries (e.g., oncosurgery, GI surgery, neurosurgery, VATS procedures, urological surgeries, orthopedic procedures, spine surgery, joint replacements, laparoscopic procedures, major gynecological surgeries, ENT surgeries, cochlear implant, laser surgeries)</li>
	  <li>Postoperative ICU or ward monitoring</li>
	  <li>Postoperative pain management and supportive care</li>
	  <li>Extended recovery period and rehabilitation</li>
	  <li>Discharge planning with follow-up care instructions</li>
	</ul>
	
	<p>There are seven Operation Theatres (including 3 Modular OTs) fully equipped with high-end OT tables, Anaesthesia workstations, Monitors, High-end airway management systems, Video Laryngoscopes, Fibreoptic Laryngoscopes, Ultrasound machines for anaesthesia purposes, Nerve stimulators, HFNO, Ventilators, etc.</p>
	
	<h4>Clinical and Academic Focus</h4>
	<p>Regular academic sessions like basic sciences lectures, case discussions, and journal clubs are conducted for four MD Anaesthesia trainees per year. The team also contributes actively to research and anaesthesia skill training. It provides CPR training to the medical staff of the hospital and the non-medical staff of Indian Railways.</p>
	
	<h4>Non-Operating Room Services</h4>
	<ul>
	  <li>Attending life-threatening emergencies in the casualty and ICU</li>
	  <li>Providing airway management, CPR, and other life-saving procedures like central venous catheter insertion, hemodialysis catheter insertion, etc.</li>
	</ul>

      <div style="text-align:center; margin:15px 0;">
        <img src="https://nr.indianrailways.gov.in//uploads/images/1761117950687-Anaesthesia Schedule.png" alt="Anaesthesia Schedule" style="max-width:100%; border-radius:8px;">
      </div>
      
      
    </div>
  </div>

</section>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Footer include -->
<%@ include file="../header/footer.jsp" %>

</body>
</html>