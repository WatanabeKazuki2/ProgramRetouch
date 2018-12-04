<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録</title>
<jsp:include page="/baselayout/head.html" />
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">新規登録</h5>
			<c:if test="${validationMessage != null}">
				<P class="red-text">${validationMessage}</P>
			</c:if>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col s6 offset-s3">
				<div class="card grey lighten-5">
					<div class="card-content">
						<form action="RegistConfirm" method="POST">
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input value="${udb.name}" name="user_name" type="text" required> <label>名前</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input value="${udb.address}" name="user_address" type="text" required> <label>住所</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input value="${udb.loginId}" name="login_id" type="text" required> <label>ログインID</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input  name="password" type="password" required> <label>パスワード</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input name="confirm_password" type="password" required> <label>パスワード（確認用）</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12">
									<p class="center-align">
										<button class="btn btn-large waves-effect waves-light  col s8 offset-s2" type="submit" name="action">確認</button>
									</p>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>