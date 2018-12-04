<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入完了</title>
<jsp:include page="/baselayout/head.html" />
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 ">購入が完了しました</h5>
		</div>
		<div class="row">
			<div class="col s12">
				<div class="col s6 center-align">
					<a href="Index" class="btn  waves-effect waves-light ">引き続き買い物をする</a>
				</div>
				<div class="col s6 center-align">
					<a href="UserData" class="btn  waves-effect waves-light">ユーザー情報へ</a>
				</div>
			</div>
		</div>
		<div class="row center">
			<h5 class=" col s12 light">購入詳細</h5>
		</div>
		<!--  購入 -->
		<div class="row">
			<div class="section"></div>
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table>
							<thead>
								<tr>
									<th class="center">購入日時</th>
									<th class="center">配送方法</th>
									<th class="center">合計金額</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center">${resultBDB.formatDate}</td>
									<td class="center">${resultBDB.deliveryMethodName}</td>
									<td class="center">${resultBDB.totalPrice}円</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 詳細 -->
		<div class="row">
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table class="bordered">
							<thead>
								<tr>
									<th class="center">商品名</th>
									<th class="center">単価</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="buyIDB" items="${buyIDBList}" >
									<tr>
										<td class="center">${buyIDB.name}</td>
										<td class="center">${buyIDB.price}円</td>
									</tr>
								</c:forEach>
								<tr>
									<td class="center">${resultBDB.deliveryMethodName}</td>
									<td class="center">${resultBDB.deliveryMethodPrice}円</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>