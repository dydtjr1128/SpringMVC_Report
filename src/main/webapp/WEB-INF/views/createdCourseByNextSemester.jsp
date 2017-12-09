<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
th, td {
	width: 70px;
}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

	<table class="table table-striped" id="mytable">
		<caption>2018년 신청 학점 내역</caption>
		<thead>
			<tr>
				<th>HansungID</th>
				<th>HansungName</th>
				<th>Year</th>
				<th>Semester</th>
				<th>CourseName</th>
				<th>CourseCode</th>
				<th>Division</th>
				<th>Grade</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="courses" items="${courses}">
				<tr>
					<td><c:out value="${courses.hansungID}"></c:out></td>
					<td><c:out value="${courses.hansungName}"></c:out></td>
					<td><c:out value="${courses.year}"></c:out></td>
					<td><c:out value="${courses.semester}"></c:out></td>
					<td><c:out value="${courses.courseName}"></c:out></td>
					<td><c:out value="${courses.courseCode}"></c:out></td>
					<td><c:out value="${courses.division}"></c:out></td>
					<td><c:out value="${courses.grade}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="/course"  class="btn btn-info" role="button">Home</a>
</body>
</html>