<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.example.FoodItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Foods</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="path_to_bootstrap.css"> 
    <link rel="stylesheet" href="css/food_list.css"> 
</head>
<body>

 <nav class="navbar navbar-expand-lg bg-danger fixed-top mb-5">
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
                <a class="nav-link text-white" href="cart.jsp">
               <i class="fas fa-truck-moving"></i>
                </a>
              </li>
            
             <li class="nav-item">
                <a class="nav-link text-white" href="login.jsp">Logout</a>
              </li>
            
            </ul>
          
          </div>
        </div>
      </nav>




 <div class="container my-5 jay">
        <h2 class="text-center mb-4">Search Food</h2>

        <form action="SearchFoodServlet" method="get">
            <div class="mb-3">
                <label for="search_term" class="form-label">Search by Name or Category:</label>
                <input type="text" id="search_term" name="search_term" class="form-control" placeholder="Enter food name or category" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Search</button>
        </form>

        <hr>

        <!-- Search Results -->
        <h3 class="mt-4">Search Results:</h3>
        <div>
            <%
                String searchResults = (String) request.getAttribute("searchResults");
                if (searchResults != null) {
                    out.print(searchResults);
                } else {
                    out.print("<p>No results found. Try searching for a food item.</p>");
                }
            %>
        </div>
    </div>






    <div class="container mt-5 yash1">
        <h2 class="text-center mb-4 mt-5">Available Foods</h2>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Food Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<FoodItem> foodItems = (List<FoodItem>) request.getAttribute("foodItems");
                    if (foodItems != null && !foodItems.isEmpty()) {
                        for (FoodItem food : foodItems) {
                %>
                <tr>
                    <td><%= food.getfoodName() %></td>
                    <td><%= food.getdescription() %></td>
                    <td><%= food.getcategory() %></td>
                    <td>$<%= food.getprice() %></td>
                    <td>
                        <form action="AddToCartServlet" method="post">
                            <input type="hidden" name="food_items_id" value="<%= food.getId() %>">
                            <button type="submit" class="btn btn-success btn-sm">Add to Cart</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">No foods available.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
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
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>
