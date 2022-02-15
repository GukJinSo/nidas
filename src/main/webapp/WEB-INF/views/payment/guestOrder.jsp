<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="body">
<div class="container-fluid">
	<div class="orderWrap">
		<h2>주문 내역</h2>
		<div class="orderBody">
			주문번호 : ${list[0].orderNo }
			총 결제 금액 : 
		</div>
	</div>

</div>
</div>