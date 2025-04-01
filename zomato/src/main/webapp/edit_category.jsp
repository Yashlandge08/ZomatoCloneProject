<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/editcategory.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Edit Category</h2>

        <form action="UpdateCategoryServlet" method="post">
            <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
            
            <div class="form-group mb-3">
                <label for="name" class="form-label">Category Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= request.getAttribute("name") %>" required>
            </div>
            
            <button type="submit" class="btn btn-primary">Update</button>
        </form>

        <form action="ViewCategoriesServlet" method="get" style="margin-top: 10px;">
            <button type="submit" class="btn btn-secondary">Cancel</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
