package sohan.mongodbtutorial.servlet;

import com.mongodb.MongoClient;
import sohan.mongodbtutorial.dao.CourseDao;
import sohan.mongodbtutorial.dao.EnrollDao;
import sohan.mongodbtutorial.dao.UserDao;
import sohan.mongodbtutorial.model.Course;
import sohan.mongodbtutorial.model.Enroll;
import sohan.mongodbtutorial.model.User;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CourseDetails
 */
@WebServlet("/coursedetails")
public class CourseDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseDetails() {
        super();
    }

    /**
     * Handles GET requests for course details, retrieves information about a course
     * and its enrolled students from the database and forwards it to the
     * courseDetails.jsp page.
     *
     * @param request  HTTP request object
     * @param response HTTP response object
     * @throws ServletException if there is a servlet-related problem
     * @throws IOException      if there is an I/O problem
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        String courseId = request.getParameter("id");
        UserDao userDao = new UserDao(mongo);
        CourseDao courseDao = new CourseDao(mongo);
        EnrollDao enrollDao = new EnrollDao(mongo);

        // Retrieve course and enrolled student information from the database
        Course course = courseDao.getCourseById(courseId);
        List<Enroll> enrolls = enrollDao.getStudentList(courseId);
        List<User> students = userDao.getStudentList(enrolls);
        int studentCount = students.size();

        // Forward course and student information to the courseDetails.jsp page
        request.setAttribute("course", course);
        request.setAttribute("students", students);
        request.setAttribute("studentCount", studentCount);
        RequestDispatcher dispatcher = request.getRequestDispatcher("courseDetails.jsp");
        dispatcher.forward(request, response);
    }

}
