<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Login 10</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="/login/style.css">

</head>
<body class="img js-fullheight"
	style="background-image: url(/IMG/img2.jpeg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Hoàng Hà Mobile Đăng Ký Tài Khoản</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
						<c:if test="${param.success}">
							<div class="col-sm-8">
								<h3 class="alert alert-danger alert-dismissible fade show"
									role="alert">
									<c:out
										value="Registration successful, please check your email to complete your registration." />
								</h3>
							</div>
						</c:if>
						<form action="<c:url value='/hoanghamobile/register'/>"
							method="post">
							<c:set var="user" value="${user}" />
							<div class="form-group">
								<input type="text" id="firstName" autofocus="autofocus"
									class="form-control" required name="firstName"
									value="<c:out value="${user.firstName}"/>" placeholder="Enter First Name">
							</div>
							<div class="form-group">
								<input type="text" id="lastName" autofocus="autofocus"
									class="form-control" required name="lastName"
									value="<c:out value="${user.lastName}"/>" placeholder="Enter Last Name">
							</div>
							<div class="form-group">
								<input type="text" id="email" autofocus="autofocus"
									class="form-control" required name="email"
									value="<c:out value="${user.email}"/>"placeholder="Enter Email">
							</div>
							<div class="form-group">
								<input type="text" id="password" autofocus="autofocus"
									class="form-control" required name="password"
									value="<c:out value="${user.password}"/>" placeholder="Enter Password">
							</div>
							<div class="form-group">
								<input type="text" id="prePass" autofocus="autofocus"
									class="form-control" required name="prePass"
									placeholder="Enter Pre Pass">
							</div>
							<div class="form-group">
								<button type="submit"
									class="form-control btn btn-primary submit px-3">Đăng kí</button>
							</div>
							<div class="form-group d-md-flex">
								<div class="w-50">
									
								</div>
								<div class="w-50 text-md-right">
									<a
										href="${pageContext.request.contextPath}/hoanghamobile/login"
										style="color: #fff">Đăng nhập tại đây</a>
								</div>
							</div>
						</form>
						<p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
						<div class="social d-flex text-center">
							<a href="#" class="px-2 py-2 mr-md-1 rounded"><span
								class="ion-logo-facebook mr-2"></span> Facebook</a> <a href="#"
								class="px-2 py-2 ml-md-1 rounded"><span
								class="ion-logo-twitter mr-2"></span> Twitter</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="/js/jquery.min.js"></script>
	<script src="/js/popper.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/main.js"></script>

</body>
</html>