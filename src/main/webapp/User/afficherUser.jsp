<%@page import="Model.entities.User"%>
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
<title>Afficher Utilisateurs</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Gestion Utilisateurs</a>
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
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/projection">Projection</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/user">User</a>
                    </li>
                </ul>

                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container m-5">

        <h1>Les Utilisateurs Disponibles</h1>
        
        <a class="btn btn-success m-auto my-2" href="<%= request.getContextPath() %>/admin/user/add">Ajouter Utilisateur</a>
        
        <% Object o = request.getAttribute("users");
        	ArrayList<User> l = new ArrayList<>(); 
        	if(o instanceof ArrayList){
        		l = (ArrayList) o; 
        	}
        %>
        <table class="table table-bordered table-hover">
            <thead>
                <tr class="table-secondary">
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Email</th>
                    <th>Rôle</th>
                    <th colspan=2 class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
               <% for (User user : l) { %>
                    <tr>
                        <td><%= user.getId_user() %></td>
                        <td><%= user.getNom() %></td>
                        <td><%= user.getPrenom() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getRole() %></td>
                        <td class="text-center">
                            <a class="btn btn-primary" href="<%= request.getContextPath() %>/admin/user/edit?id=<%= user.getId_user() %>">Editer</a>
                        </td>
                        <td class="text-center">
                            <a class="btn btn-danger" href="<%= request.getContextPath() %>/admin/user/del?id=<%= user.getId_user() %>">Supprimer</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</body>
</html>
