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
<title>Ajouter Utilisateur</title>
</head>
<body>

    <div class="container m-5">

        <h1>Ajouter Utilisateur</h1>        

        <form action="<%=request.getContextPath()%>/admin/user/add" method="post"> 
            <div>
                <div>Nom
                    <input type="text" id="nom" name="nom"
                        placeholder="Nom" class="form-control m-2" required>
                </div>
                <div>Prénom
                    <input type="text" id="prenom" name="prenom"
                        placeholder="Prénom" class="form-control m-2" required>
                </div>
                <div>Email
                    <input type="email" id="email" name="email"
                        placeholder="Email" class="form-control m-2" required>
                </div>
                <div>Mot de passe
                    <input type="password" id="password" name="password"
                        placeholder="Mot de passe" class="form-control m-2" required>
                </div>
                <div>Rôle
                    <select id="role" name="role" class="form-control m-2" required>
                        <option value="admin">Admin</option>
                        <option value="client">Client</option>
                    </select>
                </div>
                <div>
                    <input type="submit" class="btn btn-success m-2" value="Ajouter">
                </div>
            </div>
        </form>

    </div>

</body>
</html>
