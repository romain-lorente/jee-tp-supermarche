<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 27/02/2020
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/composants/head.jsp" %>

<h4>Connexion</h4>
<br/>
<form action="connexion" method="post">
  <div class="form-group">
    <label for="nom">Nom d'utilisateur</label>
    <input type="text" class="form-control" id="nom" name="nom">
  </div>
  <div class="form-group">
    <label for="mdp">Mot de passe</label>
    <input type="password" class="form-control" id="mdp" name="mdp">
  </div>
  <input type="submit" class="btn btn-success" value="Connexion"/>
</form>

<%@ include file="/WEB-INF/composants/foot.jsp" %>