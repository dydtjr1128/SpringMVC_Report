<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<style>

input[type=submit]{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
input[type=submit]:hover{
  background:#fff;
  color:#1AAB8A;
}
input[type=submit]:before,input[type=submit]:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
input[type=submit]:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
input[type=submit]:hover:before,input[type=submit]:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
</head>
<body>
	<sf:form method="post"
		action="${pageContext.request.contextPath}/doCreateCourse"
		modelAttribute="course">
		<!-- application context root -->
		<table border="1" cellpadding="10"
			style="border-collapse: collapse; text-align: center;">
			<caption>이수 구분별 학점내역</caption>
			<tbody>
				<tr>
					<td class="label">HansungID:</td>
					<td><sf:input class="control" type="text" path="hansungID" /><br />
						<sf:errors path="hansungID" class="error" /></td>
				</tr>
				<tr>
					<td class="label">HansungName:</td>
					<td><sf:input class="control" type="text" path="hansungName" /><br />
						<sf:errors path="hansungName" class="error" /></td>
				</tr>
				<tr>
					<td class="label">Year:</td>
					<td>${course.year}</td>
				</tr>
				<tr>
					<td class="label">Semester:</td>
					<td>${course.semester}</td>
				</tr>
				<tr>
					<td class="label">Grade:</td>
					<td>${course.grade}</td>
				</tr>
				<tr>
					<td class="label">CourseCode:</td>
					<td><sf:input class="control" type="text" path="courseCode" /><br />
						<sf:errors path="courseCode" class="error" /></td>
				</tr>
				<tr>
					<td class="label">CourseName:</td>
					<td><sf:input class="control" type="text" path="courseName" /><br />
						<sf:errors path="courseName" class="error" /></td>
				</tr>
				<tr>
					<td class="label">Division:</td>
					<td><sf:input class="control" type="text" path="division" /><br />
						<sf:errors path="division" class="error" /></td>
				</tr>
				<tr>
					<td class="label"></td>
					<td><input class="control" type="submit" value="등록"></td>
				</tr>
			</tbody>
		</table>
	</sf:form>
	<a href="/course">Home</a>
</body>
</html>