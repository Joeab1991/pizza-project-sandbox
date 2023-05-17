package controllers;

import models.Order;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
		request.getRequestDispatcher("/orderSummary.jsp").forward(request, response);
	}
}
