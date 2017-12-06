<%--
  Created by IntelliJ IDEA.
  User: software01
  Date: 04/12/17
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<html>
<head>
    <title>Login</title>

    <c:url value="/static/bower_components" var="bower" />

    <link rel="stylesheet" href="${bower}/tether/dist/css/tether.min.css" />
    <link rel="stylesheet" href="${bower}/bootstrap/dist/css/bootstrap.min.css" />

</head>
<body class="jumbotron">


    <form:form servletRelativeAction="/login" method="POST">

        <div class="row">
            <div class="col-md-6 offset-3">
                <h1>Login</h1>

                <div class="form-group">
                    <label for="username">Email:</label>
                    <input type="text" class="form-control" id="username" name="username"/>
                    <form:errors path="username" />
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" />
                    <form:errors path="password" />
                </div>
                <button class="btn btn-success" type="submit">Login</button>
            </div>
        </div>
    </form:form>

</body>

<script type="text/javascript" src="${bower}/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="${bower}/tether/dist/js/tether.min.js"></script>
<script type="text/javascript" src="${bower}/bootstrap/dist/js/bootstrap.min.js"></script>

</html>
