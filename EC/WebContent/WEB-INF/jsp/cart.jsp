<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カート確認</title>
<jsp:include page="/baselayout/head.html" />

</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			${cartActionMessage}
			<h5 class=" col s12 light">買い物かご</h5>
		</div>
		<div class="section">
			<form action="ItemDelete" method="POST">
				<div class="row">
					<div class="col s12">
						<div class="col s6 center-align">
							<button class="btn waves-effect waves-light col s6 offset-s3 " type="submit" name="action">
								削除<i class="material-icons right">delete</i>
							</button>
						</div>
						<div class="col s6 center-align">
							<a href="Buy" class="btn  waves-effect waves-light col s6 offset-s3">レジに進む<i class="material-icons right">attach_money</i></a>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach var="item" items="${cart}" varStatus="status">
					<div class="col s12 m3">
						<div class="card">
							<div class="card-image">
								<a href="Item?item_id=${item.id}"><img src="img/${item.fileName}"> </a>
							</div>
							<div class="card-content">
								<span class="card-title">${item.name}</span>
								<p>${item.price}円
								</p>
								<p>
									<input type="checkbox" id="${status.index}" name="delete_item_id_list" value="${item.id}" /> <label for="${status.index}">削除</label>
								</p>
							</div>
						</div>
					</div>
					<c:if test="${(status.index+1) % 4 == 0 }">
				</div>
				<div class="row">
					</c:if>
					</c:forEach>

				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>