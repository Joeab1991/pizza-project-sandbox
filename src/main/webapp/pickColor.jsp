<%--
  Created by IntelliJ IDEA.
  User: joeab
  Date: 5/12/23
  Time: 09:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Order Pizza" />
    </jsp:include>
</head>
<body>
    <div class="container pb-5">
        <jsp:include page="partials/navbar.jsp" />
        <div class="row">
            <div class="col-12">
                <h1 class="text-center">Pick your favorite color!</h1>
                <form action="${pageContext.request.contextPath}/pickcolor" method="post">
                    <label for="color">Favorite Color</label>
                    <input type="text" name="color" id="color">
                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
