package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

@WebServlet(name = "PizzaServlet", value = "/pizza-order")
@MultipartConfig
public class PizzaServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String street = null;
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			if ("street".equals(part.getName())) {
				street = request.getParameter("street");
			}
		}

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Form Submitted</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Form Submitted</h1>");
		out.println("<p>Street: " + street + "</p>");
		out.println("</body>");
		out.println("</html>");
	}
}
