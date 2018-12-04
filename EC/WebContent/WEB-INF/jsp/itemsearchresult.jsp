<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>
<jsp:include page="/baselayout/head.html" />
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<div class="section no-pad-bot" id="index-banner">
		<div class="container">
			<div class="row center">
				<div class="input-field col s8 offset-s2 ">
					<form action="ItemSearchResult">
						<i class="material-icons prefix">search</i> <input type="text" name="search_word" value="${searchWord}">
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">検索結果</h5>
			<p>
				検索結果${itemCount}件
			</p>
		</div>
		<div class="section">
			<!--   商品情報   -->
			<div class="row">
				<c:forEach var="item" items="${itemList}" varStatus="status">
				<div class="col s12 m3">
					<div class="card">
						<div class="card-image">
							<a href="Item?item_id=${item.id}&page_num=${pageNum}"><img src="img/${item.fileName}"></a>
						</div>
						<div class="card-content">
							<span class="card-title">${item.name}</span>
							<p>${item.price}円
							</p>
						</div>
					</div>
				</div>
				<c:if test="${(status.index + 1) % 4 == 0}">
			</div>
			<div class="row">
				</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="row center">
			<ul class="pagination">
				<!-- １ページ戻るボタン  -->
				<c:choose>
					<c:when test="${pageNum == 1}">
						<li class="disabled"><a><i class="material-icons">chevron_left</i></a></li>
					</c:when>
					<c:otherwise>
						<li class="waves-effect"><a href="ItemSearchResult?search_word=${searchWord}&page_num=${pageNum - 1}"><i class="material-icons">chevron_left</i></a></li>
					</c:otherwise>
				</c:choose>

				<!-- ページインデックス -->
				<c:forEach begin="${(pageNum - 5) > 0 ? pageNum - 5 : 1}" end="${(pageNum + 5) > pageMax ? pageMax : pageNum + 5}" step="1" varStatus="status">
					<li <c:if test="${pageNum == status.index }"> class="active" </c:if>><a href="ItemSearchResult?search_word=${searchWord}&page_num=${status.index}">${status.index}</a></li>
				</c:forEach>

				<!-- 1ページ送るボタン -->
				<c:choose>
				<c:when test="${pageNum == pageMax || pageMax == 0}">
					<li class="disabled"><a><i class="material-icons">chevron_right</i></a></li>
				</c:when>
				<c:otherwise>
					<li class="waves-effect"><a href="ItemSearchResult?search_word=${searchWord}&page_num=${pageNum + 1}"><i class="material-icons">chevron_right</i></a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>