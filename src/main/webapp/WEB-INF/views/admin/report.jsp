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
				<link rel="stylesheet" href="../contrast-bootstrap-pro/css/bootstrap.min.css" />
				<link rel="stylesheet" href="../contrast-bootstrap-pro/css/cdb.css" />
				<script src="../contrast-bootstrap-pro/js/cdb.js"></script>
				<script src="../contrast-bootstrap-pro/js/bootstrap.min.js"></script>
				<script src="https://kit.fontawesome.com/9d1d9a82d2.js" crossorigin="anonymous"></script>
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
				<style>
					.chart-container {
						width: 50%;
						height: 50%;
						margin: auto;
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
				<main>

					<div class="row  mt-3 d-flex justify-content-center">
						<div class="col-xl-6 col-xxl-5 d-flex">
							<div class="w-100">
								<div class="row">
									<div class="col-sm-6">
										<div class="card mb-2">
											<div class="card-body ">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Sales</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-truck align-middle">
																<rect x="1" y="3" width="15" height="13"></rect>
																<polygon points="16 8 20 8 23 11 23 16 16 16 16 8">
																</polygon>
																<circle cx="5.5" cy="18.5" r="2.5"></circle>
																<circle cx="18.5" cy="18.5" r="2.5"></circle>
															</svg>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">${slBan}</h1>
												<div class="mb-0">
													<span class="text-danger"> <i
															class="mdi mdi-arrow-bottom-right"></i> -3.65% </span>
													<span class="text-muted">Since last week</span>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Visitors</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-users align-middle">
																<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2">
																</path>
																<circle cx="9" cy="7" r="4"></circle>
																<path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
																<path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
															</svg>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">${slTruyCap}</h1>
												<div class="mb-0">
													<span class="text-success"> <i
															class="mdi mdi-arrow-bottom-right"></i> 5.25% </span>
													<span class="text-muted">Since last week</span>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="card mb-2">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Earnings</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-dollar-sign align-middle">
																<line x1="12" y1="1" x2="12" y2="23"></line>
																<path
																	d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6">
																</path>
															</svg>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">${tongtien}</h1>
												<div class="mb-0">
													<span class="text-success"> <i
															class="mdi mdi-arrow-bottom-right"></i> 6.65% </span>
													<span class="text-muted">Since last week</span>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Orders</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-shopping-cart align-middle">
																<circle cx="9" cy="21" r="1"></circle>
																<circle cx="20" cy="21" r="1"></circle>
																<path
																	d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6">
																</path>
															</svg>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">${slOrder}</h1>
												<div class="mb-0">
													<span class="text-danger"> <i
															class="mdi mdi-arrow-bottom-right"></i> -2.25% </span>
													<span class="text-muted">Since last week</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>
					<div class="container mt-5">
						<div class="row tm-content-row">
							<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
								<div class="search-container ">
									<input type="text" class="input-custom" placeholder="Search products">
									<button class="btn btn-primary btn-block text-uppercase mb-3">
										Search</button>
								</div>
								<div class="tm-bg-primary-dark tm-block tm-block-products">
									<div class="tm-product-table-container">
										<table class="table table-hover tm-table-small tm-product-table">
											<thead>
												<tr>
													<th scope="col">&nbsp;</th>
													
													
													<th scope="col">Tên Sản Phẩm</th>
													<th scope="col">Số Lượng</th>
													
													<th scope="col">Tổng Tiền</th>

													<th scope="col">&nbsp;</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="allOrders" items="${allOrder}">

													<tr>
															
														<td></td>
														
														<td>${allOrders.idProduct.nameProduct}</td>
														<td>${allOrders.soLuong}</td>
														<td>${allOrders.tongGia}</td>
														<td></td>
													</tr>

												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>


				</main>

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

				<!--chart-->
				<script>
					const ctx = document.getElementById("chart").getContext('2d');
					const myChart = new Chart(ctx, {
						type: 'bar',
						data: {
							labels: ["rice", "yam", "tomato", "potato",
								"beans", "maize", "oil"],
							datasets: [{
								label: 'food Items',
								backgroundColor: 'rgba(161, 198, 247, 1)',
								borderColor: 'rgb(47, 128, 237)',
								data: [300, 400, 200, 500, 800, 900, 200],
							}]
						},
						options: {
							scales: {
								yAxes: [{
									ticks: {
										beginAtZero: true,
									}
								}]
							}
						},
					});
				</script>

				<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>

			</body>

			</html>