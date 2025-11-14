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

      <!-- Example Departments — add all 20+ here -->
      <a href="#" id="dept-ent" class="circle-link dept-btn dept-active" data-dept="ENT">
  <div class="circle-bg"><span>ENT</span></div>
</a>

<a href="#" id="dept-ortho" class="circle-link dept-btn" data-dept="Orthopaedics">
  <div class="circle-bg"><span>Orthopaedics</span></div>
</a>

<a href="#" id="dept-gm" class="circle-link dept-btn" data-dept="General Medicine">
  <div class="circle-bg"><span>General Medicine</span></div>
</a>

<a href="#" id="dept-cardio" class="circle-link dept-btn" data-dept="Cardiology">
  <div class="circle-bg"><span>Cardiology</span></div>
</a>

<a href="#" id="dept-derma" class="circle-link dept-btn" data-dept="Dermatology">
  <div class="circle-bg"><span>Dermatology</span></div>
</a>

<a href="#" id="dept-radio" class="circle-link dept-btn" data-dept="Radiology">
  <div class="circle-bg"><span>Radiology</span></div>
</a>

<!-- More Departments Added Below -->

<a href="#" id="dept-surgery" class="circle-link dept-btn" data-dept="Surgery">
  <div class="circle-bg"><span>Surgery</span></div>
</a>

<a href="#" id="dept-anaesthesia" class="circle-link dept-btn" data-dept="Anaesthesia">
  <div class="circle-bg"><span>Anaesthesia</span></div>
</a>

<a href="#" id="dept-paediatrics" class="circle-link dept-btn" data-dept="Paediatrics">
  <div class="circle-bg"><span>Paediatrics</span></div>
</a>

<a href="#" id="dept-ophthal" class="circle-link dept-btn" data-dept="Ophthalmology">
  <div class="circle-bg"><span>Ophthalmology</span></div>
</a>

<a href="#" id="dept-psy" class="circle-link dept-btn" data-dept="Psychiatry">
  <div class="circle-bg"><span>Psychiatry</span></div>
</a>

<a href="#" id="dept-pathology" class="circle-link dept-btn" data-dept="Pathology">
  <div class="circle-bg"><span>Pathology</span></div>
</a>

<a href="#" id="dept-microbiology" class="circle-link dept-btn" data-dept="Microbiology">
  <div class="circle-bg"><span>Microbiology</span></div>
</a>

<a href="#" id="dept-dental" class="circle-link dept-btn" data-dept="Dental">
  <div class="circle-bg"><span>Dental</span></div>
</a>

<a href="#" id="dept-urology" class="circle-link dept-btn" data-dept="Urology">
  <div class="circle-bg"><span>Urology</span></div>
</a>

<a href="#" id="dept-neuro" class="circle-link dept-btn" data-dept="Neurology">
  <div class="circle-bg"><span>Neurology</span></div>
</a>

<a href="#" id="dept-gastro" class="circle-link dept-btn" data-dept="Gastroenterology">
  <div class="circle-bg"><span>Gastroenterology</span></div>
</a>

      <!-- Add all other departments — they will scroll -->
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

      <table class="faculty-table" id="faculty-table">
        <thead>
          <tr>
            <th>Department</th>
            <th>Designation</th>
            <th>Name</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>

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
  {dept:"MEDICINE", desig:"Professor", name:"Dr. Sanjay Joshi"},
  {dept:"MEDICINE", desig:"Professor", name:"Dr. Atul Gupta"},
  {dept:"MEDICINE", desig:"Assistant Professor", name:"Dr. Siddharth M."},

  {dept:"ENT", desig:"Professor", name:"Dr. Shruti Ogra"},
  {dept:"ENT", desig:"Professor", name:"Dr. Divya Gupta"},
  {dept:"ENT", desig:"Assistant Professor", name:"Dr. XYZ"},

  {dept:"ORTHOPAEDICS", desig:"Professor", name:"Dr. Ashutosh Kapoor"},
  {dept:"ORTHOPAEDICS", desig:"Assistant Professor", name:"Dr. S.P. Sharma"},

  {dept:"GYNAECOLOGY", desig:"Professor", name:"Dr. Anita Bansal"},
  {dept:"GYNAECOLOGY", desig:"Associate Professor", name:"Dr. Shuchi Sharma"},

  {dept:"ANAESTHESIA", desig:"Professor", name:"Dr. Mamta Chadha"},
  {dept:"ANAESTHESIA", desig:"Assistant Professor", name:"Dr. Dildeep Singh"},
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
    
    let filtered = facultyData.filter(f => f.dept === dept);

    filtered.forEach(f => {
      tbody.innerHTML += `
        <tr>
          <td>${f.dept}</td>
          <td>${f.desig}</td>
          <td>${f.name}</td>
        </tr>`;
    });

    document.getElementById("faculty-section").style.display = "block";
  }
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

    let filtered = facultyData.filter(f => f.dept === dept);

    filtered.forEach(f => {
      tbody.innerHTML += `
        <tr>
          <td>${f.dept}</td>
          <td>${f.desig}</td>
          <td>${f.name}</td>
        </tr>`;
    });

    document.getElementById("faculty-section").style.display = "block";
    document.getElementById("faculty-section").scrollIntoView({behavior: "smooth"});
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


</script>

</body>
</html>
