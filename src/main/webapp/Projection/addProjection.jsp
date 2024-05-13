<%@page import="Model.entities.Film"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.entities.Hall"%>
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
<% ArrayList<Hall> halls = (ArrayList<Hall>) request.getAttribute("halls");  %>
<% ArrayList<Film> films = (ArrayList<Film>) request.getAttribute("films");  %>

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
                
                <div>Hall
                    <select name="numhall" id="numhall" class="form-select m-2" required>
                     <option value="" selected="selected"> Selectioner Hall  </option>
                     <% for(Hall h : halls) { %>
							<option value="<%= h.getId_hall()  %>"> <%= h.getNum_hall() + " Capacité = " + h.getCapacity()  %>  </option>
						<%} %>
                    </select>
                </div>
                
                <div>Film 
                    <select name="numfilm" id="numfilm" class="form-select m-2" required >
                      <option value="" selected="selected"> Selectioner Film  </option>
                      <% for(Film f : films){ %>
                      <option value="<%= f.getId_film() %>"> <%= f.getTitle() %>  </option>
                      <%} %>
                        
                    </select>

                </div>
                
                <div>
                    <input type="submit" class="btn btn-success m-2" value="Ajouter">
                </div>
            </div>
        </form>

    </div>



</body>
</html>