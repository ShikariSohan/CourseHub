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
        EnrollDao enrollDao = new EnrollDao(mongo);
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
                String studentId = (String) session.getAttribute("id");
                List<Enroll> enrolls = enrollDao.getCourseList(studentId);
                List<Course> courses = courseDao.getStudentCourses(enrolls);
                request.setAttribute("courses", courses);
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

        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        HttpSession session = request.getSession(false);
        String courseCode = request.getParameter("courseCode");
        String studentId = (String) session.getAttribute("id");
        EnrollDao enrollDao = new EnrollDao(mongo);
        CourseDao courseDao = new CourseDao(mongo);
        String courseId = courseDao.getCourseId(courseCode);
        if (courseId != null) {
            Enroll enroll = new Enroll();
            enroll.setStudentId(studentId);
            enroll.setCourseId(courseId);
            enrollDao.create(enroll);
            String url = "/coursehub/dashboard?q=1";
            response.sendRedirect(url);
        } else {
            String url = "/coursehub/dashboard?q=2";
            response.sendRedirect(url);
        }
    }

}