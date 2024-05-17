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
<title>Bienvenue</title>
</head>
<body>
 <div class="container mt-5">
        <div class="jumbotron text-center">
            <h1 class="display-4">Bienvenue</h1>
            <p class="lead">Merci de visiter notre site.</p>
            <hr class="my-4">
            <p>Connectez-vous pour accéder à plus de fonctionnalités.</p>
            <a class="btn btn-primary btn-lg m-1" href="<%= request.getContextPath() %>/login" role="button">Se connecter</a>
            <a class="btn btn-secondary btn-lg m-1" href="<%= request.getContextPath() %>/signup" role="button">S'inscrire</a>
        </div>
    </div>
</body>
</html>