<%--
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
    <header class="navbar navbar-dark bg-dark">
      <div class="navbar-nav-scroll">
        <ul class="navbar-nav bd-navbar-nav flex-row text-light">
          <li class="nav-item">
            <a class="nav-link" href="#">Index</a>
          </li>
        </ul>
      </div>
    </header>

    <div class="container text-center mt-5">
      <h4>Liste des articles</h4>
      <br/>
      <table class="table table-hover">
        <thead class="thead-dark">
        <tr>
          <th scope="col">Libellé</th>
          <th scope="col">Code-barre</th>
          <th scope="col">Référence</th>
          <th scope="col">Prix HT</th>
          <th scope="col">Taux TVA</th>
          <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td scope="row">Un article</td>
          <td>123456789</td>
          <td>REF123</td>
          <td>10.00€</td>
          <td>5%</td>
          <td class="col-icon"><a href="https://google.com" class="fas fa-shopping-basket btn btn-icon"></a></td>
        </tr>
        </tbody>
      </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>
