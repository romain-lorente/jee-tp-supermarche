<%@ page import="models.Article" %>
<%@ page import="java.util.Map" %>

<%--
  Created by IntelliJ IDEA.
  User: Quentin
  Date: 26/02/2020
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/composants/head.jsp" %>

<%
    Long[] selected = (Long[]) request.getAttribute("selected");

    if (selected != null && selected.length > 0) {
%>
<h4>Les éléments suivants seront supprimés :</h4>
<hr/>
<form method="post" action="suppressionPanier">
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
<h4>Aucun éléments n'a été séléctioné.</h4>
<%
    }
%>

<%@ include file="/WEB-INF/composants/foot.jsp" %>