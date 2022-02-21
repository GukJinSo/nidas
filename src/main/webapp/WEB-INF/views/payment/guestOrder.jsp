<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="body">
<div class="container-fluid">
	<div class="orderWrap">
		<h2 class="margin-bottom-40px">주문 내역</h2>
		<div class="orderBody">
			<div class="text-left font-size-18px font-weight-800 padding-bottom-20px">
				주문번호 : ${list[0].orderNo }
			</div>
			<div class="lightgreyBackground" style="border-top:3px solid black;">
			</div>
			<div class="font-size-14px">
				<table>
					<tr class="height-50px">
						<th>번호</th>
						<th colspan="2">상품 정보</th>
						<th>수량</th>
						<th>판매 금액</th>
						<th>할인액</th>
						<th>결제액</th>
						<th>주문 상태</th>
					</tr>
					<c:forEach var="vo" items="${list }" varStatus="status">
						<tr class="border-bottom-1px-grey">
							<td class="padding-top-20px padding-bottom-20px height-150px">
								${status.index }
							</td>
							<td class="width-150px text-align-right">
								<img class="width-100px" src="${pageContext.request.contextPath}/resources/images/product/${vo.filePath }">
							<td class="width-150px">
								<p class="font-weight-800 margin-0px margin-top-5px">
									${vo.bnameKor }
								</p>
								<p class="margin-0px">
									${vo.pnameEng }
								</p>
								<p class="margin-0px">
									${vo.color }
								</p>
								<p class="margin-0px">
									${fn:replace(vo.shoeSize, 's', '')}
								</p>
							</td>
							<td>
								${vo.stocks }
							</td>
							<td>
								<fmt:formatNumber type="number" maxFractionDigits="0" value="${vo.price }" />
							</td>
							<td>
								<c:if test="${vo.disRate eq 0 }">
								</c:if>
								<c:if test="${vo.disRate ne 0 }">
									<fmt:formatNumber type="number" maxFractionDigits="0" value="${vo.price*vo.disRate }" />
								</c:if>
							</td>
							<td>
								<fmt:formatNumber type="number" maxFractionDigits="0" value="${ (vo.price - (vo.price*vo.disRate))*vo.stocks }"/>
							</td>
							<td>
								배송중
							</td>
						</tr>
					</c:forEach>					
				</table>
			</div>
			<div class="lightgreyBackground " style="border-bottom:3px solid black;">
			</div>
			
		</div>
	</div>

</div>
</div>