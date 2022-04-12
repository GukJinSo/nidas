<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
	function boxChange(action){
		let billForm = $('.billForm');
		let loginForm = $('.loginForm');
		let memBtn = $('.memBtn');
		let gstBtn = $('.gstBtn');
		
		if (action == 'member'){
			billForm.css('display', 'none');
			loginForm.css('display', 'block');
			memBtn.css('border-top', '3px solid black');
			memBtn.css('border-left', '3px solid black');
			memBtn.css('border-right', '3px solid black');
			memBtn.css('border-bottom', 'none');
			memBtn.css('padding-top', '1px');
			gstBtn.css('padding-top', '5px');
			gstBtn.css('border-top', '1px solid grey');
			gstBtn.css('border-bottom', '3px solid black');
			gstBtn.css('border-right', '1px solid grey');
			
			
		} else {
			loginForm.css('display', 'none');
			billForm.css('display', 'block');
			
			memBtn.css('border-top', '1px solid grey');
			memBtn.css('border-left', '1px solid grey');
			memBtn.css('border-right', '3px solid black');
			memBtn.css('border-bottom', '3px solid black');
			memBtn.css('padding-top', '5px');
			gstBtn.css('padding-top', '1px');
			gstBtn.css('border-top', '3px solid black');
			gstBtn.css('border-bottom', 'none');
			gstBtn.css('border-right', '3px solid black');
		}
		
	}
	
</script>

<div class="body">
<div class="container-fluid">
<div class="login">
	<h2>로그인</h2>
	<div class="btnGroups">
		<button class="memBtn" onclick="boxChange('member')">
			회원 로그인
		</button>
		<button class="gstBtn" onclick="boxChange('guest')">
			비회원 주문 조회
		</button>
	</div>
	<div class="loginForm">
		<form action="${pageContext.request.contextPath}/login.do" method="post">
		    <input type="text" name="id" placeholder="아이디를 입력해주세요">
		    <br>
		    <input type="password" name="pw" placeholder="비밀번호를 입력해주세요">
		    <p>
				<c:if test="${errMsg != null}">${errMsg }</c:if>
		    </p>
		    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			<br>
		    <button type="submit">로그인</button>
		    <a href="${pageContext.request.contextPath}/registerForm.do">
		    	신규가입
		    </a>
		</form>
	</div>
	<div class="billForm">
		<form action="${pageContext.request.contextPath}/selectOrder.do" method="post">
			<input type="text" name="name" placeholder="이름을 입력해주세요">
			<br>
			<input type="text" name="orderNo" placeholder="주문번호를 입력해주세요">
			<p></p>
			<br>
			<button type="submit">주문/배송조회</button>
		</form>
	</div>	

</div>
</div>
</div>