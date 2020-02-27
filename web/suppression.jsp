<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 26/02/2020
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/composants/head.jsp" %>

<h4>Les éléments suivants seront supprimés :</h4>
<hr/>
<form method="post" action="suppressionOk">
<ul>
    <%
        String[] valeurs = request.getParameterValues("selected");
        for(String valeur : valeurs) {
    %>
        <li><%= valeur %></li>
        <input type="hidden" name="selected" value="<%= valeur %>">
    <%
        }
    %>
</ul>
    <div>
        <button type="submit" class="btn btn-success">Supprimer</button>
        <button type="button" class="btn btn-danger">Annuler</button>
    </div>
</form>

<%@ include file="/WEB-INF/composants/foot.jsp" %>
