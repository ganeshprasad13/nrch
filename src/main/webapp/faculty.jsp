	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Faculty | NRCH</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #f9f9f9;
  color: #333;
}

/* -----------------------------------------------------------
   HERO SECTION
------------------------------------------------------------ */
.hero-section {
  position: relative;
  background: url('../images/Bck2.jpg') center/cover no-repeat;
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

/* -----------------------------------------------------------
   CIRCULAR LINK SECTION
------------------------------------------------------------ */

.circular-links {
  background-color: #e8f4ff;
  border-top: 2px solid #cfe7ff;
  border-bottom: 2px solid #cfe7ff;
}

.circle-link {
  text-decoration: none;
  color: #003366;
  display: inline-block;
  transition: transform 0.3s ease, color 0.3s ease;
}




/* -----------------------------------------------------------
   FACULTY TABLE
------------------------------------------------------------ */

#faculty-section {
  padding: 40px 0;
  display: none;
}

.faculty-card {
  background: #fff;
  padding: 25px;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.faculty-title {
  color: #004080;
  font-weight: 700;
  text-align: center;
  margin-bottom: 20px;
}

.faculty-table {
  width: 100%;
  border-collapse: collapse;
}

.faculty-table thead {
  background: #004080;
  color: #fff;
}

.faculty-table th,
.faculty-table td {
  padding: 12px 16px;
  border-bottom: 1px solid #e1e5ee;
}

.faculty-table tr:hover {
  background: #f2f6ff;
}
/* ACTIVE DEPARTMENT */
.circle-link.dept-active img {
  transform: scale(1.15);
  border-color: #003399 !important;
  box-shadow: 0 0 15px rgba(0, 64, 128, 0.6);
  background
}

.circle-link.dept-active p {
  color: #003399;
  font-weight: 700;
}

.circle-link.dept-active {
  transform: translateY(-5px);
}




/* Horizontal scroll container */
/* DESKTOP — exactly 6 equally spaced departments */
.dept-scroll {
  display: flex;
  grid-template-columns: repeat(6, 1fr);
  gap: 30px;
  
  overflow-x: auto;
  scroll-behavior: smooth;
  
  padding: 20px;   /* remove left/right padding here */
  margin: 0 40px;    /* create space from arrows */
  
  scrollbar-width: none;
}
.dept-scroll::-webkit-scrollbar {
  display: none;
}
.scroll-btn {
  z-index: 30;      /* stays above everything */
}
/* Center each item inside */
.circle-link {
  text-decoration: none;
  display: flex;
  justify-content: center;
}

/* Circle styling */
.circle-bg {
  width: 130px;
  height: 130px;
  border-radius: 50%;
  border: 3px solid #004080;
  background: #004080;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  transition: 0.3s;
  position: relative;
  overflow: hidden;
}

.circle-bg::before {
  content: "";
  position: absolute;
  top: 5%;
  left: 5%;
  width: 90%;
  height: 40%;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.35);
  filter: blur(6px);
}

.circle-bg span {
  color: #fff;
  font-size: 14px;
  font-weight: 700;
  text-align: center;
  z-index: 2;
}

/* Hover */
.circle-link:hover .circle-bg {
  transform: scale(1.1);
}

/* Active Department */
.circle-link.dept-active .circle-bg {
  transform: scale(1.15);
  border-color: #003399 !important;
  background:white;
  box-shadow: 0 0 15px rgba(0,64,128,0.6);
}

.circle-link.dept-active span {
  color: #003399;
  font-weight: 800;
}

/* Scroll Buttons */
.scroll-btn {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: #004080;
  color: white;
  border: none;
  padding: 8px 12px;
  border-radius: 50%;
  font-size: 22px;
  cursor: pointer;
  z-index: 20;
  box-shadow: 0 3px 8px rgba(0,0,0,0.25);
  transition: 0.3s;
}

.scroll-btn.left { left: 5px; }
.scroll-btn.right { right: 5px; }

.scroll-btn:hover {
  background: #002f5e;
}

