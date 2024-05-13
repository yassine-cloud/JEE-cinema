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
<title>Supprimer Projection</title>
</head>
<body>

    <% ArrayList<Hall> halls = (ArrayList<Hall>) request.getAttribute("halls");  %>
        <% ArrayList<Film> films = (ArrayList<Film>) request.getAttribute("films");  %>
        <% Projection p = (Projection) request.getAttribute("projection");  %>
        <% DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
    %>


    <div class="container m-5">

        <form action="${pageContext.request.contextPath}/admin/projection/del"
            method="post">
            <div>
                <div>
                    Voullez-vous vraiment supprimer Projection avec l'ID <input type="text" id="numprojection"
                        name="numprojection" value="<%= p.getId_projection() %>" placeholder="Enter id Projection" class="form-control m-2" readonly="readonly" required>
                </div>
                <div>Date
                    <input type="date" name="date" id="date"
                        placeholder="Date" class="form-control m-2" value="<%=p.getdate().format(dateFormatter)%>" readonly required>
                </div>
                <div>Heure
                    <input type="time" name="heure" id="heure"
                        placeholder="Heure" class="form-control m-2" value="<%=p.getdate().format(timeFormatter)%>" readonly required>
                </div>
                <div>Prix
                    <input type="number" name="prix" id="prix"
                        placeholder="Prix" class="form-control m-2" value="<%= p.getPrix() %>" readonly required>
                </div>
                <div>Hall
                    <input type="text" name="numhall" id="numhall"
                        placeholder="Hall" class="form-control m-2" 
                        value="<%
                        int hallId = p.getId_hall();
                        for (Hall hall : halls) {
                            if (hall.getId_hall() == hallId) {
                                out.print(hall.getNum_hall());
                                break;
                            }
                        }
                    %>" readonly required>
                </div>
                <div>Film
                    <input type="text" name="numfilm" id="numfilm"
                        placeholder="Film" class="form-control m-2" 
                        value="<%
                        int filmId = p.getId_film();
                        for (Film film : films) {
                            if (film.getId_film() == filmId) {
                                out.print(film.getTitle());
                                break;
                            }
                        }
                    %>" readonly required>
                </div>

                <div>
                    <input type="submit" class="btn btn-danger m-2" value="supprimer">
                </div>
            </div>
        </form>

    </div>

</body>
</html>