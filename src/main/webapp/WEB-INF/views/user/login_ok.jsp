<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SELLFIT</title>
<style>


body {
	background-image: url("${rootPath}/static/images/bg.jpg");
}
.not-login:hover{
color: black;
background-color: white;


}
.not-login{
margin-left: 30px ;
background-color: black;
color: white;
padding: 10px;
border-radius: 5px;
margin: 30px;
}

div{
margin: 80px 0;

}
.no-user {
	margin-bottom: 50px;
	margin-left: 30px;
}
img{
	margin: 0 auto;
}
.content {
	margin-bottom: 220px;
}
#nav_margin {
	width: 300px;
	margin: 0 auto;
} 
a:hover{
color:white; 

}
.logout{
margin-top: 20px
}

.logo {
    margin: 50px auto;
    width: 10rem;
    height: 8rem;
    line-height: 5rem;
    padding: 50px 0px 0px 0px;
}

.icon {
    text-decoration: none;
    border-bottom: none;
    position: relative;
    display: inline-block;
    float: inherit;

}
</style>

<link rel="stylesheet" href="${rootPath}/static/css/login_ok.css?20220610_004" />

</head>
<body>

	<h3>${LOGIN.message}</h3>
		
	<c:choose>
	
		<c:when test="${LOGIN_MESSAGE == 'USERNAME FAIL' }">
		<div>
		<img src="${rootPath}/static/images/do it list.png">
			<h3 class="no-user">USER NAME(사용자 ID) 가 없습니다</h3>
			<a class="not-login" href="${rootPath}/user/login">로그인 다시 하기</a>
			<a class="not-login" href="${rootPath}">홈으로 가기</a>
			</div>
		</c:when>
		<c:when test="${LOGIN_MESSAGE == 'PASSWORD FAIL' }">
			<h2>비밀번호가 잘못되었습니다</h2>
			<a href="${rootPath}/user/login">로그인 다시 하기</a>
			<a href="${rootPath}">홈으로 가기</a>
		
		</c:when>
		
		<c:otherwise>
			<c:if test="${not empty USER}">
			<%-- <h3>로그인 성공!!!</h3>
				<p><strong>USERNAME : </strong>${USER.username}</p>
				<p><b>NAME : </b>${USER.name}</p>
				<p><b>email : </b>${USER.email}</p>
				<a href="${rootPath}/">홈으로</a> --%>
					<!-- Header -->
					<header id="header">
						<div class="logo">
							<span class="icon"><img src="${rootPath}/static/images/do it list.png"
								alt="" /></span>
						</div>
						<div id="icon_solid"></div>
						<div class="content">
							<div class="inner">
								<h2>${USER.username} 님</h2>
							</div>
							<div>
							${MESSAGE}
							</div>
							
						</div>
						<div id="icon_solid1"></div>
						<nav id="nav_margin">
							<ul>
								<li><a href="${rootPath}/user/calender">운동 시작</a></li>
								<li><a href="${rootPath}/user/mypage">마이페이지</a></li>
							</ul>
						</nav>
					<br>
						<a class="logout" href="${rootPath}/user/logout">로그아웃</a>
					</header>
					<footer>
						<p class="team">제작 : 나준희, 임효선, 김햇살</p>
					</footer>
			</c:if>
		</c:otherwise>
	</c:choose>




	
</body>
</html>