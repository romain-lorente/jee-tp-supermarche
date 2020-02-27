package servlets;

import models.Article;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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

            if(articles.containsKey(codeBarre)) {
                Article a = articles.get(codeBarre);
                a.setLibelle(libelle);
                a.setPrixHT(prix);
                a.setTauxTVA(tauxTVA);
                a.setReference(reference);

                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                response.sendError(404, "Cet article est introuvable.");
            }
        }
        catch (Exception e) {
            response.sendError(400, "Une erreur est survenue lors de la modification. Veuillez réessayer.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String param = request.getParameter("article");

            if(param != null) {
                Long codeBarre = Long.valueOf(param);

                ServletContext context = this.getServletContext();
                Map<Long, Article> articles = (Map<Long, Article>) context.getAttribute("articles");

                if(articles.containsKey(codeBarre)) {
                    Article article = articles.get(codeBarre);

                    request.setAttribute("article", article);

                    RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/modificationArticle.jsp");
                    dispatcher.forward(request, response);
                }
                else {
                    response.sendError(404, "Cet article est introuvable.");
                }
            }
            else {
                response.sendError(400, "Il manque un parametre dans la requete.");
            }
        }
        catch (Exception e) {
            response.sendError(400, "Le parametre codeBarre n'est pas du bon type.");
        }
    }
}
