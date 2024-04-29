<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>editer Hall</title>
</head>
<body>
<div class="container m-5">

		<form action="<%=request.getContextPath()%>/hall/edit" method="post">
			<div>
				<div>ID
					<input type="text" id="idhall" name="idhall"
						placeholder="Num Hall" value="<%=request.getAttribute("id") %>" class="form-control m-2" required readonly="readonly">
				</div>
				<div>Num Hall
					<input type="text" id="numhall" name="numhall"
						placeholder="Num Hall" value="<%=request.getAttribute("num") %>" class="form-control m-2" required>
				</div>
				<div>Capacité
					<input type="text" name="capacity" id="capacity"
						placeholder="Capacity" value="<%=request.getAttribute("cap") %>" class="form-control m-2" required>
				</div>
				<div>
					<input type="submit" class="btn btn-success m-2" value="Effectuer">
				</div>
			</div>
		</form>

	</div>
</body>
</html>