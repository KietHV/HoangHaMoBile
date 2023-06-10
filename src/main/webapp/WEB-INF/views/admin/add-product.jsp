<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Add Product - Dashboard HTML Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<link rel="stylesheet" href="/CSS/fontawesome.min.css" />
<link rel="stylesheet" href="/jquery-ui-datepicker/jquery-ui.min.css" />
<link rel="stylesheet" href="/CSS/bootstrap.min.css" />
<link rel="stylesheet" href="/CSS/templatemo-style.css">
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
						href="products.html"> <i class="fas fa-shopping-cart"></i>
							Products
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
							<h2 class="tm-block-title d-inline-block">Add Product</h2>
						</div>
					</div>
					<div class="row tm-edit-product-row">
						<div class="col-xl-6 col-lg-6 col-md-12">
							<form:form action="/hoanghamobile/add-product"
								modelAttribute="item" class="tm-edit-product-form">
								<div class="form-group mb-3">
									<label for="name">Tên Sản Phẩm</label>
									<form:input id="name" type="text" path="nameProduct"
										class="form-control validate" />
									<form:errors path="nameProduct"
										cssClass="form-text text-danger" />
								</div>
								<div class="form-group mb-3">
									<label for="price">Giá Sản Phẩm</label>
									<form:input id="price" type="number" path="price"
										class="form-control validate" />
									<form:errors path="price" cssClass="form-text text-danger" />
								</div>
								<div class="form-group mb-3">
									<label for="sale">Giá Sale</label>
									<form:input id="sale" type="number" path="sale"
										class="form-control validate" />
									<form:errors path="sale" cssClass="form-text text-danger" />
								</div>
								<div class="form-group mb-3">
									<label for="Qty">Số Lượng</label>
									<form:input id="Qty" type="number" path="Qty"
										class="form-control validate" />
									<form:errors path="Qty" cssClass="form-text text-danger" />
								</div>
								<div class="form-group mb-3">
									<label for="note">Mô Tả Sản Phẩm</label>
									<form:input id="note" type="text" path="note"
										class="form-control validate" style="height: 100px" />
									<form:errors path="note" cssClass="form-text text-danger" />
								</div>
								<div class="form-group mb-3">
									<label for="category">Category</label>
									<form:select path="type"
										class="custom-select tm-select-accounts" id="category">
										<form:option value="0">Danh sách Sản Phẩm</form:option>
										<form:option value="Máy Tính" selected="selected">Máy Tính</form:option>
										<form:option value="Apple">Apple</form:option>
										<form:option value="Samsung">Samsung</form:option>
									</form:select>
								</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
							<div class="tm-product-img-dummy mx-auto">
								<img id="previewImage" src="#" alt="Preview"
									style="display: none; max-width: 100%; height: 240px" />
							</div>
							<div class="custom-file mt-3 mb-3">
								<form:input id="fileInput" path="image" type="file"
									style="display: none;" onchange="displayImage(this);" />
								<input type="button" class="btn btn-primary btn-block mx-auto"
									value="UPLOAD PRODUCT IMAGE"
									onclick="document.getElementById('fileInput').click();" />
								<form:errors path="image" cssClass="form-text text-danger" />
							</div>
						</div>
						<div class="col-12">
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase">Add
								Product Now</button>
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

	<script src="/JSON/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="/jquery-ui-datepicker/jquery-ui.min.js"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="/JSON/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script>
		$(function() {
			$("#expire_date").datepicker();
		});
	</script>
	<script>
		function displayImage(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					document.getElementById('previewImage').src = e.target.result;
					document.getElementById('previewImage').style.display = 'block';
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>
