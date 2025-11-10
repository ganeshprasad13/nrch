	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	  <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title>Indian Railway Post Graduate Institute of Medical Sciences and Research</title>
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  <style>
	  
	    
	.news-bar {
	  background-color: #003366;
	  color: white;
	  padding: 6px 0;
	  font-weight: 500;
	  font-size: 0.95rem;
	  white-space: nowrap; 
	}
	
	
	.modern-card {
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
	/*   .card img {
	  object-fit: cover;
	  border: 2px solid #dee2e6;
	}
	 */
	 
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
	 
	li{
	font-weight: bold;
	}
	.bottom-section {
	  background-color: #ffffff;
	  border-top: 2px solid #d0d0d0;
	}
	
	.bottom-section p {
	  line-height: 1.8;
	  font-size: 1.05rem;
	  color: #333333; /* darker paragraph text */
	}
	
	.read-more-btn {
	  color: #0d47a1;
	  font-weight: 600;
	  text-decoration: none;
	  border-bottom: 2px solid transparent;
	  transition: all 0.3s ease;
	}
	
	.read-more-btn:hover {
	  color: #003c8f;
	  border-bottom: 2px solid #0d47a1;
	}

	.read-more-btn {
	  color: #0d47a1;
	  font-weight: 600;
	  text-decoration: none;
	  border-bottom: 2px solid transparent;
	  transition: all 0.3s ease;
	}
	
	.read-more-btn:hover {
	  color: #003c8f;
	  border-bottom: 2px solid #0d47a1;
	}
	
	.carousel-img {
	  height: 613px; 
	  object-fit: cover; 
	  cursor: pointer;
	}
	.circle-link {
	  text-decoration: none;
	  color: #003366;
	  display: inline-block;
	  transition: transform 0.3s ease, color 0.3s ease;
	}
	
	.circle-link p {
	  margin-top: 10px;
	  font-weight: 600;
	  font-size: 0.95rem;
	}
	.circle-link:hover p {
	  color: #0d6efd;
	}
	
	
	.circular-links {
	  background-color: #e8f4ff;
	  padding-top: 2rem;
	  padding-bottom: 2rem;
	  border-top: 2px solid #cfe7ff;
	  border-bottom: 2px solid #cfe7ff;
	}
	
	.circle-link {
	  text-decoration: none;
	  color: #003366;
	  display: inline-block;
	  transition: transform 0.3s ease, color 0.3s ease;
	}
	
	.circle-link img {
	  width: 110px;
	  height: 110px;
	  object-fit: cover;
	  border-radius: 50%;
	  border: 3px solid #004080;
	  padding: 10px;
	  
	  background: radial-gradient(circle at 30% 30%, #ffd699, #496de1);
	  transition: all 0.3s ease;
	  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15); /* subtle outer shadow */
	  position: relative;
	  overflow: hidden;
	}
	
	/* ✨ Add glossy light reflection */
	.circle-link img::before {
	  content: "";
	  position: absolute;
	  top: 5%;
	  left: 5%;
	  width: 90%;
	  height: 40%;
	  border-radius: 50%;
	  background: rgba(255, 255, 255, 0.4);
	  filter: blur(6px);
	  pointer-events: none;
	}
	
	/* Hover effect */
	.circle-link:hover img {
	  transform: scale(1.1);
	  border-color: #0d6efd;
	  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
	}
	    
	    
	   .person-card {
	  position: relative;
	  overflow: hidden;
	  transition: transform 0.3s ease, box-shadow 0.3s ease;
	}
	
	/* .person-card:hover {
	  transform: translateY(-5px);
	  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
	} */
	
	/* Profile Image Styling */
	.person-img {
		  width: 110px;
		  height: 110px;
		  object-fit: fill;
		  border-radius: 50%;
		  border: 2px solid #004080;
		   /* ✨ subtle outer glow */
		  transition: all 0.3s ease;
		  position: relative;
		  z-index: 1;
		}
	
	/* Hover zoom effect on image */
	/* .person-card:hover .person-img {
	  transform: scale(1.1);
	 
	} */
	
	/* Text overlay effect (hidden by default) */
	/* .person-card .person-overlay {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 110px;
	  height: 110px;
	  border-radius: 50%;
	  background: rgba(0, 64, 128, 0.7);
	  color: #fff;
	  display: flex;
	  align-items: center;	
	  justify-content: center;
	  opacity: 0;
	  transition: opacity 0.4s ease;
	  text-align: center;
	  font-size: 0.9rem;
	  font-weight: 600;
	} */
	
	/* Show overlay text on hover */
	/* .person-card:hover .person-overlay {	
	  opacity: 1;
	  
	} */
	    
	    
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
	      Latest New 1! &nbsp;&nbsp;|&nbsp;&nbsp;
	      Latest New 2. &nbsp;&nbsp;|&nbsp;&nbsp;
	      Latest New 3.
	    </marquee>
	  </div>
	</div>
	
	  <!-- Carousel -->
	  <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
	    <div class="carousel-inner">
	    <div class="carousel-item active">
	        <img src="/nrch/images/banner1.jpg" style="cursor:pointer;width:100%;height:613px" >
	      </div>
	      <!-- <div class="carousel-item">
	        <img src="https://cbpssubscriber.mygov.in/assets/uploads/3rpbtfC38B9muoRQ?51" id="_7yCsbneY8uXMxwGe" onclick="javascript:window.open('https://cbpssubscriber.mygov.in/aff/7yCsbneY8uXMxwGe')" style="cursor:pointer;width:100%;height:auto" onload="javascript:(function(){if(typeof _done == 'undefined' || !_done){this.setAttribute('src', this.getAttribute('src')+'?'+Math.floor((Math.random() * 100) + 1)); _done=true;}}).call(this)">
	      </div> -->
	     
	      <% for(int i = 1; i <= 19; i++) { %>
			  <div class="carousel-item">
	        <img src="/nrch/images/gallery/picture<%=i%>.png"  style="cursor:pointer;width:100%;height:613px" 
	          onerror="this.onerror=null;this.src='/nrch/images/gallery/picture<%=i%>.jpg';">
	        
	      </div>
			<% } %>
	    </div>
	    
	    <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
	      <span class="carousel-control-prev-icon"></span>
	    </button>
	    <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
	      <span class="carousel-control-next-icon"></span>
	    </button>
	  </div>
	

	  <!-- ====== Circular Quick Links Section (below carousel) ====== -->
<section class="circular-links py-4">
  <div class="container text-center">
    <div class="row justify-content-center g-4">
      
      <div class="col-6 col-sm-4 col-md-2">
        <a href="/nrch/nodata.jsp" class="circle-link">
          <img src="images/icon1.png" alt="Faculty">
          <p>Faculty</p>
        </a>
      </div>

      <div class="col-6 col-sm-4 col-md-2">
        <a href="/nrch/nodata.jsp" class="circle-link">
          <img src="images/patient.png" alt="Patient">
          <p>Patient</p>
        </a>
      </div>

      <div class="col-6 col-sm-4 col-md-2">
        <a href="/nrch/nodata.jsp" class="circle-link">
          <img src="images/icon3.png" alt="Student">
          <p>Student</p>
        </a>
      </div>

      <div class="col-6 col-sm-4 col-md-2">
        <a href="/nrch/nodata.jsp" class="circle-link">
          <img src="images/icon4.png" alt="Employee">
          <p>Employee</p>
        </a>
      </div>

      <div class="col-6 col-sm-4 col-md-2">
        <a href="/nrch/nodata.jsp" class="circle-link">
          <img src="images/icon5.png" alt="Vendor">
          <p>Vendor</p>
        </a>
      </div>

      <div class="col-6 col-sm-4 col-md-2">
        <a href="/nrch/nodata.jsp" class="circle-link">
          <img src="images/visitors.png" alt="Visitor">
          <p>Visitor</p>
        </a>
      </div>

    </div>
	</div>
</section>


	  <!-- Main Content -->
	 <!-- Notifications, Tenders, Recruitment + Important Persons Section -->
	<div class="container my-4">
	  <div class="row align-items-stretch">
	    
	    <!-- Left: Tabs Section (Wider) -->
	    <div class="col-md-8">
	      <ul class="nav nav-tabs" id="infoTabs" role="tablist">
		<li class="nav-item" role="presentation">
	          <button class="nav-link active" id="whats-new-tab" data-bs-toggle="tab" data-bs-target="#whatsNew" type="button" role="tab">What's New</button>
	        </li>
	        <li class="nav-item" role="presentation">
	          <button class="nav-link" id="notifications-tab" data-bs-toggle="tab" data-bs-target="#notifications" type="button" role="tab">Notifications</button>
	        </li>
	        <li class="nav-item" role="presentation">
	          <button class="nav-link" id="tenders-tab" data-bs-toggle="tab" data-bs-target="#tenders" type="button" role="tab">Tenders</button>
	        </li>
	        <li class="nav-item" role="presentation">
	          <button class="nav-link" id="recruitment-tab" data-bs-toggle="tab" data-bs-target="#recruitment" type="button" role="tab">Recruitment</button>
	        </li>
	      </ul>
	
	
	    <div class="tab-content border border-top-0 bg-white rounded-bottom" id="infoTabsContent" style="height: 450px; overflow-y: scroll;">
		  <div class="tab-pane fade show active" id="whatsNew" role="tabpanel">
		    <ul>
		      <li>Sample content 1</li>
		      <li>Sample content 2</li>
		      <li>Sample content 3</li>
		      <li>Sample content 4</li>
		      <li>Sample content 5</li>
		      <li>Sample content 6</li>
		      <li>Sample content 7</li>
		      <li>Sample content 8</li>
		    </ul>
		  </div>
		
		  <div class="tab-pane fade show" id="notifications" role="tabpanel">
		    <ul>
		      <li>Sample notification 1</li>
		      <li>Sample notification 2</li>
		      <li>Sample notification 3</li>
		      <li>Sample notification 4</li>
		      <li>Sample notification 5</li>
		    </ul>
		  </div>
		
		  <div class="tab-pane fade" id="tenders" role="tabpanel">
		    <ul>
		      <li>Sample tender 1</li>
		      <li>Sample tender 2</li>
		      <li>Sample tender 3</li>
		    </ul>
		  </div>
		
		  <div class="tab-pane fade" id="recruitment" role="tabpanel">
		    <ul>
		      <li>Sample recruitment 1</li>
		      <li>Sample recruitment 2</li>
		      <li>Sample recruitment 3</li>
		    </ul>
		  </div>
		</div>      
	    </div>
	
	    <!-- Right: Person Cards (Narrower) -->
	 <div class="col-md-4">
  <div class="card p-3 shadow-sm modern-card" style="border-radius: 12px; margin-top: 40px; height: 450px;">
    
	    <!-- Person 1 -->
	    <div class="d-flex align-items-center mb-4 person-card">
	      <div style="position: relative; margin-right: 15px;">
	        <img src="images/ministers/Shri-Ashwini-Vaishnaw.png" class="person-img" alt="Person 1">
	      </div>
	      <div>
	        <h5 class="mb-1">Shri Ashwini Vaishnaw</h5>
	        <p class="mb-0 text-muted">Honourable Minister of Railways</p>
	      </div>
	    </div>
	
	    <!-- Person 2 -->
	    <div class="d-flex align-items-center mb-4 person-card">
	      <div style="position: relative; margin-right: 15px;">
	        <img src="images/ministers/Shri V Somanna.jpg" class="person-img" alt="Person 2">
	        
	      </div>
	      <div>
	        <h5 class="mb-1">Shri V. Somanna</h5>
	        <p class="mb-0 text-muted">Honourable Minister of State for Railways</p>
	      </div>
	    </div>
	
	    <!-- Person 3 -->
	    <div class="d-flex align-items-center person-card">
	      <div style="position: relative; margin-right: 15px;">
	        <img src="images/ministers/Shri Ravneet Singh.jpg" class="person-img" alt="Person 3">
	        	
	      </div>
	      <div>
	        <h5 class="mb-1">Shri Ravneet Singh</h5>
	        <p class="mb-0 text-muted">Honourable Minister of State for Railways</p>
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