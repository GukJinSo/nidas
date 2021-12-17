<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						50,000원
					</div>	
				</div>
			</div>
			
		</div>
		<div class="clear"></div>
</div>
</div>
</div>