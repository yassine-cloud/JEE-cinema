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
<title>Se connecter</title>
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <h5 class="card-title text-center">Créer Compte</h5>
        </div>
        <div class="card-body">
            <form action="<%= request.getContextPath() %>/signup" method="post">
                <div class="form-group">
                    <label for="nom">Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Entrez votre Nom" required>
                </div>
                <div class="form-group">
                    <label for="prenom">Prenom</label>
                    <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Entrez votre Prenom" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Entrez votre email" required>
                </div>
                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Entrez votre mot de passe" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block mt-3">Connecter </button>
            </form>
        </div>
    </div>
</div>

</body>
</html>