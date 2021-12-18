<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="body">
<div class="container-fluid">
<div class="prodDetailWrap">
		<div class="path">
			<a href="main.do"><i class="fas fa-home"></i> HOME</a>
			>
			<a href="productList.do">신발</a>
			>
			<c:if test="${prod.details.PCategory eq 'cate01cv' }">
				캔버스/스웨이드
			</c:if>
			<c:if test="${prod.details.PCategory eq 'cate01ca' }">
				캐주얼
			</c:if>
			<c:if test="${prod.details.PCategory eq 'cate01sl' }">
				슬리퍼/뮬
			</c:if>
			<c:if test="${prod.details.PCategory eq 'cate01rn' }">
				러닝/스포츠
			</c:if>
		</div>
		<div class="details">
			<div class="detailsLeft">
				<div class="bigImage">
					<img src="resources/images/shoes1.jpg">
				</div>
				<div class="sliders">
					슬라이더
				</div>
			</div>
			<div class="detailsRight">
				<div class="detailsHeader">
					<div class="brand">
						<a href="productList.do?search=${prod.details.bnameKor }">${prod.details.bnameKor } ></a>
					</div>
					<div class="pnameKor">
						${prod.details.pnameKor }
					</div>
					<div class="pnameEng">
						${prod.details.pnameEng }
					</div>
					<div class="codes">
						<div class="stylecode">
							상품코드 : ${prod.details.serial }
						</div>
						<div class="serial">
							상품코드 : ${prod.details.serial }
						</div>
					</div>
					<div class="price">
						<c:if test="${prod.details.disRate ne null }">
							<span class="prodNormalPrice faint"><fmt:formatNumber value="${prod.details.price }" type="number"/>원</span>
							<span class="prodSalePrice lastPrice"><fmt:formatNumber value="${prod.details.disPrice }"/>원</span>
							<span class="prodDisRate">[<fmt:formatNumber value="${prod.details.disRate*100 }" type="number"/>%]</span>
						</c:if>
						<c:if test="${prod.details.disRate eq null }">
							<span class="prodNormalPrice lastPrice"><fmt:formatNumber value="${prod.details.price }" type="number"/>원</span>
						</c:if>
					</div>
					<div class="top-line-bold">
						<table>
						<c:if test="${prod.styleCodes != null }">
							<tr>
								<th style="word-break:break-all" width="29%">스타일 컬러</th>
								<th style="word-break:break-all" width="70%">
									<c:forEach items="${prod.styleCodes }" var="vo">
										${vo.img }
									</c:forEach>
								</th>
							</tr>
						</c:if>
							<tr>
								<td style="word-break:break-all" width="29%">색상 코드</td>
								<td style="word-break:break-all" width="70%">YEL</td>
								
							</tr>
							<tr>
								<td style="word-break:break-all">배송 방법</td>
								<td style="word-break:break-all">일반 배송</td>
							</tr>
							<tr>
								<td style="word-break:break-all; vertical-align: top;">사이즈 재고</td>
								<td style="word-break:break-all; line-height: 2em;">
									<c:forEach items="${prod.stocks }" var="sizeStocks" begin="">
										<c:if test="${sizeStocks.value != 0}">
											<label for="s${sizeStocks.key }"><input type="checkbox" value="${sizeStocks.key }" id="s${sizeStocks.key }">
											<span>${sizeStocks.key }</span></label>
										</c:if>
									</c:forEach>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
		</div>
		<div class="clear"></div>
</div>
</div>
</div>