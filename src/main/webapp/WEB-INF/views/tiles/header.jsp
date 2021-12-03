<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	.hMenuDiv{
		text-align:right;
		margin-top:10px;
		font-size: 12px;
	}
	.hLogoDiv{
	}
	.hSearchDiv{
		margin-top:20px;
		text-align: center;		
	}
	.hSearchBar{
		border: none;
		width:50%;
		border-bottom: 2px solid black;
	}
	.hSearchBtn{
		background:none;
		border:0px;
	}
</style>
</head>
<body>


<div class="header">
<div class="container">
<div class="row" >

	<div class="col-lg-12 hMenuDiv">
		<sec:authorize access="isAnonymous()">
			<a href="loginForm.do">로그인</a>
			<a href="registerForm.do">회원가입</a>
		</sec:authorize>
		<a href="">고객센터</a>
		<a href="">매장찾기</a>
	</div>
	
	<div class="col-lg-2 hLogoDiv">
		<a href="main.do"> <img src="resources/images/headerlogo.png"> </a>
	</div> 
	
	<div class="col-lg-8 hSearchDiv">
		<form action="search.do">
			<input type="text" class="hSearchBar" placeholder="누오보 윈터 컬렉션"/>
			<button type="submit" class="hSearchBtn"><i class="fas fa-search"></i></button>
		</form>
		<div class="col-lg-8 hMenuDiv">
		</div>
	</div>
	
	<div class="col-lg-2">
	</div>
</div>
</div>
</div>
</body>
</html>