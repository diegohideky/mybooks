<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:page title="${book.title}">

    <article id="${book.id}">
        <header id="product-highlight" class="clearfix">
            <div id="product-overview" class="container">
                <img width="280px" height="395px" src="http://cdn.shopify.com/s/files/1/0155/7645/products/css-eficiente-featured_large.png?v=1435245145" class="product-featured-image" />
                <h1 class="product-title">${book.title}</h1>
                <p class="product-author">
                    <span class="product-author-link">
                        Diego Hideky
                    </span>
                </p>

                <p class="book-description">
                    ${book.description}
                </p>
            </div>
        </header>

        <section class="buy-options clearfix">
            <form:form servletRelativeAction="/cart/add" method="post" cssClass="container">
                <ul id="variants" class="clearfix">
                    <input type="hidden" value="${book.id}" name="bookId" />
                    <c:forEach items="${book.prices}" var="price">
                        <li class="buy-option">
                            <input type="radio" name="priceType" class="variant-radio" value="${price.type}" id="priceType" checked="checked"  />
                            <label class="variant-label" for="priceType">
                                ${price.type}
                            </label>
                            <small class="compare-at-price">R$ 39,90</small>
                            <p class="variant-price">${price.value}</p>
                        </li>
                    </c:forEach>
                </ul>
                <button type="submit" class="submit-image icon-basket-alt" alt="Compre Agora" title="Compre Agora '${book.title}'"></button>

            </form:form>

        </section>

        <div class="container">
            <section class="summary">
                <ul>
                    <li><h3>E muito mais... <a href='/pages/sumario-java8'>veja o sumário</a>.</h3></li>
                </ul>
            </section>

            <section class="data product-detail">
                <h2 class="section-title">Dados do livro:</h2>
                <p>Número de páginas: <span>${book.pages}</span></p>
                <p></p>
                <p>Data de publicação:
                    <span class="publishedAt">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${book.releaseDate.time}" />
                    </span>
                </p>
                <p>Encontrou um erro? <a href='/submissao-errata' target='_blank'>Submeta uma errata</a></p>
            </section>
        </div>

    </article>

</tags:page>