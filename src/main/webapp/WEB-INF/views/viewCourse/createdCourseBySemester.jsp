<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
</head>
<body>

	<table class="table table-striped" id="mytable">
		<caption>년도,학기별이수학점(2018년 이전만 조회됩니다.)</caption>
		<thead>
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>이수학점</th>
				<th>링크</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="course" items="${courseBySemesters}">
				<tr>
					<td><c:out value="${course.year}"></c:out></td>
					<td><c:out value="${course.semester}"></c:out></td>
					<td><c:out value="${course.gradeCount}"></c:out></td>
					<td>
					<a href="${pageContext.request.contextPath}/viewCourse/showCourseBySemesterDetail?year=${course.year}&semester=${course.semester}">링크</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<a href="/course/"  class="btn btn-info" role="button">Home</a>
</body>
</html>