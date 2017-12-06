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

    <c:url value="/static/bower_components" var="bower" />

    <link rel="stylesheet" href="${bower}/tether/dist/css/tether.min.css" />
    <link rel="stylesheet" href="${bower}/bootstrap/dist/css/bootstrap.min.css" />

</head>
<body class="jumbotron">

    <form:form action="${s:mvcUrl('BC#submit').build()}" method="POST"
        commandName="book" enctype="multipart/form-data">

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <form:input cssClass="form-control" id="title" path="title"/>
                    <form:errors path="title" />
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <form:textarea cssClass="form-control" rows="5" cols="20" id="description" path="description"/>
                    <form:errors path="description" />
                </div>
                <div class="form-group">
                    <label for="pages">Pages:</label>
                    <form:input cssClass="form-control" id="pages" path="pages" />
                    <form:errors path="pages" />
                </div>

            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="releaseDate">Release Date:</label>
                    <form:input cssClass="form-control" id="releaseDate" path="releaseDate" />
                    <form:errors path="releaseDate" />
                </div>
                <c:forEach items="${types}" var="priceType" varStatus="status">
                    <div class="form-group">
                        <label for="prices">${priceType}:</label>
                        <form:input cssClass="form-control" id="prices" path="prices[${status.index}].value" />
                        <form:hidden cssClass="form-control" path="prices[${status.index}].type" value="${priceType}"/>
                    </div>
                </c:forEach>
                <div class="form-group">
                    <label for="summary">Summary:</label>
                    <input type="file" name="summary" id="summary">
                </div>
            </div>
        </div>
        <button class="btn btn-success" type="submit">Save</button>
    </form:form>

</body>

<script type="text/javascript" src="${bower}/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="${bower}/tether/dist/js/tether.min.js"></script>
<script type="text/javascript" src="${bower}/bootstrap/dist/js/bootstrap.min.js"></script>

</html>
