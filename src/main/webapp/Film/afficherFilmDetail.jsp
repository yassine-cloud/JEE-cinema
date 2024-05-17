<%@page import="Model.entities.Hall"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page import="Model.entities.Film" %>
<%@ page import="Model.entities.Projection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Détails du Film</title>
    <style type="text/css">
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

    h2 {
        color: #343a40; /* Dark gray for headings */
    }

    .img-fluid {
        max-width: 100%; /* Ensure images are responsive */
        height: auto;
    }

    .table {
        margin-top: 20px; /* Add some space above tables */
    }
    </style>
</head>
<body>
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

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <% 
                    Film film = (Film) request.getAttribute("film"); 
                    ArrayList<Projection> projections = (ArrayList<Projection>) request.getAttribute("projections");
                    ArrayList<Hall> halls = (ArrayList<Hall>) request.getAttribute("halls");
                    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                %>
                <img src="<%= film.getImg() %>" alt="Image du film" class="img-fluid">
            </div>
            <div class="col-md-8">
                <h2><%= film.getTitle() %></h2>
                <p><strong>Description:</strong> <%= film.getDescription() %></p>
                <p><strong>Durée:</strong> <%= film.getDuration() %> minutes</p>
                <p><strong>Genre:</strong> <%= film.getGenre() %></p>
                <p><strong>Directeur:</strong> <%= film.getDirecteur() %></p>
            </div>
        </div>

        <div class="mt-5">
            <h3>Projections Disponibles</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Heure</th>
                        <th>Hall</th>
                        <th>Prix</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Projection projection : projections) { %>
                        <tr>
                            <td><%= projection.getdate().format(dateFormatter) %></td>
                            <td><%= projection.getdate().format(timeFormatter) %></td>
                            <td>Num <%= halls.stream().filter(h -> h.getId_hall() == projection.getId_hall()).findFirst().map(Hall::getNum_hall).orElse(0) %></td>
                            <td><%= projection.getPrix() %> Dinars</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
