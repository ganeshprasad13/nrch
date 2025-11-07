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
	  
	    
	    .news-bar {
	  background-color: #003366;
	  color: white;
	  padding: 6px 0;
	  font-weight: 500;
	  font-size: 0.95rem;
	  white-space: nowrap; /* ensures it stays on one line */
	}
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
	 
	
	    
	  </style>
	</head>
	<body>
	
	 <!-- header start -->
	 
	 <%@ include file="header/header.jsp" %>
	 
	 <!--  header end -->
	 
	 
	  <!-- Latest News Bar -->
	  <div class="news-bar">
	  <div class="container d-flex align-items-center overflow-hidden">
	    <strong class="me-2 flex-shrink-0 text-warning">Latest News:</strong>
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
	        <img src="images/banner1.jpg" class="d-block w-100" alt="Hospital Banner 1" height="450px">
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
	
	
	
	
	
	
	
	<!-- footer start-->
	<%@ include file="header/footer.jsp" %>
	<!-- footer end-->

	 
	
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	</body>
	</html>
