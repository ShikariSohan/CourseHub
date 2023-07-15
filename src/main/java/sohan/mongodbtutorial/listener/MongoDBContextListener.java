package sohan.mongodbtutorial.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoException;

/**
 * 
 * MongoDB context listener for initializing and destroying MongoClient
 */
@WebListener
public class MongoDBContextListener implements ServletContextListener {
    /**
     * 
     * Initializes MongoClient and sets it as a ServletContext attribute
     * 
     * @param sce ServletContextEvent object
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            MongoClientURI uri = new MongoClientURI(
                    "YOUR MONGODB DB URL");

            MongoClient mongo = new MongoClient(uri);

            // MongoClient mongo = new MongoClient(
            // ctx.getInitParameter("MONGODB_HOST"),
            // Integer.parseInt(ctx.getInitParameter("MONGODB_PORT")));
            System.out.println("MongoClient initialized successfully");

            sce.getServletContext().setAttribute("MONGO_CLIENT", mongo);
        } catch (MongoException e) {
            throw new RuntimeException("MongoClient init failed");
        }
    }

    /**
     * 
     * Closes MongoClient when the ServletContext is destroyed
     * 
     * @param sce ServletContextEvent object
     */

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        MongoClient mongo = (MongoClient) sce.getServletContext()
                .getAttribute("MONGO_CLIENT");
        mongo.close();
        System.out.println("MongoClient closed successfully");
    }

}
