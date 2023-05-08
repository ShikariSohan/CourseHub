package sohan.mongodbtutorial.servlet;

import com.mongodb.MongoClient;
import sohan.mongodbtutorial.dao.UserDao;
import sohan.mongodbtutorial.model.User;
import sohan.mongodbtutorial.utils.StringArrays;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Initializes the servlet.
     */
    public register() {
        super();
    }

    /**
     * Handles GET requests to the servlet by setting the departments attribute and
     * forwarding the request to the
     * register.jsp page.
     *
     * @param request  the HttpServletRequest object that contains the request the
     *                 client has made of the servlet
     * @param response the HttpServletResponse object that contains the response the
     *                 servlet sends to the client
     * @throws ServletException if the request could not be handled
     * @throws IOException      if an input or output error is detected when the
     *                          servlet handles the GET request
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StringArrays stringArrays = new StringArrays();

        String[] depts = stringArrays.getDepartments();
        request.setAttribute("depts", depts);
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    /**
     * Handles POST requests to the servlet by creating a new User object from the
     * parameters of the request and
     * adding it to the database using the UserDao. The client is then redirected to
     * the login page.
     *
     * @param request  the HttpServletRequest object that contains the request the
     *                 client has made of the servlet
     * @param response the HttpServletResponse object that contains the response the
     *                 servlet sends to the client
     * @throws ServletException if the request could not be handled
     * @throws IOException      if an input or output error is detected when the
     *                          servlet handles the POST request
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = new User();
        user.setEmail(request.getParameter("email"));
        user.setName(request.getParameter("name"));
        user.setPassword(request.getParameter("password"));
        user.setValid(false);
        user.setUsername(request.getParameter("username"));
        user.setRole(request.getParameter("role"));
        user.setDept(request.getParameter("dept"));

        MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
        UserDao userDao = new UserDao(mongo);
        userDao.create(user);
        System.out.println("User Created Successfully...");

        String url = "/coursehub/login";
        response.sendRedirect(url);
    }
}