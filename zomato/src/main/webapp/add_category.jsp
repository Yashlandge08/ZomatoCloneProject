<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Food Category</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/addcategory.css">
</head>
<body class="d-flex align-items-center justify-content-center vh-100 bg-light">
    <div class="container category-form">
        <h2 class="text-center mb-4">Add Food Category</h2>
        <form action="AddCategoryServlet" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Category Name</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" rows="3"></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success w-100">Add Category</button>
            </div>
        </form>
    </div>
</body>
</html>
