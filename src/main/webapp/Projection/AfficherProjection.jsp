<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Model.entities.Projection"%>
<%@page import="Model.entities.Film"%>
<%@page import="Model.entities.Hall"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Afficher Projection</title>
</head>
<body>

<% ArrayList<Projection> projections = (ArrayList<Projection>) request.getAttribute("projections");  %>
<% ArrayList<Hall> halls = (ArrayList<Hall>) request.getAttribute("halls");  %>
<% ArrayList<Film> films = (ArrayList<Film>) request.getAttribute("films");  %>
<%   %>
<% DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
%>

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
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/admin/projection">projection</a>
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

    <h1>Afficher Projection</h1>
    <a href="${pageContext.request.contextPath}/admin/projection/add" class="btn btn-success">Ajouter</a>
        

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Num</th>
                    <th scope="col">Date</th>
                    <th scope="col">Heure</th>
                    <th scope="col">Prix</th>
                    <th scope="col">Num Hall</th>
                    <th scope="col">Num Film</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
            
            <% for(Projection p : projections){%>
                <tr>
                    <td><%= p.getId_projection() %></td>
                    <td><%= p.getdate().format(dateFormatter) %></td>
                    <td><%= p.getdate().format(timeFormatter) %></td>
                    <td><%= p.getPrix() %></td>
                    <td><%
                        int hallId = p.getId_hall();
                        for (Hall hall : halls) {
                            if (hall.getId_hall() == hallId) {
                                out.print(hall.getNum_hall());
                                break;
                            }
                        }
                    %></td>
                    <td><%
                        int filmId = p.getId_film();
                        for (Film film : films) {
                            if (film.getId_film() == filmId) {
                                out.print(film.getTitle());
                                break;
                            }
                        }
                    %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/projection/edit?id=<%= p.getId_projection() %>" class="btn btn-warning">Modifier</a>
                        <a href="${pageContext.request.contextPath}/admin/projection/del?id=<%= p.getId_projection() %>" class="btn btn-danger">Supprimer</a>
                    </td>
                </tr>
            <%}%>
                
            </tbody>

    </div>
    

</body>
</html>