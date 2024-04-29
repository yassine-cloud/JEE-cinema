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
<title>Ajouter Hall</title>
</head>
<body>

	<div class="container m-5">

		<form action="<%=request.getContextPath()%>/hall/add" method="post">
			<div>
				<div>Num Hall
					<input type="text" id="numhall" name="numhall"
						placeholder="Num Hall" class="form-control m-2" required>
				</div>
				<div>Capacité
					<input type="text" name="capacity" id="capacity"
						placeholder="Capacity" class="form-control m-2" required>
				</div>
				<div>
					<input type="submit" class="btn btn-success m-2" value="Ajouter">
				</div>
			</div>
		</form>

	</div>

</body>
</html>