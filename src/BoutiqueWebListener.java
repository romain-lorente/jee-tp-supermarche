import models.Article;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.HashMap;
import java.util.Map;

@WebListener
public class BoutiqueWebListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();

        Map<Long, Article> articles = new HashMap<Long, Article>();
        articles.put(984L, new Article(984L, "RF_984", "Poubelle", 100, Article.TVA[0]));
        articles.put(974L, new Article(974L, "RF_974", "Lit", 19999, Article.TVA[0]));
        articles.put(978L, new Article(978L, "RF_978", "Lave-Vaisselle", 59500, Article.TVA[0]));
        articles.put(789L, new Article(789L, "RF_789", "Seche-linge", 48000, Article.TVA[0]));
        articles.put(756L, new Article(756L, "RF_756", "Réfrégirateur", 78000, Article.TVA[0]));

        context.setAttribute("articles", articles);
    }
}
