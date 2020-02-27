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

<div class="row">
    <div class="offset-3 col-6">
        <form method="post" class="ajout-panier-form">
            <div class="form-group">
                <div class="input-group">
                    <input type="number" class="form-control" name="codeBarre" placeholder="Code-barre"/>
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i></button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<form method="post" action="suppressionPanier">
    <div class="row">
        <div class="col-4">
            <h4>Votre panier</h4>
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
            <th scope="col">Prix TTC</th>
            <th scope="col">Taux TVA</th>
        </tr>
        </thead>
        <tbody>
        <%
            //TODO: Remplacer par une liste de long
            Map<Long, Article> articles = (Map<Long, Article>) session.getAttribute("articles");
            Float prixTotal = 0F;
            for(Long key : articles.keySet()) {
                Article article = articles.get(key);
                Float prix = (article.getPrixHT() * (1 + article.getTauxTVA() / 10000F)) / 100F;
                prixTotal += prix;
        %>

        <tr>
            <td><input type="checkbox" name="selected" value="<%=article.getCodeBarre()%>"/></td>
            <td scope="row"><%=article.getLibelle()%></td>
            <td><%=article.getCodeBarre()%></td>
            <td><%=article.getReference()%></td>
            <td><%=String.format("%.2f", prix)%> €</td>
            <td><%=article.getTauxTVA() / 100F%> %</td>
        </tr>

        <%
            }
        %>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>Total :</td>
            <td><%=String.format("%.2f", prixTotal)%> €</td>
            <td></td>
        </tr>
        </tbody>
    </table>
</form>

<%@ include file="/WEB-INF/composants/foot.jsp" %>
