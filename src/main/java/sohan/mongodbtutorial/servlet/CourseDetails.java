package sohan.mongodbtutorial.servlet;

import com.mongodb.MongoClient;
import sohan.mongodbtutorial.dao.CourseDao;
import sohan.mongodbtutorial.dao.EnrollDao;
import sohan.mongodbtutorial.dao.UserDao;
import sohan.mongodbtutorial.model.Course;
import sohan.mongodbtutorial.model.Enroll;
import sohan.mongodbtutorial.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Sohan
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
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        String courseId = request.getParameter("id");
        UserDao userDao = new UserDao(mongo);
        CourseDao courseDao = new CourseDao(mongo);
        EnrollDao enrollDao = new EnrollDao(mongo);
        Course course = courseDao.getCourseById(courseId);
        List<Enroll> enrolls = enrollDao.getStudentList(courseId);
        List<User> students = userDao.getStudentList(enrolls);
        request.setAttribute("course", course);
        request.setAttribute("students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("courseStudentList.jsp");
        dispatcher.forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}