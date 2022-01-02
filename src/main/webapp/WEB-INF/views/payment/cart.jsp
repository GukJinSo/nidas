<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script>
function selectStock(target){
    $('.addedStock.s'+size+'Div input').trigger('onchange');
}


function sumChange(target){
	cartStockChange
}

function sumPlus(target){
	$(target).prev().val( parseInt($(target).prev().val())+1 );
	$(target).prev().trigger('onchange');
}
function sumMinus(target){
	if( $(target).next().val() != 1 ){ // 1 이하로 내려가는 것 방지
		$(target).next().val( parseInt($(target).next().val())-1 );
		$(target).next().trigger('onchange');
	}
}
</script>


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
		배송 상품(${fn:length(prodInfo) })
	</div>
	<div class="cartBody">
		<div class="lightgreyBackground" style="border-bottom: 1px solid #CECECE">
		</div>
		<div class="cartProdList">
			<table>
			<c:forEach var="vo" items="${prodInfo }">
				<tr>
					<td>
						<div>
							<img src="${pageContext.request.contextPath}/resources/images/product/${vo.filePath }">
						</div>
						<div>
							<p>
								${vo.bnameKor }
							</p>
							<p>
								${vo.pnameEng }
							</p>
							<p>
								${vo.color }
							</p>
							<p>
								${vo.shoeSize }
								<input type="hidden" value="s${vo.shoeSize }" id="${vo.shoeSize }">
							</p>
						</div>
						<div class="clear"></div>
					</td>
					<td>
						<div class="border-grey-right padding-5all">
							<button onclick="sumMinus(this)">-</button>
							<input type="number" value="${vo.quantity }" onchange="sumChange(this)">
							<button onclick="sumPlus(this)">+</button>
						</div>
						<div>
							<button onclick="cartStockChange()">변경
							</button>
						</div>
					</td>
					<td>
						<c:if test="${vo.disPrice != vo.price }">
							<p style="font-size:14px; color:#CECECE; text-decoration: line-through; padding:0px 10px">
								<span><fmt:formatNumber value="${vo.price}" type="number"/></span>원
							</p>
							<p>
								<span style="color:red">
								<fmt:formatNumber value="${vo.disPrice}" type="number"/></span>원
							</p>
						</c:if>
						<c:if test="${vo.disPrice == vo.price }">
							<p>
								<span style="color:red">
								<fmt:formatNumber value="${vo.disPrice}" type="number"/></span>원
							</p>
						</c:if>
					</td>
					<td>
						<button><i class="fa fa-trash" aria-hidden="true"></i>삭제</button>
					</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div class="explane">
			비 로그인 상태에서 장바구니에 담은 상품은 저장되지 않습니다.
		</div>
		<div class="cartTotalPrice">
			<table>
				<tr>
					<td>
						<div>
							<div>
								주문금액
							</div>
							<div>
								<c:set var="b_sum" value="0"></c:set>
								<c:forEach items="${prodInfo }" var="vo">
									<c:set var="b_sum" value="${b_sum + vo.price }"></c:set>
								</c:forEach>
								<fmt:formatNumber value="${b_sum}" type="number"/>
								<span class="won"></span>
							</div>
						</div>
					</td>
					<td class="icon-minus">
						<div>
							<div>
								총 할인금액
							</div>
							<div>
								<c:set var="d_sum" value="0"></c:set>
								<c:forEach items="${prodInfo }" var="vo">
									<c:if test="${vo.disRate ne null }">
										<c:set var="d_sum" value="${d_sum + vo.disPrice }"></c:set>
									</c:if>
								</c:forEach>
								<fmt:formatNumber value="${d_sum}" type="number"/>
								<span class="won"></span>
							</div>
						</div>
					</td>
					<td class="icon-result">
						<div>
							<div>
								결제예정금액
							</div>
							<div>
								<c:set var="a_sum" value="0"></c:set>
								<c:forEach items="${prodInfo }" var="vo">
									<c:set var="a_sum" value="${b_sum - d_sum }"></c:set>
								</c:forEach>
								<span style="color:red;"><fmt:formatNumber value="${a_sum}" type="number"/></span>
								<span class="won"></span>
							</div>
						</div>					
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="cartFooter">
	
	</div>
</div>
</div>
</div>