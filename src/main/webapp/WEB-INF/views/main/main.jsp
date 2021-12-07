<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>


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
		<a href="" class="seeMore" title="더 보기">MORE</a>
	</p>
	<div class="bestSellerWrap">
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes1.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">나이키</div>
					<div class="prodName">와플 트레이너</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">59,000</span>
						<span class="prodSalePrice">53,100</span>원
					</div>
				</div>
			</div>
		</a>
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes2.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">아디다스</div>
					<div class="prodName">스탠 스미스</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">109,000</span>원
					</div>
				</div>
			</div>
		</a>
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes3.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">반스</div>
					<div class="prodName">올드스쿨</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">69,000</span>원
					</div>
				</div>
			</div>
		</a>
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes4.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">컨버스</div>
					<div class="prodName">척 테일러 70</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">89,000</span>
					</div>
				</div>
			</div>
		</a>
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes5.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">나이키</div>
					<div class="prodName">에어 포스 1</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">129,000</span>원
					</div>
				</div>
			</div>
		</a>
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes1.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">나이키</div>
					<div class="prodName">와플 트레이너</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">59,000</span>
						<span class="prodSalePrice">53,100</span>원
					</div>
				</div>
			</div>
		</a>
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes2.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">아디다스</div>
					<div class="prodName">스탠 스미스</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">109,000</span>원
					</div>
				</div>
			</div>
		</a>
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes3.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">반스</div>
					<div class="prodName">올드스쿨</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">69,000</span>원
					</div>
				</div>
			</div>
		</a>
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes4.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">컨버스</div>
					<div class="prodName">척 테일러 70</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">89,000</span>
					</div>
				</div>
			</div>
		</a>
		<a href="">
			<div class="mainProduct">
				<div class="mainProductImage">
					<img src="resources/images/shoes5.jpg">
				</div>
				<div class="mainProductText">
					<div class="prodBrand">나이키</div>
					<div class="prodName">에어 포스 1</div>
					<div class="prodPrice">
						<span class="prodNormalPrice">129,000</span>원
					</div>
				</div>
			</div>
		</a>
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
			<img src="resources/images/mainNike.jpg" width="30%;" height="400px;">
			<span class="imgFont">NIKE</span>
			<span class="imgsubFont">Just Do It!</span>
		</div>
		<div class="imgDiv">
			<img src="resources/images/mainVans.jpg" width="30%;" height="400px;">
			<span class="imgFont">VANS</span>
			<span class="imgsubFont">스케이트 슈즈에서 클래식으로</span>
		</div>
		<div class="imgDiv">
			<img src="resources/images/mainConverse.jpg" width="30%;" height="400px;">
			<span class="imgFont">CONVERSE</span>
			<span class="imgsubFont">디자인 헤리티지를 더한 프리미엄 컴포트 스니커즈</span>
		</div>
	</div>
	<div class="clear"></div>
</div>

<div class="mainReview">
	<p>새로운 리뷰</p>
	<div class="reviewDivWrap">
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>

</div>
</div>

