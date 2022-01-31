<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script>

	function addCart(){
		
		var cartList = [];
		$.each( $('input[type="hidden"]'), function(index, e){
				var obj = new Object();
				obj.serial = '${prod.details.serial }';
				obj.shoeSize = e.id;
				obj.quantity = e.value;
				cartList.push(obj);
			});
		console.log(cartList);
		$.ajax({
			url:'addCart.do',
			method:'post',
			contentType: "application/json; charset=utf-8",
			dataType: 'json',
			data:JSON.stringify({cartList}),
			success:function(result){
				console.log('added data : '+result);
		        if (confirm("장바구니에 등록되었습니다.\n장바구니 페이지로 이동할까요?") == true) {
		        	location.href = 'cart.do';
		        } else {
		        }
			}, error:function(err){
				console.log('fail');
			}
		});
		

		
	}



	function selectStock(target){
		var size = target.innerText;
		var addHtml = '';
		
		// 사이즈 버튼 클릭마다 div 생성하거나, 이미 있는 경우 갯수만 추가
		if($('.addedStock.s'+size+'Div').length == 0){
			addHtml += '<div class="addedStock '+'s'+size+'Div">';
				addHtml += '<div class="size">'+size+'</div>';
				addHtml += '<div class="border-grey-right padding-5all">';
					addHtml += '<button onclick="sumMinus(this)">-</button>';
					addHtml += '<input type="number" value=1 onchange="sumChange(this)">';
					addHtml += '<button onclick="sumPlus(this)">+</button>';
					addHtml += '<input type="hidden" id="s'+size+'"value="1">';
				addHtml += '</div>';
		    	addHtml += '<div class="sum"></div>';
		    addHtml += '</div>';
		    $('.addedStockWrap').append(addHtml);
		    $('.addedStock.s'+size+'Div input').trigger('onchange');
		} else {
			$('.addedStock.s'+size+'Div input').val( parseInt($('.addedStock.s'+size+'Div input').val())+1 );
			$('.addedStock.s'+size+'Div input').trigger('onchange');
		}
	}
	
	
	function sumChange(target){
		var times = $(target).val();
		var totalPrice = 0;
		$(target).parent().siblings('.sum').html(addComma('${prod.details.disPrice }'*times)+'원');
		$(target).next().next().val(times);
		$.each( $('.addedStockWrap .sum'), function(index, span){
				totalPrice += removeKorSc(span.innerText);
			});
		var comPrice = addComma(totalPrice);
		$('.sums').text(comPrice);
	}
	
	function sumPlus(target){
		$(target).prev().val( parseInt($(target).prev().val())+1 );
		$(target).prev().trigger('onchange');
	}
	function sumMinus(target){
		if( $(target).next().val() != 1 ){ // 1 이하로 내려가는 것 방지
			$(target).next().val( parseInt($(target).next().val())-1 );
			$(target).next().trigger('onchange');
		} else {
			sumChange(target); // target을 찾을 수 없기에 sumChange의 times는 0이 됨. 결국 0을 곱하게 되어 가격이 사라짐 
			$(target).closest('.addedStock').remove();
		}
	}
</script>


<div class="body">
<div class="container-fluid">
<div class="prodDetailWrap">
		<div class="path">
			<a href="${pageContext.request.contextPath}/main.do"><i class="fas fa-home"></i> HOME</a>
			>
			<a href="${pageContext.request.contextPath}/productList.do">신발</a>
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
					<img src="${pageContext.request.contextPath}/resources/images/product/${prod.details.filePath }">
				</div>
				<div class="sliders">
					슬라이더
				</div>
			</div>
			<div class="detailsRight">
				<div class="detailsHeader">
					<div class="brand">
						<a href="${pageContext.request.contextPath}/productList.do?search=${prod.details.bnameKor }">${prod.details.bnameKor } ></a>
					</div>
					<div class="pnameKor">
						${prod.details.pnameKor }
					</div>
					<div class="pnameEng">
						${prod.details.pnameEng }
					</div>
					<div class="codes">
						<div class="serial">
							상품코드 : ${prod.details.serial }
						</div>
					</div>
					<div class="price">
						<c:if test="${prod.details.disRate != 0 }">
							<span class="prodNormalPrice faint"><fmt:formatNumber value="${prod.details.price }" type="number"/>원</span>
							<span class="prodSalePrice lastPrice"><fmt:formatNumber value="${prod.details.disPrice }"/>원</span>
							<span class="prodDisRate">[<fmt:formatNumber value="${prod.details.disRate*100 }" type="number"/>%]</span>
						</c:if>
						<c:if test="${prod.details.disRate == 0 }">
							<span class="prodNormalPrice lastPrice"><fmt:formatNumber value="${prod.details.disPrice }" type="number"/>원</span>
						</c:if>
					</div>
					<div class="tableDiv">
						<table>
						<c:if test="${fn:length(prod.styleCodes) != 0 }">
							<tr>
								<th style="word-break:break-all" width="29%">스타일 컬러</th>
								<th style="word-break:break-all" width="70%">
									<c:forEach items="${prod.styleCodes }" var="vo">
									<a href="${pageContext.request.contextPath}/productDetail.do?serial=${vo.serial}" title="${vo.filePath }">
										<img src="${pageContext.request.contextPath}/resources/images/product/${vo.filePath }">
									</a>
									</c:forEach>
								</th>
							</tr>
						</c:if>
							<tr>
								<td style="word-break:break-all; padding-top: 10px;" width="29%" >색상 코드</td>
								<td style="word-break:break-all; padding-top: 10px;" width="70%">${prod.details.color }</td>
							</tr>
							<tr>
								<td style="word-break:break-all">배송 방법</td>
								<td style="word-break:break-all">일반 배송</td>
							</tr>
							<tr>
								<td style="word-break:break-all; vertical-align: top;">사이즈 재고 / 선택</td>
								<td style="word-break:break-all; line-height: 2em;">
									<c:forEach items="${prod.stocks }" var="sizeStocks" begin="">
										<c:if test="${sizeStocks.value != 0}">
											<button type="button" id="${sizeStocks.key }" onclick="selectStock(this)">${sizeStocks.key }</button>
										</c:if>
									</c:forEach>
								</td>
							</tr>
						</table>
					</div>
					<div class="addedStockWrap"></div>
					<div class="totalPrice flex">
						<span>총 결제 가격</span>
						<span class="sums">0</span>
					</div>
					<div class="totalPriceBtns flex">
						<button class="" onclick="addCart()">장바구니
						</button>
						<button class="">바로구매
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
</div>
</div>
</div>
