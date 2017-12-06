<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
input[type="submit"]{
	margin-top: 20px;
	padding-left: 100px;
	padding-right: 100px;
}
</style>
</head>
<body onload='document.f.username.focus();'>
	<h3>Login with Username and Password</h3>
	<form name='f' action="<c:url value="/login"/>" method='POST'>
		<c:if test="${not empty logoutMsg}">
			<div style="color: #0000ff">
				<h3>${ logoutMsg }</h3>
			</div>
		</c:if>
		<c:if test="${not empty errorMsg}">
			<div style="color: #ff0000">
				<h3>${ errorMsg }</h3>
			</div>
		</c:if>
		<table>

			<tr>
				<td>
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							class="form-control" name="hansungID" placeholder="hansungID">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input id="password"
							type="password" class="form-control" name="password"
							placeholder="Password">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" class="btn btn-info"
					type="submit" value="Login" /></td>
			</tr>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<!-- csrf는 공격에 대비하기위한 용도 토큰값을 이용해 없는애가 똑같이보내는것을 방지 -->
		</table>
	</form>
</body>
</html>