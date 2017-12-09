<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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

	<table class="table table-striped" id="mytable">
		<caption>이수 구분별 학점내역(2018년 이전만 조회됩니다.)</caption>
		<thead>
			<tr>
				<c:forEach var="divisions" items="${courseByDivisions}">
					<th><c:out value="${divisions.division}"></c:out></th>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="divisions" items="${courseByDivisions}">
				<td><c:out value="${divisions.divisionSum}"></c:out></td>
			</c:forEach>
		</tbody>
	</table>
	<a href="/course"  class="btn btn-info" role="button">Home</a>
</body>
</html>