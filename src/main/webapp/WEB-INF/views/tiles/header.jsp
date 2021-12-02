<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	#bannerDiv{
		text-align: center;
	}
	#searchBar{
		border: none;
		border-bottom: 2px solid black;
	}
</style>
</head>
<body>


<div id="header">
<div class="container">
<div class="row">
	<div class="col-lg-2" id="bannerDiv">
		<img src="resources/images/headerlogo.png"/>
	</div> 
	<div class="col-lg-8">
		<input type="text" id="searchBar" placeholder="누오보 윈터 컬렉션"/>
		<i class="fas fa-search"></i>
	</div>
	<div class="col-lg-2">
	</div>
</div>
</div>
</div>


	<sec:authorize access="isAnonymous()">
		<p>
			<a href="loginForm.do">로그인</a>
			<a href="registerForm.do">회원가입</a>
			
		</p>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<form:form action="${pageContext.request.contextPath}/logout.do" method="POST">
			<input type="submit" value="로그아웃" />
		</form:form>
	</sec:authorize>
	
	<h3>
		<a href="main.do">메인</a>
	</h3>

</body>
</html>