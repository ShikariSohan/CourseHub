package sohan.mongodbtutorial.servlet;

import com.mongodb.MongoClient;
import sohan.mongodbtutorial.dao.CourseDao;
import sohan.mongodbtutorial.model.Course;

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
    }

    /**
     * This method handles GET requests to the "/currentcourses" URL.
     * It retrieves all courses that are not archived from the database,
     * as well as all archived courses.
     * It then sets these courses as request attributes and forwards the
     * request and response to the "currentCourses.jsp" page for rendering.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        CourseDao courseDao = new CourseDao(mongo);
        List<Course> courses = courseDao.getAllCourse(false); // get all non-archived courses
        List<Course> archived = courseDao.getAllCourse(true); // get all archived courses
        request.setAttribute("courses", courses);
        request.setAttribute("archived", archived);

        RequestDispatcher dispatcher = request.getRequestDispatcher("currentCourses.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * This method handles POST requests to the "/currentcourses" URL.
     * It receives data from the client via an AJAX call, which is in the form
     * of a boolean value and a course ID, separated by a dash.
     * It then updates the course's archived status in the database
     * using the CourseDao class, based on the boolean value received.
     * Finally, it sends a plain text response back to the client.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        String line = null;
        StringBuilder stringBuilder = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        String token = stringBuilder.toString();
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        String[] parts = token.split("-");
        String val = parts[0];
        String id = parts[1];
        boolean isTrue = val.equals("T"); // boolean value indicating whether the course should be archived or
                                          // unarchived
        CourseDao courseDao = new CourseDao(mongo);
        courseDao.archiveACourse(id, !isTrue); // update the course's archived status in the database
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
