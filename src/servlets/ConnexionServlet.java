package servlets;

import models.Article;
import models.Utilisateur;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/connexion")
public class ConnexionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ServletContext context = this.getServletContext();

            Map<String, Utilisateur> utilisateurs = (Map<String, Utilisateur>) context.getAttribute("utilisateurs");
            String nom = request.getParameter("nom");
            String mdp = request.getParameter("mdp");

            if(utilisateurs.containsKey(nom)) {
                Utilisateur user = utilisateurs.get(nom);
                if(mdp.equals(user.getMdp())) {
                    HttpSession session = request.getSession();
                    session.setAttribute("utilisateur", nom);

                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                } else {
                    response.setStatus(401);
                    response.getOutputStream().write("Les informations de connexion sont incorrectes.".getBytes("utf-8"));
                }
            } else {
                response.setStatus(404);
                response.getOutputStream().write("Cet utilisateur n'existe pas.".getBytes("utf-8"));
            }
        } catch (Exception e) {
            response.setStatus(400);
            response.getOutputStream().write("Erreur lors de la connexion.".getBytes("utf-8"));
        }
    }
}
