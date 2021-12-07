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
				<img class="d-block w-100" src="resources/images/mainBanner1.jpg">
			</a> 
		</div>
		<div class="carousel-item">
			<a href="">
				<img class="d-block w-100" src="resources/images/mainBanner2.jpg">
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

<div class="mainBestBrand">
	<p>베스트 브랜드</p>
	<div class="imgDiv"><img src="resources/images/mainNike.jpg" width="33%;" height="400px;"><span class="imgFont">NIKE</span></div>
	<div class="imgDiv"><img src="resources/images/mainVans.jpg" width="33%;" height="400px;"><span class="imgFont">VANS</span></div>
	<div class="imgDiv"><img src="resources/images/mainConverse.jpg" width="33%;" height="400px;"><span class="imgFont">CONVERSE</span></div>
</div>


</div>



</div>

