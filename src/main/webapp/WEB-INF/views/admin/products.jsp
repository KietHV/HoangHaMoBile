<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="UTF-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<meta http-equiv="X-UA-Compatible" content="ie=edge" />
				<title>Product Page - Admin HTML Template</title>
				<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
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
				<style>
					.input-custom {
						width: 100%;
						padding: 8px;
						border: none;
						border-radius: 4px;
						margin-right: 8px;
					}
				</style>
			</head>

			<body id="reportsPage">
				<nav class="navbar navbar-expand-xl">
					<div class="container h-100">
						<a class="navbar-brand" href="index.html">
							<h1 class="tm-site-title mb-0">Product Admin</h1>
						</a>
						<button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse"
							data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
							aria-expanded="false" aria-label="Toggle navigation">
							<i class="fas fa-bars tm-nav-icon"></i>
						</button>
						<%@ include file="/WEB-INF/views/admin/header.jsp" %>
					</div>
				</nav>
				<div class="container mt-5">
					<div class="row tm-content-row">
						<div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
				<div class="search-container">
					<form action="/hoanghamobile/findproduct1" method="post">
						<input type="text" class="input-custom"
							placeholder="Search products" name="keyword" value="${keyword}">
						<input type="hidden" name="p" value="0">
						<button type="submit"
							class="btn btn-primary btn-block text-uppercase mb-3">Search</button>
					</form>
				</div>

				<div class="tm-bg-primary-dark tm-block tm-block-products">
								<div class="tm-product-table-container">
									<table class="table table-hover tm-table-small tm-product-table">
										<thead>
											<tr>
												<th scope="col">&nbsp;</th>
												<th scope="col">HÌNH</th>
												<th scope="col">TÊN SẢN PHẨM</th>
												<th scope="col">GIÁ SẢN PHẨM</th>
												<th scope="col">LOẠI</th>
												<th scope="col">NGÀY TẠO</th>
												<th scope="col">&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${itemlistproduct}">
												<tr>
													<th scope="row"><input type="checkbox" /></th>
													<td><img src="../IMG/${item.image}" alt="" width="110px"></a></th>
													
													<td class="tm-product-name">
													<a href="/hoanghamobile/edit-product?id=${item.idProduct}">${item.nameProduct}</a>
													</td>
													<td><strong>
															<fmt:formatNumber value="${item.price}" type="currency"
																currencySymbol="₫" />
														</strong></td>
													<td>${item.type}</td>
													<td>${item.date}</td>
													<td><a href="<c:url value='/hoanghamobile/deleteproduct/?id=${item.idProduct}'/>" class="tm-product-delete-link"> <i
																class="far fa-trash-alt tm-product-delete-icon"></i>
														</a></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
								<!-- table container -->
								<a href="/hoanghamobile/addproduct" class="btn btn-primary btn-block text-uppercase mb-3">Add
									new product</a>
								<button formaction="/hoanghamobile/deleteproduct" class="btn btn-primary btn-block text-uppercase">
									Delete selected products</button>
							</div>
						</div>
						<div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
							<div class="tm-bg-primary-dark tm-block tm-block-product-categories">
								<h2 class="tm-block-title">Product Categories</h2>
								<div class="tm-product-table-container">
									<table class="table tm-table-small tm-product-table">
										<tbody>
											<tr>
												<td class="tm-product-name">Product Category 1</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 2</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 3</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 4</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 5</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 6</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 7</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 8</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 9</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 10</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
											<tr>
												<td class="tm-product-name">Product Category 11</td>
												<td class="text-center"><a href="#" class="tm-product-delete-link"> <i
															class="far fa-trash-alt tm-product-delete-icon"></i>
													</a></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- table container -->
								<button class="btn btn-primary btn-block text-uppercase mb-3">
									Add new category</button>
							</div>
						</div>
					</div>
				</div>
				<footer class="tm-footer row tm-mt-small">
					<div class="col-12 font-weight-light">
						<p class="text-center text-white mb-0 px-4 small">
							Copyright &copy; <b>2018</b> All rights reserved. Design: <a rel="nofollow noopener"
								href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
						</p>
					</div>
				</footer>

				<script src="/JSON/jquery-3.3.1.min.js"></script>
				<!-- https://jquery.com/download/ -->
				<script src="/JSON/bootstrap.min.js"></script>
				<!-- https://getbootstrap.com/ -->
				<script>
					$(function () {
						$(".tm-product-name").on("click", function () {
							window.location.href = "edit-product";
						});
					});
				</script>
			</body>

			</html>