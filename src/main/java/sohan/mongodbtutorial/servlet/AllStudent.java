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

/**
 * Servlet implementation class AllStudent
 */
@WebServlet("/allstudent")
public class AllStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllStudent() {
        super();
    }

    /**
     * Handles HTTP GET requests. Retrieves all the students from the database and
     * forwards the request to the JSP file 'allStudents.jsp'
     * 
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
        UserDao userDao = new UserDao(mongo);

        // Retrieve all the students from the database
        List<User> students = userDao.getAllStudent();
        System.out.println(students.size());

        // Set the 'students' attribute of the request object to the retrieved list of
        // students
        request.setAttribute("students", students);

        // Forward the request and response objects to the 'allStudents.jsp' file for
        // rendering
        RequestDispatcher dispatcher = request.getRequestDispatcher("allStudents.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles HTTP POST requests. Deletes the user and all its associated
     * enrollments from the database and sends a plain text response back to the
     * client.
     * 
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Read the request body and get the user id to be deleted
        BufferedReader reader = request.getReader();
        String line = null;
        StringBuilder stringBuilder = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        String id = stringBuilder.toString();
        System.out.println(id);

        // Delete the user and all its associated enrollments from the database
        MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
        UserDao userDao = new UserDao(mongo);
        EnrollDao enrollDao = new EnrollDao(mongo);
        userDao.deleteUser(id);
        enrollDao.deleteStudentEnroll(id);

        // Prepare the response data
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