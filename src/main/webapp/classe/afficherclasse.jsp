<%@page import="java.util.ArrayList"%>
<%@page import="Model.entities.Hall"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>classes</title>
</head>
<body>

<% Object o = request.getAttribute("halls");
	ArrayList<Hall> l = new ArrayList<>(); 
	if(o instanceof ArrayList){
		l= (ArrayList) o ; 
	}
%>

<table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>num</th>
                <th>cap</th>
            </tr>
        </thead>
        <tbody>
           <%  for (Hall student : l) { %>
                <tr>
                    <td><%= student.getId_hall() %></td>
                    <td><%= student.getNum_hall() %></td>
                    <td><%= student.getCapacity() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>