<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	

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