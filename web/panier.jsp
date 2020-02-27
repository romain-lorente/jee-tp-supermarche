<%@ page import="java.lang.management.ManagementPermission" %>
<%@ page import="models.Article" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 26/02/2020
  Time: 09:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/composants/head.jsp" %>

<form method="post" action="suppressionPanier">
    <div class="row">
        <div class="col-4">
            <h4>Liste des articles</h4>
        </div>
        <div class="text-right offset-4 col-4">
            <button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i></button>
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
            //TODO: Remplacer par une liste de long
            Map<Long, Article> articles = (Map<Long, Article>) session.getAttribute("articles");
            for(Long key : articles.keySet()) {
                Article article = articles.get(key);
        %>

        <tr>
            <td><input type="checkbox" name="selected" value="<%=article.getCodeBarre()%>"/></td>
            <td scope="row"><%=article.getLibelle()%></td>
            <td><%=article.getCodeBarre()%></td>
            <td><%=article.getReference()%></td>
            <td><%=article.getPrixHT() / 100F%> €</td>
            <td><%=article.getTauxTVA() / 100F%> %</td>
        </tr>

        <%
            }
        %>
        </tbody>
    </table>
</form>

<%@ include file="/WEB-INF/composants/foot.jsp" %>
