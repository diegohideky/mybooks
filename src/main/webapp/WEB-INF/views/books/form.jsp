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
    <title>My books</title>

    <style type="text/css"><%@include file="/static/bower_components/tether/dist/css/tether.min.css"%></style>
    <style type="text/css"><%@ include file="/static/bower_components/bootstrap/dist/css/bootstrap.min.css" %></style>

</head>
<body class="jumbotron">

    <form:form action="${s:mvcUrl('BC#submit').build()}" method="POST"
        commandName="book" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title">Title:</label>
            <form:input class="form-control" id="title" path="title"/>
            <form:errors path="title" />
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <form:textarea class="form-control" rows="5" cols="20" id="description" path="description"/>
            <form:errors path="description" />
        </div>
        <div class="form-group">
            <label for="pages">Pages:</label>
            <form:input class="form-control" id="pages" path="pages" />
            <form:errors path="pages" />
        </div>
        <div class="form-group">
            <label for="releaseDate">Release Date:</label>
            <form:input class="form-control" id="releaseDate" path="releaseDate" />
            <form:errors path="releaseDate" />
        </div>
        <c:forEach items="${types}" var="priceType" varStatus="status">
            <div class="form-group">
                <label for="prices">${priceType}:</label>
                <form:input class="form-control" id="prices" path="prices[${status.index}].value" />
                <form:hidden class="form-control" path="prices[${status.index}].type" value="${priceType}"/>
            </div>
        </c:forEach>
        <div>
            <label for="summary">Summary:</label>
            <input type="file" name="summary" id="summary">
                <%--<form:input class="form-control" id="summary" path="summary" />--%>
            <%--<form:errors path="summary" />--%>
        </div>
        <button class="btn btn-success" type="submit">Save</button>
    </form:form>

</body>

<script type="text/javascript"><%@include file="/static/bower_components/jquery/dist/jquery.min.js"%></script>
<script type="text/javascript"><%@include file="/static/bower_components/tether/dist/js/tether.min.js"%></script>
<script type="text/javascript"><%@include file="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"%></script>

</html>
