<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SELLFIT</title>
<style>
body {
	background-image: url(${rootPath}/static/images/bg.jpg);
	background-size: cover;
	background-attachment: fixed;
}

button:last-of-type {
	width: 50px;
	height: 20px;
}
#go {
	font-size: 15px;
	color: black;
}
#go:hover{
color:#eee;
}
#daysetList {
	margin-top: 30px;
}
footer {
	margin: 10px auto; 
	overflow-y: scroll;
	height: 300px;
	width: 580px; 
}
</style>
<script>
	const rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/dayhealth.js?20220620_002"></script>

</head>
<link rel="stylesheet"
	href="${rootPath}/static/css/dayHealth.css?ver=2022-06-16-026">


<body>
	
		<header>
			<section class="health">
				<h2>${HEALTH.list_name}</h2>

			</section>
			<input id="guide" type="checkbox" /> <label class="guidecheck"
				for="guide"><div class="blankbutton">운동 가이드</div></label>
			<div class="check1">
				<br>
				<h4>운동 설명</h4>
				<br>
				<c:forEach items="${EXP}" var="EE">
				${EE.ex_content}<br>
				</c:forEach>
				<br>
				<h4>운동 가이드</h4>
				<br>
				<c:forEach items="${GUID}" var="GG">
				${GG.gd_content}<br>
				</c:forEach>
				<br>
				<h4>호흡법</h4>
				<br>
				<c:forEach items="${BRE}" var="BB">
				${BB.br_contenth}<br>
				</c:forEach>
				<br>
			</div>
		</header>
		<div id="wrap">
		<section>
			<div>
				<img src="${rootPath}/static/images/${HEALTH.sl_listid}.jpg">
			</div>
		</section>
		<section>
			<div>
				<div>
					<h4>** 세트가 끝날 때마다 체크를 눌러주세요. **</h4>
				</div>




				<div class="healthpage list">
					<span>${INDEX.count} set )</span>
					<form action="${rootPath}/user/dayHealth" method="POST"
						class="send">
						<input name="my_dayset" type="hidden" value="${INDEX.count}">
						<input name="my_list" type="hidden" value="${HEALTH.list_name}">
						<input name="sc_id" type="hidden" value="${HEALTH.sl_scid}">
						<input name="sl_listid" type="hidden" value="${HEALTH.sl_listid}">
						<input placeholder="${HEALTH.sl_weight}" name="my_weight"
							class="kg"><label>kg</label> <input
							placeholder="${HEALTH.sl_rep}" name="my_rep" class="rep"><label>회</label>
						<button type="button" class="alerts">체크</button>
					</form>
				</div>

			</div>
		</section>
		<footer>
			<table>
				<tr>
					<th>세트</th>
					<th>운동종목</th>
					<th>무게</th>
					<th>횟수</th>
				</tr>
				<c:forEach items="${LIST_NAME}" var="l_name" varStatus="INDEX">
				<tr>
					<td>${INDEX.count}</td>
					<td>${l_name.my_list}</td>
					<td>${l_name.my_weight}</td>
					<td>${l_name.my_rep}</td>
				</tr>
			</c:forEach>
			</table>
		</footer>
			<div id="daysetList">
				<a href="${rootPath}/user/dayset/${HEALTH.sc_num}" id="go">운동 목록으로</a>
			</div>
	</div>
</body>

</html>