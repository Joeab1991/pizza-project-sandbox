<%--
  Created by IntelliJ IDEA.
  User: joeab
  Date: 5/12/23
  Time: 09:26
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="partials/head.jsp">
    <jsp:param name="title" value="Color Viewer" />
  </jsp:include>
  <style>
    body {
      background-color: ${color};
    }
  </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />



</body>
</html>
