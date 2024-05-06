<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Ajouter Projection</title>
</head>
<body>

    <div class="container m-5">

        <h1>Ajouter Projection</h1>        

        <form action="${pageContext.request.contextPath}/admin/projection/add" method="post">
            <div>
                <div>Date
                    <input type="date" name="date" id="date"
                        placeholder="Date" class="form-control m-2" required>
                </div>
                <div>Heure
                    <input type="time" name="heure" id="heure"
                        placeholder="Heure" class="form-control m-2" required>
                </div>
                <div>Prix
                    <input type="number" name="prix" id="prix"
                        placeholder="Prix" class="form-control m-2" required>
                </div>
                <div>Num Hall
                    <input type="number" name="numhall" id="numhall"
                        placeholder="Num Hall" class="form-control m-2" required>
                </div>
                <div>Num Film
                    <input type="number" name="numfilm" id="numfilm"
                        placeholder="Num Film" class="form-control m-2" required>
                </div>
                
                <div>
                    <input type="submit" class="btn btn-success m-2" value="Ajouter">
                </div>
            </div>
        </form>

    </div>



</body>
</html>