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

<div class="container m-5">
    <h1>Choisir un Film</h1>

    <%-- Récupération des films depuis la base de données --%>
    <%-- Supposons que vous avez une liste de films avec leurs noms et identifiants --%>
    <%-- filmList est une liste d'objets Film avec des attributs id_film et title --%>
    <%-- Vous devriez remplacer filmList par votre propre logique pour récupérer les films --%>
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
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= film.getTitle() %></h5>
                        <p class="card-text"><%= film.getDescription() %></p>
                        <button type="button" class="btn btn-primary" >Choisir</button>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>


</body>
</html>
