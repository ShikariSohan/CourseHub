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
 * Servlet implementation class Profile
 * This servlet is used to display the profile of a logged in user
 */
@WebServlet("/profile")
public class Profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("id") != null) {
            // If the user is logged in, fetch their details from the database and display
            // their profile
            MongoClient mongo = (MongoClient) request.getServletContext()
                    .getAttribute("MONGO_CLIENT");
            UserDao userDao = new UserDao(mongo);
            User user = userDao.getUser((String) session.getAttribute("id"));
            request.setAttribute("name", user.getName());
            request.setAttribute("email", user.getEmail());
            request.setAttribute("dept", user.getDept());
            request.setAttribute("role", user.getRole());
            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);

        } else {
            // If the user is not logged in, redirect to the login page
            String url = "coursehub/login";
            response.sendRedirect(url);
        }
    }

}