<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	function filterShow(target, action, clickedBtn){
		if (action == 'show'){
			$('.'+target).removeClass('hide');
			$(clickedBtn).children().first().addClass('hide');
			$(clickedBtn).children().eq(1).removeClass('hide');
			$(clickedBtn).attr("onclick", "filterShow("+"'"+target+"','hide', this);");
			$(clickedBtn).parent().css('border-bottom', 'none');
			$(clickedBtn).parent().next().css('border-bottom', '1px solid #DFDFDF');
		} else {
			$('.'+target).addClass('hide');
			$(clickedBtn).children().first().removeClass('hide');
			$(clickedBtn).children().eq(1).addClass('hide');
			$(clickedBtn).attr("onclick", "filterShow("+"'"+target+"','show', this);");
			$(clickedBtn).parent().next().css('border-bottom', 'none');
		}
	}

</script>

<div class="body">
<div class="container-fluid">
<div class="prodListWrap">
	<div class="nav eqHeight">
		<div class="filterWrap">
			<div class="filter filterTitle">FILTER</div>
			<div class="filter">브랜드
				<button class="filterShowBtn" onclick="filterShow('brands', 'show', this)">
					<i class="fas fa-chevron-down"></i>
					<i class="fas fa-chevron-up hide"></i>
				</button>
			</div>
			<div class="innFilter brands hide">
				<span>나이키</span>
				<span>나이키</span>
				<span>나이키</span>
				<span>나이키</span>
				<span>나이키</span>
				<span>나이키</span>
				
			</div>
			<div class="filter">사이즈
				<button class="filterShowBtn"><i class="fas fa-chevron-down"></i></button></div>
			<div class="filter">컬러
				<button class="filterShowBtn"><i class="fas fa-chevron-down"></i></button></div>
			<div class="filter">검색어
				<button class="filterShowBtn"><i class="fas fa-chevron-down"></i></button></div>
			<div class="filter">가격
				<button class="filterShowBtn"><i class="fas fa-chevron-down"></i></button></div>
		</div>
		<div class="filterBtns">
			<button type="button" class="btn btn-light filterBtn">초기화</button>
			<button type="button" class="btn btn-dark filterBtn">검색</button>
		</div>
	</div>
	<div class="prodList eqHeight">
		<div class="path">
			<a href="main.do">HOME</a>
			>
			<c:if test="${pCategory eq null }">
				신발
			</c:if>
			<c:if test="${pCategory ne null }">
				<a href="productList.do">신발</a>
			</c:if>
			<c:if test="${pCategory eq 'cate01cv'}">
				> 캔버스/스웨이드
			</c:if>
			<c:if test="${pCategory eq 'cate01ca'}">
				> 캐주얼
			</c:if>
			<c:if test="${pCategory eq 'cate01rn'}">
				> 러닝/스포츠
			</c:if>
			<c:if test="${pCategory eq 'cate01sl'}">
				> 슬리퍼/뮬
			</c:if>
		</div>
		<h3>
			<c:if test="${pCategory eq 'cate01cv'}">
				캔버스/스웨이드
			</c:if>
			<c:if test="${pCategory eq 'cate01ca'}">
				캐주얼
			</c:if>
			<c:if test="${pCategory eq 'cate01rn'}">
				러닝/스포츠
			</c:if>
			<c:if test="${pCategory eq 'cate01sl'}">
				슬리퍼/뮬
			</c:if>
			<c:if test="${pCategory eq null }">
				신발
			</c:if>
		</h3>
		<div class="prodcategory">
			<c:if test="${pCategory eq 'cate01cv'}">
				<a href="productList.do?pCategory=cate01ca"><span>캐주얼</span></a>
				<a href="productList.do?pCategory=cate01rn"><span>러닝/스포츠</span></a>
				<a href="productList.do?pCategory=cate01sl"><span>슬리퍼/뮬</span></a>
			</c:if>
			<c:if test="${pCategory eq 'cate01ca'}">
				<a href="productList.do?pCategory=cate01cv"><span>캔버스/스웨이드</span></a>
				<a href="productList.do?pCategory=cate01rn"><span>러닝/스포츠</span></a>
				<a href="productList.do?pCategory=cate01sl"><span>슬리퍼/뮬</span></a>
			</c:if>
			<c:if test="${pCategory eq 'cate01rn'}">
				<a href="productList.do?pCategory=cate01cv"><span>캔버스/스웨이드</span></a>
				<a href="productList.do?pCategory=cate01ca"><span>캐주얼</span></a>
				<a href="productList.do?pCategory=cate01sl"><span>슬리퍼/뮬</span></a>
			</c:if>
			<c:if test="${pCategory eq 'cate01sl'}">
				<a href="productList.do?pCategory=cate01cv"><span>캔버스/스웨이드</span></a>
				<a href="productList.do?pCategory=cate01ca"><span>캐주얼</span></a>
				<a href="productList.do?pCategory=cate01rn"><span>러닝/스포츠</span></a>
			</c:if>
			<c:if test="${pCategory eq null }">
				<a href="productList.do?pCategory=cate01cv"><span>캔버스/스웨이드</span></a>
				<a href="productList.do?pCategory=cate01ca"><span>캐주얼</span></a>
				<a href="productList.do?pCategory=cate01rn"><span>러닝/스포츠</span></a>
				<a href="productList.do?pCategory=cate01sl"><span>슬리퍼/뮬</span></a>
			</c:if>
		</div>
		<div class="pagingOptions">
			<span>
				총 <span>${map.paging.totalCount }</span>개의 상품이 있습니다
			</span>
		    <select name="pagePer">
		        <option value="20">20개씩 보기</option>
		        <option value="40">40개씩 보기</option>
		    </select>
			<select name="orderBy">
				<option value="relDate">신상품순</option>
				<option value="bestSeller">베스트상품순</option>
				<option value="lowPrice">낮은가격순</option>
				<option value="highPrice">높은가격순</option>
			</select>
	    	<div class="clear"></div>
			<hr>
		</div>
		<div class="prodWrap">
			상품설명란
			<hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>
			상품설명란
		</div>
		<div class="paging">
			${map.paging }
		</div>
	</div>
</div>
<div class="clear"></div>
</div>
</div>
