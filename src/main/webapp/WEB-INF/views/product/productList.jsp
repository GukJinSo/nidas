<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="body">
<div class="container-fluid">
<div class="prodListWrap">
	<div class="nav">
		내비바
	</div>
	<div class="prodList">
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
			<c:if test="${pCategory eq 'cate01cs'}">
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
			<c:if test="${pCategory eq 'cate01cs'}">
				캐주얼
			</c:if>
			<c:if test="${pCategory eq 'cate01rn'}">
				러닝/스포츠
			</c:if>
			<c:if test="${pCategory eq 'cate01sl'}">
				슬리퍼/뮬
			</c:if>
			<c:if test="${pCategory eq null }">
				&nbsp;
			</c:if>
		</h3>
		<div class="prodcategory">
			<c:if test="${pCategory eq 'cate01cv'}">
				<a href="productList.do?pCategory=cate01cs">캐주얼</a>
				<a href="productList.do?pCategory=cate01rn">러닝/스포츠</a>
				<a href="productList.do?pCategory=cate01sl">슬리퍼/뮬</a>
			</c:if>
			<c:if test="${pCategory eq 'cate01cs'}">
				<a href="productList.do?pCategory=cate01cv">캔버스/스웨이드</a>
				<a href="productList.do?pCategory=cate01rn">러닝/스포츠</a>
				<a href="productList.do?pCategory=cate01sl">슬리퍼/뮬</a>
			</c:if>
			<c:if test="${pCategory eq 'cate01rn'}">
				<a href="productList.do?pCategory=cate01cv">캔버스/스웨이드</a>
				<a href="productList.do?pCategory=cate01cs">캐주얼</a>
				<a href="productList.do?pCategory=cate01sl">슬리퍼/뮬</a>
			</c:if>
			<c:if test="${pCategory eq 'cate01sl'}">
				<a href="productList.do?pCategory=cate01cv">캔버스/스웨이드</a>
				<a href="productList.do?pCategory=cate01cs">캐주얼</a>
				<a href="productList.do?pCategory=cate01rn">러닝/스포츠</a>
			</c:if>
			<c:if test="${pCategory eq null }">
				<a href="productList.do?pCategory=cate01cv">캔버스/스웨이드</a>
				<a href="productList.do?pCategory=cate01cs">캐주얼</a>
				<a href="productList.do?pCategory=cate01rn">러닝/스포츠</a>
				<a href="productList.do?pCategory=cate01sl">슬리퍼/뮬</a>
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
			<hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>
			상품설명란
		</div>
	</div>
	<div class="clear"></div>
</div>
</div>
</div>
