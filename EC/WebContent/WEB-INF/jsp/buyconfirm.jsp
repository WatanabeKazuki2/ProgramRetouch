<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入確認</title>
<jsp:include page="/baselayout/head.html" />

</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">購入</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<div class="row">
							<table class="bordered">
								<thead>
									<tr>
										<th class="center">商品名</th>
										<th class="center">単価</th>
										<th class="center">小計</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cartInItem" items="${cart}" >
										<tr>
											<td class="center">${cartInItem.name}</td>
											<td class="center">${cartInItem.price}円</td>
											<td class="center">${cartInItem.price}円</td>
										</tr>
									</c:forEach>
									<tr>

										<td class="center">${bdb.deliveryMethodName}</td>
										<td class="center"></td>
										<td class="center">${bdb.deliveryMethodPrice}円</td>
									</tr>
									<tr>
										<td class="center"></td>
										<td class="center">合計</td>
										<td class="center">${bdb.totalPrice}円</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col s12">
								<form action="BuyResult" method="post">
									<button class="btn  waves-effect waves-light  col s4 offset-s4" type="submit">購入</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>