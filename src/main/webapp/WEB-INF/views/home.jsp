<%--
  Created by IntelliJ IDEA.
  User: software01
  Date: 04/12/17
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Books</title>

    <style type="text/css"><%@include file="/static/bower_components/tether/dist/css/tether.min.css"%></style>
    <style type="text/css"><%@ include file="/static/bower_components/bootstrap/dist/css/bootstrap.min.css" %></style>

</head>
<body class="jumbotron">
    <h1>My Books!</h1>

    <a href="/books" class="btn btn-primary"> All Books</a>
    <a href="/books/form" class="btn btn-primary"> New Book</a>
</body>

<script type="text/javascript"><%@include file="/static/bower_components/jquery/dist/jquery.min.js"%></script>
<script type="text/javascript"><%@include file="/static/bower_components/tether/dist/js/tether.min.js"%></script>
<script type="text/javascript"><%@include file="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"%></script>

</html>
