<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
							<tr>
								<td style="word-break:break-all" width="29%">색상 코드</td>
								<td style="word-break:break-all" width="70%">YEL</td>
								
							</tr>
							<tr>
								<td style="word-break:break-all">배송 방법</td>
								<td style="word-break:break-all">일반 배송</td>
							</tr>
							<tr>
								<td style="word-break:break-all">사이즈 선택</td>
								<td style="word-break:break-all; line-height: 2em;">
									<label for="s220"><input type="checkbox" value="s220" id="s220"><span>220</span></label>
									<label for="s225"><input type="checkbox" value="s225" id="s225"><span>225</span></label>
									<label for="s230"><input type="checkbox" value="s230" id="s230"><span>230</span></label>
									<label for="s235"><input type="checkbox" value="s235" id="s235"><span>235</span></label>
									<label for="s240"><input type="checkbox" value="s240" id="s240"><span>240</span></label>
									<label for="s245"><input type="checkbox" value="s245" id="s245"><span>245</span></label>
									<label for="s250"><input type="checkbox" value="s250" id="s250"><span>250</span></label>
									<label for="s255"><input type="checkbox" value="s255" id="s255"><span>255</span></label>
									<label for="s260"><input type="checkbox" value="s260" id="s260"><span>260</span></label>
									<label for="s265"><input type="checkbox" value="s265" id="s265"><span>265</span></label>
									<label for="s270"><input type="checkbox" value="s270" id="s270"><span>270</span></label>
									<label for="s275"><input type="checkbox" value="s275" id="s275"><span>275</span></label>
									<label for="s280"><input type="checkbox" value="s280" id="s280"><span>280</span></label>
									<label for="s285"><input type="checkbox" value="s285" id="s285"><span>285</span></label>
									<label for="s290"><input type="checkbox" value="s290" id="s290"><span>290</span></label>
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