<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
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

                    <li><a href="${s:mvcUrl('CC#items').build()}" rel="nofollow">Cart (${cart.quantity})</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<nav class="categories-nav">
    <ul class="container">
        <li class="category"><a href="http://www.casadocodigo.com.br">Home</a></li>
        <li class="category"><a href="/collections/livros-de-agile">
            Agile </a></li>
        <li class="category"><a href="/collections/livros-de-front-end">
            Front End </a></li>
        <li class="category"><a href="/collections/livros-de-games">
            Games </a></li>
        <li class="category"><a href="/collections/livros-de-java">
            Java </a></li>
        <li class="category"><a href="/collections/livros-de-mobile">
            Mobile </a></li>
        <li class="category"><a
                href="/collections/livros-desenvolvimento-web"> Web </a></li>
        <li class="category"><a href="/collections/outros"> Outros </a></li>
    </ul>
</nav>