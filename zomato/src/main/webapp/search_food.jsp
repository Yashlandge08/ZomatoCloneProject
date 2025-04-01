<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Food</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/searchfood.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Search Food</h2>

        <form action="SearchFoodServlet" method="get">
            <div class="mb-3">
                <label for="search_term" class="form-label">Search by Name or Category:</label>
                <input type="text" id="search_term" name="search_term" class="form-control" placeholder="Enter food name or category" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Search</button>
        </form>

        <hr>

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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
