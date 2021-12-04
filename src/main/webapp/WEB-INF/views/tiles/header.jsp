<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row" >

	
	<div class="col-lg-2 hLogoDiv">
		<a href="main.do"> <img src="resources/images/headerlogo.png"> </a>
	</div> 
	
	<div class="col-lg-8 hSearchDiv">
		<form action="search.do">
			<input type="text" class="hSearchBar" placeholder="누오보 윈터 컬렉션" onfocus="this.placeholder=''"/>
			<button type="submit" class="hSearchBtn"><i class="fas fa-search"></i></button>
		</form>
									<div class="col-lg-8">
		</div>
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
	
	<div class="col-lg-12 hCategoryBar">
		<a href="" title="카테고리별">CATEGORY</a>
		<a href="" title="신상품">NEW</a>
		<a href="" title="커스터마이즈">CUSTOM</a>
		<a href="" title="할인중">SALE</a>
	</div>
	
</div>	
