

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zomato</title>
    <link rel="stylesheet" href="css/home.css">
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
          <img src="./images/home/main section bg.webp" alt="Background Image" class="img-fluid">
          <div class="text-overlay">
          <h1 class="fw-bold">zomato</h1>
          <p>Discover the best food & drinks in Pune</p>
          
          <div class="input-group mb-3">
            <!-- Button with location icon -->
            <button class="btn btn-outline-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fas fa-map-marker-alt"></i> Pune
            </button>
        
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Action</a></li>
            </ul>
        
            <!-- Input field with search icon inside -->
            <input type="text" class="form-control" aria-label="Text input with dropdown button" placeholder="search restaurant">
            <span class="input-group-text"><i class="fas fa-search"></i></span>
          </div>
        </div>
        </div>  
</section>   <!-- end Home section -->


<section>  <!-- Event section -->
  <div class="container mt-5 mb-5">
    <div class="row justify-content-center">
      <div class="col-12 col-md-6 col-xl-4 mt-3">
        <div class="card">
         <a href="RestaurantListServlet"> <img src="./images/home/first card 0001.jpg" class="card-img-top" alt="Image 1"></a>
          <div class="card-body">
            <h5 class="card-title">Order Online</h5>
            <p class="card-text">Stay home and order to your doorstep.</p>
          </div>
        </div>
      </div>

      <div class="col-12 col-md-6 col-xl-4 mt-3">
        <div class="card">
          <img src="./images/home/first card 02.webp" class="card-img-top" alt="Image 2">
          <div class="card-body">
            <h5 class="card-title">Dining</h5>
            <p class="card-text">View the city's favourite dining venues.</p>
          </div>
        </div>
      </div>

      <div class="col-12 col-md-6 col-xl-4 mt-3">
        <div class="card">
          <img src="./images/home/first card 03.webp" class="card-img-top" alt="Image 3">
          <div class="card-body">
            <h5 class="card-title">Live Events</h5>
            <p class="card-text">Discover India’s best events & concerts.</p>
          </div>
        </div>
      </div>
    
    </div>
  </div>

</section>   <!-- end Event section -->

<section class="mt-5 mb-5"> <!-- Collection section -->
<div class="container">
  <h1>Collection</h1>
  <p class="fs-5">Explore curated lists of top restaurants, cafes, pubs, and bars in Pune, based on trends</p>

  <div class="row mb-5">
    <div class="col-12 col-md-6 col-xl-3 position-relative mt-3">
      <img src="./images/home/collection1.webp" class="img-fluid" alt="New Year's Celebration">
      <div class="position-absolute bottom-0 start-0 p-4 pb-0 text-white">
        <h5>New Year's Celebration</h5>
        <p>19 places</p>
      </div>
    </div>
    <div class="col-12 col-md-6 col-xl-3 position-relative mt-3">
      <img src="./images/home/collection2.webp" class="img-fluid" alt="Top Branding Spots">
      <div class="position-absolute bottom-0 start-0 p-4 pb-0 text-white">
        <h5>Top Branding Spots</h5>
        <p>26 places</p>
      </div>
    </div>
    <div class="col-12 col-md-6 col-xl-3 position-relative mt-3">
      <img src="./images/home/collection3.webp" class="img-fluid" alt="Newly Open Places">
      <div class="position-absolute bottom-0 start-0 p-4 pb-0 text-white">
        <h5>Newly Open Places</h5>
        <p>16 places</p>
      </div>
    </div>
    <div class="col-12 col-md-6 col-xl-3 position-relative mt-3">
      <img src="./images/home/collection4.webp" class="img-fluid" alt="Best RoofTop Places">
      <div class="position-absolute bottom-0 start-0 p-4 pb-0 text-white">
        <h5>Best RoofTop Places</h5>
        <p>19 places</p>
      </div>
    </div>
  </div>
  
  
  
  </div>
 </section> <!-- end Collection section -->


 <section> <!-- localities section -->
  <div class="container">
    <h1 class="mt-5">Popular localities in and around Pune</h1>
    </div>


  <!-- Bootstrap Container -->
<div class="container">
  <div class="row mb-5 mt-5">
    <!-- First Container -->
    <div class="col-md-4">
      <div class="p-2 border shadow-hover">
        <h4>Baner</h4>
        <p>679 places</p>
      </div>
    </div>

    <!-- Second Container -->
    <div class="col-md-4">
      <div class="p-2 border shadow-hover">
        <h4>Vimannagar</h4>
        <p>679 places</p>

      </div>
    </div>

    <!-- Third Container -->
    <div class="col-md-4">
      <div class="p-2 border shadow-hover">
        <h4>Hinjewadi</h4>
        <p>1370 places</p>

      </div>
    </div>

    <div class="col-md-4 mt-3">
      <div class="p-2 border shadow-hover">
        <h4>Koregaon Park</h4>
        <p>255 places</p>

      </div>
    </div>

    <div class="col-md-4 mt-3">
      <div class="p-2 border shadow-hover">
        <h4>Wakad</h4>
        <p>1003 places</p>

      </div>
    </div>


    <div class="col-md-4 mt-3">
      <div class="p-2 border shadow-hover">
        <h4>Kothrud</h4>
        <p>787 places</p>

      </div>
    </div>


    <div class="col-md-4 mt-3">
      <div class="p-2 border shadow-hover">
        <h4>Kalyani Nagar</h4>
        <p>171 places</p>

      </div>
    </div>


    <div class="col-md-4 mt-3">
      <div class="p-2 border shadow-hover">
        <h4>Kharadi</h4>
        <p>864 places</p>

      </div>
    </div>


    <div class="col-md-4 mt-3">
      <div class="p-2 border shadow-hover">
        <h4>FC Road</h4>
        <p>140 places</p>

      </div>
    </div>

  </div>
</div>
 </section>




 <section class="container-fluid bi1">
  <div class="container">
      <div class="row align-items-center mt-5 mb-5">

        <div class="col-12 col-md-6 mt-5 mb-5">
          <img src="./images/home/mobilephoneimg.webp"
              alt="" class="img-fluid">
      </div>

      <div class="col-12 col-md-6 mt-5 mb-5">
        <h2>Get the Zomato App</h2>
        <p>We will send you a link, open it on your phone to download the app</p>
      
        <!-- Checkboxes side by side -->
        <div class="row mb-3">
          <div class="col-6 d-flex align-items-center">
            <input type="radio" id="emailCheckbox">
            <p class="mb-0 ms-2">Email</p>
          </div>
          <div class="col-6 d-flex align-items-center">
            <input type="radio" id="phoneCheckbox">
            <p class="mb-0 ms-2">Phone</p>
          </div>
        </div>
      
        <!-- Email input and button side by side -->
        <div class="row">
          <div class="col-6">
            <input type="email" class="form-control" placeholder="Your email">
          </div>
          <div class="col-4">
            <button class="btn btn-send bg-danger text-white" type="submit">Share App Link</button>
          </div>
        </div>

        <div class="mt-3">
          <p>download app from</p>
        <a href="https://play.google.com/store/search?q=zomato&c=apps&hl=en" target="_blank">  <img src="./img/Zomato/Zomato profile/google play.webp"
          alt="" class="img-fluid mt-2"></a>
          <a href="https://apps.apple.com/in/app/zomato-food-delivery-dining/id434613896" target="_blank">
          <img src="./images/home/app store.webp"
          alt="" class="img-fluid mt-2"></a>
      </div>
      </div>
      </div>
  </div>
</section>







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
                  <img src="./img/Zomato/Zomato profile/app store.webp"
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