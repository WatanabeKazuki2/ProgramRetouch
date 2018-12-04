<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細</title>
<jsp:include page="/baselayout/head.html" />
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<div class="section no-pad-bot" id="index-banner">
		<div class="container">
			<br> <br>
			<div class="row center">
				<div class="col s4">
					<c:if test="${searchWord != null}">
						<a href="ItemSearchResult?search_word=${searchWord}&page_num=${pageNum}" class="btn waves-effect waves-light">検索結果へ </a>
					</c:if>
				</div>
				<div class="col s4">
					<h5 class=" col s12 light">商品詳細</h5>
				</div>
				<div class="col s4">
					<form action="ItemAdd" method="POST">
						<input type="hidden" name="item_id" value="${item.id}">
						<button class="btn waves-effect waves-light" type="submit" name="action">
							買い物かごに追加 <i class="material-icons right">add_shopping_cart</i>
						</button>
					</form>
				</div>
			</div>
			<br> <br>
			<div class="row">
				<div class="col s6">
					<div class="card">
						<div class="card-image">
							<img src="img/${item.fileName}">
						</div>
					</div>
				</div>
				<div class="col s6">
					<h4>${item.name}</h4>
					<h5>${item.price}円</h5>
					<p>${item.detail}</p>
				</div>
			</div>
		</div>
		<jsp:include page="/baselayout/footer.jsp" />
	</div>
</body>
</html>