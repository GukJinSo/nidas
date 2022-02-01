<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$(function() {
  var swiper = new Swiper(".mySwiper", {
	slidesPerView: 'auto',
    spaceBetween: 60,
    freeMode: true,
    loop:true,
    allowTouchMove: true,
    autoplay: {
        delay: 3000,
      }
  });
});
</script>

<div class="body">
<div class="container-fluid">

<div id="slide" class="carousel slide" data-ride="carousel">
	<!-- 슬라이드 쇼 -->
	<div class="carousel-inner"> 
		<div class="carousel-item active">
			<a href=""> 
				<img class="d-block w-100" src="resources/images/mainBanner2.jpg">
			</a> 
		</div>
		<div class="carousel-item">
			<a href="">
				<img class="d-block w-100" src="resources/images/mainBanner1.jpg">
      		</a>
		</div> 
		<!-- 왼쪽 오른쪽 화살표 버튼 -->
		<a class="carousel-control-prev slideArrBtn" href="#slide" data-slide="prev"> 
			<span class="carousel-control-prev-icon" aria-hidden="true">
			</span>
		</a> 
		<a class="carousel-control-next slideArrBtn" href="#slide" data-slide="next"> 
			<span class="carousel-control-next-icon" aria-hidden="true">
			</span>
		</a>
		<!-- 인디케이터 -->
		<ul class="carousel-indicators" style="z-index: 0;">
	 		<li data-target="#slide" data-slide-to="0" class="active"></li>
	  		<li data-target="#slide" data-slide-to="1"></li> 
 		</ul>
	</div>
</div>

<div class="mainBestSeller">
	<p>베스트 셀러
		<a href="productList.do" class="seeMore" title="더 보기">MORE</a>
	</p>
	<div class="bestSellerWrap">
		<c:forEach var="vo" items="${list }">
			<a href="${pageContext.request.contextPath}/productDetail.do?serial=${vo.serial}">
				<div class="mainProduct">
					<img src="${pageContext.request.contextPath}/resources/images/product/${vo.filePath }">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">${vo.bnameKor }</div>
					<div class="prodName">${vo.pnameKor }</div>
					<div class="prodPrice">
						<c:if test="${vo.disRate != 0 }">
							<span class="prodNormalPrice faint">
								<fmt:formatNumber value="${vo.price }" pattern="#,###" />원
							</span>
							<span class="prodSalePrice">
								<fmt:formatNumber value="${vo.disPrice }" pattern="#,###" />원
							</span>
							<span class="prodDisRate">
							 [<fmt:formatNumber type="number" maxFractionDigits="0" value="${vo.disRate*100 }" />%]
							</span>
						</c:if>
						<c:if test="${vo.disRate == 0 }">
							<span class="prodNormalPrice">${vo.price }</span>원
						</c:if>
					</div>
				</div>
			</a>
		</c:forEach>
		<div class="clear"></div>
	</div>
</div>

<div class="saleBanner">
	<a href="">
	<img src="resources/images/saleBanner.png" width="100%;" height="150px;">
	</a>
</div>

<div class="mainBestBrand">
	<p>베스트 브랜드</p>
	<div class="imgDivWrap">
		<div class="imgDiv">
			<a href="${pageContext.request.contextPath}/productList.do?search=NIKE">
			<img src="resources/images/mainNike.jpg" width="30%;" height="400px;">
			<span class="imgFont">NIKE</span>
			<span class="imgsubFont">Just Do It!</span>
			</a>
		</div>
		<div class="imgDiv">
			<a href="${pageContext.request.contextPath}/productList.do?search=VANS">
			<img src="resources/images/mainVans.jpg" width="30%;" height="400px;">
			<span class="imgFont">VANS</span>
			<span class="imgsubFont">스케이트 슈즈에서 클래식으로</span>
			</a>
		</div>
		<div class="imgDiv">
			<<a href="${pageContext.request.contextPath}/productList.do?search=CONVERSE">
			<img src="resources/images/mainConverse.jpg" width="30%;" height="400px;">
			<span class="imgFont">CONVERSE</span>
			<span class="imgsubFont">디자인 헤리티지를 더한 프리미엄 컴포트 스니커즈</span>
			</a>
		</div>
	</div>
	<div class="clear"></div>
</div>

<div class="mainReview">
	<p>새로운 리뷰<p>
	<div class="swiper mySwiper">
	  <div class="swiper-wrapper">
	    <div class="swiper-slide"><img src="resources/images/shoes1.jpg"></div>
	    <div class="swiper-slide">Slide 2</div>
	    <div class="swiper-slide">Slide 3</div>
	    <div class="swiper-slide">Slide 4</div>
	    <div class="swiper-slide">Slide 5</div>
	    <div class="swiper-slide">Slide 6</div>
	    <div class="swiper-slide">Slide 7</div>
	    <div class="swiper-slide">Slide 8</div>
	    <div class="swiper-slide">Slide 9</div>
	    <div class="swiper-slide">Slide 10</div>
	  </div>
	</div>
</div>

</div>
</div>
