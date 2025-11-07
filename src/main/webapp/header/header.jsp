<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    padding: 5px 0; */
  }
  .main-header {
    background-color: #ffffff;
    padding: 15px 0;
    border-bottom: 1px solid #ddd;
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
  .main-logo {
    height: 70px;
    width: auto;
    margin-right: 10px;
  }
  .right-logo {
    height: 70px;
    width: auto;
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
	  background: #f9fafc;
	}
	
	.tab-content ul li:nth-child(even) {
	  background: #fff;
	}
	
	.tab-content ul li:hover {
	  background: #eef3ff;
	  cursor: pointer;
	}
</style>

<!-- Top Header -->
<div class="top-header text-center text-md-start">
  <div class="container d-flex justify-content-between align-items-center">
    <div id="datetime"></div>
    <div>
     <a href="#" class="text-decoration-none text-white me-3">Facebook</a>
	 <a href="#" class="text-decoration-none text-white me-3">Twitter</a>
	 <a href="#" class="text-decoration-none text-white">Instagram</a>
	</div>
  </div>
</div>

<!-- Main Header -->
<header class="main-header">
  <div class="container d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center">
      <img src="/nrch/images/emblem.png" alt="Logo" class="main-logo">
      <h1 class="h4 mb-0">
	  Indian Railway Post Graduate <br>
	  Institute of Medical Sciences and Research
	</h1>
    </div>	
    <div>
      <img src="/nrch/images/logo.gif" alt="Right Logo" class="right-logo">
    </div>
  </div>
</header>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
      <a class="navbar-brand d-lg-none" href="#">Menu</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="aboutDropdown" role="button" data-bs-toggle="dropdown">About Us</a>
            <ul class="dropdown-menu" aria-labelledby="aboutDropdown">
              <li><a class="dropdown-item" href="#">Vision & Mission</a></li>
              <li><a class="dropdown-item" href="/nrch/about_us/organization.jsp">Organization</a></li>
              <li><a class="dropdown-item" href="/nrch/about_us/aarogya.jsp">Aarogya - The Times of NRCH</a></li>
            </ul>
          </li>

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

          <li class="nav-item"><a class="nav-link" href="#">Admission</a></li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="studentZoneDropdown" role="button" data-bs-toggle="dropdown">Student Zone</a>
            <ul class="dropdown-menu" aria-labelledby="studentZoneDropdown">
              <li><a class="dropdown-item" href="#">Courses</a></li>
              <li><a class="dropdown-item" href="#">Admission</a></li>
              <li><a class="dropdown-item" href="#">Examination</a></li>
            </ul>
          </li>

          <li class="nav-item"><a class="nav-link" href="#">Circulars & Notifications</a></li>

          <li class="nav-item"><a class="nav-link" href="#">Contact Us</a></li>
        </ul>
      </div>
    </div>
  </nav>
