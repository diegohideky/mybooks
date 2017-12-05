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
<html>
<head>
    <title>My books</title>

    <style type="text/css"><%@include file="/static/bower_components/tether/dist/css/tether.min.css"%></style>
    <style type="text/css"><%@ include file="/static/bower_components/bootstrap/dist/css/bootstrap.min.css" %></style>

</head>
<body class="jumbotron">
    <h1>Books List</h1>

    <a href="/books/form" class="btn btn-primary"> New Book</a>

    <strong>${success}</strong>
    <strong>${fail}</strong>

    <hr>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
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
                    <td>${book.pages}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>

<script type="text/javascript"><%@include file="/static/bower_components/jquery/dist/jquery.min.js"%></script>
<script type="text/javascript"><%@include file="/static/bower_components/tether/dist/js/tether.min.js"%></script>
<script type="text/javascript"><%@include file="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"%></script>

</html>
