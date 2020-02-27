package servlets;

import models.Article;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet("/ajout_au_panier")
public class AjoutArticlePanierServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            long codeBarre = Long.parseLong(req.getParameter("codeBarre"));

            ServletContext context = this.getServletContext();
            Map<Long, Article> articlesBoutique = (Map<Long, Article>) context.getAttribute("articles");

            if(articlesBoutique.containsKey(codeBarre)) {
                HttpSession session = req.getSession();
                ArrayList<Long> articlesPanier = (ArrayList<Long>) session.getAttribute("articles");

                articlesPanier.add(codeBarre);

                int quantity = 0;
                for(Long codeBarreArticle : articlesPanier) {
                    if(codeBarreArticle == codeBarre) quantity += 1;
                }

                resp.getOutputStream().write(String.format("Ajout réussi. Vous possédez actuellement %d entrées de cet article dans votre panier.", quantity).getBytes("utf-8"));
            } else {
                resp.setStatus(404);
                resp.getOutputStream().write("Aucun article n'est associé au code-barre saisi.".getBytes("utf-8"));
            }

        } catch (Exception e) {
            resp.setStatus(400);
            resp.getOutputStream().write("Le code-barre saisi n'est pas de type 'Long'.".getBytes("utf-8"));
        }
    }
}
