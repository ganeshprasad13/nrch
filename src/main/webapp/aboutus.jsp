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
    <h1>Introduction</h1>
    <nav aria-label="breadcrumb">
      
    </nav>
  </div>
  </section>
  
<!-- MAIN CONTENT -->
<section class="container content-section">

  <div class="card-overview">
    <h2>About Us</h2>
    <hr>
    <div class="container py-4">

    <p class="mb-3">
        With the foundation stone laid in 1955 by Shri Lal Bahadur Shastri, the then Hon&rsquo;ble Minister of Railways, and inaugurated in 1957 by Shri Babu Jagjivan Ram, the then Hon&rsquo;ble Minister of Railways, Northern Railway Central Hospital has delivered quality medical care to railway employees and their families for decades.
    </p>
    <p>
        We gained recognition from the Medical Council of India (MCI) in 1970, and further recognition came from the National Board of Examinations (NBE) in 1990, solidifying NRCH's reputation as a premier teaching hospital.
    </p>
    <p>
        As we look back on our history, we are proud of our legacy and inspired to continue our mission of providing exceptional healthcare services. 
    </p>
    <div style="text-align:center; margin:15px 0;">
        <img src="/nrch/images/aboutus1.png" style="width:100%; border-radius:8px;">
      </div>
	<p>
        NRCH features a comprehensive and modern infrastructure designed to deliver quality health services. The hospital is fully air-conditioned for patient comfort. Our hospital has been declared a Swachh Green Hospital due to its exceptional cleanliness and greenery.
    </p>
    <p>
        The Old Building consists of three floors; Eastern Wing has four floors. This building houses administrative areas, Kitchen, Radiology Department, Pathology Department, Blood Centre, and Casualty. Our 24/7, twenty-bedded Emergency Department is equipped to handle all kinds of medical emergencies. We provide round-the-clock BLS ambulances. Blood sample collection is available from 8:30 am to 1 pm & daily from various health units. Our Blood Centre operates round the clock.
    </p>
	<p>
        Newly started CT-MRI Centre on a PPP model, is on the back side of the hospital.
    </p>
    <p>
        Savera Building houses our Auditorium and Teaching Centre, equipped with a library supporting our teaching and DNB Training programs, the Physiotherapy and ENT department.
    </p>
	<div style="text-align:center; margin:15px 0;">
        <img src="/nrch/images/aboutus2.png" style="width:100%; border-radius:8px;">
      </div>
      <div style="text-align:center; margin:15px 0;">
        <img src="/nrch/images/aboutus3.png" style="width:100%; border-radius:8px;">
      </div>
      <p>
    There is a separate OPD block with blood sample collection and pharmacy. 
    </p>
    <p>
    All wards are updated to meet stringent fire safety standards. Security system with CCTV and manual surveillance.
</p>

<p>
    For patient attendants, a 20-bed rest house is available, ensuring a comfortable stay. 
    A Solar Heating Plant provides hot water throughout the hospital. A round-the-clock canteen and an Amul Parlour 
    cater to the needs of patients, attendants, and staff. Sufficient parking space is available for visitors and staff.
</p>

<p>
    Our hospital boasts 502 beds, catering to almost 13,000 indoor patients annually. 
</p>

<p>
    The state-of-the-art ICU is located on the first floor. We offer advanced diagnostic services, 
    including X-ray, USG, MRI, CT scan, and laboratory services.
</p>

<p>
    Well-equipped OTs support a variety of surgical procedures, with approximately 21,000 surgeries 
    performed yearly.
</p>

<p>
    On an average, OPD caters to around 1,800 patients daily. Our dedicated team of doctors, nurses, 
    and support staff work tirelessly to ensure the well-being and comfort of every patient.
</p>

<p>
    The Pharmacy operates from 8:30 am to 10 pm to ensure an uninterrupted supply of medications.
</p>
      <br>
      <h4>CENTRE OF ACADEMIC EXCELLENCE</h4>
      <br>
      <p>
    The hospital has established a well-structured and resource-rich learning environment to support postgraduate medical education under the Diplomate of National Board (DNB) programme, which has been successfully conducted for the last 24 years across nine specialties. The programme has consistently achieved commendable academic results, with a pass percentage exceeding 90%, and has contributed significantly to the production of scholarly work through publications in reputed national and international journals.
</p>

<p>
    The central library and departmental reading rooms serve as vital academic hubs for both faculty and postgraduate students. The main library houses an extensive collection of standard textbooks, reference materials, specialty journals, and up-to-date digital resources that cater to the needs of all departments. Access to online medical databases and e-journals ensures that students and faculty remain abreast of recent advancements in clinical research and medical practice. The reading rooms provide a quiet and conducive environment for study, equipped with comfortable seating, adequate lighting, and uninterrupted access to high-speed internet.
</p>

<p>
    Each clinical and paraclinical department also maintains an independent departmental library to facilitate specialty-specific learning. These departmental libraries are supported by dedicated seminar rooms that function both in online and offline modes, fostering active teaching-learning sessions, case discussions, and journal clubs. The seminar rooms are equipped with interactive smart screens and audio-visual aids, promoting technology-enabled education and collaborative learning.
</p>

<p>
    A newly developed, state-of-the-art conference hall located in the Samvad building further enhances the academic infrastructure. This facility was inaugurated during the visit of the Hon’ble Minister of Railways, coinciding with the launch of the Swasth Nari Sashakt Parivar Abhiyan at NRCH. The conference room is designed to host departmental and interdepartmental academic activities, guest lectures, and institutional events, strengthening the culture of continuous medical learning and professional exchange.
</p>
      <div style="text-align:center; margin:15px 0;">
        <img src="/nrch/images/aboutus4.jpg" style="width:100%; border-radius:8px;">
      </div> 
      <div style="text-align:center; margin:15px 0;">
        <img src="/nrch/images/aboutus5.png" style="width:100%; border-radius:8px;">
      </div> 
    <p class="mt-4">
        Through these comprehensive facilities, the hospital's academic environment continues to support excellence in postgraduate education, research, and clinical practice.
    </p>
</div>
    
    
  </div>

</section>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Footer include -->
<%@ include file="../header/footer.jsp" %>

</body>
</html>