<%@page import="Model.entities.Film"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Editer Film</title>
</head>
<body>
<% Film f = (Film) request.getAttribute("film"); %>
    <div class="container m-5">

        <h1>Editer Film</h1>        

        <form action="${pageContext.request.contextPath}/admin/film/edit" method="post">
            <div>
                <div>ID
					<input type="text" id="idfilm" name="idfilm"
						placeholder="Num film" value="<%= f.getId_film() %>" class="form-control m-2" required readonly="readonly">
				</div>
                <div>Titre
                    <input type="text" id="titre" name="titre"
                        placeholder="Titre" class="form-control m-2" value="<%= f.getTitle() %>" required>
                </div>
                <div>
                    Description
                    <textarea id="description" name="description" placeholder="Description" class="form-control m-2" required><%= f.getDescription() %></textarea>
                </div>
                <div>Duree
                    <input type="number" name="duration" id="dudurationree"
                        placeholder="Duree" class="form-control m-2" value="<%= f.getDuration() %>" required>
                </div>
                <div>Genre
                    <input type="text" name="genre" id="genre"
                        placeholder="Genre" class="form-control m-2" value="<%= f.getGenre() %>" required>
                </div>
                <div>Directeur
                    <input type="text" name="directeur" id="directeur"
                        placeholder="Directeur" class="form-control m-2" value="<%= f.getDirecteur() %>" required>
                </div>
                
                <div>
                    <input type="submit" class="btn btn-success m-2" value="Editer">
                </div>
            </div>
        </form>

    </div>

</body>
</html>