package servlets;

import models.Article;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/ajoutArticle")
public class AjoutArticleServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String libelle = request.getParameter("libelle");
            String reference = request.getParameter("reference");
            long codeBarre = Long.parseLong(request.getParameter("codeBarre"));
            int tauxTVA = Integer.parseInt(request.getParameter("tva"));
            int prix = (int)(Double.parseDouble(request.getParameter("prix")) * 100);

            Map<Long, Article> articles = (Map<Long, Article>) this.getServletContext().getAttribute("articles");
            articles.put(codeBarre, new Article(codeBarre, reference, libelle, prix, tauxTVA));

            response.sendRedirect("/index.jsp");
        }
        catch (Exception e) {
            response.sendError(400, "Une erreur est survenue lors de l'ajout. Veuillez réessayer.");
        }
    }
}
