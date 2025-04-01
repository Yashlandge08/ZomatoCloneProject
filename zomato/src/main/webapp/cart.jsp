<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.example.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" href="path_to_bootstrap.css"> 
    <link rel="stylesheet" href="css/cart.css"> 
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
                <a class="nav-link text-white" href="cart.jsp">
               <i class="fas fa-truck-moving"></i>
                </a>
              </li>
              
              
                <li class="nav-item">
               <a class="nav-link text-white" href="CustomerOrdersServlet">My Orders</a>
              </li>
              
              <li class="nav-item">
              <a class="nav-link text-white" href="LogoutServlet">Logout</a>
              </li>
            
            </ul>
          
          </div>
        </div>
      </nav>
 







    <div class="container mt-5">
        <h2 class="text-center mb-4">Your Cart</h2>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Food Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
                    double total = 0.00; 
                    
                    if (cartItems != null && !cartItems.isEmpty()) {
                        for (CartItem item : cartItems) {
                            double itemTotal = item.getprice() * item.getquantity();
                            total += itemTotal; 
                %>
                <tr>
                    <td><%= item.getfoodName() %></td>
                    <td>$<%= item.getprice() %></td>
                    <td><%= item.getquantity() %></td>
                    <td>$<%= itemTotal %></td>
                    <td>
                        <form action="DeleteCartItemServlet" method="post">
                            <input type="hidden" name="cart_id" value="<%= item.getcartId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">Your cart is empty.</td>
                </tr>
                <%
                    }
                %>
                <%
                    if (cartItems != null && !cartItems.isEmpty()) {
                %>
                <tr>
                    <td><strong>Total Price:</strong></td>
                    <td colspan="3"></td>
                    <td><strong>$<%= total %></strong></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
        <%
            if (cartItems != null && !cartItems.isEmpty()) {
        %>
        <div class="checkout-container text-center">
            <form action="CheckoutServlet" method="post">
                <button type="submit" class="btn btn-success btn-lg">Checkout</button>
            </form>
        </div>
        <%
            }
        %>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     <footer class="footer fixed-bottom">
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



    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
