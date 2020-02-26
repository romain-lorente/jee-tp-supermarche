<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 26/02/2020
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Ajouter un article</title>
    <link rel="stylesheet" type="text/css" href="style/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="style/custom.css"/>
    <script src="https://kit.fontawesome.com/1a5eecb642.js" crossorigin="anonymous"></script>
  </head>
  <body>
  <%@ include file="/composants/navigation.jsp" %>

    <div class="container">
      <form action="ajoutArticle" method="post">
        <div class="form-group">
          <label for="codeBarre">Code-barre du produit</label>
          <input type="number" class="form-control" id="codeBarre">
        </div>
        <div class="form-group">
          <label for="reference">Référence du produit</label>
          <input type="text" class="form-control" id="reference">
        </div>
        <div class="form-group">
          <label for="libelle">Libellé</label>
          <input type="text" class="form-control" id="libelle">
        </div>
        <div class="row">
          <div class="col">
            <div class="form-group">
              <label for="prix">Prix</label>
              <div class="input-group">
                <input type="number" step="0.01" class="form-control" id="prix">
                <div class="input-group-append">
                  <span class="input-group-text">€</span>
                </div>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <label>Taux de TVA</label>
              <select name="tva" class="custom-select">
                <option value="0">5.5%</option>
                <option value="1">20.0%</option>
              </select>
            </div>
          </div>
        </div>
        <button type="submit" class="btn btn-success">Ajouter</button>
      </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>
