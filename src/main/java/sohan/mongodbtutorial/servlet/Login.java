package sohan.mongodbtutorial.servlet;

import com.mongodb.MongoClient;
import sohan.mongodbtutorial.dao.UserDao;
import sohan.mongodbtutorial.model.User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * The Login servlet handles user authentication.
 */
@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public Login() {
        super();
    }

    /**
     * Handles the HTTP GET request. If the user is already logged in, they are
     * redirected
     * to the dashboard. Otherwise, they are shown the login page.
     *
     * @param request  the HTTP request
     * @param response the HTTP response
     * @throws ServletException if there is a servlet-related problem
     * @throws IOException      if there is an I/O problem
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("id") != null) {
            System.out.println(session.getAttribute("role"));
            String url = "/coursehub/dashboard";
            response.sendRedirect(url);
        } else {

            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    /**
     * Handles the HTTP POST request for user authentication. If the user's
     * credentials are valid,
     * they are logged in and redirected to the dashboard. Otherwise, they are shown
     * the login page
     * with an error message.
     *
     * @param request  the HTTP request
     * @param response the HTTP response
     * @throws ServletException if there is a servlet-related problem
     * @throws IOException      if there is an I/O problem
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        UserDao userDao = new UserDao(mongo);
        User user = userDao.checkCredentials(username, password);

        // If the user's credentials are not valid, show the login page with an error
        // message.
        if (user == null) {
            response.sendRedirect("login.jsp?error=1");
        } else {
            // Otherwise, log the user in and redirect them to the dashboard.
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("id", user.getId());
            session.setAttribute("role", user.getRole());
            session.setAttribute("isLoggedIn", true);
            String url = "/coursehub/dashboard";
            response.sendRedirect(url);
        }

    }

}