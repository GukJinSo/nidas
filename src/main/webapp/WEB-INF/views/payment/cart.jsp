<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="body">
<div class="container-fluid">
<div class="cartWrap">
	<div class="cartHeader">
		<h2>장바구니</h2>
		<span class="cartProgress">
			<span class="cartInProgress"> 장바구니 > </span>주문서 작성/결제 > 주문 완료
		</span>
		<div class="clear"></div>
		<div class="cartLoginGroups">
			<button class="" onclick="location.href='${pageContext.request.contextPath}/loginForm.do'">로그인
			</button>
			<button class="" onclick="location.href='${pageContext.request.contextPath}/registerForm.do'">회원가입
			</button>
		</div>
		<div class="clear"></div>
		배송 상품(${fn:length(cartInfo) })
	</div>
	<div class="cartBody">
		<div class="yellowBackground" style="border-bottom: 1px solid #CECECE">
		</div>
		<div class="cartProdList">
			<table>
			<c:forEach var="vo" items="${prodInfo }">
				<tr>
					<td>
						<img src="${pageContext.request.contextPath}/resources/images/product/${vo.filePath }">
						<span>
							${vo.bnameKor }
						</span>
						<span>
							${vo.disPrice }
						</span>
						<span>
						</span>
					</td>
					<td>
						${vo.quantity }
					</td>
					<td>
						2222222222222
					</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div class="yellowBackground" style="border-top: 1px solid #CECECE">
		</div>
	</div>
	<div class="cartFooter">
	
	</div>
</div>
</div>
</div>