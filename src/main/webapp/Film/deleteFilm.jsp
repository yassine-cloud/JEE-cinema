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

    <div class="container m-5">

        <form action="${pageContext.request.contextPath}/admin/film/del"
            method="post">
            <div>
                <div>
                <% int id_film = (int) request.getAttribute("id"); %>
                    Voullez-vous vraiment supprimer Film avec l'ID <input type="text" id="idfilm"
                        name="idfilm" value="<%= id_film %>" placeholder="Enter id Film" class="form-control m-2" readonly="readonly" required>
                </div>

                <div>
                    <input type="submit" class="btn btn-success m-2" value="supprimer">
                </div>
            </div>
        </form>

    </div>


</body>
</html>