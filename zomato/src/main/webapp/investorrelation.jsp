<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Zomato</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/investorrelation.css">
</head>
<body>
 
 
  

      <nav class="navbar navbar-expand-lg bg-danger fixed-top">
        <div class="container-fluid">
        
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
             <li class="nav-item">
                <a class="nav-link active text-white" aria-current="page" href="home.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active text-white" href="investorrelation.jsp">Investor Relation</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="addrestaurant.jsp">Add Restaurant</a>
              </li>
             
            
              
              
               <li class="nav-item">
              <a class="nav-link text-white" href="login.jsp">Login</a>
              </li>
            
            
              <li class="nav-item">
              <a class="nav-link text-white" href="Registration.jsp">Registration</a>
              </li>
            
             <li class="nav-item">
              <a class="nav-link text-white" href="login.jsp">Logout</a>
              </li>
            
            </ul>
          
          </div>
        </div>
      </nav>
 
      




  <div class="container py-5 mt-5 yash">
    <h2 class="text-center mb-5">Our core offerings</h2>
    <div class="row g-4">
      <!-- Food Delivery Card -->
      <div class="col-md-6">
        <div class="card p-4 shadow-sm rounded">
          <div class="d-flex justify-content-between align-items-center mb-3">
            <div>
              <h4>Food delivery</h4>
              <p class="text-muted">
                Food ordering and delivery platform where customers can search and discover local restaurants, order food, and have it delivered reliably and quickly.
              </p>
            </div>
            <img src="./images/investorrelation/zomato logo.webp" alt="Zomato Logo" class="logo">
          </div>
          <p class="text-muted">Q2FY25</p>
          <div class="d-flex justify-content-between align-items-center mt-3">
            <div>
              <h5>INR 9,690 crore</h5>
              <p class="text-muted">Food delivery GOV</p>
            </div>
            <div>
              <h5>20.7 million</h5>
              <p class="text-muted">Avg. monthly transacting customers</p>
            </div>
          </div>
        </div>
      </div>
      <!-- Quick Commerce Card -->
      <div class="col-md-6">
        <div class="card p-4 shadow-sm rounded h-100">
          <div class="d-flex justify-content-between align-items-center mb-3">
            <div>
              <h4>Quick commerce</h4>
              <p class="text-muted">
                Quick commerce platform where customers can order everyday needs across thousands of products and have them delivered within minutes.
              </p>
            </div>
            <img src="./images/investorrelation/blinkit.png" alt="Blinkit Logo" class="logo">
          </div>
          <p class="text-muted">Q2FY25</p>
          <div class="d-flex justify-content-between align-items-center mt-3">
            <div>
              <h5>INR 6,132 crore</h5>
              <p class="text-muted">Quick commerce GOV</p>
            </div>
            <div>
              <h5>8.9 million</h5>
              <p class="text-muted">Avg. monthly transacting customers</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <div class="container py-5">
    <h2 class="text-center mb-3">Beyond business</h2>
    <p class="text-center text-muted mb-5">
      At Zomato, our business approach is guided by our commitment to responsible and sustainable growth. Our ESG update outlines the many ways in which we make the impact of our business more sustainable and help make the world a better place for everyone. Some of our key sustainability initiatives include:
    </p>
    <div class="row g-4">
      <!-- Feeding India Card -->
      <div class="col-md-4">
        <div class="card p-3 shadow-sm rounded">
          <img src="./images/investorrelation/fruit and hand.webp" alt="Feeding India" class="card-img-top rounded">
          <div class="card-body">
            <h5 class="card-title">Feeding India</h5>
            <p class="card-text text-muted">
              A not-for-profit organisation, designing interventions to reduce hunger and malnutrition among underserved communities in India.
            </p>
          </div>
        </div>
      </div>
      <!-- Net Zero Emissions Card -->
      <div class="col-md-4">
        <div class="card p-3 shadow-sm rounded">
          <img src="./images/investorrelation/electric pump.webp " alt="Net Zero Emissions" class="card-img-top rounded">
          <div class="card-body">
            <h5 class="card-title">Net zero emissions</h5>
            <p class="card-text text-muted">
              Starting FY24, we have taken on a goal to achieve Net Zero emissions across Zomato’s food delivery value chain by 2033.
            </p>
          </div>
        </div>
      </div>
      <!-- Reducing Plastic Waste Card -->
      <div class="col-md-4">
        <div class="card p-3 shadow-sm rounded h-100">
          <img src="./images/investorrelation/dusbin.webp" alt="Reducing Plastic Waste" class="card-img-top rounded">
          <div class="card-body">
            <h5 class="card-title">Reducing plastic waste</h5>
            <p class="card-text text-muted">
              Trying to reduce Zomato’s plastic waste by ensuring completely plastic-neutral deliveries since April 2022.
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="text-center mt-4">
      <a href="#" class="text-danger">See the latest ESG update</a>
    </div>
  </div>


  <div class="container my-5">
    <h2 class="text-center mb-4">From our blogs</h2>
    <div class="row">
        <!-- Blog Card 1 -->
        <div class="col-md-4">
            <div class="card h-100">
                <img src="./images/investorrelation/Resize-1-1.jpg" class="card-img-top" alt="Blog Image 1">
                <div class="card-body">
                    <p class="text-muted">Shuvra Saha | 27 December 2024</p>
                    <h5 class="card-title">The Big Brand Theory | Carving a Spice Trail</h5>
                    <p class="card-text">Explore how the fusion of tradition and innovation shaped the creation of a legacy brand.</p>
                </div>
            </div>
        </div>
        <!-- Blog Card 2 -->
        <div class="col-md-4">
            <div class="card h-100">
                <img src="./images/investorrelation/amoraBanner1.jpg" class="card-img-top" alt="Blog Image 2">
                <div class="card-body">
                    <p class="text-muted">Shuvra Saha | 16 December 2024</p>
                    <h5 class="card-title">The Big Brand Theory | From Trekking to Gelato</h5>
                    <p class="card-text">Discover how the founders of Amore Gelato are bringing the true taste of Italian gelato to India!</p>
                </div>
            </div>
        </div>
        <!-- Blog Card 3 -->
        <div class="col-md-4">
            <div class="card h-100">
                <img src="./images/investorrelation/plastic banner2.jpg" class="card-img-top" alt="Blog Image 3">
                <div class="card-body">
                    <p class="text-muted">Anjali Kumar | 13 December 2024</p>
                    <h5 class="card-title">Introducing Zomato’s Plastic-Free Future</h5>
                    <p class="card-text">Recognizing restaurant partners for embracing plastic-free food delivery packaging options.</p>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container my-5">
  <div class="row align-items-center">
      <!-- Subscription Section -->
      <div class="col-md-6">
          <h3>Subscribe to our email alerts</h3>
          <p>Get regular updates through email.</p>
          <form>
              <div class="mb-3">
                  <input type="email" class="form-control" placeholder="Email" required>
              </div>
              <button type="submit" class="btn btn-danger">Subscribe</button>
          </form>
      </div>
      <!-- Contact Section -->
      <div class="col-md-6">
          <h3>Have questions?</h3>
          <p>Reach out to us by emailing at <a href="mailto:shareholders@zomato.com" class="text-danger">shareholders@zomato.com</a>, and we’ll get back to you.</p>
          <button class="btn btn-danger">Contact Us</button>
      </div>
  </div>
