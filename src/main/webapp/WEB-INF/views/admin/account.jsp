<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Accounts - Product Admin Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="/CSS/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="/CSS/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="/CSS/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
	<div class="" id="home">
		<nav class="navbar navbar-expand-xl">
			<div class="container h-100">
				<a class="navbar-brand" href="index.html">
					<h1 class="tm-site-title mb-0">Product Admin</h1>
				</a>
				<button class="navbar-toggler ml-auto mr-0" type="button"
					data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars tm-nav-icon"></i>
				</button>
				<%@ include file="/WEB-INF//views/admin/header.jsp"%>
			</div>
		</nav>
		<div class="container mt-5">
			<!--<div class="row tm-content-row">
				<div class="col-12 tm-block-col">
					<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
						<p class="text-white">Accounts</p>
						<select class="custom-select">
							<option value="0">Select account</option>
							<option value="1">Admin</option>
							<option value="2">Staff</option>
						</select>
					</div>
				</div>
			</div>-->
			<!-- row -->
			<div class="row tm-content-row mb-3">
				<div class="col-3"></div>
				<div class="col-6" style="background-color: #4e657a">

					<h2 class="tm-block-title">Account Settings</h2>
					<form:form class="tm-signup-form row" modelAttribute="user"
						action="/hoanghamobile/account" accept-charset="UTF-8">
						<div class="form-group col-lg-6">
							<label for="id">Id</label>
							<form:input path="id"
								class="form-control validate bg-white text-dark"
								placeholder="Không được nhập ở đây" readonly="true" />
						</div>
						<div class="form-group col-lg-6">
							<label for="firstName">First Name</label>
							<form:input path="firstName"
								class="form-control validate bg-white text-dark"
								placeholder="Nhập first name" />
						</div>
						<div class="form-group col-lg-6">
							<label for="email">Account Email</label>
							<form:input path="email"
								class="form-control validate bg-white text-dark"
								placeholder="Nhập Email" />
						</div>
						<div class="form-group col-lg-6">
							<label for="lastName">Last Name</label>
							<form:input path="lastName"
								class="form-control validate bg-white text-dark"
								placeholder="Nhập last name" />
						</div>
						<div class="form-group col-lg-6">
							<label for="password">Password</label>
							<form:input path="password"
								class="form-control validate bg-white text-dark"
								placeholder="Nhập password" />
						</div>

						<div class="col-12 text-center fs-3 mb-3">
							<div class="form-check form-check-inline">
								<form:radiobutton path="isEnabled" value="true"
									cssClass="form-check-input" />
								<label class="form-check-label">Enable</label>
							</div>
							<div class="form-check form-check-inline">
								<form:radiobutton path="isEnabled" value="false"
									cssClass="form-check-input" />
								<label class="form-check-label">Disable</label>
							</div>
						</div>


						<div class="text-center ">
							<div class="button-group">
								<button type="submit" formaction="/user/update"
									class="btn btn-primary text-uppercase" ${dis}>Update
									Your Profile</button>
								<button type="submit" formaction="/user/delete/${id}"
									class="btn btn-primary text-uppercase" ${dis}>Delete
									Your Account</button>
								<button type="submit" formaction="/hoanghamobile/account"
									class="btn btn-primary text-uppercase">Reset</button>
							</div>
						</div>

					</form:form>



				</div>
				<div class="col-3"></div>

			</div>
		</div>

		<div class="container">
			<form method="post" action="/hoanghamobile/account/search">
				<div class="input-group mb-3">
					<input type="text" class="form-control rounded bg-white text-dark"
						placeholder="Nhập Email để tìm kiếm" name="search" value="${search}">
					<div class="input-group-append">
						<button class="input-group-text btn btn-primary rounded-right"
							type="submit">Search</button>
					</div>
				</div>
			</form>

			<table class="table table-hover bg-white text-dark">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Password</th>
					<th>is_enabled</th>
					<th></th>
				</tr>
				<c:forEach var="item" items="${users}">
					<tr>
						<td>${item.firstName}</td>
						<td>${item.lastName}</td>
						<td>${item.email}</td>
						<td>${item.password}</td>
						<td>${item.isEnabled ? 'Đã kích hoạt' : 'Chưa kích hoạt'}</td>
						<td><a href="/user/edit/${item.id}">Edit</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<footer class="tm-footer row tm-mt-small">
			<div class="col-12 font-weight-light">
				<p class="text-center text-white mb-0 px-4 small">
					Copyright &copy; <b>2018</b> All rights reserved. Design: <a
						rel="nofollow noopener" href="https://templatemo.com"
						class="tm-footer-link">Template Mo</a>
				</p>
			</div>
		</footer>
	</div>

	<script src="JSON/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="JSON/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
</body>
</html>
