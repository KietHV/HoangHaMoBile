<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Edit Product - Dashboard Admin Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="../CSS/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css"
	type="text/css" />
<!-- http://api.jqueryui.com/datepicker/ -->
<link rel="stylesheet" href="../CSS/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="../CSS/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body>
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

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto h-100">
					<li class="nav-item"><a class="nav-link" href="index.html">
							<i class="fas fa-tachometer-alt"></i> Dashboard <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="far fa-file-alt"></i> <span>
								Reports <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Daily Report</a> <a
								class="dropdown-item" href="#">Weekly Report</a> <a
								class="dropdown-item" href="#">Yearly Report</a>
						</div></li>
					<li class="nav-item"><a class="nav-link active"
						href="/hoanghamobile/products"> <i
							class="fas fa-shopping-cart"></i> Products
					</a></li>

					<li class="nav-item"><a class="nav-link" href="accounts.html">
							<i class="far fa-user"></i> Accounts
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-cog"></i> <span>
								Settings <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Profile</a> <a
								class="dropdown-item" href="#">Billing</a> <a
								class="dropdown-item" href="#">Customize</a>
						</div></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="login.html"> Admin, <b>Logout</b>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Edit Product</h2>
						</div>
					</div>
					<div class="row tm-edit-product-row">
						<div class="col-xl-6 col-lg-6 col-md-12">
						<form:form action="/hoanghamobile/updateproduct"
								clas="tm-edit-product-form"  modelAttribute="items">
								<div class="form-group mb-3">
									<label for="name">Max Sản Phẩm </label>
									 <form:input id="id"
										name="id" type="text" path="idProduct"
										value="${items.idProduct}" class="form-control validate" />
								</div>
						 		<div class="form-group mb-3">
									<label for="name">Tên Sản Phẩm </label>
									 <form:input id="name"
										name="name" type="text" path="nameProduct"
										value="${items.nameProduct}" class="form-control validate" />
								</div>
								<div class="form-group mb-3">
									<label for="name">Giá Sản Phẩm Mới </label> 
									<form:input id="price"
										name="price" type="text" path="price" value="${items.price}"
										class="form-control validate" />
								</div>
								<div class="form-group mb-3">
									<label for="name">Giảm Giá Sản Phẩm </label>
									<form:input id="sale"
										name="sale" type="text" path="sale" value="${items.sale}"
										class="form-control validate" />
								</div>
								<div class="form-group mb-3">
									<label for="description">Mô Tả</label>
									
									<form:input id="note"
										name="note" type="text" path="note" value="${items.note}"
										class="form-control validate" />
								</div>
								<div class="form-group mb-3">
									<label for="category">Category</label> <select
										class="custom-select tm-select-accounts" id="category">
										<option>Danh sách Sản Phẩm</option>
										<option value="${items.type}" selected>Máy Tính</option>
										<option value="${items.type}">Apple</option>
										<option value="${items.type}">Samsung</option>
									</select>
								</div>
								<%-- <div class="form-group mb-3">
									<label for="name">Ngày Cập Nhập </label>
									 <form:input id="name"
										name="name" type="text" path="date" value="${items.date}"
										class="form-control validate" />
								</div> --%>
								<div class="col-12">
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase">Update
								Now</button>
						</div>
						
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
							<div class="tm-product-img-edit mx-auto">
								<img src="../IMG/${items.image}" alt="Product image"
									class="img-fluid d-block mx-auto"> <i
									class="fas fa-cloud-upload-alt tm-upload-icon"
									onclick="document.getElementById('fileInput').click();"></i>
							</div>
							<div class="custom-file mt-3 mb-3">
								<input id="fileInput" type="file" style="display: none;" /> <input
									type="button" class="btn btn-primary btn-block mx-auto"
									value="CHANGE IMAGE NOW" formaction="/hoanghamobile/updateproduct"
									onclick="document.getElementById('fileInput').click();" />
							</div>
						</div>
					
						</form:form>
						
					</div>
				</div>
			</div>
		</div>
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

	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script>
		$(function() {
			$("#expire_date").datepicker({
				defaultDate : "10/22/2020"
			});
		});
	</script>
</body>
</html>
