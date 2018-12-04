<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ-登録完了</title>
<jsp:include page="/baselayout/head.html" />
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">登録完了</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col s6 offset-s3">
				<div class="card grey lighten-5">
					<div class="card-content">
						<div class="row">
							<div class="input-field col s10 offset-s1">
								<input type="text" value="${udb.name}" readonly> <label>名前</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s10 offset-s1">
								<input type="text" value="${udb.address}" readonly> <label>住所</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s10 offset-s1">
								<input type="text" value="${udb.loginId}" readonly> <label>ログインID</label>
							</div>
						</div>
						<div class="row">
							<div class="col s12">
								<p class="center-align">上記内容で登録しました。</p>
							</div>
						</div>
						<div class="row">
							<div class="col s12">
								<p class="center-align">
									<a href="Login" class="btn waves-effect waves-light  col s8 offset-s2">ログイン画面へ</a>
								</p>
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