package servlets;

import models.Article;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/modificationArticle")
public class ModificationArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<Long, Article> articles = (Map<Long, Article>) this.getServletContext().getAttribute("articles");

        try {
            String libelle = request.getParameter("libelle");
            String reference = request.getParameter("reference");
            Long codeBarre = Long.valueOf(request.getParameter("codeBarre"));
            Integer tauxTVA = Integer.parseInt(request.getParameter("tva"));
            Integer prix = (int)(Double.parseDouble(request.getParameter("prix")) * 100);

            Article a = articles.get(codeBarre);

            a.setLibelle(libelle);
            a.setPrixHT(prix);
            a.setTauxTVA(tauxTVA);
            a.setReference(reference);

            articles.remove(codeBarre);
            articles.put(codeBarre, a);

            this.getServletContext().setAttribute("articles", articles);

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e) {
            response.sendError(400, "Une erreur est survenue lors de la modification. Veuillez réessayer.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long.valueOf(request.getParameter("article"));

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/modificationArticle.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e) {
            response.sendError(404, "Cet article est introuvable.");
        }
    }
}
