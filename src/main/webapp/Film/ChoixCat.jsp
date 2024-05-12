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
                        <a class="nav-link" href="<%= request.getContextPath() %>">Logout</a>
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
			        <div class="card-body d-flex flex-column">
			            <h5 class="card-title"><%= film.getTitle() %></h5>
			            <p class="card-text flex-grow-1"><%= film.getDescription() %></p>
			            <button type="button" class="btn btn-primary mt-auto">Choisir</button>
			        </div>
			    </div>
			</div>

        <% } %>
    </div>
</div>


</body>
</html>
