<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Model.entities.Projection"%>
<%@page import="Model.entities.Film"%>
<%@page import="Model.entities.Hall"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Edit Projection</title>
</head>
<body>

    <% ArrayList<Hall> halls = (ArrayList<Hall>) request.getAttribute("halls");  %>
    <% ArrayList<Film> films = (ArrayList<Film>) request.getAttribute("films");  %>
    <% Projection projection = (Projection) request.getAttribute("projection");  %>
    <% DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
%>

    <div class="container m-5">

        <h1>Modifier Projection</h1>        

        <form action="${pageContext.request.contextPath}/admin/projection/edit" method="post">
            <div>
                <div>Num Projection
                    <input type="text" name="numprojection" id="numprojection"
                        placeholder="Num Projection" class="form-control m-2" value="<%=projection.getId_projection()%>" readonly required>
                </div>
                <div>Date
                    <input type="date" name="date" id="date"
                        placeholder="Date" class="form-control m-2" value="<%=projection.getdate().format(dateFormatter)%>" required>
                </div>
                <div>Heure
                    <input type="time" name="heure" id="heure"
                        placeholder="Heure" class="form-control m-2" value="<%=projection.getdate().format(timeFormatter)%>" required>
                </div>
                <div>Prix
                    <input type="number" name="prix" id="prix"
                        placeholder="Prix" class="form-control m-2" value="<%=projection.getPrix()%>" required>
                </div>
                
                <div>Hall
                    <select name="numhall" id="numhall" class="form-select m-2" required>
                        <option value="">Selectioner Hall</option>
                        <% for(Hall h : halls) { %>
                            <option value="<%= h.getId_hall() %>" <%= (h.getId_hall() == projection.getId_hall()) ? "selected" : "" %>>
                                <%= h.getNum_hall() + " Capacité = " + h.getCapacity() %>
                            </option>
                        <% } %>
                    </select>
                    </div>

                <div>Film
                    <select name="numfilm" id="numfilm" class="form-select m-2" required>
                        <option value="">Selectioner Film</option>
                        <% for(Film f : films){ %>
                        <option value="<%= f.getId_film() %>" <%= (f.getId_film() == projection.getId_film()) ? "selected" : "" %>>
                            <%= f.getTitle() %>
                        </option>
                        <% } %>
                    </select>
</div>
                <div>

                    <input type="submit" class="btn btn-success m-2" value="Modifier">
                    </div>

    </div>

</body>
</html>