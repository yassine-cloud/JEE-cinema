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

    <div class="container m-5">
        <h1>Les Projections Disponnibles</h1>

        <a href="${pageContext.request.contextPath}/admin/projection/add" class="btn btn-success">Ajouter Projection</a>

        

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
                
            </tbody>

    </div>
    

</body>
</html>