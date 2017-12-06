<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
    <c:url value="/" var="contextPath" />
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

    <title>My Books</title>

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

                    <li><a href="/cart" rel="nofollow">Cart</a></li>

                    <li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">About US</a></li>

                    <li><a href="/pages/perguntas-frequentes" rel="nofollow">Questions</a></li>
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


<section id="index-section" class="container middle">

    <h1 class="cdc-call">Últimos dias com os preços promocionais. Aproveite!</h1>
    <ul class="clearfix book-collection">

        <c:forEach items="${books}" var="book">
            <li>
                <a href="${s:mvcUrl('BC#detail').arg(0, book.id).build()}" class="block clearfix">
                    <h2 class="product-title">${book.title}</h2>
                    <img width="143"
                         height="202"
                         src="https://cdn.shopify.com/s/files/1/0155/7645/products/java8-featured_large.png?v=1411490181"
                         alt="Java 8 Prático"
                         title="Java 8 Prático"/>
                    <small class="buy-button">Compre</small>
                </a>
            </li>
        </c:forEach>

    </ul>

    <h2 class="cdc-call">Diferenciais da Casa do Código</h2>

    <ul id="cdc-diferenciais" class="clearfix">
        <li class="col-left">
            <h3>E-books sem DRM. Leia onde quiser</h3>
            <p>
                <span class="sprite" id="sprite-drm"></span> Nossos e-books não
                possuem DRM, ou seja, você pode ler em qualquer computador, tablet
                e smartphone.
            </p>
        </li>
        <li class="col-right">
            <h3>Autores de renome na comunidade</h3>
            <p>
                <span class="sprite" id="sprite-renome"></span> Autores que
                participam ativamente na comunidade com Open Source, listas de
                discussão, grupos e mais.
            </p>
        </li>
        <li class="col-left">
            <h3>Receba atualizações dos e-books</h3>
            <p>
                <span class="sprite" id="sprite-atualizacoes"></span> Quando você
                compra um e-book, automaticamente tem direito às atualizações e
                correções dele.
            </p>
        </li>
        <li class="col-right">
            <h3>Livros com curadoria da Caelum</h3>
            <p>
                <span class="sprite" id="sprite-caelum"></span> Desenvolvedores
                experientes que avaliam e revisam os livros constantemente.
            </p>
        </li>
    </ul>



</section>


<footer id="layout-footer">
    <div class="clearfix container">
        <div id="collections-footer">
            <!-- cdc-footer -->
            <p class="footer-title">Coleções de Programação</p>
            <ul class="footer-text-links">
                <li><a href="/collections/livros-de-java">Java</a></li>
                <li><a href="/collections/livros-desenvolvimento-web">Desenvolvimento
                    Web</a></li>
                <li><a href="/collections/livros-de-mobile">Mobile</a></li>
                <li><a href="/collections/games">Games</a></li>
                <li><a href="/collections/livros-de-front-end">Front End</a></li>
            </ul>
            <p class="footer-title">Outros Assuntos</p>
            <ul class="footer-text-links">
                <li><a href="/collections/livros-de-agile">Agile</a></li>
                <li><a href="/collections/outros">e outros...</a></li>
            </ul>
        </div>
        <div id="social-footer">
            <!-- books-footer -->
            <p class="footer-title">Links da Casa do Código</p>
            <ul class="footer-text-links">
                <li><a href="http://livros.casadocodigo.com.br" rel="nofollow">Meus
                    E-books</a></li>
                <li><a href="/pages/sobre-a-casa-do-codigo">Sobre a Casa
                    do Código</a></li>
                <li><a href="/pages/perguntas-frequentes">Perguntas
                    Frequentes</a></li>
                <li><a href="https://www.caelum.com.br">Caelum - Ensino e
                    Inovação</a></li>
                <li><a href="http://www.codecrushing.com/" rel="nofollow">Code
                    Crushing</a></li>
                <li><a
                        href="http://www.casadocodigo.com.br/pages/politica-de-privacidade"
                        rel="nofollow">Política de Privacidade</a></li>
            </ul>
            <p class="footer-title">Redes Sociais</p>
            <ul>
                <li class="social-links"><a
                        href="http://www.twitter.com/casadocodigo" target="_blank"
                        id="twitter" rel="nofollow">Facebook</a> <a
                        href="http://www.facebook.com/casadocodigo" target="_blank"
                        id="facebook" rel="nofollow">Twitter</a></li>
            </ul>
        </div>
        <div id="newsletter-footer">
            <!-- social-footer -->
            <p class="footer-title">Receba as Novidades e Lançamentos</p>
            <div id="form-newsletter">
                <form action=""
                        method="POST" id="ss-form" class="form-newsletter">
                    <ul>
                        <li><input type="hidden" name="pageNumber" value="0"/><input
                                type="hidden" name="backupCache" value=""/><input
                                type="email" name="entry.0.single" value="" class="ss-q-short"
                                id="entry_0" placeholder="seu@email.com"/></li>
                        <li><input type="submit" name="submit"
                                   value="Quero Receber!" id="submit-newsletter"/></li>
                    </ul>
                </form>
                <ul>
                    <li class="ie8"><a
                            href=""
                            rel="nofollow">Receba as Novidades e Lançamentos</a></li>
                </ul>
            </div>
            <ul class="footer-payments">
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>
</footer>

</body>
</html>
