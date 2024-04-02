<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@ page pageEncoding="UTF-8" isELIgnored="false" %>


<c:url value="/login" var="localUrl">
    <c:param name="s" value="local" />
    <c:param name="service" value="${service}" />
</c:url>


<jsp:directive.include file="includes/top.jsp" />


<!-- Content header -->
<div class="content-header-container">
    <div class="content-header-navbar">
        <h2 class="content-title"><spring:message code="screen.choose.title" /></h2>
    </div>
</div>


<div class="tiles">
	<div class="row">
		<div class="col-md-6 text-center">
			<!-- FIM aca -->
			<div class="panel panel-default">
				<div class="panel-body">

					<div class="row">

						<div class="col-md-3"></div>
						<div class="col-md-6">

							<img src="<c:url value="/img/logo-en2.png" />" class="img-responsive" alt="Minist&egrave;re de l'&Eacute;ducation nationale et de la jeunesse">

							<div>
								<a class="btn btn-primary btn-lg" href="${selectorForm.acaUrl}">
									<span><spring:message code="screen.choose.connect" /></span>
								</a>
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>

				</div>
			</div>
		</div>

		<div class="col-md-6">
			<!-- FIM sup -->
			<div class="row">
				<div class="col-md-12">

					<!-- FIM sup -->
					<div class="panel panel-default">
						<div class="panel-body">

							<div class="row panel-login">
								<div class="col-md-4">
									<img src="<c:url value="/img/logo-sup.png" />" class="img-responsive" alt="Minist&egrave;re de l'&Eacute;ducation nationale et de la jeunesse">

								</div>
								<div class="col-md-8 text-center">
									<a class="btn btn-default btn-lg" href="${selectorForm.supUrl}">
										<span><spring:message code="screen.choose.connect" /></span>
									</a>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>

			<!-- FIM agri -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row panel-login">
								<div class="col-md-4">
									<img src="<c:url value="/img/logo-agri.png" />" class="img-responsive" alt="Minist&egrave;re de l'&Eacute;ducation nationale et de la jeunesse">

								</div>
								<div class="col-md-8 text-center">
									<a class="btn btn-default btn-lg" href="${selectorForm.supUrl}">
										<span><spring:message code="screen.choose.connect" /></span>
									</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<!-- Externes -->
			<div class="row">
				<div class="col-md-12">
					<!-- Authentification locale -->
					<div class="panel panel-default">
						<div class="panel-body">

							<div class="row panel-login">
								<div class="col-md-4">
									<strong><spring:message code="screen.choose.userlocal" /></strong>

								</div>
								<div class="col-md-8 text-center">
									<a class="btn btn-default btn-lg" href="${localUrl}">
										<span><spring:message code="screen.choose.connect" /></span>
									</a>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
</div>



<jsp:directive.include file="includes/bottom.jsp" />
