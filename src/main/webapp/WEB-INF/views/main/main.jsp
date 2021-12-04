<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>


<div class="body">
<div class="container-fluid">

<div id="slide" class="carousel slide" data-ride="carousel">
	<!-- 슬라이드 쇼 -->
	<div class="carousel-inner"> 
		<div class="carousel-item active" data-bs-interval="3000"> <!--가로--> 
			<img class="d-block w-100" src="resources/images/mainBanner1.jpg"> 
		</div>
		<div class="carousel-item" data-bs-interval="3000"> 
			<img class="d-block w-100" src="resources/images/mainBanner2.jpg"
      			alt="Second slide">
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
		<ul class="carousel-indicators">
	 		<li data-target="#slide" data-slide-to="0" class="active"></li>
	  		<li data-target="#slide" data-slide-to="1"></li> 
 		</ul>
	</div>
</div>

</div>
</div>