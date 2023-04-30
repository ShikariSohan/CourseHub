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


@WebServlet("/dashboard")
public class Dashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        UserDao userDao = new UserDao(mongo);
        CourseDao courseDao = new CourseDao(mongo);
        if (session != null && session.getAttribute("id") != null) {
            System.out.println(session.getAttribute("role"));
            String role = session.getAttribute("role").toString();
            if (role.equals("admin")) {
                List<User> teachers = userDao.getRecentUser("teacher");
                List<User> students = userDao.getRecentUser("student");
                List<Course> courses = courseDao.getRecentCourses();
                int totalStudents = userDao.getUserCount("student");
                int totalTeachers = userDao.getUserCount("teacher");
                int totalCourses = courseDao.getCourseCount();
                int runningCourses = courseDao.getRunningCourseCount();
                request.setAttribute("teachers", teachers);
                request.setAttribute("students", students);
                request.setAttribute("courses", courses);
                request.setAttribute("totalCourses", totalCourses);
                request.setAttribute("totalStudents", totalStudents);
                request.setAttribute("totalTeachers", totalTeachers);
                request.setAttribute("runningCourses", runningCourses);
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
                dispatcher.forward(request, response);

            } else if (role.equals("teacher")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("teacherDashboard.jsp");
                dispatcher.forward(request, response);
            } else {

                RequestDispatcher dispatcher = request.getRequestDispatcher("studentDashboard.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            String url = "/coursehub";
            response.sendRedirect(url);
        }


    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String password = request.getParameter("password");

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

}