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
	var times = $(target).val();
	var totalPrice = 0;
	$(target).parent().siblings('.sum').html(addComma('${prod.details.disPrice }'*times)+'원');
	$(target).next().next().val(times);
	$.each( $('.addedStockWrap .sum'), function(index, span){
			totalPrice += removeKorSc(span.innerText);
		});
	var comPrice = addComma(totalPrice);
	$('.sums').text(comPrice);
}

function sumPlus(target){
	$(target).prev().val( parseInt($(target).prev().val())+1 );
	$(target).prev().trigger('onchange');
}
function sumMinus(target){
	if( $(target).next().val() != 1 ){ // 1 이하로 내려가는 것 방지
		$(target).next().val( parseInt($(target).next().val())-1 );
		$(target).next().trigger('onchange');
	} else {
		sumChange(target); // target을 찾을 수 없기에 sumChange의 times는 0이 됨. 결국 0을 곱하게 되어 가격이 사라짐 
		$(target).closest('.addedStock').remove();
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
		<div class="yellowBackground" style="border-bottom: 1px solid #CECECE">
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