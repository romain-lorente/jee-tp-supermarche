<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 26/02/2020
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Suppression d'articles</title>
    <link rel="stylesheet" type="text/css" href="style/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="style/custom.css"/>
    <script src="https://kit.fontawesome.com/1a5eecb642.js" crossorigin="anonymous"></script>
  </head>
  <body>
    <%@ include file="/composants/navigation.jsp" %>

    <div class="container">
      <h4>Les éléments suivants seront supprimés :</h4>
      <hr/>
      <form method="post" action="suppressionOk">
        <ul>
        <%
          String[] valeurs = request.getParameterValues("selected");
          for(String valeur : valeurs) { %>
            <li><%= valeur %></li>
            <input type="hidden" name="selected" value="<%= valeur %>">
          <% }
        %>
        </ul>
        <div>
          <button type="submit" class="btn btn-success">Supprimer</button>
          <button type="button" class="btn btn-danger">Annuler</button>
        </div>
      </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>
