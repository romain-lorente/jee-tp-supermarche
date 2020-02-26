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
        Map<Long, Article> articles = (Map<Long, Article>) this.getServletContext().getAttribute("articles");

        try {
            String libelle = request.getParameter("libelle");
            String reference = request.getParameter("reference");
            Long codeBarre = Long.valueOf(request.getParameter("codeBarre"));
            Integer tauxTVA = Integer.parseInt(request.getParameter("tva"));
            Integer prix = (int)(Double.parseDouble(request.getParameter("prix")) * 100);

            articles.put(codeBarre, new Article(codeBarre, reference, libelle, prix, tauxTVA));

            this.getServletContext().setAttribute("articles", articles);

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e) {
            response.sendError(400, "Une erreur est survenue lors de l'ajout. Veuillez réessayer.");
        }
    }
}
