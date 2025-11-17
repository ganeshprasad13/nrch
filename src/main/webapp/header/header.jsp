<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="keywords" content="NRCH, IRPGI, IRPGIMSR, Northern Railway Central Hospital, Indian Railway Post Graduate Institute, Indian Railway Post Graduate Institute of Medical Sciences and Research">
<meta name="description" content="NRCH, IRPGI, IRPGIMSR, Northern Railway Central Hospital, Indian Railway Post Graduate Institute, Indian Railway Post Graduate Institute of Medical Sciences and Research">
<!-- Date-Time Script -->
<script src="https://cdn.userway.org/widget.js" data-account="sYnCngDBRn"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<script>
function updateDateTime() {
  const now = new Date();
  const options = {
    weekday: 'short',
    month: 'short',
    day: '2-digit',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: true
  };
  let formatted = now.toLocaleString('en-US', options);
  formatted = formatted.replace(/, (?=[^,]*$)/, ' | ');
  document.getElementById('datetime').textContent = formatted;
}
setInterval(updateDateTime, 1000);
updateDateTime();
</script>

<style>


.header-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: nowrap;
  position: relative;
}

.main-logo,
.right-logo {
  height: 70px;
  width: auto;
}

.institute-title {
  font-size: 1.8rem;
  font-weight: 700;
  color: #0d47a1;
  line-height: 1.3;
  text-align: center;
  margin: 0;
}

/* ===== Mobile View ===== */
@media (max-width: 768px) {
  .header-container {
    flex-direction: column;
    justify-content: center;
    text-align: center;
  }

  .main-logo,
  .right-logo {
    height: 55px;
    margin: 5px 0;
  }

  .institute-title {
    font-size: 1.4rem;
  }
}


.top-header a {
  color: white;
  text-decoration: none;
}

.top-header {
  background-color: #003366;
  color: white;
  font-weight: 500;
  white-space: nowrap;
  font-size: 0.9rem;
  padding: 5px 0;
}

.institute-name {
  line-height: 1.2;
  max-width: 800px;
}

.institute-title {
  font-size: 1.2rem;
  font-weight: 700;
  color: #003366;
}

.institute-subtitle {
display: inline;
  font-size: 1rem;
  font-weight: 500;
  color: #555;
}

.main-header {
  background-color: #ffffff;
  padding: 15px 0;
  border-bottom: 1px solid #ddd;
}

.main-logo {
  height: 70px;
  width: auto;
  margin-right: 10px;
}

.right-logo {
  height: 70px;
  width: auto;
}

.navbar {
  background-color: #004080 !important;
}

.navbar .nav-link,
.navbar .navbar-brand {
  color: #ffffff !important;
}

.navbar .nav-link:hover {
  color: #ffd700 !important;
}

@media (min-width: 992px) {
  .navbar .dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
  }
}

.dropdown-menu {
  background-color: #004080;
}

.dropdown-menu .dropdown-item {
  color: #ffffff !important;
}

.dropdown-menu .dropdown-item:hover {
  background-color: #003366;
}

.nav-tabs .nav-link.active {
  background: #004080;
  color: #fff;
  border-radius: 6px 6px 0 0;
}

.nav-tabs .nav-link:hover {
  background: #e3e9f5;
}

/* Striped tab content */
.tab-content ul {
  list-style: none;
  padding-left: 0;
  margin: 0;
  border-radius: 6px;
  overflow: hidden;
}

.tab-content ul li {
  padding: 12px 15px;
  transition: background 0.3s;
}

.tab-content ul li:nth-child(odd) {
  background: #e7eaf1;
}

.tab-content ul li:nth-child(even) {
  background: #fff;
}

.tab-content ul li:hover {
  background: #eef3ff;
  cursor: pointer;
}
navbar
body {
  background-color: #e2ecf7;
}

/* --- Header layout fix for mobile --- */
@media (max-width: 768px) {
  .main-header .container {
    flex-direction: column !important;
    text-align: center;
    justify-content: center;
  }

  .main-header .d-flex.align-items-center {
    flex-direction: column !important;
    align-items: center !important;
    justify-content: center !important;
  }

  .main-logo {
    height: 55px;
    margin: 0 auto 10px auto;
  }

  .right-logo {
    height: 55px;
    margin-top: 10px;
  }

  .institute-name {
    max-width: 100%;
    margin: 0 auto;
  }

  .institute-title {
    font-size: 1rem;
    text-align: center;
  }

  .institute-subtitle {
    font-size: 0.9rem;
    text-align: center;
  }
}



