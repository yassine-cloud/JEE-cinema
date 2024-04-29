<%@page import="Model.entities.Hall"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Halls</title>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<div class="container m-5" >

<h1>Les Halls Disponibles</h1>

<a class="btn btn-primary m-auto my-2" href="<%= request.getContextPath() %>/hall/add" >Ajouter Hall</a>

<% Object o = request.getAttribute("halls");
	ArrayList<Hall> l = new ArrayList<>(); 
	if(o instanceof ArrayList){
		l= (ArrayList) o ; 
	}
%>
<table class="table table-bordered table-hover ">
        <thead>
            <tr class="table-secondary">
                <th>ID</th>
                <th>num</th>
                <th>cap</th>
                <th colspan=2 class="text-center">Action</th>
            </tr>
        </thead>
        <tbody>
           <%  for (Hall h : l) { %>
                <tr>
                
                    <td><%= h.getId_hall() %></td>
                    <td><%= h.getNum_hall() %></td>
                    <td><%= h.getCapacity() %></td>
                    <td class="text-center" > <a class="btn btn-primary" href="<%= request.getContextPath() %>/hall/edit?id=<%= h.getId_hall() %>" >Editer</a> </td>
                    <td class="text-center" > <a class="btn btn-danger" href="<%= request.getContextPath() %>/hall/del?id=<%= h.getId_hall() %>">Supprimer</a> </td>
                    
                </tr>
            <% } %>
        </tbody>
    </table>
    
    </div>
</body>
</html>