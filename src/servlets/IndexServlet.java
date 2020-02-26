package servlets;

import models.Article;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Obtention de la liste des articles, ou création si elle n'existe pas
        Object articlesObject = this.getServletContext().getAttribute("articles");
        if(articlesObject == null) {
            HashMap<Long, Article> articles = new HashMap<>();
            articlesObject = articles;
            this.getServletContext().setAttribute("articles", articles);
        }

        if(articlesObject instanceof Map) {
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }

        response.sendError(500, "Ça fonctionne pas !");
    }
}
