<%@page import="Model.entities.User"%>
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
<title>Supprimer Utilisateur</title>
</head>
<body>
    <% User user = (User) request.getAttribute("user"); %>

    <div class="container m-5">

        <form action="${pageContext.request.contextPath}/admin/user/del" method="post"> 
            <div>
                <div>
                    Voulez-vous vraiment supprimer l'utilisateur avec l'ID 
                    <input type="text" id="id_user" name="id_user" value="<%= user.getId_user() %>" 
                        class="form-control m-2" readonly="readonly" required>
                </div>
                <div>Nom
                    <input type="text" id="nom" name="nom" value="<%= user.getNom() %>"
                        class="form-control m-2" readonly required>
                </div>
                <div>Prénom
                    <input type="text" id="prenom" name="prenom" value="<%= user.getPrenom() %>"
                        class="form-control m-2" readonly required>
                </div>
                <div>Email
                    <input type="email" id="email" name="email" value="<%= user.getEmail() %>"
                        class="form-control m-2" readonly required>
                </div>
                <div>Rôle
                    <input type="text" id="role" name="role" value="<%= user.getRole() %>"
                        class="form-control m-2" readonly required>
                </div>
                <div>
                    <input type="submit" class="btn btn-danger m-2" value="Supprimer">
                </div>
            </div>
        </form>

    </div>

</body>
</html>
