<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: joeab
  Date: 5/17/23
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Order Summary" />
    </jsp:include>
</head>
<body>
    <div class="container pb-5">
        <jsp:include page="partials/navbar.jsp" />
    </div>
    <c:if test="${order == null}">
        <h1>Order not found!</h1>
    </c:if>
    <c:if test="${order != null}">
    <div class="container pb-5">
        <div class="card text-center p-0">
            <div class="card-header">
                <h2>Order has been placed!</h2>
            </div>
            <div class="card-body">
                <h3>Order Summary:</h3>
                <div class="row justify-content-center">
                    <div class="col-4">
                        <p>Crust: ${order.crust}</p>
                        <p>Cheese: ${order.cheese}</p>
                        <p>Sauce: ${order.sauce}</p>
                        <p>Toppings: ${order.toppings}</p>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <h3>Your Order will be delivered to:</h3>
                <div class="row justify-content-center">
                    <div class="col-4">
                        <p>${order.street}</p>
                        <p>${order.city}, ${order.state} ${order.zip}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>
    <!-- SCRIPTS -->
    <script src="js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
</html>
