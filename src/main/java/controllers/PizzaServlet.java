package controllers;

import models.Order;

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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/orderPizza.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//order summary
		String crust = request.getParameter("crust");
		String cheese = request.getParameter("cheese");
		String[] sauceArry = request.getParameterValues("sauce");
		String sauce = "";
		String[] toppingsArry = request.getParameterValues("toppings");
		String toppings = "";
		//delivery info
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");


		StringBuilder sauceSpecs = new StringBuilder();
		for (String s : sauceArry) {
			sauceSpecs.append(s).append(", ");
		}
		sauceSpecs.setLength(sauceSpecs.length() - 2);
		sauce = sauceSpecs.toString();

		StringBuilder toppingSpecs = new StringBuilder();
		for (String t : toppingsArry) {
			toppingSpecs.append(t).append(", ");
		}
		toppingSpecs.setLength(toppingSpecs.length() - 2);
		toppings = toppingSpecs.toString();

		Order customerOrder = new Order(crust, cheese, sauce, toppings, street, city, state, zip);

		request.setAttribute("order", customerOrder);
		request.getRequestDispatcher("/orderPizza.jsp").forward(request, response);

//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//
//		out.println("<div class=" + "container " + "pb-5" + ">");
//		out.println("<jsp:include page="+"partials/navbar.jsp"+ "/>");
//		out.println("<div class=\"card text-center p-0\">");
//		out.println("<div class=\"card-header bg-transparent border-bottom-0 p-0 d-flex\">");
//		out.println("<h1 class=\"text-start p-1 pt-5\">Your order has been placed!</h1>");
//		out.println("</div>");
//		out.println("<div class=\"tab-content\" id=\"myTabContent\">\n" +
//				"<div class=\"tab-pane fade show active\" id=\"size-and-crust-tab-pane\" role=\"tabpanel\" aria-labelledby=\"size-and-crust-tab\" tabindex=\"0\">\n" +
//				"                    <div class=\"card-body border border-top-0 rounded-top p-0\">\n" +
//				"                        <div class=\"container p-0\">\n" +
//				"                            <h5 class=\"card-title text-start bg-primary text-white p-2\" style=\"margin: 2px -2px 3px;\">Order Details</h5>");
//		out.println("<p>Crust: " + customerOrder.getCrust() + "</p>");
//		out.println("<p>Cheese: " + customerOrder.getCheese() + "</p>");
//		out.println("<p>Sauce: " + sauceSpecs + "</p>");
//		out.println("<p>Toppings: " + toppingSpecs + "</p>");
//		out.println("</div>\n" +
//				"					</div>");
//		out.println("<div class=\"card-body border border-top-0 rounded-top p-0\">\n" +
//				"                        <div class=\"container p-0\">\n" +
//				"                            <h5 class=\"card-title text-start bg-primary text-white p-2\" style=\"margin: 2px -2px 3px;\">Delivery Details</h5>");
//		out.println("<p>Street: " + customerOrder.getStreet() + "</p>");
//		out.println("<p>City: " + customerOrder.getCity() + "</p>");
//		out.println("<p>State: " + customerOrder.getState() + "</p>");
//		out.println("<p>Zip: " + customerOrder.getZip() + "</p>");
//		out.println("</div>\n" +
//				"					</div>\n" +
//						"			</div>");
//		System.out.println("Crust: " + customerOrder.getCrust());
//		System.out.println("Cheese: " + customerOrder.getCheese());
//		System.out.println("Sauce: " + sauceSpecs);
//		System.out.println("Toppings: " + toppingSpecs);
//		System.out.println("Street: " + customerOrder.getStreet());
//		System.out.println("City: " + customerOrder.getCity());
//		System.out.println("State: " + customerOrder.getState());
//		System.out.println("Zip: " + customerOrder.getZip());
	}
}
