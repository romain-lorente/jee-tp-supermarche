<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 26/02/2020
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/composants/head.jsp" %>

<h4>Nouvel article</h4>
<br/>
<form action="ajoutArticle" method="post">
    <div class="form-group">
        <label for="codeBarre">Code-barre du produit</label>
        <input type="number" class="form-control" id="codeBarre" name="codeBarre">
    </div>
    <div class="form-group">
        <label for="reference">Référence du produit</label>
        <input type="text" class="form-control" id="reference" name="reference">
    </div>
    <div class="form-group">
        <label for="libelle">Libellé</label>
        <input type="text" class="form-control" id="libelle" name="libelle">
    </div>
    <div class="row">
        <div class="col">
            <div class="form-group">
                <label for="prix">Prix</label>
                <div class="input-group">
                    <input type="number" step="0.01" class="form-control" id="prix" name="prix">
                    <div class="input-group-append">
                        <span class="input-group-text">€</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="tva">Taux de TVA</label>
                <select id="tva" name="tva" class="custom-select">
                    <option value="0">5.5%</option>
                    <option value="1">20.0%</option>
                </select>
            </div>
        </div>
    </div>
    <input type="submit" class="btn btn-success" value="Ajouter"/>
</form>

<%@ include file="/WEB-INF/composants/foot.jsp" %>