/* 🌟 MOBILE — show only 1 department at a time */
@media (max-width: 576px) {

  .dept-scroll {
    justify-content: flex-start;
    scroll-snap-type: x mandatory;     /* snap slider */
  }

  .circle-link {
    scroll-snap-align: center;
    min-width: 100%;                   /* show only one card */
    display: flex;
    justify-content: center;
  }

  .circle-bg {
    width: 160px;
    height: 160px;
  }

  .scroll-btn.left,
  .scroll-btn.right {
    top: 42%;
  }
}
.circular-links .container {
  padding-left: 70px;
  padding-right: 70px;
}
.dept-scroll > a:first-child {
  margin-left: 10px;
}
.dept-scroll > a:last-child {
  margin-right: 10px;
}
img{
width: 100%;
}
.table-heading th {
    background-color: #004080 !important;
    color: #fff !important;
}
.faculty-table tbody tr td {
    font-size: 20px !important;
}
.faculty-table th,
.faculty-table td {
    vertical-align: middle !important;
    font-size: 1rem !important;
}
</style>
</head>

<body>

<%@ include file="/header/header.jsp" %>


<!-- -----------------------------------------------------------
     CIRCULAR DEPARTMENT LINKS
------------------------------------------------------------ -->

<section class="circular-links">
  <div class="container position-relative">

    <!-- Left Arrow -->
    <button class="scroll-btn left" id="scrollLeft">
      &#10094;
    </button>

    <!-- Scrollable Department List -->
<div class="dept-scroll" id="deptScroll">

    <a href="#" id="dept-anaesthesia" class="circle-link dept-btn dept-active" data-dept="Anaesthesia">
        <div class="circle-bg"><span>Anaesthesia</span></div>
    </a>

    <a href="#" id="dept-casualty" class="circle-link dept-btn" data-dept="Casualty">
        <div class="circle-bg"><span>Casualty</span></div>
    </a>

    <a href="#" id="dept-dentalsurgery" class="circle-link dept-btn" data-dept="Dental Surgery">
        <div class="circle-bg"><span>Dental Surgery</span></div>
    </a>

    <a href="#" id="dept-dermatology" class="circle-link dept-btn" data-dept="Dermatology">
        <div class="circle-bg"><span>Dermatology</span></div>
    </a>

    <a href="#" id="dept-ent" class="circle-link dept-btn" data-dept="ENT">
        <div class="circle-bg"><span>ENT</span></div>
    </a>

    <a href="#" id="dept-eye" class="circle-link dept-btn" data-dept="Eye">
        <div class="circle-bg"><span>Eye</span></div>
    </a>

    <a href="#" id="dept-generaladmin" class="circle-link dept-btn" data-dept="General Administration">
        <div class="circle-bg"><span>General Administration</span></div>
    </a>

    <a href="#" id="dept-geriatric" class="circle-link dept-btn" data-dept="Geriatric Services">
        <div class="circle-bg"><span>Geriatric Services</span></div>
    </a>

    <a href="#" id="dept-healthunit" class="circle-link dept-btn" data-dept="Health Unit">
        <div class="circle-bg"><span>Health Unit</span></div>
    </a>

    <a href="#" id="dept-medicine" class="circle-link dept-btn" data-dept="Medicine">
        <div class="circle-bg"><span>Medicine</span></div>
    </a>

    <a href="#" id="dept-microbiology" class="circle-link dept-btn" data-dept="Microbiology">
        <div class="circle-bg"><span>Microbiology</span></div>
    </a>

    <a href="#" id="dept-obgyn" class="circle-link dept-btn" data-dept="Obstetrics & Gynaecology">
        <div class="circle-bg"><span>Obstetrics & Gynaecology</span></div>
    </a>

	<a href="#" id="dept-oncology" class="circle-link dept-btn" data-dept="Oncology">
        <div class="circle-bg"><span>Oncology</span></div>
    </a>
    
    <a href="#" id="dept-orthopaedics" class="circle-link dept-btn" data-dept="Orthopaedics">
        <div class="circle-bg"><span>Orthopaedics</span></div>
    </a>

    <a href="#" id="dept-paediatrics" class="circle-link dept-btn" data-dept="Paediatrics">
        <div class="circle-bg"><span>Paediatrics</span></div>
    </a>

    <a href="#" id="dept-pathblood" class="circle-link dept-btn" data-dept="Pathology & Blood Centre">
        <div class="circle-bg"><span>Pathology & Blood Centre</span></div>
    </a>

    <a href="#" id="dept-pathology" class="circle-link dept-btn" data-dept="Pathology">
        <div class="circle-bg"><span>Pathology</span></div>
    </a>

    <a href="#" id="dept-psychiatry" class="circle-link dept-btn" data-dept="Psychiatry">
        <div class="circle-bg"><span>Psychiatry</span></div>
    </a>

    <a href="#" id="dept-radiodiagnosis" class="circle-link dept-btn" data-dept="Radiodiagnosis">
        <div class="circle-bg"><span>Radiodiagnosis</span></div>
    </a>

    <a href="#" id="dept-surgery" class="circle-link dept-btn" data-dept="Surgery">
        <div class="circle-bg"><span>Surgery</span></div>
    </a>

