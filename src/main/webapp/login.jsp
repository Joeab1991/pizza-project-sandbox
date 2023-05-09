<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--When a user visits /login.jsp, they should see a form for logging in

This form should have a 'username' and 'password' field.

This form should submit a POST request to /login.jsp

Inside of login.jsp write some code to check the submmitted values. If the username submitted is "admin", and the
password is "password", redirect the user to the profile page; otherwise, redirect back to the login form.--%>





<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Login"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp"/>
    <header>
        <h1>Login</h1>
    </header>
    <main>
        <form action="/login.jsp" method="post">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" placeholder="username">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" placeholder="password">
            <input type="submit" value="Login">
        </form>
    </main>
</body>
</html>

<c:if test="${param.username == 'admin' && param.password == 'password'}">
    <c:redirect url="/profile.jsp"/>
</c:if>










