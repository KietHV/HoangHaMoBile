<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<h2 class="heading-section">Hoàng Hà Mobile Rest Password</h2>
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
										value="You have successfully reset your password, please log in here." />
								</h3>
							</div>
						</c:if>
						<form action="<c:url value='/hoanghamobile/reset-password'/>"
							method="post">
							<c:set var="user" value="${token}" />
							<div class="form-group">
								<input type="text" id="password" autofocus="autofocus"
									class="form-control" required name="password"
									placeholder="Enter Password">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="confirm"
									name="confirm" required placeholder="Confirm new password"
									autofocus="autofocus" oninput="checkConfirmPassword(this)">
							</div>
							<div class="form-group">
								<button type="submit"
									class="form-control btn btn-primary submit px-3">Reset
									Password</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="/js/jquery.min.js"></script>
	<script src="/js/popper.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/main.js"></script>
	<script type="text/javascript">
		function checkConfirmPassword() {
			const password = document.querySelector('input[name=password]');
			const confirm = document.querySelector('input[name=confirm]');
			if (confirm.value === password.value) {
				confirm.setCustomValidity('');
			} else {
				confirm.setCustomValidity('Confirm password does not match');
			}
		}
	</script>

</body>
</html>