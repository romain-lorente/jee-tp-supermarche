package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/suppressionPanier")
public class SuppressionPanierServlet extends AbstractSuppressionServlet {

    @Override
    protected void validatedCase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long[] selected = getSelected(request, response);

        if(selected != null) {

            if(selected.length > 0) {
                HttpSession session = request.getSession();
                ArrayList<Long> articles = (ArrayList<Long>) session.getAttribute("articles");

                for(Long articleCodeBarre : selected) {
                    boolean deleted = false;
                    int j = 0;
                    while(!deleted && j < articles.size()) {
                        if (articles.get(j).equals(articleCodeBarre)) {
                            articles.remove(j);
                            deleted = true;
                        }
                        j++;
                    }
                }
            }

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/suppressionPanierOk.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void toValidateCase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long[] selected = getSelected(request, response);

        if(selected != null) {
            request.setAttribute("selected", selected);

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/suppressionPanier.jsp");
            dispatcher.forward(request, response);
        }
    }
}
