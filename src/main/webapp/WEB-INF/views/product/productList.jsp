<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	var nowPage;
	
	function addComma(value){
		return Number(value).toLocaleString();
	}
	function filterShow(target, action, clickedBtn){
		if (action == 'show'){
			$('.'+target).removeClass('hide');
			$(clickedBtn).children().first().addClass('hide');
			$(clickedBtn).children().eq(1).removeClass('hide');
			$(clickedBtn).attr("onclick", "filterShow("+"'"+target+"','hide', this);");
			$(clickedBtn).parent().css('border-bottom', 'none');
			$(clickedBtn).parent().next().css('border-bottom', '1px solid #CECECE');
		} else {
			$('.'+target).addClass('hide');
			$(clickedBtn).children().first().removeClass('hide');
			$(clickedBtn).children().eq(1).addClass('hide');
			$(clickedBtn).attr("onclick", "filterShow("+"'"+target+"','show', this);");
			$(clickedBtn).parent().next().css('border-bottom', 'none');
			$(clickedBtn).parent().css('border-bottom', '1px solid #CECECE');
		}
	}
	
	function filterSelectedReset(){
		$.each ( $('.filterWrap input[type="checkbox"]'), function(i, e){
			e.checked = false;
		});
		$('#input-left').val('10000');
		$('#input-left').css('left', '0%');
		$('.thumb.left').css('left', '0%');
		$('#input-right').val('500000');
		$('#input-right').css('right', '0%');
		$('.thumb.right').css('right', '0%');
		$('.range').css('left', '0%');
		$('.sliderLeftPrice').text('10,000');
		$('.sliderRightPrice').text('500,000');
		$('#filterSearchBar').val('');
		$('#filterSearchBar').attr('placeholder', '검색어');
		
	}
	
	function drawProdList(prodList){
		$('.prodWrap table').html('');
		var addHtml = '';
		addHtml += '<tr>';
		for(var i = 0; i < prodList.length; i++){
			addHtml += '<td>';
				addHtml += '<div class="prod">';
					addHtml += '<a href="productDetail.do?serial='+prodList[i].serial+'">';
						addHtml += '<img src="resources/images/shoes1.jpg">';
						addHtml += '<div class="prodText">';
							addHtml += '<div class="prodBrand">'+prodList[i].bnameKor+'</div>';
							addHtml += '<div class="prodName">'+prodList[i].pnameKor+'</div>';
							addHtml += '<div class="prodPrice">';
								if ( prodList[i].disRate != null ){
									addHtml += '<span class="prodNormalPrice faint">'+addComma(prodList[i].price)+'원</span>';
									addHtml += '&nbsp;<span class="prodSalePrice">'+addComma(prodList[i].disPrice)+'원</span>';
									addHtml += '<span class="prodDisRate">['+prodList[i].disRate*100+'%]</span>'
								} else {
									addHtml += '<span class="prodNormalPrice">'+addComma(prodList[i].price)+'원</span>';
								}
							addHtml += '</div>';
						addHtml += '</div>';
						//addHtml += '<img src="resources/images/'+data.prodList[i].img+'">';
					addHtml += '</a>';
				addHtml += '</div>';
			addHtml += '</td>';
			if ((i+1) % 4 == 0 ){ // 4건 마다 개행
				addHtml += '</tr><tr>';
			}
		}
		addHtml += '</tr>';
		$('.prodWrap table').append(addHtml);
	}
	
	function drawPaging(paging){
		$('.prodCount').text(paging.totalCount);
		$('.paging').html('');
		
		if (paging.totalCount == 0){ // 가져올 상품 없으면 실행하지 않음
			$('.prodWrap').append('<span class="noProdList">등록된 상품이 없습니다</span>');
			return false;
		}
		
		var addHtml = '';
		addHtml += '<a href="javascript:getProdList('+paging.firstPageNo+')" class="first pagingFirstBtn">first</a>';
		addHtml += '<a href="javascript:getProdList('+paging.prevPageNo+')" class="prev pagingPrevBtn">←prev</a>';
		addHtml += '<span>';
		for(i = paging.startPageNo; i <= paging.endPageNo; i++){
			if (nowPage == paging.pageNo){
				addHtml += '<a href="javascript:" class="active">'+i+'</a>';
			} else {
				addHtml += '<a href="javascript:getProdList('+i+')">'+i+'</a>';
			} 
		}
		addHtml += '</span>';
		addHtml += '<a href="javascript:getProdList('+paging.nextPageNo+')" class="next pagingNextBtn">next→</a>';
		addHtml += '<a href="javascript:getProdList('+paging.finalPageNo+')" class="next pagingFinalBtn">last</a>';
		$('.paging').append(addHtml);
		
	}
	
	function getProdList(page){
		nowPage = page;
		var param = {};
		var priceRange = [];
		var brands = [];
		var colors = [];
		var sizes = [];
		$.each ( $('.PriceFilterElement input[type="range"]'), function(index, value){
			priceRange.push(value.value);
			});
		$.each ( $('.sizeFilterElement input[type="checkbox"]:checked'), function(index, value){
			sizes.push(value.value);
			});
		$.each ( $('.brandFilterElement input[type="checkbox"]:checked'), function(index, value){
			brands.push(value.value);
			});
		$.each ( $('.colorFilterElement input[type="checkbox"]:checked'), function(index, value){
			colors.push(value.value);
			});
		param = {
					page:page,
					orderBy:$("select[name='orderBy'] option:selected").val(),
					pagePer:$("select[name='pagePer'] option:selected").val(),
					pCategory:'${pCategory}',
					search:$('#filterSearchBar').val(),
					sizes:sizes,
					colors:colors,
					brands:brands,
					priceRange:priceRange
				}
		$.ajax({
			url:'productListAjax.do',
			data:param,
			success:function(data){
				console.log(data);
				drawProdList(data.prodList);
				drawPaging(data.paging);
			},
			error:function(err){
				console.log(err);
			}
		});
	}	
	
	$(function() {
		var nowPage = 1;
		
		// 사용자가 header에서 검색해서 들어온 것이라면 필터에 검색어 입력값을 넣어주고 드랍다운 메뉴 열어줌
		if($('#headerSearchKeyword').val() != ''){
			$('#filterSearchBar').val( $('#headerSearchKeyword').val() );
			filterShow('search', 'show', $('.searchShowBtn'));
		}
			
		getProdList(1);
		
	});
	

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
				<c:forEach items="${brandFilters }" var="vo">
					<div class="brandFilterElement filterElement">
						<label for="${vo.brand }Label"><input type="checkbox" id="${vo.brand }Label"value="${vo.brand }"><span>${vo.brand }</span></label>
					</div>
				</c:forEach>
			</div>
			<div class="filter">사이즈
				<button class="filterShowBtn" onclick="filterShow('sizes', 'show', this)">
					<i class="fas fa-chevron-down"></i>
					<i class="fas fa-chevron-up hide"></i>
				</button>
			</div>
			<div class="innFilter sizes hide textCenter">
				<div class="sizeFilterElement filterElement">
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
				</div>
			</div>
			<div class="filter">컬러
				<button class="filterShowBtn" onclick="filterShow('colors', 'show', this)">
					<i class="fas fa-chevron-down"></i>
					<i class="fas fa-chevron-up hide"></i>
				</button>
			</div>
			<div class="innFilter colors hide textCenter">
				<div class="colorFilterElement filterElement textLeft">
					<label for="cBLK" style="background:black;"><input type="checkbox" value="BLK" id="cBLK"><span></span></label>
					<label for="cWHT" style="background:white;"><input type="checkbox" value="WHT" id="cWHT"><span></span></label>
					<label for="cRED" style="background:red;"><input type="checkbox" value="RED" id="cRED"><span></span></label>
					<label for="cBLU" style="background:blue;"><input type="checkbox" value="BLU" id="cBLU"><span></span></label>
					<label for="cYEL" style="background:yellow;"><input type="checkbox" value="YEL" id="cYEL"><span></span></label>
					<label for="cGRN" style="background:green;"><input type="checkbox" value="GRN" id="cGRN"><span></span></label>
					<label for="cPNK" style="background:pink;"><input type="checkbox" value="PNK" id="cPNK"><span></span></label>
					<label for="cGRY" style="background:grey;"><input type="checkbox" value="GRY" id="cGRY"><span></span></label>
				</div>
			</div>
	
			
			<div class="filter">검색어
				<button class="filterShowBtn searchShowBtn" onclick="filterShow('search', 'show', this)">
					<i class="fas fa-chevron-down"></i>
					<i class="fas fa-chevron-up hide"></i>
				</button>
			</div>
			<div class="innFilter search hide">
				<div class="filterElement">
					<input type="text" id="filterSearchBar" class="hSearchBar smallSearchBar fullPerWidth" placeholder="검색어" onfocus="this.placeholder=''">
				</div>
			</div>
			<div class="filter">가격
				<button class="filterShowBtn" onclick="filterShow('priceRange', 'show', this)">
					<i class="fas fa-chevron-down"></i>
					<i class="fas fa-chevron-up hide"></i>
				</button>
			</div>
			<div class="innFilter priceRange hide">
				<div class="PriceFilterElement filterElement ">
					<div class="middle">
					<div class="multi-range-slider">
						<!-- 진짜 슬라이더 -->
						<input type="range" id="input-left" min="10000" max="500000" value="10000" />
						<input type="range" id="input-right" min="10000" max="500000" value="500000" />
						<!-- 커스텀 슬라이더 --> 
						<div class="slider"> 
							<div class="track"></div>
							<div class="range"></div>
							<div class="thumb left">
								<div class="inThumb"></div>
							</div>
							<div class="thumb right">
								<div class="inThumb"></div>
							</div>
						</div>
						<div class="sliderPrice">
							<span class="sliderLeftPrice">10,000</span>
							<span> ~ </span>
							<span class="sliderRightPrice">500,000</span>
							<span style="font-size:13px;">원</span>
						</div>
						
					</div>
					</div>
				</div>
			</div>
			
		</div>
		<div class="filterBtns">
			<button type="button" class="btn btn-light filterBtn" onclick="filterSelectedReset()">초기화</button>
			<button type="button" class="btn btn-dark filterBtn" onclick="getProdList('1')">검색</button>
		</div>
	</div>
	<div class="prodList eqHeight">
		<div class="path">
			<a href="main.do"><i class="fas fa-home"></i> HOME</a>
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
				총 <span class="prodCount"></span>개의 상품이 있습니다
			</span>
		    <select name="pagePer" onchange="filterSelectedReset(); getProdList('1');">
		        <option value="20" selected="selected">20개씩 보기</option>
		        <option value="40">40개씩 보기</option>
		    </select>
			<select name="orderBy" onchange="filterSelectedReset(); getProdList('1');">
				<option value="relDate" selected="selected">신상품순</option>
				<option value="lowPrice">낮은가격순</option>
				<option value="highPrice">높은가격순</option>
			</select>
	    	<div class="clear"></div>
		</div>
		<div class="prodWrap">
			<table>
			</table>
		</div>
		<div class="paging textCenter">
		</div>
	</div>
</div>
<div class="clear"></div>
<input type="hidden" value="${search }" id="headerSearchKeyword">
</div>
</div>


<script src="resources/js/priceSlider.js"></script>