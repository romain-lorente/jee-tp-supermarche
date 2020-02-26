package servlets;

import models.Article;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet("/suppressionOk")
public class ConfirmerSuppressionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Map<Long, Article> articles = (Map<Long, Article>) this.getServletContext().getAttribute("articles");

            for(String valeur : request.getParameterValues("selected")) {
                Long codeBarre = Long.parseLong(valeur);

                articles.remove(codeBarre);
            }

            this.getServletContext().setAttribute("articles", articles);

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/suppressionOk.jsp");
            dispatcher.forward(request, response);
        }
        catch(Exception e) {
            response.sendError(400, "Au moins un des codes est invalide. Veuillez réessayer.");
        }
    }
}
