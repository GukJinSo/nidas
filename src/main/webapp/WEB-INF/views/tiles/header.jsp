<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		
<script src="resources/js/header.js"></script>
		
<div class="header" onmouseleave="cateFadeOut()" >
<div class="container">
<div class="row">

	
	<div class="col-lg-2 hLogoDiv">
		<a href="main.do"> <img src="resources/images/headerlogo.png"> </a>
	</div> 
	
	<div class="col-lg-8 hSearchDiv">
		<form action="search.do">
			<input type="text" class="hSearchBar" placeholder="누오보 윈터 컬렉션" onfocus="this.placeholder=''"/>
			<button type="submit" class="hSearchBtn"><i class="fas fa-search"></i></button>
		</form>
	</div>
	
	<div class="col-lg-2 hMenuDiv">
		<sec:authorize access="isAnonymous()">
			<a href="loginForm.do" title="로그인"><i class="far fa-user middleIcon"></i></a>
			<a href="registerForm.do" title="회원가입"><i class="fas fa-user-plus middleIcon"></i></a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<form:form action="${pageContext.request.contextPath}/logout.do" method="POST" style="display:inline;">
				<button type="submit" class="submitIconBtn" title="로그아웃">
					<i class="fas fa-sign-out-alt middleIcon"></i>
				</button>
			</form:form>
		</sec:authorize>
		<a href="" title="장바구니"><i class="fas fa-shopping-cart middleIcon"></i></a>
		<a href="" title="매장위치"><i class="far fa-map middleIcon"></i></a>
	</div>
	
	<div class="col-lg-12 hCateBar">
		<Button class="hCateBtn" onmouseover="cateFade()">카테고리</Button>
		<Button class="hCateBtn" onmouseover="cateFadeOut()" onclick="location.href='customPage.do'">커스터마이즈</Button>
		<Button class="hCateBtn" onmouseover="cateFadeOut()">랭킹</Button>
		<Button class="hCateBtn" onmouseover="cateFadeOut()" onclick="location.href='sales.do'">세일</Button>
	</div>
	
</div>
</div>
		<div class="hCateWrap">
			<div class="hCateDiv cateAll">
				<p class="seeAll"><a href=""><i class="fas fa-chevron-right smallIcon"></i>모두 보기</a></p>
				<div class="hCateInDiv">
					<ul class="ul">
					<li>신발</li>
					<li><a href="">캔버스/스웨이드</a>
					<li><a href="">캐주얼</a>
					<li><a href="">러닝/스포츠</a></li>
					<li><a href="">농구화</a>
					<li><a href="">슬리퍼</a>
					</ul>
				</div>
				<div class="hCateInDiv">
					<ul class="ul">
					<li>의류</li>
					<li><a href="">티셔츠</a></li>
					<li><a href="">맨투맨/후드</a></li>
					<li><a href="">바지</a></li>
					<li><a href="">반바지</a></li>
					<li><a href="">레플리카</a></li>
					<li><a href="">트랙탑</a></li>
					<li><a href="">재킷</a></li>
					</ul>
				</div>
				<div class="hCateInDiv">
					<ul class="ul">
					<li>악세서리</li>
					<li><a href="">모자</a></li>
					<li><a href="">가방</a></li>
					<li><a href="">스포츠 장비</a></li>
					</ul>
				</div>
				<div class="hCateInDiv">
					<ul class="ul">
					<li>아이콘</li>
					<li><a href="">나이키 에어 포스</a></li>
					<li><a href="">나이키 에어 맥스</a></li>
					<li><a href="">아디다스 스탠 스미스</a></li>
					<li><a href="">아디다스 슈퍼스타</a></li>
					<li><a href="">컨버스 척 70 클래식</a></li>
					<li><a href="">반스 올드스쿨</a></li>
					</ul>
				</div>
			</div>
			<div class="clear">
			</div>
		</div>
</div>
