<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Northern Railway Central Hospital</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .top-header {
      background-color: #f8f9fa;
      font-size: 0.9rem;
      padding: 5px 0;
    }
    .main-header {
      background-color: #ffffff;
      padding: 15px 0;
      border-bottom: 1px solid #ddd;
    }
    .navbar {
      background-color: #004080 !important;
    }
    .navbar a {
      color: white !important;
    }
    .navbar a:hover {
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
    .dropdown-menu a {
      color: #fff !important;
    }
    .dropdown-menu a:hover {
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
    .news-bar {
  background-color: #003366;
  color: white;
  padding: 6px 0;
  font-weight: 500;
  font-size: 0.95rem;
  white-space: nowrap; /* ensures it stays on one line */
}
.news-bar strong {
  color: #ffd700;
}
    .carousel-inner img {
      width: 100%;
      height: 400px;
      object-fit: cover;
    }
    /* Modern Tabs Styling */
.modern-tabs .nav-link {
  color: #004080;
  font-weight: 500;
  border: none;
  border-bottom: 3px solid transparent;
  transition: all 0.3s ease;
  background-color: #f8f9fa;
}
.modern-tabs .nav-link.active {
  color: #003366;
  background-color: #ffffff !important;
  border-bottom: 3px solid #003366;
  font-weight: 600;
}
.modern-tabs .nav-link:hover {
  color: #002244;
  border-bottom: 3px solid #ffd700;
}
.tab-content {
  border-radius: 0 0 0.5rem 0.5rem;
}

/* Modern Card Styling */
.rounded-4 {
  border-radius: 1rem !important;
}
.bg-white.shadow-sm {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.bg-white.shadow-sm:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}
    /* Striped list items inside tab content */
.tab-content ul li {
  padding: 10px 12px;
  border-radius: 6px;
  transition: background 0.3s ease;
}

.tab-content ul li:nth-child(odd) {
  background-color: #f9fafc; /* Light gray stripe */
}

.tab-content ul li:nth-child(even) {
  background-color: #ffffff; /* White stripe */
}

.tab-content ul li:hover {
  background-color: #eef3ff; /* Subtle blue hover */
  cursor: pointer;
}

/* Optional subtle border and better font */
.tab-content ul {
  border-radius: 8px;
  padding-left: 0;
  list-style: none;
}

.tab-content ul li::before {
  content: "› ";
  color: #004080;
  font-weight: bold;
}
    /* Modern Nav Tabs */
.nav-tabs .nav-link {
  font-weight: 600;
  color: #004080;
  border: none;
  background: #f5f7fa;
  border-radius: 0;
  transition: all 0.3s ease;
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

/* Person Cards */
.modern-card {
  border: none;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
  border-radius: 12px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.modern-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
}

.person-img {
  width: 130px;
  height: 130px;
  object-fit: cover;
  border: 3px solid #004080;
}

@media (max-width: 992px) {
  .person-img {
    width: 100px;
    height: 100px;
  }
}
    @media (min-width: 992px) {
  .col-lg-7 {
    flex: 0 0 60%;
    max-width: 60%;
  }
  .col-lg-5 {
    flex: 0 0 40%;
    max-width: 40%;
  }
}

/* Slightly smaller circular images */
.person-img {
  width: 120px;
  height: 120px;
  object-fit: cover;
  border: 3px solid #004080;
}
  .card img {
  object-fit: cover;
  border: 2px solid #dee2e6;
}

.card h6 {
  color: #0d47a1;
  font-size: 1rem;
}

.card p {
  font-size: 0.9rem;
}

.card .d-flex:last-child {
  margin-bottom: 0 !important;
}
 footer a:hover {

  color: #ffd700 !important;

  text-decoration: underline !important;

}


    
  </style>
</head>
<body>

  <!-- Top Header -->
  <div class="top-header text-center text-md-start">
    <div class="container d-flex justify-content-between align-items-center">
      <div id="datetime"></div>
      <div>
        <a href="#" class="text-decoration-none text-dark me-3">Facebook</a>
        <a href="#" class="text-decoration-none text-dark me-3">Twitter</a>
        <a href="#" class="text-decoration-none text-dark">Instagram</a>
      </div>
    </div>
  </div>

  <!-- Main Header -->
  <header class="main-header">
    <div class="container d-flex justify-content-between align-items-center">
      <div class="d-flex align-items-center">
        <img src="images/emblem.png" alt="Logo" class="main-logo">
        <h1 class="h4 mb-0">Northern Railway Central Hospital</h1>
      </div>
      <div>
        <img src="images/logo.gif" alt="Right Logo" class="right-logo">
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
              <li><a class="dropdown-item" href="#">Overview</a></li>
              <li><a class="dropdown-item" href="#">Mission & Vision</a></li>
              <li><a class="dropdown-item" href="#">Administration</a></li>
            </ul>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="departmentsDropdown" role="button" data-bs-toggle="dropdown">Departments</a>
            <ul class="dropdown-menu" aria-labelledby="departmentsDropdown">
              <li><a class="dropdown-item" href="#">Cardiology</a></li>
              <li><a class="dropdown-item" href="#">Orthopedics</a></li>
              <li><a class="dropdown-item" href="#">Radiology</a></li>
              <li><a class="dropdown-item" href="#">Emergency</a></li>
            </ul>
          </li>

          <li class="nav-item"><a class="nav-link" href="#">Admission</a></li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="studentZoneDropdown" role="button" data-bs-toggle="dropdown">Student Zone</a>
            <ul class="dropdown-menu" aria-labelledby="studentZoneDropdown">
              <li><a class="dropdown-item" href="#">Courses</a></li>
              <li><a class="dropdown-item" href="#">Schedules</a></li>
              <li><a class="dropdown-item" href="#">Results</a></li>
            </ul>
          </li>

          <li class="nav-item"><a class="nav-link" href="#">Circulars & Notifications</a></li>

          <li class="nav-item"><a class="nav-link" href="#">Contact Us</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Latest News Bar -->
  <div class="news-bar">
  <div class="container d-flex align-items-center overflow-hidden">
    <strong class="me-2 flex-shrink-0">Latest News:</strong>
    <marquee behavior="scroll" direction="left" scrollamount="5" class="flex-grow-1 mb-0">
      Admission forms for 2025 session are now open! &nbsp;&nbsp;|&nbsp;&nbsp;
      New MRI machine installed in Radiology Department. &nbsp;&nbsp;|&nbsp;&nbsp;
      Blood donation camp scheduled for 12th November.
    </marquee>
  </div>
</div>

  <!-- Carousel -->
  <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="images/banner1.jpg" class="d-block w-100" alt="Hospital Banner 1">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>
  </div>

  <!-- Main Content -->
 <!-- Notifications, Tenders, Recruitment + Important Persons Section -->
<div class="container my-4">
  <div class="row align-items-stretch">
    
    <!-- Left: Tabs Section (Wider) -->
    <div class="col-lg-7 col-md-7">
      <ul class="nav nav-tabs" id="infoTabs" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="notifications-tab" data-bs-toggle="tab" data-bs-target="#notifications" type="button" role="tab">Notifications</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="tenders-tab" data-bs-toggle="tab" data-bs-target="#tenders" type="button" role="tab">Tenders</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="recruitment-tab" data-bs-toggle="tab" data-bs-target="#recruitment" type="button" role="tab">Recruitment</button>
        </li>
      </ul>

      <div class="tab-content p-3 border border-top-0 bg-white rounded-bottom" id="infoTabsContent" style="height: 90%;">
        <div class="tab-pane fade show active" id="notifications" role="tabpanel">
          <ul>
            <li>Annual cultural fest announced.</li>
            <li>Holiday on 8th Nov due to Diwali.</li>
            <li>Blood donation camp registration open.</li>
            <li>Notice regarding annual health checkup.</li>
          </ul>
        </div>
        <div class="tab-pane fade" id="tenders" role="tabpanel">
          <ul>
            <li>Tender for college canteen renovation.</li>
            <li>Quotation invited for lab equipment.</li>
            <li>AMC for network systems.</li>
          </ul>
        </div>
        <div class="tab-pane fade" id="recruitment" role="tabpanel">
          <ul>
            <li>Applications invited for Assistant Professor (Physics).</li>
            <li>Recruitment for Library Assistant open till 20th Nov.</li>
            <li>Walk-in interview for Nursing Staff.</li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Right: Person Cards (Narrower) -->
    <div class="col-md-4">
  <div class="card p-3 shadow-sm" style="border-radius: 15px;">
    <div class="d-flex align-items-center mb-4">
      <img src="images/shri-vinai-kumar-saxena11_0.jpg" class="rounded-circle me-3 person-img" alt="Person 1">
            <div>
              <h5 class="mb-1">Shri Vinai Kumar Saxena</h5>
              <p class="mb-0 text-muted">Lieutenant Governor</p>
            </div>
    </div>

    <div class="d-flex align-items-center mb-4">
      <img src="images/rekha_gupta.jpg" class="rounded-circle me-3 person-img" alt="Person 2">
            <div>
              <h5 class="mb-1">Smt. Rekha Gupta</h5>
              <p class="mb-0 text-muted">Chief Minister</p>
            </div>
    </div>

    <div class="d-flex align-items-center">
      <img src="images/1000358422.jpg" class="rounded-circle me-3 person-img" alt="Person 3">
            <div>
              <h5 class="mb-1">Dr. Pankaj Kumar Singh</h5>
              <p class="mb-0 text-muted">Minister</p>
            </div>
    </div>
  </div>
</div>

  </div>
</div>
<footer class="text-white pt-4" style="background-color:#0b222c; font-size: 0.9rem;">

  <div class="container text-center">



    <!-- Footer Links Row -->

    <div class="mb-3">

      <a href="#" class="text-white text-decoration-none mx-2">Admin Login</a> |

      <a href="#" class="text-white text-decoration-none mx-2">Site Map</a> |

      <a href="#" class="text-white text-decoration-none mx-2">Contact Us</a> |

      <a href="#" class="text-white text-decoration-none mx-2">RTI</a> |

      <a href="#" class="text-white text-decoration-none mx-2">Disclaimer</a> |

      <a href="#" class="text-white text-decoration-none mx-2">Terms & Conditions</a> |

      <a href="#" class="text-white text-decoration-none mx-2">Privacy Policy</a>

    </div>



    

    <div class="mb-3">

      © 2016 All Rights Reserved.

    </div>



    <!-- Portal Description -->

    <div class="small px-3" style="max-width:900px; margin:auto;">

      This is the Portal of Indian Railways, developed with an objective to enable a single window access to 

      information and services being provided by the various Indian Railways entities. The content in this Portal 

      is the result of a collaborative effort of various Indian Railways Entities and Departments. Maintained by 

      <strong>CRIS, Ministry of Railways, Government of India.</strong>

    </div>



  </div>



  <!-- Bottom Bar -->

  <div class="text-center py-2 mt-3" style="background-color:#06151c; font-size:0.85rem;">

    Government of India | Ministry of Railways

  </div>

</footer>


  <!-- Date and Time Script -->
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

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