/* ------------------------------------------------------------
   GLOBAL FONT SETTINGS — uniform font across entire website
------------------------------------------------------------- */
/* --------------------------------------------------
   UNIVERSAL TYPOGRAPHY CONTROL FOR WHOLE WEBSITE
-------------------------------------------------- */

/* Base font size for all text */
html, body {
    font-size: 16px !important;
    font-family: "Segoe UI", sans-serif !important;
    line-height: 1.6;
    color: #333;
}

/* Paragraphs, list items, table text */
p, li, td, th, a, span, label, input, button {
    font-size: 1rem !important;  /* 16px */
}

/* Headings */
h1 { font-size: 2rem !important; font-weight: 700; }  /* 32px */
h2 { font-size: 1.75rem !important; font-weight: 700; } /* 28px */
h3 { font-size: 1.5rem !important; font-weight: 600; }  /* 24px */
h4 { font-size: 1.25rem !important; font-weight: 600; } /* 20px */
h5 { font-size: 1.1rem !important; font-weight: 600; }  /* 17.6px */
h6 { font-size: 1rem !important; font-weight: 600; }     /* 16px */

/* Navigation, tabs, circular links */
.nav-link,
.circle-link span,
.breadcrumb,
button {
    font-size: 1rem !important;
}

/* Tables in inner pages */
table {
    font-size: 1rem !important;
}

font {
    font-family: "Segoe UI", sans-serif !important;
    font-size: 1rem !important;
    color: #333 !important;
    font-weight: normal !important;
}

font[size], font[color], font[face] {
    all: unset !important;
    font-family: "Segoe UI", sans-serif !important;
    font-size: 1rem !important;
    color: #333 !important;
}
</style>

<!-- Top Header -->
<div class="top-header text-center text-md-start">
  <div class="container d-flex justify-content-between align-items-center">
    <div id="datetime"></div>
    <a class="LangSwitcher" href="#mainCarousel" title="Skip to Main Content">
		Skip to Main Content
	</a>
  </div>
</div> 

<!-- Main Header -->
<header class="main-header">
 <!--  <div class="container d-flex justify-content-between align-items-center flex-wrap">
    <div class="d-flex align-items-center flex-wrap">
      <a href="/nrch">
        <img src="/nrch/images/emblem.png" alt="Logo" class="main-logo">
      </a>
      <div class="institute-name">
        <h1 class="institute-title mb-0" style="display:inline">
          Indian Railway Post Graduate Institute of Medical Sciences and Research <br>
          and associated Northern Railway Central Hospital, New Delhi
        </h1>
      </div>
    </div>
    <div>
      <img src="/nrch/images/logo.gif" alt="Right Logo" class="right-logo">
    </div>
  </div> -->
  <div class="container header-container position-relative py-3 text-center">
  <!-- Left Logo -->
  <a href="/nrch" class="left-logo-link">
    <img src="/nrch/images/emblem.png" alt="Left Logo" class="main-logo">
  </a>

  <!-- Center Heading -->
  <div class="institute-name my-2">
    <h4 class="institute-title mb-0">
      Indian Railway Post Graduate Institute of Medical Sciences and Research <br>
          and associated Northern Railway Central Hospital, New Delhi
    </h4>
  </div>

  <!-- Right Logo -->
  <div class="right-logo-link">
    <img src="/nrch/images/logo.gif" alt="Right Logo" class="right-logo">
  </div>
</div>

</header>

