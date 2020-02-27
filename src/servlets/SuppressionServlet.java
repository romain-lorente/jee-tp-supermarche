package servlets;

import models.Article;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet("/suppression")
public class SuppressionServlet extends AbstractSuppressionServlet {

    @Override
    protected void validatedCase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long[] selected = getSelected(request, response);

        if(selected != null) {

            if(selected.length > 0) {
                HttpSession session = request.getSession();
                Map<Long, Article> articles = (Map<Long, Article>) this.getServletContext().getAttribute("articles");

                for(Long valeur : selected) {
                    articles.remove(valeur);
                }
            }

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/suppressionOk.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void toValidateCase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long[] selected = getSelected(request, response);

        if(selected != null) {
            request.setAttribute("selected", selected);

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/suppression.jsp");
            dispatcher.forward(request, response);
        }
    }
}
