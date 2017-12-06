<%--
  Created by IntelliJ IDEA.
  User: software01
  Date: 04/12/17
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<html>
<head>
    <title>My books</title>

    <c:url value="/static/bower_components" var="bower" />

    <link rel="stylesheet" href="${bower}/tether/dist/css/tether.min.css" />
    <link rel="stylesheet" href="${bower}/bootstrap/dist/css/bootstrap.min.css" />

</head>
<body class="jumbotron">
    <h1>
        <security:authentication property="principal" var="user"/>
        User: ${user.username}
    </h1>

    <a href="/books/form" class="btn btn-primary"> New Book</a>

    <strong>${success}</strong>
    <strong>${fail}</strong>

    <hr>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Preços</th>
                <th>Pages</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>
                        <a href="${s:mvcUrl('BC#detail').arg(0, book.id).build()}">${book.title}</a>
                    </td>
                    <td>${book.description}</td>
                    <td>${book.prices}</td>
                    <td>${book.pages}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>

<script type="text/javascript" src="${bower}/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="${bower}/tether/dist/js/tether.min.js"></script>
<script type="text/javascript" src="${bower}/bootstrap/dist/js/bootstrap.min.js"></script>

</html>