<!-- Navbar -->
<nav id = "navbar" class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand d-lg-none" href="#">Menu</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav mx-auto">

        <li class="nav-item"><a class="nav-link active" href="/nrch">Home</a></li>

        <!-- About Us -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="aboutDropdown" role="button" data-bs-toggle="dropdown">About Us</a>
          <ul class="dropdown-menu" aria-labelledby="aboutDropdown">
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Introduction</a></li>
            <li><a class="dropdown-item" href="/nrch/mission.jsp">Vision & Mission</a></li>
            <li><a class="dropdown-item" href="/nrch/about_us/organization.jsp">About IGPGIMSR</a></li>
            <li><a class="dropdown-item" href="/nrch/about_us/aarogya.jsp">Aarogya - The Times of NRCH</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Teaching</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Research</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Patient Care</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Director</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Management</a></li>
          </ul>
        </li>

        <!-- Departments -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="departmentsDropdown" role="button" data-bs-toggle="dropdown">Departments</a>
          <ul class="dropdown-menu" aria-labelledby="departmentsDropdown">
            <li><a class="dropdown-item" href="/nrch/departments/surgery.jsp">Surgery</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/orthopaedics.jsp">Orthopaedics</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/gynaecology.jsp">Obstetrics & Gynaecology</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/anesthesiology.jsp">Anesthesiology</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/medicine.jsp">Medicine</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/paediatrics.jsp">Paediatrics</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/ent.jsp">ENT</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/ophthalmology.jsp">Ophthalmology</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/pathology.jsp">Pathology</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/microbiology.jsp">Microbiology</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/radiodiagnosis.jsp">Radiodiagnosis</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/dermatology.jsp">Dermatology</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/oncology.jsp">Oncology</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/dentalsurgery.jsp">Dental Surgery</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/psychiatry.jsp">Psychiatry</a></li>
            <li><a class="dropdown-item" href="/nrch/departments/bloodcentre.jsp">Blood Centre</a></li>
          </ul>
        </li>

        <li class="nav-item"><a class="nav-link" href="/nrch/nodata.jsp">Admission</a></li>

        <!-- Student Zone -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="studentZoneDropdown" role="button" data-bs-toggle="dropdown">Student Zone</a>
          <ul class="dropdown-menu" aria-labelledby="studentZoneDropdown">
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Courses</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Admission</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Examination</a></li>
          </ul>
        </li>

         <!-- Research -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="researchDropdown" role="button" data-bs-toggle="dropdown">Research</a>
          <ul class="dropdown-menu" aria-labelledby="researchDropdown">
            <li><a class="dropdown-item" href="/nrch/documents/Scientific Research Committee.pdf" target="_blank">Scientific Research Committee</a></li>
            <li><a class="dropdown-item" href="/nrch/documents/NRCH Ethical Committee Approval Presentation Template.pdf" target="_blank">NRCH Ethical Committee Approval Presentation Template</a></li>
            <li><a class="dropdown-item" href="/nrch/documents/IEC NRCH CONSTITUTION 2025.pdf" target="_blank">IEC NRCH CONSTITUTION 2025</a></li>
            <li><a class="dropdown-item" href="https://docs.google.com/forms/d/e/1FAIpQLScPT1NF5FAswBC-lOCGvtb6OCfxqNKvkQKmPXBsh8DjrEO_Sg/viewform" target="_blank">Thesis / Research study protocol for IEC NRCH approval</a></li>
          </ul>
        </li>

        <!-- Library -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="libraryDropdown" role="button" data-bs-toggle="dropdown">Library</a>
          <ul class="dropdown-menu" aria-labelledby="libraryDropdown">
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Single Point Search</a></li>
          </ul>
        </li>

        <!-- Events -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="eventsDropdown" role="button" data-bs-toggle="dropdown">Events</a>
          <ul class="dropdown-menu" aria-labelledby="eventsDropdown">
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Conference & Workshops</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Current Events</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Archive Events</a></li>
            <li><a class="dropdown-item" href="/nrch/nodata.jsp">Public Lecture</a></li>
          </ul>
        </li>

        <li class="nav-item"><a class="nav-link" href="#">Circulars & Notifications</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Contact Us</a></li>

        <!-- Gallery -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="galleryDropdown" role="button" data-bs-toggle="dropdown">Gallery</a>
          <ul class="dropdown-menu" aria-labelledby="galleryDropdown">
           <!--  <li><a class="dropdown-item" href="gallery.jsp">Photo Gallery</a></li> -->
            <li><a class="dropdown-item" href="kumbh.jsp">Kumbh@NRCH</a></li>
          </ul>
        </li>

      </ul>
    </div>
  </div>
</nav>
