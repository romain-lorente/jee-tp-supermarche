<%@ page import="java.lang.management.ManagementPermission" %>
<%@ page import="models.Article" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 26/02/2020
  Time: 09:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Index</title>
    <link rel="stylesheet" type="text/css" href="style/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="style/custom.css"/>
    <script src="https://kit.fontawesome.com/1a5eecb642.js" crossorigin="anonymous"></script>
  </head>
  <body>
    <%@ include file="/composants/navigation.jsp" %>

    <form method="post" action="suppression">
      <div class="container">
        <div class="row">
          <div class="col-4">
            <h4>Liste des articles</h4>
          </div>
          <div class="text-right offset-4 col-4">
            <button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i></button>
            <button type="button" class="btn btn-success"><i class="fas fa-plus"></i></button>
          </div>
        </div>
        <br/>
        <table class="table table-hover">
          <thead class="thead-dark">
            <tr>
              <th></th>
              <th scope="col">Libellé</th>
              <th scope="col">Code-barre</th>
              <th scope="col">Référence</th>
              <th scope="col">Prix HT</th>
              <th scope="col">Taux TVA</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
          <%
            Map<Long, Article> articles = (Map<Long, Article>) application.getAttribute("articles");
            for(Long key : articles.keySet()) {
              Article article = articles.get(key);%>

              <tr>
                <td><input type="checkbox" name="selected" value="<%=article.getCodeBarre()%>"/></td>
                <td scope="row"><%=article.getLibelle()%></td>
                <td><%=article.getCodeBarre()%></td>
                <td><%=article.getReference()%></td>
                <td><%=article.getPrixHT() / 100F%> €</td>
                <td><%=article.getTauxTVA() / 100F%> %</td>

                <%-- TODO: mettre en place l'evenement pour l'ajout au panier --%>
                <td class="col-icon"><a href="https://google.com" class="fas fa-shopping-basket btn btn-icon"></a></td>
              </tr>

            <%}%>
          </tbody>
        </table>
      </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>
