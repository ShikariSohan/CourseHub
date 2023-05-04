package sohan.mongodbtutorial.servlet;


import com.mongodb.MongoClient;
import sohan.mongodbtutorial.dao.EnrollDao;
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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Sohan
 */
@WebServlet("/allstudent")
public class AllStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllStudent() {
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
        UserDao userDao = new UserDao(mongo);
        List<User> students = userDao.getAllStudent();
        System.out.println(students.size());
        request.setAttribute("students", students);

        RequestDispatcher dispatcher = request.getRequestDispatcher("allStudents.jsp");
        dispatcher.forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        EnrollDao enrollDao = new EnrollDao(mongo);
        userDao.deleteUser(id);
        enrollDao.deleteStudentEnroll(id);
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