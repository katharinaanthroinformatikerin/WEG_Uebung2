// Gehört in Ordner src/servlets/
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FormServlet", urlPatterns = {"/FormServlet"})
public class FormServlet extends HttpServlet {

    public void init() throws ServletException {
        // Do required initialization
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FormServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FormServlet at " + request.getContextPath() + "</h1>");
            out.println("<ul>");
            Enumeration<String> parameterNames = request.getParameterNames();

            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                String[] paramValues = request.getParameterValues(paramName);

                String logOutput = paramName + " = ";
                for (int i = 0; i < paramValues.length; i++) {
                    String paramValue = paramValues[i];
                    logOutput += (i == paramValues.length - 1) ? paramValue : paramValue + ", ";
                }
                out.println("<li>");
                out.println(logOutput);
                out.println("</li>");
            }
            out.println("</ul>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //System.out.println("$ Hello from doPost");
        processRequest(request, response);

        // Unterpunkt 4
        /*Enumeration<String> parameterNames = request.getParameterNames();

        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String[] paramValues = request.getParameterValues(paramName);

            String logOutput = "$ " + paramName + " = ";
            for (int i = 0; i < paramValues.length; i++) {
                String paramValue = paramValues[i];
                logOutput += (i == paramValues.length - 1) ? paramValue : paramValue + ", ";
            }
            System.out.println(logOutput);
        }*/
        // Set response content type
        response.setContentType("text/html");

        // Specify the content
        PrintWriter out = response.getWriter();
        out.println("<h1>" + "Hello World" + "</h1>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //System.out.println("$ Hello from doGet");
        processRequest(request, response);

    }

    public void destroy() {
        // do nothing.
    }
}
