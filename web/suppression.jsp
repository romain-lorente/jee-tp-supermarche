<%@ page import="models.Article" %>
<%@ page import="java.util.Map" %><%--
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
    <%@ include file="/WEB-INF/composants/navigation.jsp" %>

    <div class="container">
      <%
        Long[] selected = (Long[]) request.getAttribute("selected");

        if (selected != null && selected.length > 0) {
      %>
      <h4>Les éléments suivants seront supprimés :</h4>
      <hr/>
      <form method="post" action="suppression">
        <table class="table table-hover">
          <thead class="thead-dark">
          <tr>
            <th scope="col">Libellé</th>
            <th scope="col">Code-barre</th>
            <th scope="col">Référence</th>
            <th scope="col">Prix HT</th>
            <th scope="col">Taux TVA</th>
          </tr>
          </thead>
          <tbody>
          <%
            Map<Long, Article> articles = (Map<Long, Article>) application.getAttribute("articles");

            for(Long key : selected) {
          %>
          <tr>
            <td scope="row"><%=articles.get(key).getLibelle()%></td>
            <td><%=articles.get(key).getCodeBarre()%></td>
            <td><%=articles.get(key).getReference()%></td>
            <td><%=articles.get(key).getPrixHT() / 100F%> €</td>
            <td><%=articles.get(key).getTauxTVA() / 100F%> %</td>
            <input type="hidden" name="selected" value="<%= key %>">
          </tr>
          <%
            }
          %>
          </tbody>
        </table>

        <input type="submit" name="valider" class="btn btn-success" value="Supprimer">
        <a class="btn btn-danger" href="index.jsp">Annuler</a>
      </form>
      <%
      } else {
      %>
      <h4>Aucun élément n'a été sélectionné.</h4>
      <br/>
      <a href="index.jsp" role="button" class="btn btn-success">Retour à l'accueil</a>
      <%
        }
      %>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>
