package sohan.mongodbtutorial.servlet;

import com.mongodb.MongoClient;
import sohan.mongodbtutorial.dao.UserDao;
import sohan.mongodbtutorial.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class register
 */
@WebServlet("/profile")
public class CourseStudentList extends HttpServlet {

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseStudentList() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String url = "coursehub/courseStudentList";
            response.sendRedirect(url);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}