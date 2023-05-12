<%--
  Created by IntelliJ IDEA.
  User: joeab
  Date: 5/12/23
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/partials/head.jsp">
        <jsp:param name="title" value="Ads"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="/partials/navbar.jsp"/>
    <h1>Ads</h1>
    <c:forEach items="${ads}" var="ad">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">${ad.title}</h5>
                <p class="card-text">${ad.description}</p>
            </div>
        </div>
    </c:forEach>
</body>
</html>
