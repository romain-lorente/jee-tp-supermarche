import models.Article;
import models.Utilisateur;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.HashMap;
import java.util.Map;

@WebListener
public class BoutiqueContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();

        Map<Long, Article> articles = new HashMap<Long, Article>();
        articles.put(984L, new Article(984L, "RF_984", "Poubelle", 100, 0));
        articles.put(974L, new Article(974L, "RF_974", "Lit", 19999, 1));
        articles.put(978L, new Article(978L, "RF_978", "Lave-Vaisselle", 59500, 1));
        articles.put(789L, new Article(789L, "RF_789", "Seche-linge", 48000, 0));
        articles.put(756L, new Article(756L, "RF_756", "Réfrigérateur", 78000, 0));

        Map<String, Utilisateur> utilisateurs = new HashMap<String, Utilisateur>();
        utilisateurs.put("rlorente", new Utilisateur("rlorente", "admin"));
        utilisateurs.put("qlegrand", new Utilisateur("qlegrand", "epsi"));

        context.setAttribute("articles", articles);
        context.setAttribute("utilisateurs", utilisateurs);
    }
}
