<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zomato</title>
    <link rel="stylesheet" href="css/addrestaurant.css">
    <link rel="icon" href="images/illustration/Revlon_Logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  
  </head>
  <body>
    <section><!--main section-->

   

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

      


      <section>  <!-- Home section -->
        <div class="image-container yash">
          <img src="./images/home/homebackground.jpg" alt="Background Image" class="img-fluid">
          <div class="text-overlay">
          <h1 class="fw-bold text-danger">zomato</h1>
          
         <a href="register.jsp" class="btn btn-primary register-button">Register Your Restaurant</a>

        
        </div>
        </div>  
</section>   <!-- end Home section -->


<div class="container my-5 text-center">
  <div class="row">
      <div class="col-md-4">
          <div class="icon-container mb-3">
              <img src="./images/home/peopleicon.webp" alt="Attract Customers">
          </div>
          <h5>Attract new customers</h5>
          <p>Reach the millions of people ordering on Zomato</p>
      </div>
      <div class="col-md-4">
          <div class="icon-container mb-3">
              <img src="./images/home/bagicon.png" alt="Doorstep Delivery">
          </div>
          <h5>Doorstep delivery convenience</h5>
          <p>Easily get your orders delivered through our trained delivery partners</p>
      </div>
      <div class="col-md-4">
          <div class="icon-container mb-3">
              <img src="./images/home/headphoneicon.png" alt="Hotline Support">
          </div>
          <h5>Hotline support</h5>
          <p>On-call support for any issues or growth consultations</p>
      </div>
  </div>
</div>

<!-- Success Stories Section -->
<div class="container my-5">
  <h3 class="text-center mb-4">Restaurant success stories</h3>
  <div class="row">
    <div class="col-md-4">
        <div class="card p-3">
            <p>Zomato enabled me to restart my operations post-COVID when I had no hope of doing business again...</p>
            <p><strong>Arshad Khan</strong><br>Owner - Khushboo Biryani, Shillong</p>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card p-3">
            <p>Thanks to Zomato's invaluable support, our startup cloud kitchen has been doing wonders...</p>
            <p><strong>Vijay</strong><br>Owner - Birgo</p>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card p-3 h-100">
            <p>Zomato helped us grow by 60% since registration...</p>
            <p><strong>Sandeep K Mohan</strong><br>Owner - Mysore Raman Idli, Kerala</p>
        </div>
    </div>
</div>

</div>







<section class="container">

<div><h3>Explore options near me</h3>
  <div class="accordion" id="accordionExample">
    <div class="accordion-item mb-4 mt-4">
      <h2 class="accordion-header" id="headingOne">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Popular Cuisines Near Me
        </button>
      </h2>
      <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <a href="#" class="text-dark text-decoration-none">.Beverages near me  </a> <a href="#" class="text-dark text-decoration-none">.Biryani near me </a> <a href="#" class="text-dark text-decoration-none">.Burger near me </a> <a href="#" class="text-dark text-decoration-none">.Chinese near me </a> <a href="#" class="text-dark text-decoration-none">.Coffee near me </a> <a href="#" class="text-dark text-decoration-none">.Desserts near me </a> <a href="#" class="text-dark text-decoration-none">.Ice Cream near me </a> <a href="#" class="text-dark text-decoration-none">.Kebab near me </a>  <a href="#" class="text-dark text-decoration-none">.Maharashtrian near me </a>  <a href="#" class="text-dark text-decoration-none">.Momos near me </a> <a href="#" class="text-dark text-decoration-none">.Mughlai near me </a>  <a href="#" class="text-dark text-decoration-none">.North Indian near me </a> <a href="#" class="text-dark text-decoration-none">.Pizza near me </a> <a href="#" class="text-dark text-decoration-none">.Rolls near me </a>.
        </div>
      </div>
    </div>
    <div class="accordion-item mb-4 mt-4">
      <h2 class="accordion-header" id="headingTwo">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Popular Restaurant Types Near me
        </button>
      </h2>
      <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <a href="#" class="text-dark text-decoration-none">.Bakeries near me  </a> <a href="#" class="text-dark text-decoration-none">.Bars near me </a> <a href="#" class="text-dark text-decoration-none">.Beverage Shop near me </a> <a href="#" class="text-dark text-decoration-none">.Bhojnalay near me </a> <a href="#" class="text-dark text-decoration-none">.Coffee near me </a> <a href="#" class="text-dark text-decoration-none">.Clubs near me </a> <a href="#" class="text-dark text-decoration-none">.Dhabas near me </a> <a href="#" class="text-dark text-decoration-none">.Food Courts near me </a>  <a href="#" class="text-dark text-decoration-none">.Food Trucks near me </a>  <a href="#" class="text-dark text-decoration-none">.Irani Cafes near me </a> <a href="#" class="text-dark text-decoration-none">.Kiosks near me </a>  <a href="#" class="text-dark text-decoration-none">.Lounges near me </a> <a href="#" class="text-dark text-decoration-none">.Pubs near me </a> <a href="#" class="text-dark text-decoration-none">.Paan Shop near me </a>.        </div>
      </div>
    </div>
    <div class="accordion-item mb-4 mt-4">
      <h2 class="accordion-header" id="headingThree">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Top Restaurant Chains

        </button>
      </h2>
      <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <a href="#" class="text-dark text-decoration-none">.Burger Singh  </a> <a href="#" class="text-dark text-decoration-none">.Domino"s </a> <a href="#" class="text-dark text-decoration-none">.Dunkin'Donuts </a> <a href="#" class="text-dark text-decoration-none">.Faasos </a> <a href="#" class="text-dark text-decoration-none">.KFC </a> <a href="#" class="text-dark text-decoration-none">.McDonald's </a> <a href="#" class="text-dark text-decoration-none">.Paradise Biryani</a> <a href="#" class="text-dark text-decoration-none">.Subway</a>  <a href="#" class="text-dark text-decoration-none">.WOW! Momo </a>     </div>
      </div>
    </div>

    <div class="accordion-item mb-4 mt-4">
      <h2 class="accordion-header" id="headingFour">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
          Cities We Deliver To

        </button>
      </h2>
      <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <a href="#" class="text-dark text-decoration-none">.Banglore  </a> <a href="#" class="text-dark text-decoration-none">.Pune </a> <a href="#" class="text-dark text-decoration-none">.Mumbai </a> <a href="#" class="text-dark text-decoration-none">.Surat </a> <a href="#" class="text-dark text-decoration-none">.Shimla </a> <a href="#" class="text-dark text-decoration-none">.Nashik </a> <a href="#" class="text-dark text-decoration-none">.Hydrabad </a> <a href="#" class="text-dark text-decoration-none">.Kolkata </a>  <a href="#" class="text-dark text-decoration-none">.Ooty </a>  <a href="#" class="text-dark text-decoration-none">.Delhi </a> <a href="#" class="text-dark text-decoration-none">.Chennai </a>  <a href="#" class="text-dark text-decoration-none">.Chandigarh </a> <a href="#" class="text-dark text-decoration-none">.Jammu </a> <a href="#" class="text-dark text-decoration-none">.Goa </a>        </div>
      </div>
    </div>
  </div>

</div>
</section>




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






    </section><!--End of main section-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
      <script src="/javascript/js/script.js"></script>
  
  </body>
</html>