</div>


    <!-- Right Arrow -->
    <button class="scroll-btn right" id="scrollRight">
      &#10095;
    </button>

  </div>
</section>




<!-- -----------------------------------------------------------
     FACULTY TABLE SECTION (DYNAMIC)
------------------------------------------------------------ -->

<section id="faculty-section">
  <div class="container">
    <div class="faculty-card">
      <h2 class="faculty-title" id="dept-title"></h2>
<div class="table-responsive">
      <table class="table table-bordered faculty-table" id="faculty-table">
        <thead class="table-heading">
          <tr>
            <th style="width: 15%;text-align:center">Photo</th>
            <th style="text-align:center">Name</th>
            <th style="text-align:center">Designation</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>
</div>
    </div>
  </div>
</section>


<%@ include file="/header/footer.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- -----------------------------------------------------------
     FACULTY DATA + DYNAMIC TABLE LOADING
------------------------------------------------------------ -->

<script>
// ***** replace this with dynamic JSON if you want *****
const facultyData = [
    {
        "Department": "General Administration",
        "Designation": "Chief Specialist I",
        "Name": "Dr. Dinesh Mohan",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Dinesh Mohan.png\" alt=\"Dr. Dinesh Mohan\">"
    },
    {
        "Department": "General Administration",
        "Designation": "Additional Chief Health Director",
        "Name": "Dr. Daisy Rani",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Daisy Rani.png\" alt=\"Dr. Daisy Rani\">"
    },
    {
        "Department": "Orthopaedics",
        "Designation": "Professor",
        "Name": "Dr. Rushama Tandon",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Rushama Tandon.png\" alt=\"Dr. Rushama Tandon\">"
    },
    {
        "Department": "Orthopaedics",
        "Designation": "Professor",
        "Name": "Dr. Ashutosh Kapoor",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Ashutosh Kapoor.png\" alt=\"Dr. Ashutosh Kapoor\">"
    },
    {
        "Department": "Orthopaedics",
        "Designation": "Assistant Professor",
        "Name": "Dr. Surya Prakash Sharma",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Surya Prakash Sharma.png\" alt=\"Dr. Surya Prakash Sharma\">"
    },
    {
        "Department": "Obstetrics & Gynaecology",
        "Designation": "Professor",
        "Name": "Dr. Anita Bansal",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Anita Bansal.png\" alt=\"Dr. Anita Bansal\">"
    },
    {
        "Department": "Obstetrics & Gynaecology",
        "Designation": "Associate Professor",
        "Name": "Dr. Shuchi Sharma",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Shuchi Sharma.png\" alt=\"Dr. Shuchi Sharma\">"
    },
    {
        "Department": "Obstetrics & Gynaecology",
        "Designation": "Assistant Professor",
        "Name": "Dr. Anita Chandrayan",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Anita Chandrayan.png\" alt=\"Dr. Anita Chandrayan\">"
    },
    {
        "Department": "Obstetrics & Gynaecology",
        "Designation": "Assistant Professor",
        "Name": "Dr. Dipali Maurya",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Dipali Maurya.png\" alt=\"Dr. Dipali Maurya\">"
    },
    {
        "Department": "Obstetrics & Gynaecology",
        "Designation": "Divisional Medical Officer",
        "Name": "Dr. Neeti Nisha",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Neeti Nisha.png\" alt=\"Dr. Neeti Nisha\">"
    },
    {
        "Department": "Medicine",
        "Designation": "Professor",
        "Name": "Dr. Sanjay Joshi",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Sanjay Joshi.png\" alt=\"Dr. Sanjay Joshi\">"
    },
    {
        "Department": "Medicine",
        "Designation": "Professor",
        "Name": "Dr. Atul Gupta",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Atul Gupta.png\" alt=\"Dr. Atul Gupta\">"
    },
    {
        "Department": "Medicine",
        "Designation": "Professor",
        "Name": "Dr. Celestina Dungdung",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Celestina Dungdung.png\" alt=\"Dr. Celestina Dungdung\">"
    },
    {
        "Department": "Medicine",
        "Designation": "Professor",
        "Name": "Dr. Madhu Kaushal",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Madhu Kaushal.png\" alt=\"Dr. Madhu Kaushal\">"
    },
    {
        "Department": "Medicine",
        "Designation": "Professor",
        "Name": "Dr. Uday Bhan Bharadwaj",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Uday Bhan Bharadwaj.png\" alt=\"Dr. Uday Bhan Bharadwaj\">"
    },
    {
        "Department": "Medicine",
        "Designation": "Professor",
        "Name": "Dr. Bimal Kumar Singh",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Bimal Kumar Singh.png\" alt=\"Dr. Bimal Kumar Singh\">"
    },
    {
        "Department": "Medicine",
        "Designation": "Assistant Professor",
        "Name": "Dr. Siddharth M.",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Siddharth M..png\" alt=\"Dr. Siddharth M.\">"
    },
    {
        "Department": "Medicine",
        "Designation": "Assistant Professor",
        "Name": "Dr. Ambrish Tiwari",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Ambrish Tiwari.png\" alt=\"Dr. Ambrish Tiwari\">"
    },
    {
        "Department": "Medicine",
        "Designation": "Senior Divisional Medical Officer",
        "Name": "Dr. Radha Kant Pandey",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Radha Kant Pandey.png\" alt=\"Dr. Radha Kant Pandey\">"
    },
    {
        "Department": "Psychiatry",
        "Designation": "Assistant Professor",
        "Name": "Dr. Rama Shankar",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Rama Shankar.png\" alt=\"Dr. Rama Shankar\">"
    },
    {
        "Department": "Psychiatry",
        "Designation": "Assistant Divisional Medical Officer",
        "Name": "Dr. Alka Singh",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Alka Singh.png\" alt=\"Dr. Alka Singh\">"
    },
    {
        "Department": "Anaesthesia",
        "Designation": "Professor",
        "Name": "Dr. Mamta Chadha",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Mamta Chadha.png\" alt=\"Dr. Mamta Chadha\">"
    },
    {
        "Department": "Anaesthesia",
        "Designation": "Professor",
        "Name": "Dr. Anil Kumar Sharma",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Anil Kumar Sharma.png\" alt=\"Dr. Anil Kumar Sharma\">"
    },
    {
        "Department": "Anaesthesia",
        "Designation": "Associate Professor",
        "Name": "Dr. Sushil Krishnan",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Sushil Krishnan.png\" alt=\"Dr. Sushil Krishnan\">"
    },
    {
        "Department": "Anaesthesia",
        "Designation": "Assistant Professor",
        "Name": "Dr. Dildeep Singh",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Dildeep Singh.png\" alt=\"Dr. Dildeep Singh\">"
    },
    {
        "Department": "Anaesthesia",
        "Designation": "Dr.",
        "Name": "Dr. Rakesh Kumar",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Rakesh Kumar.png\" alt=\"Dr. Rakesh Kumar\">"
    },
    {
        "Department": "Microbiology",
        "Designation": "Associate Professor",
        "Name": "Dr. Meenakshi Agarwal",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Meenakshi Agarwal.png\" alt=\"Dr. Meenakshi Agarwal\">"
    },
    {
        "Department": "Microbiology",
        "Designation": "Assistant Professor",
        "Name": "Dr. Deepa Pandey",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Deepa Pandey.png\" alt=\"Dr. Deepa Pandey\">"
    },
    {
        "Department": "Microbiology",
        "Designation": "Assistant Professor",
        "Name": "Dr. Priyanka Tiwari",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Priyanka Tiwari.png\" alt=\"Dr. Priyanka Tiwari\">"
    },
    {
        "Department": "ENT",
        "Designation": "Professor",
        "Name": "Dr. Shruti Ogra",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Shruti Ogra.png\" alt=\"Dr. Shruti Ogra\">"
    },
    {
        "Department": "ENT",
        "Designation": "Professor",
        "Name": "Dr. Divya Gupta",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Divya Gupta.png\" alt=\"Dr. Divya Gupta\">"
    },
    {
        "Department": "ENT",
        "Designation": "Professor",
        "Name": "Dr. Divya Aggarwal",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Divya Aggarwal.png\" alt=\"Dr. Divya Aggarwal\">"
    },
    {
        "Department": "ENT",
        "Designation": "Dr.",
        "Name": "Dr. Puneet Gupta",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Puneet Gupta.png\" alt=\"Dr. Puneet Gupta\">"
    },
    {
        "Department": "Dermatology",
        "Designation": "Assistant Professor",
        "Name": "Dr. Krishan Mehra",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Krishan Mehra.png\" alt=\"Dr. Krishan Mehra\">"
    },
    {
        "Department": "Dermatology",
        "Designation": "Assistant Professor",
        "Name": "Dr. Sunita Gupta",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Sunita Gupta.png\" alt=\"Dr. Sunita Gupta\">"
    },
    {
        "Department": "Pathology",
        "Designation": "Professor",
        "Name": "Dr. Seema Chadha",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Seema Chadha.png\" alt=\"Dr. Seema Chadha\">"
    },
    {
        "Department": "Pathology",
        "Designation": "Professor",
        "Name": "Dr. Pamelle Yadav",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Pamelle Yadav.png\" alt=\"Dr. Pamelle Yadav\">"
    },
    {
        "Department": "Pathology",
        "Designation": "Assistant Professor",
        "Name": "Dr. Sumaiya Siddiqui",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Sumaiya Siddiqui.png\" alt=\"Dr. Sumaiya Siddiqui\">"
    },
    {
        "Department": "Pathology & Blood Centre",
        "Designation": "Assistant Professor",
        "Name": "Dr. Sonal Agarwal",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Sonal Agarwal.png\" alt=\"Dr. Sonal Agarwal\">"
    },
    {
        "Department": "Eye",
        "Designation": "Professor",
        "Name": "Dr. Shailendra Kumar Choudhary",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Shailendra Kumar Choudhary.png\" alt=\"Dr. Shailendra Kumar Choudhary\">"
    },
    {
        "Department": "Eye",
        "Designation": "Associate Professor",
        "Name": "Dr. Saloni Gupta",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Saloni Gupta.png\" alt=\"Dr. Saloni Gupta\">"
    },
    {
        "Department": "Eye",
        "Designation": "Assistant Professor",
        "Name": "Dr. Rishi Sethi",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Rishi Sethi.png\" alt=\"Dr. Rishi Sethi\">"
    },
    {
        "Department": "Eye",
        "Designation": "Assistant Professor",
        "Name": "Dr. Amita Jain",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Amita Jain.png\" alt=\"Dr. Amita Jain\">"
    },
    {
        "Department": "Surgery",
        "Designation": "Professor",
        "Name": "Dr. Sanjeev Singhal",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Sanjeev Singhal.png\" alt=\"Dr. Sanjeev Singhal\">"
    },
    {
        "Department": "Surgery",
        "Designation": "Professor",
        "Name": "Dr. Bishwa Nath Tiwary",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Bishwa Nath Tiwary.png\" alt=\"Dr. Bishwa Nath Tiwary\">"
    },
    {
        "Department": "Surgery",
        "Designation": "Professor",
        "Name": "Dr. Pawan Malik",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Pawan Malik.png\" alt=\"Dr. Pawan Malik\">"
    },
    {
        "Department": "Surgery",
        "Designation": "Assistant Professor",
        "Name": "Dr. Vashishth Rai",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Vashishth Rai.png\" alt=\"Dr. Vashishth Rai\">"
    },
    {
        "Department": "Radiodiagnosis",
        "Designation": "Assistant Professor",
        "Name": "Dr. Amit Ballani",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Amit Ballani.png\" alt=\"Dr. Amit Ballani\">"
    },
    {
        "Department": "Radiodiagnosis",
        "Designation": "Senior Divisional Medical Officer",
        "Name": "Dr. Yogesh Bharadwaj",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Yogesh Bharadwaj.png\" alt=\"Dr. Yogesh Bharadwaj\">"
    },
    {
        "Department": "Paediatrics",
        "Designation": "Professor",
        "Name": "Dr. Tanushree Joshi",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Tanushree Joshi.png\" alt=\"Dr. Tanushree Joshi\">"
    },
    {
        "Department": "Paediatrics",
        "Designation": "Professor",
        "Name": "Dr. Kathakali Das",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Kathakali Das.png\" alt=\"Dr. Kathakali Das\">"
    },
    {
        "Department": "Paediatrics",
        "Designation": "Professor",
        "Name": "Dr. Zeeshan Rafi",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Zeeshan Rafi.png\" alt=\"Dr. Zeeshan Rafi\">"
    },
    {
        "Department": "Oncology",
        "Designation": null,
        "Name": "Dr. Abhishekh Kumar",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Abhishekh Kumar.png\" alt=\"Dr. Abhishekh Kumar\">"
    },
    {
        "Department": "Geriatric Services",
        "Designation": "Principal Consultant",
        "Name": "Dr. Man Singh",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Man Singh.png\" alt=\"Dr. Man Singh\">"
    },
    {
        "Department": "Geriatric Services",
        "Designation": "Senior Consultant",
        "Name": "Dr. Rajni Bhalla",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Rajni Bhalla.png\" alt=\"Dr. Rajni Bhalla\">"
    },
    {
        "Department": "Casualty",
        "Designation": "Senior Consultant",
        "Name": "Dr. Suniti Sharma",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Suniti Sharma.png\" alt=\"Dr. Suniti Sharma\">"
    },
    {
        "Department": "Casualty",
        "Designation": null,
        "Name": "Dr. Akash",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Akash.png\" alt=\"Dr. Akash\">"
    },
    {
        "Department": "Casualty",
        "Designation": "CMP",
        "Name": "Dr. Fardeen",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Fardeen.png\" alt=\"Dr. Fardeen\">"
    },
    {
        "Department": "Dental Surgery",
        "Designation": "Principal Chief Dental Surgeon",
        "Name": "Dr. Parveen Sharma",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Parveen Sharma.png\" alt=\"Dr. Parveen Sharma\">"
    },
    {
        "Department": "Dental Surgery",
        "Designation": "Additional Chief Health Director",
        "Name": "Dr. Naveeta Mittal",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Naveeta Mittal.png\" alt=\"Dr. Naveeta Mittal\">"
    },
    {
        "Department": "Dental Surgery",
        "Designation": "Additional Chief Dental Surgeon",
        "Name": "Dr. Ashish Dixit",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Ashish Dixit.png\" alt=\"Dr. Ashish Dixit\">"
    },
    {
        "Department": "Dental Surgery",
        "Designation": "Divisional Dental Surgeon",
        "Name": "Dr. Arti Yadav",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Arti Yadav.png\" alt=\"Dr. Arti Yadav\">"
    },
    {
        "Department": "Health Unit Tilak Bridge",
        "Designation": "Senior Divisional Medical Officer",
        "Name": "Dr. Niti Arora",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Niti Arora.png\" alt=\"Dr. Niti Arora\">"
    },
    {
        "Department": "Health Unit Basant Lane",
        "Designation": "Senior Divisional Medical Officer",
        "Name": "Dr. Kamal Kumar Wadhwa",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Kamal Kumar Wadhwa.png\" alt=\"Dr. Kamal Kumar Wadhwa\">"
    },
    {
        "Department": "Health Unit Basant Lane",
        "Designation": "Divisional Medical Officer",
        "Name": "Dr. Arushi Singh",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Arushi Singh.png\" alt=\"Dr. Arushi Singh\">"
    },
    {
        "Department": "Health Unit Sarojini Nagar",
        "Designation": "Chief Consultant",
        "Name": "Dr. Sridhar Krishnappa",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Sridhar Krishnappa.png\" alt=\"Dr. Sridhar Krishnappa\">"
    },
    {
        "Department": "Health Unit Sardar Patel Marg",
        "Designation": "Senior Divisional Medical Officer",
        "Name": "Dr. Shakraja",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Shakraja.png\" alt=\"Dr. Shakraja\">"
    },
    {
        "Department": "Health Unit Baroda House",
        "Designation": "Divisional Medical Officer",
        "Name": "Dr. Nibha Mohanty",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Nibha Mohanty.png\" alt=\"Dr. Nibha Mohanty\">"
    },
    {
        "Department": "Health Unit Lajpat Nagar",
        "Designation": null,
        "Name": "Dr. Jyoti Garg",
        "Img": "<img src=\"/nrch/images/faculty/Dr. Jyoti Garg.png\" alt=\"Dr. Jyoti Garg\">"
    }
];


