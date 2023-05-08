package sohan.mongodbtutorial.servlet;

import com.mongodb.MongoClient;
import sohan.mongodbtutorial.dao.CourseDao;
import sohan.mongodbtutorial.dao.UserDao;
import sohan.mongodbtutorial.model.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class allTeacher
 */
@WebServlet("/allteacher")
public class AllTeacher extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllTeacher() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    /**
     * Handles GET requests to display all the teachers
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        UserDao userDao = new UserDao(mongo);
        List<User> teachers = userDao.getAllTeacher();
        System.out.println(teachers.size());
        request.setAttribute("teachers", teachers);

        RequestDispatcher dispatcher = request.getRequestDispatcher("allTeachers.jsp");
        dispatcher.forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    /**
     * Handles POST requests to delete a teacher
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        String line = null;
        StringBuilder stringBuilder = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        String id = stringBuilder.toString();
        System.out.println(id);
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        UserDao userDao = new UserDao(mongo);
        CourseDao courseDao = new CourseDao(mongo);
        userDao.deleteUser(id);
        courseDao.deleteTeacherCourses(id);

        String responseData = "Response data";

        // Set the content type of the response
        response.setContentType("text/plain");

        // Get a PrintWriter object from the response
        PrintWriter out = response.getWriter();

        // Write the response data to the output stream
        out.println(responseData);

        // Close the PrintWriter
        out.close();
    }

}