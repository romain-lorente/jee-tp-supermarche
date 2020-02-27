<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 26/02/2020
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<header>
    <nav class="navbar navbar-expand navbar-dark bg-dark mb-5">

        <a class="navbar-brand" href="index.jsp">Boutique</a>

        <ul class="navbar-nav">

            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Liste des articles</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="panier.jsp">Panier</a>
            </li>

            <li class="nav-item">
                <%
                    if(session.getAttribute("utilisateur") != null) {
                %>
                <a class="nav-link" href="#">Deconnexion (<%=session.getAttribute("utilisateur")%>)</a>
                <%
                    }
                    else {
                %>
                <a class="nav-link" href="connexion.jsp">Connexion</a>
                <%
                    }
                %>
            </li>

        </ul>
    </nav>
</header>
