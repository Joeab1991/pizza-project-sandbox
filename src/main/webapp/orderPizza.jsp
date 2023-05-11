<%--
  Created by IntelliJ IDEA.
  User: joeab
  Date: 5/10/23
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>

<%--A user goes to /pizza-order and sees a pizza order form. This form features choices to select the crust type,
sauce type, size type (use select inputs), toppings (checkboxes), and delivery address (text input).
Use System.out.println to output the values submitted by the user.

use a POST request on the form
use one JSP and one servlet
don't worry about styling--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Order Pizza" />
    </jsp:include>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://kit.fontawesome.com/a470e83216.css" crossorigin="anonymous">
</head>
<body>
    <div class="container pb-5">
        <jsp:include page="partials/navbar.jsp" />
        <h2 class="text-start p-1 pt-5">Build your own pizza!</h2>
        <div class="card text-center p-0">
            <div class="card-header bg-transparent border-bottom-0 p-0 d-flex">
                <ul class="nav nav-tabs card-header-tabs border-bottom-0 ms-0 mb-0" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link d-flex align-items-center justify-content-center active"  id="size-and-crust-tab" data-bs-toggle="tab" data-bs-target="#size-and-crust-tab-pane" type="button" role="tab" aria-controls="size-and-crust" aria-selected="true"><i class="fa-solid fa-circle-1" style="color: #b7b7b7; margin: 5px;"></i>Size and Crust</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link d-flex align-items-center justify-content-center" id="cheese-and-sauce-tab" data-bs-toggle="tab" data-bs-target="#cheese-and-sauce-tab-pane" type="button" role="tab" aria-controls="cheese-and-sauce" aria-selected="false"><i class="fa-solid fa-circle-2" style="color: #b7b7b7; margin: 5px;"></i>Cheese and Sauce</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link d-flex align-items-center justify-content-center" id="toppings-tab" data-bs-toggle="tab" data-bs-target="#toppings-tab-pane" type="button" role="tab" aria-controls="toppings" aria-selected="false"><i class="fa-solid fa-circle-3" style="color: #b7b7b7; margin: 5px;"></i>Toppings</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link d-flex align-items-center justify-content-center" id="checkout-tab" data-bs-toggle="tab" data-bs-target="#checkout-tab-pane" type="button" role="tab" aria-controls="toppings" aria-selected="false"><i class="fa-solid fa-circle-4" style="color: #b7b7b7; margin: 5px;"></i>Checkout</button>
                    </li>
                </ul>
            </div>
            <div class="tab-content" id="myTabContent">
                <!--    SIZE AND CRUST PANE   -->
                <div class="tab-pane fade show active" id="size-and-crust-tab-pane" role="tabpanel" aria-labelledby="size-and-crust-tab" tabindex="0">
                    <div class="card-body border border-top-0 rounded-top p-0">
                        <div class="container p-0">
                            <h5 class="card-title text-start bg-primary text-white p-2" style="margin: 2px -2px 3px;">Choose Size and Crust</h5>
                            <form id="crust-selection" class="pizza-selection" action="/pizza-order" method="post">
                                <div class="container justify-content-between">
                                    <div class="card m-2 mt-3">
                                        <div class="card-header text-start">
                                            Hand Tossed
                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item text-start">
                                                Garlic seasoned crust with a rich, buttery taste.
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="radio" value="hand-tossed-small" id="hand-tossed-small" name="crust">
                                                <label class="form-check-label" for="hand-tossed-small">Small (10")</label>
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="radio" value="hand-tossed-medium" id="hand-tossed-medium" name="crust">
                                                <label class="form-check-label" for="hand-tossed-medium">Medium (12")</label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="card m-2 mb-3 mt-3">
                                        <div class="card-header text-start">
                                            Crispy Thin
                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item text-start">
                                                Thin enough for optimum crispy to crunchy ratio.
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="radio" value="crispy-medium" id="crispy-medium" name="crust">
                                                <label class="form-check-label" for="crispy-medium">Medium (12")</label>
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="radio" value="crispy-large" id="crispy-large" name="crust">
                                                <label class="form-check-label" for="crispy-large">Large (14")</label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer d-flex justify-content-end">
                            <button class="btn btn-primary nav-link d-flex align-items-center justify-content-center active" id="size-and-crust-next-step-btn" data-bs-target="#cheese-and-sauce-tab" type="button" role="button" aria-controls="cheese-and-sauce" aria-selected="false" style="padding: 10px 20px;">Next Step ></button>
                        </div>
                    </div>
                </div>
                <!--    CHEESE AND SAUCE PANE   -->
                <div class="tab-pane fade" id="cheese-and-sauce-tab-pane" role="button" aria-labelledby="cheese-and-sauce-tab" tabindex="0">
                    <div class="card-body rounded-top border border-top-0 p-0">
                        <div class="container p-0 rounded-top">
                            <h5 class="card-title text-start bg-primary text-white p-2" style="margin: 2px -2px 3px;">Choose Cheese and Sauce</h5>
                            <div class="container justify-content-between">
                                <div class="card m-2 mt-3">
                                    <div class="card-header text-start">
                                        Cheese
                                    </div>
                                    <form id="cheese-selection" class="pizza-selection" action="/pizza-order" method="post">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item text-start">
                                                <label for="amount-of-cheese">How much?</label>
                                            </li>
                                            <li class="list-group-item text-start form-label">
                                                <select name="cheese" id="amount-of-cheese" class="form-select">
                                                    <option value="Light">Light</option>
                                                    <option value="Normal">Normal</option>
                                                    <option value="Extra">Extra</option>
                                                    <option value="Double">Double</option>
                                                </select>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <div class="card m-2 mb-3 mt-3">
                                    <div class="card-header text-start">
                                        Sauce
                                    </div>
                                    <form id="sauce-selection" class="pizza-selection" action="/pizza-order" method="post">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item text-start">
                                                <label for="sauce-type">What kind?</label>
                                            </li>
                                            <li class="list-group-item text-start form-label">
                                                <select name="sauce" id="sauce-type" class="form-select">
                                                    <option value="Pizza Sauce">Pizza Sauce</option>
                                                    <option value="Alfredo Sauce">Alfredo Sauce</option>
                                                    <option value="BBQ Sauce">BBQ Sauce</option>
                                                    <option value="Garlic Sauce">Garlic Sauce</option>
                                                    <option value="Ranch Sauce">Ranch Sauce</option>
                                                </select>
                                            </li>
                                            <li class="list-group-item text-start">
                                                <label for="amount-of-sauce">How much?</label>
                                            </li>
                                            <li class="list-group-item text-start form-label">
                                                <select name="sauce" id="amount-of-sauce" class="form-select">
                                                    <option value="Light">Light</option>
                                                    <option value="Normal">Normal</option>
                                                    <option value="Extra">Extra</option>
                                                    <option value="Double">Double</option>
                                                </select>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-end">
                            <div class="btn-group" role="group" aria-label="Previous and Next Button Group">
                                <button class="btn btn-primary nav-link d-flex align-items-center justify-content-center active" id="cheese-and-sauce-previous-step-btn" data-bs-target="#size-and-crust-tab" type="button" role="button" aria-controls="size-and-crust" aria-selected="false" style="padding: 10px 20px;">< Previous</button>
                                <button class="btn btn-primary nav-link d-flex align-items-center justify-content-center active" id="cheese-and-sauce-next-step-btn" data-bs-target="#toppings-tab" type="button" role="button" aria-controls="toppings" aria-selected="false" style="padding: 10px 20px;">Next Step ></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--    TOPPINGS PANE   -->
                <div class="tab-pane fade" id="toppings-tab-pane" role="tabpanel" aria-labelledby="toppings-tab" tabindex="0">
                    <div class="card-body border border-top-0 rounded-top p-0">
                        <div class="container p-0 rounded-top">
                            <h5 class="card-title text-start bg-primary text-white p-2" style="margin: 2px -2px 3px;">Choose Toppings</h5>
                            <div class="container justify-content-between">
                                <div class="card m-2 mt-3">
                                    <div class="card-header text-start">
                                        Choose Meats
                                    </div>
                                    <form id="meats-selection" class="pizza-selection" action="/pizza-order" method="post">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="checkbox" value="Beef" id="topping-meat-beef" name="toppings">
                                                <label class="form-check-label" for="topping-meat-beef">Beef</label>
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="checkbox" value="Ham" id="topping-meat-ham" name="toppings">
                                                <label class="form-check-label" for="topping-meat-ham">Ham</label>
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="checkbox" value="Philly Steak" id="topping-meat-philly-steak" name="toppings">
                                                <label class="form-check-label" for="topping-meat-philly-steak">Philly Steak</label>
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="checkbox" value="Bacon" id="topping-meat-bacon" name="toppings">
                                                <label class="form-check-label" for="topping-meat-bacon">Bacon</label>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <div class="card m-2 mt-3">
                                    <div class="card-header text-start">
                                        Choose Non-Meats
                                    </div>
                                    <form id="non-meats-selection" class="pizza-selection" action="/pizza-order" method="post">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="checkbox" value="Green Peppers" id="topping-other-green-peppers" name="toppings">
                                                <label class="form-check-label" for="topping-other-green-peppers">Green Peppers</label>
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="checkbox" value="Mushrooms" id="topping-other-mushrooms" name="toppings">
                                                <label class="form-check-label" for="topping-other-mushrooms">Mushrooms</label>
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="checkbox" value="Onions" id="topping-other-onions" name="toppings">
                                                <label class="form-check-label" for="topping-other-onions">Onions</label>
                                            </li>
                                            <li class="list-group-item text-start">
                                                <input class="form-check-input me-1" type="checkbox" value="Jalapeño Peppers" id="topping-other-jalapeno-peppers" name="toppings">
                                                <label class="form-check-label" for="topping-other-jalapeno-peppers">Jalapeño Peppers</label>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-end">
                            <button class="btn btn-primary nav-link d-flex align-items-center justify-content-center active" id="toppings-previous-step-btn" data-bs-target="#cheese-and-sauce-tab" type="button" role="button" aria-controls="cheese-and-sauce" aria-selected="false" style="padding: 10px 20px;">< Previous</button>
                            <button class="btn btn-primary d-flex justify-content-around align-items-center" id="checkout-btn">Checkout<i class="fa-solid fa-cart-shopping-fast" style="margin-left: 5px;"></i></button>
                        </div>
                    </div>
                </div>
                <!--    CHECKOUT PANE   -->
                <div class="tab-pane fade" id="checkout-tab-pane" role="tabpanel" aria-labelledby="checkout-tab" tabindex="0">
                    <div class="card-body border border-top-0 rounded-top p-0">
                        <div class="container p-0 rounded-top">
                            <h5 class="card-title text-start bg-primary text-white p-2" style="margin: 2px -2px 3px;">Checkout</h5>
                            <div class="container justify-content-start">
                                <div class="card m-2 mt-3">
                                    <div class="card-header text-start">
                                        Enter a delivery address
                                    </div>
                                    <form id="checkout-form" class="row g-3 p-2" action="/pizza-order" method="post">
                                        <div class="col-12 text-start">
                                            <label for="street" class="form-label">Street:</label>
                                            <input type="text" class="form-control" id="street" name="street" placeholder="1234 Main St" required>
                                        </div>
                                        <div class="col-6 text-start">
                                            <label for="city" class="form-label">City:</label>
                                            <input type="text" class="form-control" id="city" name="city" placeholder="City" required>
                                        </div>
                                        <div class="col-3 text-start">
                                            <label for="state" class="form-label">State:</label>
                                            <select name="state" id="state" class="form-select">
                                                <option value="" selected disabled>Choose...</option>
                                                <option value="AL">Alabama</option>
                                                <option value="AK">Alaska</option>
                                                <option value="AZ">Arizona</option>
                                                <option value="AR">Arkansas</option>
                                                <option value="CA">California</option>
                                                <option value="CO">Colorado</option>
                                                <option value="CT">Connecticut</option>
                                                <option value="DW">Delaware</option>
                                                <option value="FL">Florida</option>
                                                <option value="GA">Georgia</option>
                                                <option value="HW">Hawaii</option>
                                                <option value="ID">Idaho</option>
                                                <option value="IL">Illinois</option>
                                                <option value="IN">Indiana</option>
                                                <option value="IW">Iowa</option>
                                                <option value="KS">Kansas</option>
                                                <option value="KT">Kentucky</option>
                                                <option value="LS">Louisiana</option>
                                                <option value="ME">Maine</option>
                                                <option value="MD">Maryland</option>
                                                <option value="MS">Massachusetts</option>
                                                <option value="MT">Michigan</option>
                                                <option value="MW">Minnesota</option>
                                                <option value="MS">Mississippi</option>
                                                <option value="MO">Missouri</option>
                                                <option value="MT">Montana</option>
                                                <option value="NB">Nebraska</option>
                                                <option value="NV">Nevada</option>
                                                <option value="NW">New Hampshire</option>
                                                <option value="NJ">New Jersey</option>
                                                <option value="NM">New Mexico</option>
                                                <option value="NY">New York</option>
                                                <option value="NC">North Carolina</option>
                                                <option value="ND">North Dakota</option>
                                                <option value="OH">Ohio</option>
                                                <option value="OK">Oklahoma</option>
                                                <option value="OR">Oregon</option>
                                                <option value="PW">Pennsylvania</option>
                                                <option value="RI">Rhode Island</option>
                                                <option value="SW">South Carolina</option>
                                                <option value="SD">South Dakota</option>
                                                <option value="TE">Tennessee</option>
                                                <option value="TX">Texas</option>
                                                <option value="UT">Utah</option>
                                                <option value="VM">Vermont</option>
                                                <option value="VW">Virginia</option>
                                                <option value="WS">Washington</option>
                                                <option value="WV">West Virginia</option>
                                                <option value="WG">Wisconsin</option>
                                                <option value="WY">Wyoming</option>
                                            </select>
                                        </div>
                                        <div class="col-3 text-start">
                                            <label for="zip" class="form-label">Zip:</label>
                                            <input type="text" class="form-control" id="zip" name="zip" placeholder="Zip" required>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-end">
                            <button class="btn btn-primary nav-link d-flex align-items-center justify-content-center active" id="checkout-previous-step-btn" data-bs-target="#toppings-tab" type="button" role="button" aria-controls="toppings" aria-selected="false" style="padding: 10px 20px;">Previous</button>
                            <button type="submit" class="btn btn-primary nav-link d-flex align-items-center justify-content-center active" id="submit-order-btn" data-bs-target="#toppings-tab" role="button" aria-controls="order-submit" aria-selected="false" style="padding: 10px 20px;">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--    <c:if test="${post != null}">--%>
<%--        <h2>Your Order Summary:</h2>--%>
<%--        <h3 id="crust-and-size">${post.title}</h3>--%>
<%--        <p>${post.post}</p>--%>
<%--        <p>Topics:</p>--%>
<%--        <ul>--%>
<%--            <c:forEach var="topic" items="${post.topics}">--%>
<%--                <li>${topic}</li>--%>
<%--            </c:forEach>--%>
<%--        </ul>--%>
<%--    </c:if>--%>
    <!-- SCRIPTS -->
    <script src="js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
</html>