// ------------------------------------------------------------
// CLICK HANDLER FOR DEPARTMENTS
// ------------------------------------------------------------
document.addEventListener("DOMContentLoaded", function () {

  // Get the first department button
  let firstDept = document.querySelector(".dept-btn");

  if (firstDept) {
    let dept = firstDept.dataset.dept;
    firstDept.classList.add("dept-active");

    // Set Header
    document.getElementById("dept-title").innerText = dept + " Department";

    // Fill Table
    let tbody = document.querySelector("#faculty-table tbody");
    tbody.innerHTML = "";
    
    let filtered = facultyData.filter(f => f.Department === dept || (dept === "Health Unit" && f.Department.startsWith("Health Unit")));
	filtered.forEach(f => {
	    console.log("ROW:", f); // final check
	    tbody.innerHTML += '<tr><td style="text-align:center">'+f.Img+'</td><td style="text-align:center">'+f.Name+'</td><td style="text-align:center">'+((f.Designation!=null)?f.Designation:"")+((f.Department.startsWith("Health Unit"))?" ("+f.Department.replace("Health Unit ","")+")":"")+'</td></tr>';
	});

    document.getElementById("faculty-section").style.display = "block";
  }
  fixMissingImages();
});

document.querySelectorAll(".dept-btn").forEach(btn => {
  btn.addEventListener("click", function(e){
    e.preventDefault();

    // Remove previous active
    document.querySelectorAll(".dept-btn").forEach(b => b.classList.remove("dept-active"));

    // Add active to clicked one
    this.classList.add("dept-active");

    let dept = this.dataset.dept;

    document.getElementById("dept-title").innerText = dept + " Department";

    let tbody = document.querySelector("#faculty-table tbody");
    tbody.innerHTML = "";

    let filtered = facultyData.filter(f => f.Department === dept || (dept === "Health Unit" && f.Department.startsWith("Health Unit")));
    filtered.forEach(f => {
        console.log("ROW:", f); // final check

        tbody.innerHTML += '<tr><td style="text-align:center">'+f.Img+'</td><td style="text-align:center">'+f.Name+'</td><td style="text-align:center">'+((f.Designation!=null)?f.Designation:"")+((f.Department.startsWith("Health Unit"))?" ("+f.Department.replace("Health Unit ","")+")":"")+'</td></tr>';
    });

    document.getElementById("faculty-section").style.display = "block";
    document.getElementById("faculty-section").scrollIntoView({behavior: "smooth"});
    fixMissingImages();
  });
});

const deptScroll = document.getElementById("deptScroll");
const scrollAmount = 300; // pixels per click

document.getElementById("scrollLeft").onclick = () => {
  deptScroll.scrollBy({ left: -scrollAmount, behavior: "smooth" });
};

document.getElementById("scrollRight").onclick = () => {
  deptScroll.scrollBy({ left: scrollAmount, behavior: "smooth" });
};
function fixMissingImages() {
    document.querySelectorAll("#faculty-table img").forEach(img => {
        img.onerror = function () {
            this.outerHTML = "N.A.";
        };
    });
}


</script>

</body>
</html>