</div>



<footer class="footer">
  <div class="container">
      <div class="row">
        
          <div class="col-12 col-md-4 col-xl">
              <img src="./images/home/zomato footer logo.webp" class="img fluid mb-3 w-50" alt="">
              <h5>ABOUT ZOMATO</h5>
              <ul class="list-unstyled">
                  <li><a href="#">Who We Are</a></li>
                  <li><a href="#">Blog</a></li>
                  <li><a href="#">Work With Us</a></li>
                  <li><a href="#">Investor Relations</a></li>
                  <li><a href="#">Report Fraud</a></li>
                  <li><a href="#">Press Kit</a></li>
                  <li><a href="#">Contact Us</a></li>
              </ul>
          </div>
    
          <div class="col-12 col-md-4 col-xl">
              <h5>ZOMAVERSE</h5>
              <ul class="list-unstyled">
                  <li><a href="#">Zomato</a></li>
                  <li><a href="#">Blinkit</a></li>
                  <li><a href="#">District</a></li>
                  <li><a href="#">Feeding India</a></li>
                  <li><a href="#">Hyperpure</a></li>
                  <li><a href="#">Zomaland</a></li>
                  <li><a href="#">Weather Union</a></li>
              </ul>
          </div>

    
          <div class="col-12 col-md-4 col-xl">
              <h5>FOR RESTAURANTS</h5>
              <ul class="list-unstyled">
                  <li><a href="#">Partner With Us</a></li>
                  <li><a href="#">Apps For You</a></li>
              </ul>
          </div>

          <div class="col-12 col-md-4 col-xl">
              <h5>LEARN MORE</h5>
              <ul class="list-unstyled">
                <li><a href="#">Privacy</a></li>
                <li><a href="#">Security</a></li>
                <li><a href="#">Terms</a></li>
            </ul>
          </div>


          <div class="col-12 col-md-4 col-xl">
            <div class="row">
            <div class="col-6 col-lg-4">
            <div class="dropdown">
              <button class="btn btn-outline-light text-dark dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="./images/home/Flag_of_India.svg.png"
                  alt="" class="img-fluid w-50">  India
              </button>
              <ul class="dropdown-menu">
                <li><button class="dropdown-item" type="button">USA</button></li>
                <li><button class="dropdown-item" type="button">UK</button></li>
                <li><button class="dropdown-item" type="button">UAE</button></li>
              </ul>
            </div>
            </div>
            <div class="col-6 col-lg-4">
              <div class="dropdown">
              <button class="btn btn-outline-light text-dark dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-globe"></i>  English
              </button>
              <ul class="dropdown-menu">
                <li><button class="dropdown-item" type="button">HINDI</button></li>
                <li><button class="dropdown-item" type="button">MARATHI</button></li>
                <li><button class="dropdown-item" type="button">KANNADA</button></li>
              </ul>
            </div>
          </div>
          </div>
            <ul class="list-unstyled text-center mt-3">
              <li><a href="#">Social Links</a></li>
              <a href="#"><i class="fab fa-linkedin-in mx-1"></i></a>
              <a href="#"><i class="fab fa-instagram mx-1"></i></a>
              <a href="#"><i class="fas fa-times mx-1"></i></a>
                  <a href="#"><i class="fab fa-youtube-square mx-1"></i></a>
                  <a href="#"><i class="fab fa-facebook-f mx-1"></i></a>

                  <div class="mt-3">
                <a href="https://play.google.com/store/search?q=zomato&c=apps&hl=en" target="_blank">  <img src="./img/Zomato/Zomato profile/google play.webp"
                  alt="" class="img-fluid w-50"></a>
                  <a href="https://apps.apple.com/in/app/zomato-food-delivery-dining/id434613896" target="_blank">
                  <img src="./images/home/app store.webp"
                  alt="" class="img-fluid w-50 mt-3"></a>
                </div>
          </ul>
        </div>

        


      </div>
  </div>
</footer>


  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/javascript/js/script.js"></script>

</body>
</html>
