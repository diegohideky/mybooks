<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tags:page title="Error found">

    <section id="index-section" class="container middle">

        <h2>Generical error happening :(</h2>
    </section>

    <!--
        Message: ${exception.stackTrace}

        <c:forEach items="${exception.stackTrace}" var="stk" >
            ${stk}
        </c:forEach>
    -->

</tags:page>