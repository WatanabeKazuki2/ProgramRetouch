<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>TOPページ</title>
<jsp:include page="/baselayout/head.html" />
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<div class="section no-pad-bot" id="index-banner">
		<div class="container">
			<br> <br>
			<h1 class="header center red-text">ECサイト</h1>
			<div class="row center">
				<h5 class="header col s12 light">なんでも買える魔法のサイト</h5>
			</div>
			<div class="row center">
				<div class="input-field col s8 offset-s2">
					<form action="ItemSearchResult">
						<i class="material-icons prefix">search</i> <input type="text" name="search_word">
					</form>
				</div>
			</div>
			<br> <br>

		</div>
	</div>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">おすすめ商品</h5>
		</div>
		<div class="section">
			<!--   おすすめ商品   -->
			<div class="row">
				<c:forEach var="item" items="${itemList}">
				<div class="col s12 m3">
					<div class="card">
						<div class="card-image">
							<a href="Item?item_id=${item.id}"><img src="img/${item.fileName}"></a>
						</div>
						<div class="card-content">
							<span class="card-title">${item.name}</span>
							<p>${item.price}円
							</p>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>