<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<header id="layout-header">
    <div class="clearfix container">
        <a href="/" id="logo">
        </a>
        <div id="header-content">
            <nav id="main-nav">

                <ul class="clearfix">
                    <security:authorize access="isAuthenticated()">
                        <li><a href="${s:mvcUrl('BC#list').build()}" rel="nofollow">Books</a></li>

                        <li><a href="${s:mvcUrl('BC#form').build()}" rel="nofollow">New</a></li>
                    </security:authorize>

                    <li>
                        <a href="${s:mvcUrl('CC#items').build()}" rel="nofollow">
                            <s:message code="menu.cart" arguments="${cart.quantity}" />
                        </a>
                    </li>

                    <li>
                        <a href="?locale=pt" rel="nofollow">
                            <fmt:message key="menu.pt" />
                        </a>
                    </li>
                    <li>
                        <a href="?locale=en_US" rel="nofollow">
                            <fmt:message key="menu.en" />
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<nav class="categories-nav">
    <ul class="container">
        <li class="category">
            <a href="http://www.casadocodigo.com.br">
                <fmt:message key="nav.category.home" />
            </a>
        </li>
        <li class="category">
            <a href="/collections/livros-de-agile">
                <fmt:message key="nav.category.agile" />
            </a>
        </li>
        <li class="category">
            <a href="/collections/livros-de-front-end">
                <fmt:message key="nav.category.front_end" />
            </a>
        </li>
        <li class="category">
            <a href="/collections/livros-de-games">
                <fmt:message key="nav.category.front_end" />
            </a>
        </li>
        <li class="category">
            <a href="/collections/livros-de-java">
                <fmt:message key="nav.category.java" />
            </a>
        </li>
        <li class="category">
            <a href="/collections/livros-de-mobile">
                <fmt:message key="nav.category.mobile" />
            </a>
        </li>
        <li class="category">
            <a href="/collections/livros-desenvolvimento-web">
                <fmt:message key="nav.category.web" />
            </a>
        </li>
        <li class="category">
            <a href="/collections/outros">
                <fmt:message key="nav.category.others" />
            </a>
        </li>
    </ul>
</nav>