<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
<!-- ios에서 전화번호가 링크화되는 것 방지 -->
<meta name="format-detection" content="telephone=no">
<title>SELLFIT</title>
<style>
body{
background-image: url(${rootPath}/static/images/bg.jpg);
}
header{
    margin-top: 50px;
    padding: 6px;
    text-align: center;
    margin: 0 auto;
}
header a {
    text-decoration: none;
	padding: 10px;
    border-radius: 4px;
    color: #58596b;
}
fieldset {
	margin-top: 30px;
	border:3px solid  #545354;
	border-radius: 20px;
}
form.bbs_write {
	width: 80%;
	margin: 10px auto;
	
}

form.bbs_write h2, form.bbs_write input, form.bbs_write textarea {
	width: 90%;
	margin: 5px auto;
	padding: 8px;
}
form button {
	padding: 10px;
    color: rgb(200, 199, 199);
    background-color: rgb(45, 45, 45);
    border-radius: 4px;
}
</style>
</head>
<body>
<header>
		<a href="${rootPath}/user/notionList" class="notion  last">게시판으로 돌아가기</a>  
</header>
	<form method="POST" class="bbs_write">
		<fieldset>
		<input name="no_date" type="date" value="${NOTION.no_date}" hidden="hidden" />
		<input name="no_time" type="time" value="${NOTION.no_time}"hidden="hidden" />
		<input name="no_writer" placeholder="작성자" value="${USER.username}"  readonly="readonly" />
		<input name="no_subject" placeholder="제목" value="${NOTION.no_subject}" autofocus />
		<textarea rows="5" cols="20" name="no_content" placeholder="내용"  required="required"></textarea>
		<!-- <input type="file" name="file" accept="image/*"> -->
		<button>저장</button>
		</fieldset>
	</form>
</body>
</html>