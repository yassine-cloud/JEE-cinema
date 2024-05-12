<%@page import="Model.entities.Film"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
    href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
    rel="stylesheet">
<script
    src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title> afficher Film</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Gestion Cinema</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/hall">Hall</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/film">Film</a>
                    </li>
                    
                </ul>

                <ul class="navbar-nav ml-auto">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>">Logout</a>
                    </li>
                    
                </ul>
                
            </div>
        </div>
    </nav>

    <div class="container m-5">

        <h1>Les Films Disponibles</h1>
        
        <a class="btn btn-success m-auto my-2" href="<%= request.getContextPath() %>/admin/film/add" >Ajouter Film</a>
        
        <% Object o = request.getAttribute("films");
        	ArrayList<Film> l = new ArrayList<>(); 
        	if(o instanceof ArrayList){
        		l= (ArrayList) o ; 
        	}
        %>
        <table class="table table-bordered table-hover ">
            <thead>
                <tr class="table-secondary">
                    <th>ID</th>
                    <th>Titre</th>
                    <th>Duree</th>
                    <th>Genre</th>
                    <th>Directeur</th>
                    <th colspan=2 class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
               <%  for (Film f : l) { %>
                    <tr>
                    
                        <td><%= f.getId_film() %></td>
                        <td><%= f.getTitle() %></td>
                        <td><%= f.getDuration() %></td>
                        <td><%= f.getGenre() %></td>
                        <td><%= f.getDirecteur() %></td>
                        <td class="text-center" > <a class="btn btn-primary" href="<%= request.getContextPath() %>/admin/film/edit?id=<%= f.getId_film() %>" >Editer</a> </td>
                        <td class="text-center" > <a class="btn btn-danger" href="<%= request.getContextPath() %>/admin/film/del?id=<%= f.getId_film() %>">Supprimer</a> </td>
                        
                    </tr>
                <% } %>
            </tbody>
        </table>
        
        </div>
    </div>


</body>
</html>