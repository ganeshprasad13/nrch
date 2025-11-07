<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <a class="navbar-brand d-lg-none" href="#">NRCH</a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav mx-auto">

        <li class="nav-item">
          <a class="nav-link active" href="#">Home</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">About Us</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="Overview.jsp">Overview</a></li>
            <li><a class="dropdown-item" href="#">Mission & Vision</a></li>	
            <li><a class="dropdown-item" href="#">Administration</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Departments</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Cardiology</a></li>
            <li><a class="dropdown-item" href="#">Orthopedics</a></li>
            <li><a class="dropdown-item" href="#">Radiology</a></li>
            <li><a class="dropdown-item" href="#">Emergency</a></li>
          </ul>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Admission</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Student Zone</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Courses</a></li>
            <li><a class="dropdown-item" href="#">Schedules</a></li>
            <li><a class="dropdown-item" href="#">Results</a></li>
          </ul>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Circulars & Notifications</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Contact Us</a>
        </li>

      </ul>
    </div>
  </div>
</nav>
