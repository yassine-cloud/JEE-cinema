<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.entities.Film"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Choisir un Film</title>
    <!-- Ajouter les liens vers les fichiers CSS Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script
    src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
    <style>
    body {
        background-color: #f8f9fa; /* Light gray background */
        font-family: Arial, sans-serif; /* Choose a common font for readability */
    }

    .container {
        margin-top: 50px; /* Add some space from the top */
    }

    .navbar {
        border-radius: 0; /* Remove border-radius from navbar */
    }

    .nav-link {
        color: #fff; /* White color for navbar links */
    }

    .card {
        background-color: #fff; /* White background for cards */
        border-radius: 10px; /* Rounded corners for cards */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
    }

    .card-img-top {
        border-top-left-radius: 10px; /* Rounded corners for top left of image */
        border-top-right-radius: 10px; /* Rounded corners for top right of image */
        height: 150px; /* Set image height */
        object-fit: cover; /* Maintain aspect ratio */
    }

    .card-title {
        color: #343a40; /* Dark gray color for card titles */
    }

    .card-text {
        color: #6c757d; /* Gray color for card text */
    }

    .btn-primary {
        background-color: #007bff; /* Blue color for primary buttons */
        border: none; /* Remove button border */
    }

    .btn-primary:hover {
        background-color: #0056b3; /* Darker blue color on hover */
    }
</style>
    
</head>
<body>
    <!-- Barre de navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Cinema</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/client/film">Films</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/logout">Logout</a>
                    </li>   
                </ul>
            </div>
        </div>
    </nav>

<div class="container m-5">
    <h1>Choisir un Film</h1>



    <% Object o = request.getAttribute("films");
        	ArrayList<Film> l = new ArrayList<>(); 
        	if(o instanceof ArrayList){
        		l= (ArrayList) o ; 
        	}
        %>

        <div class="row">
            <%-- Boucle pour afficher les cartes pour chaque film --%>
            <% for(Film film : l) { %>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img class="card-img-top" alt="<%= film.getTitle() %>" src="<%= film.getImg() %>" style="height: 150px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title"><%= film.getTitle() %></h5>
                            <p class="card-text flex-grow-1"><%= film.getDescription() %></p>
                            <a type="button" class="btn btn-primary mt-auto" href="<%= request.getContextPath() %>/film/detail?id=<%= film.getId_film() %>">Choisir</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
        
</div>


</body>
</html>
