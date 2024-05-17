<%@page import="Model.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Editer Utilisateur</title>
</head>
<body>
<% User user = (User) request.getAttribute("user"); %>
    <div class="container m-5">

        <h1>Editer Utilisateur</h1>        

        <form action="${pageContext.request.contextPath}/admin/user/edit" method="post">
            <div> 
                <div>ID
					<input type="text" id="id_user" name="id_user"
						placeholder="Num utilisateur" value="<%= user.getId_user() %>" class="form-control m-2" required readonly="readonly">
				</div>
                <div>Nom
                    <input type="text" id="nom" name="nom"
                        placeholder="Nom" class="form-control m-2" value="<%= user.getNom() %>" required>
                </div>
                <div>Prénom
                    <input type="text" id="prenom" name="prenom"
                        placeholder="Prénom" class="form-control m-2" value="<%= user.getPrenom() %>" required>
                </div>
                <div>Email
                    <input type="email" id="email" name="email"
                        placeholder="Email" class="form-control m-2" value="<%= user.getEmail() %>" required>
                </div>
                <div>Mot de passe
                    <input type="password" id="password" name="password"
                        placeholder="Mot de passe" class="form-control m-2" value="<%= user.getPassword() %>" required>
                </div>
                <div>Rôle
                    <select id="role" name="role" class="form-control m-2" required>
                        <option value="admin" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
                        <option value="client" <%= "client".equals(user.getRole()) ? "selected" : "" %>>Client</option>
                    </select>
                </div>
                
                <div>
                    <input type="submit" class="btn btn-success m-2" value="Editer">
                </div>
            </div>
        </form>

    </div>

</body>
</html>
