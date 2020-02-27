package servlets;

import models.Article;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public abstract class AbstractSuppressionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("valider") != null) {
            validatedCase(request, response);
        } else {
            toValidateCase(request, response);
        }
    }

    protected Long[] getSelected(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] selected = request.getParameterValues("selected");

        if(selected != null) {
            try {
                Long[] selectedConverted = new Long[selected.length];

                for (int i = 0; i < selected.length; i++) {
                    selectedConverted[i] = Long.parseLong(selected[i]);
                }

                return selectedConverted;
            } catch (Exception e) {
                response.sendError(400, "Au moins un des codes est invalide.");

                return null;
            }
        } else {
            return new Long[0];
        }
    }

    protected abstract void validatedCase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    protected abstract void toValidateCase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
