<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>반갑습니다!</h1>

	<p>
		<a
			href="${pageContext.request.contextPath}/viewCourse/showCourseBySemester"
			class="btn btn-info" role="button">Show Course By Semester and
			year</a>
	</p>
	<p>
		<a
			href="${pageContext.request.contextPath}/viewCourse/showCourseByDivision"
			class="btn btn-info" role="button">Show Course By Division</a>
	</p>
	<p>
		<a href="${pageContext.request.contextPath}/viewCourse/createCourse"
			class="btn btn-info" role="button">Create 2018 Course</a>
	</p>
	<p>
		<a
			href="${pageContext.request.contextPath}/viewCourse/showCourseByNextSemester"
			class="btn btn-info" role="button">Show Course By Next(2018-1)
			Semester</a>
	</p>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<a href="javascript:document.getElementById('logout').submit()" class="btn btn-info" role="button">Logout</a>
	</c:if>
	<form id="logout" action="<c:url value="/logout" />" method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
</body>
</html>
