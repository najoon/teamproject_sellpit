<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<style>
body{
	background-image: url(${rootPath}/static/images/bg.jpg);
	width: 1000px;
	margin: 0 auto;
}
h2 {
	text-align: center;
	margin-top: 80px;
}
section{
    margin-top: 20px;
    padding: 6px;
    text-align: center;
    width: 160px;
    margin-left:auto;
    margin-right: 10px;
}
section a {
	
    border-radius: 10px;
    background-color: #a2a3bd; 
    text-decoration: none;
	padding: 6px; 
    color: #333;
    font-weight: bolder;
    font-size: 14px;
}
section a:hover {
	color: #495c7b; 
}
table {
	border-collapse: collapse;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	font-size: 90%;
	text-align: center;
	table-layout: fixed;
	margin: 10px auto;
	width: 90%;
} 
 
table th, td {
	padding: 15px;
	border-bottom: 1px solid rgba(14, 13, 13, 0.2);
}


</style>
<body>
	<h2>문의 사항</h2>
	<section>
		<a href="${rootPath}/user/notion">글쓰기</a>
	</section>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<c:forEach items="${NOTIONLIST}" var="notion">
			<tr>
				<td>${notion.no_subject}</td>
				<td>${notion.no_content}</td>
				<td>${notion.no_writer}</td>
				<td>${notion.no_date}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>