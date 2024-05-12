<%@page import="Model.entities.Film"%>
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
<title>Supprimer Film</title>
</head>
<body>
    <% Film f = (Film) request.getAttribute("film"); %>

    <div class="container m-5">

        <form action="${pageContext.request.contextPath}/admin/film/del"
            method="post">
            <div>
                <div>
                    Voullez-vous vraiment supprimer Film avec l'ID <input type="text" id="idfilm"
                        name="idfilm" value="<%= f.getId_film() %>" placeholder="Enter id Film" class="form-control m-2" readonly="readonly" required>
                </div>
                <div>Titre
                    <input type="text" id="titre" name="titre"
                        placeholder="Titre" class="form-control m-2" value="<%= f.getTitle() %>" readonly required>
                </div>
                <div>
                    Description
                    <textarea id="description" name="description" placeholder="Description" class="form-control m-2" readonly required><%= f.getDescription() %></textarea>
                </div>
                <div>Duree
                    <input type="number" name="duration" id="dudurationree"
                        placeholder="Duree" class="form-control m-2" value="<%= f.getDuration() %>" readonly required>
                </div>
                <div>Genre
                    <input type="text" name="genre" id="genre"
                        placeholder="Genre" class="form-control m-2" value="<%= f.getGenre() %>" readonly required>
                </div>
                <div>Directeur
                    <input type="text" name="directeur" id="directeur"
                        placeholder="Directeur" class="form-control m-2" value="<%= f.getDirecteur() %>" readonly required>
                </div>

                <div>
                    <input type="submit" class="btn btn-danger m-2" value="supprimer">
                </div>
            </div>
        </form>

    </div>


</body>
</html>