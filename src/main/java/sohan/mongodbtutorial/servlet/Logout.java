package sohan.mongodbtutorial.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
    }

    /**
     * Handle HTTP POST requests.
     *
     * @param request  the {@link HttpServletRequest} object that contains the
     *                 request the client has made of the servlet.
     * @param response the {@link HttpServletResponse} object that contains the
     *                 response the servlet sends to the client.
     * @throws ServletException if an error occurs while processing the HTTP POST
     *                          request.
     * @throws IOException      if an error occurs in the input/output process while
     *                          processing the HTTP POST request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get all cookies associated with the request.
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            // Loop through all cookies and set their maximum age to 0 to delete them.
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("JSESSIONID")) {
                    System.out.println("JSESSIONID=" + cookie.getValue());
                }
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }

        // Get the session associated with the request.
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Invalidate the session to remove all attributes associated with it.
            session.invalidate();
        }

        // Redirect the client to the login page.
        String url = "/coursehub";
        response.sendRedirect(url);

    }

}