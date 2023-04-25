package sohan.mongodbtutorial.servlet;

import com.mongodb.MongoClient;
import sohan.mongodbtutorial.dao.CourseDao;
import sohan.mongodbtutorial.dao.UserDao;
import sohan.mongodbtutorial.model.Course;
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
 * Servlet implementation class CurrentCourses
 */
@WebServlet("/currentcourses")
public class CurrentCourses extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurrentCourses() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession(false);
//        if (session != null) {
//            System.out.println(session.getAttribute("id"));
//            System.out.println(session.getAttribute("role"));
//        } else {
//            System.out.println("Noooooooooo");
//        }
//        find all the students...
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        CourseDao courseDao = new CourseDao(mongo);
        List<Course> courses = courseDao.getAllCourse();
        request.setAttribute("courses", courses);

        RequestDispatcher dispatcher = request.getRequestDispatcher("currentCourses.jsp");
        dispatcher.forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Course course = new Course();
        course.setCourseCode(request.getParameter("courseCode"));
        course.setName(request.getParameter("name"));
        course.setTeacher(request.getParameter("teacher"));
        course.setIsArchived(false);
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        CourseDao courseDao = new CourseDao(mongo);
        courseDao.create(course);
        System.out.println("Course Created Successfully...");

        String url = "/coursehub/dashboard";
        response.sendRedirect(url);
    }

}