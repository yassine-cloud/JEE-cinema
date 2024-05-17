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
<title>Ajouter Film</title>
</head>
<body>

    <div class="container m-5">

        <h1>Ajouter Film</h1>        

        <form action="<%=request.getContextPath()%>/admin/film/add" method="post">
            <div>
                <div>Titre
                    <input type="text" id="titre" name="titre"
                        placeholder="Titre" class="form-control m-2" required>
                </div>
                <div>
                    Description
                    <textarea id="description" name="description" placeholder="Description" class="form-control m-2" required></textarea>
                </div>
                <div>Duree
                    <input type="number" name="duration" id="duree"
                        placeholder="Duree" class="form-control m-2" required>
                </div>
                <div>Genre
                    <input type="text" name="genre" id="genre"
                        placeholder="Genre" class="form-control m-2" required>
                </div>
                <div>Directeur
                    <input type="text" name="directeur" id="directeur"
                        placeholder="Directeur" class="form-control m-2" required>
                </div>
                <div>Image
                    <input type="text" name="img" id="img"
                        placeholder="Directeur" class="form-control m-2" required>
                </div>
                
                <div>
                    <input type="submit" class="btn btn-success m-2" value="Ajouter">
                </div>
            </div>
        </form>

    </div>

</body>
</html>