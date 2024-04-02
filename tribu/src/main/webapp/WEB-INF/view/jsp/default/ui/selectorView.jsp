<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@ page pageEncoding="UTF-8" isELIgnored="false" %>


<c:url value="/login" var="localUrl">
    <c:param name="s" value="local"/>
    <c:param name="service" value="${service}"/>
</c:url>


<jsp:directive.include file="includes/top.jsp"/>


<h2><spring:message code="screen.choose.title"/></h2>


<div class="row row-cols-md-2 gy-4">
    <%--FIM aca--%>
    <div class="col">
        <div class="card enlarge-link h-100">
            <div class="card-body d-flex flex-column align-items-center justify-content-center">
                <div>
                    <div>
                        <p class="logo">
                            <span>Minist&egrave;re</span>
                            <br>
                            <span>de l&rsquo;&Eacute;ducation</span>
                            <br>
                            <span>Nationale</span>
                            <br>
                            <span>et de la Jeunesse</span>
                        </p>
                    </div>

                    <a class="btn btn-primary btn-lg stretched-link" href="${selectorForm.acaUrl}">
                        <span><spring:message code="screen.choose.connect"/></span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="col">
        <%--FIM sup--%>
        <div class="card enlarge-link mb-4">
            <div class="card-body">
                <div class="row align-items-center gy-3">
                    <div class="col">
                        <p class="logo logo-sm">
                            <span>Minist&egrave;re</span>
                            <br>
                            <span>de l&rsquo;Enseignement</span>
                            <br>
                            <span>Sup&eacute;rieur</span>
                            <br>
                            <span>et de la Recherche</span>
                        </p>
                    </div>

                    <div class="col-auto">
                        <a class="btn btn-secondary btn-lg stretched-link" href="${selectorForm.supUrl}">
                            <span><spring:message code="screen.choose.connect"/></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <%--FIM agri--%>
        <div class="card enlarge-link mb-4">
            <div class="card-body">
                <div class="row align-items-center gy-3">
                    <div class="col">
                        <p class="logo logo-sm">
                            <span>Minist&egrave;re</span>
                            <br>
                            <span>de l&rsquo;Agriculture</span>
                            <br>
                            <span>et de la Souverainet&eacute;</span>
                            <br>
                            <span>Alimentaire</span>
                        </p>
                    </div>

                    <div class="col-auto">
                        <a class="btn btn-secondary btn-lg stretched-link" href="${selectorForm.supUrl}">
                            <span><spring:message code="screen.choose.connect"/></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <%--Externe--%>
        <div class="card enlarge-link">
            <div class="card-body">
                <div class="row align-items-center gy-3">
                    <div class="col">
                        <h3 class="card-title mb-0">
                            <span><spring:message code="screen.choose.userlocal"/></span>
                        </h3>
                    </div>

                    <div class="col-auto">
                        <a class="btn btn-secondary btn-lg stretched-link" href="${localUrl}">
                            <span><spring:message code="screen.choose.connect"/></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:directive.include file="includes/bottom.jsp"/>
