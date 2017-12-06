<%@tag language="java" pageEncoding="UTF-8" %>
<%@attribute name="title" required="true" %>
<%@attribute name="bodyClass" required="false" %>
<%@attribute name="scripts" fragment="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <c:url value="/" var="contextPath" />
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

    <title>${title} - My Books</title>

    <c:url value="/static/css" var="css" />

    <link rel="stylesheet" href="${css}/cssbase-min.css" />
    <link rel="stylesheet" href="${css}/fonts.css" />
    <link rel="stylesheet" href="${css}/fontello-ie7.css" />
    <link rel="stylesheet" href="${css}/fontello-embedded.css" />
    <link rel="stylesheet" href="${css}/fontello.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/layout-colors.css" />
    <link rel="stylesheet" href="${css}/responsive-style.css" />
    <link rel="stylesheet" href="${css}/guia-do-programador-style.css" />
    <link rel="stylesheet" href="${css}/produtos.css" />

</head>

<body>

    <%@include file="/WEB-INF/views/header.jsp" %>

    <jsp:doBody />

    <%@include file="/WEB-INF/views/footer.jsp" %>

    <jsp:invoke fragment="scripts" />

</body>

</html>