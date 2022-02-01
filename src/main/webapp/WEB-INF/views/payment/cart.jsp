<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>


function sumPlus(target){
	$(target).prev().val( parseInt($(target).prev().val())+1 );
	
}
function sumMinus(target){
	if( $(target).next().val() != 1 ){ // 1 이하로 내려가는 것 방지
		$(target).next().val( parseInt($(target).next().val())-1 );
	}
}
function cartStockUpdate(t, serial, shoeSize){
	let stock = $(t).parent().prev().children('div input').val();
	console.log(stock);
	console.log(serial);
	$.ajax({
		url:'cartStockUpdate.do',
		method:'post',
		data:{quantity:stock, serial:serial, shoeSize:shoeSize},
		success:function(result){
	        alert('정상적으로 수정되었습니다.');
	        location.href='${pageContext.request.contextPath}/cart.do';
		}, error:function(err){
			console.log('fail');
		}
	});
}

function cartStockDelete(serial, shoeSize){
	$.ajax({
		url:'cartStockDelete.do',
		method:'post',
		data:{serial:serial, shoeSize:shoeSize},
		success:function(result){
	        alert('정상적으로 삭제되었습니다.');
	        location.href='${pageContext.request.contextPath}/cart.do';
		}, error:function(err){
			console.log('fail');
		}
	});
}

function needsChange(value){
	if(value != 'write'){
		$('#needs').attr('readonly', 'true');
		$('#needs').val(value);
	} else {
		$('#needs').val('');
		$('#needs').removeAttr('readonly');
		$('#needs').focus();
		
	}	
}

function callPayment(){
	if ($('input[name=name]').val() == ''){
		alert('이름을 입력하세요');
		return;
	}
	if ($('input[name=tel]').val() == ''){
		alert('연락처를 입력하세요');
		return;
	}
	if ($('input[name=zipcode]').val() == '' || $('input[name=zipcode]').val() == '우편번호'){
		alert('주소를 검색하세요');
		return;
	}
	var totalPrice = $('body > div.body > div > div > div.cartFooter > div:nth-child(3) > div:nth-child(5) > span:nth-child(2)').text().replace(',','');
	if ($('.cartFooter input[name=payment]:checked').length != 0){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp04708803');
		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({
			pg : 'kakao',
			pay_method : 'card',
			merchant_uid : new Date().getTime(),
			name : '주문명 : '+new Date().getTime(),
			amount : totalPrice,
		}, function(rsp) {
			if (rsp.success) {
				var tel = $('.cartFooter input[name=tel]').val();
				var address = $('.cartFooter input[name=address]').val()+' '+$('.cartFooter input[name=addressExtra]').val()+' '+$('.cartFooter input[name=zipcode]').val();
				var name = $('.cartFooter input[name=name]').val();
				var needs = $('.cartFooter input[name=needs]').val();
				
				$.ajax({
					url : "insertOrder.do",
					data:{
						tel:tel,
						address:address,
						name:name,
						needs:needs
					},
					method : "post",
					success : function(data) {
						alert('주문이 완료되었습니다');
					},
					error : function(err) {
						alert(err);
					}
				})
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});
	} else {
		alert('결제수단을 선택하세요.');	
	}
}


function getAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressExtra").focus();
        }
    }).open();
}


function moveToPayment(){

	$('	.cartFooter > div:nth-child(2)').css('display', 'inline-block');
	$('	.cartFooter > div:nth-child(3)').css('display', 'inline-block');
	var right = $('.cartFooter > div:nth-child(3)'); // 스크롤 시 움직일 오른쪽 div
	right.css('top', 0);
	$('	.cartFooter > div:nth-child(4)').css('display', 'inline-block');
	$('	.cartFooter > div:nth-child(5)').css('display', 'block');
	
	
	
	var scrollLocation;
	scrollLocation = document.querySelector(".cartFooter div:first-child").offsetTop;
	window.scrollTo({top:scrollLocation, behavior:'smooth'});
	let ulWidth = Math.floor($('.list-style-none').css('width').replace('px', ''));
	console.log(ulWidth);
	$('.list-style-none label').css('width', (ulWidth/5)-3);
	
	let width1 = $('.cartFooter > div:nth-child(1)').width();
	let width2 = $('.cartFooter > div:nth-child(2)').width();
	let width3 = $('.cartFooter > div:nth-child(3)').width();
	$('.cartFooter > div:nth-child(3)').css( 'left', (width1-(width2+width3))-60 );
}

$(function(){
	$('.cartFooter > div:not(:first-child)').css('display', 'none');	
});


// 얼마만큼 움직일 지 저장하는 변수
var move = 0;
var lastScrollTop = 0;
$(window).scroll(function(event){

	var headerSize = $('.header').height(); // 헤더 높이
	var blankSpace = 20; // 헤더로부터 떨어져 보일 여백
	var left = $('.cartFooter > div:nth-child(2)'); // 스크롤의 왼쪽 div
	var left2 = $('.cartFooter > div:nth-child(4)'); // 스크롤 왼쪽의 두번째 div
	var right = $('.cartFooter > div:nth-child(3)'); // 스크롤 시 움직일 오른쪽 div
	var limitDistance = left.height() + left2.height() - right.height();
	var scrollTop = $(document).scrollTop(); // 상단으로부터 스크롤 된 거리
	
	var st = $(this).scrollTop(); // 스크롤의 방향을 알아내기 위한 변수
	if (st > lastScrollTop){
		// 스크롤이 downside
		// 스크롤이 시작될 위치를 지났으면
		if(scrollTop >= right.offset().top - (headerSize + blankSpace) ){
			// 움직일 수 있는 여백 값은 좌측편 div 높이 - 우측편 div 높이를 하면 산출 가능
			// 움직일 수 있는 여백 값이 남아 있다면
			if(move <= limitDistance ){
				move = scrollTop - (left.offset().top - (headerSize + blankSpace));
				// move가 319이고 limitDistance가 320인 경우 위 if는 통과 가능한 경우가 있다.
				// 따라서 첫 if문 안에서 move를 계산하여 320을 넘는 경우 move는 limitDistance의 최대값을 넣어준다.
				if (move > limitDistance){
					move = limitDistance;
				}
				console.log("downside :"+move);
				right.css('top', move);
			}
	   }
	} else {
		// 스크롤이 upside
		// 스크롤이 시작될 위치를 지났으면
		if(scrollTop <= right.offset().top - (headerSize + blankSpace) ){
			// 움직일 수 있는 여백 값은 좌측편 div 높이 - 우측편 div 높이를 하면 산출 가능
			// 움직일 수 있는 여백 값이 남아 있다면
			if(move > 0){
				move = scrollTop - (left.offset().top - (headerSize + blankSpace));
				// 사용자가 화면을 확 올리는 경우를 대비한 코드
				if (move < 0){
					move = 0;
				}
				console.log("downside :"+move);
				right.css('top', move);
			}
	   }
	}
	lastScrollTop = st;
});


</script>


<div class="body">
<div class="container-fluid">
<div class="cartWrap">
	<div class="cartHeader">
		<h2>장바구니</h2>
		
		<!-- 
		<span class="cartProgress">
			<span class="cartInProgress"> 장바구니 > </span>주문서 작성/결제 > 주문 완료
		</span>
		 -->
		<div class="clear"></div>
		<div class="cartLoginGroups">
			<button class="" onclick="location.href='${pageContext.request.contextPath}/loginForm.do'">로그인
			</button>
			<button class="" onclick="location.href='${pageContext.request.contextPath}/registerForm.do'">회원가입
			</button>
		</div>
		<div class="clear"></div>
		<span style="font-size:18px; font-weight:800;">
			배송 상품(${fn:length(prodInfo) })
		</span>
	</div>
	<div class="cartBody">
		<div class="lightgreyBackground" style="border-bottom: 1px solid #CECECE">
		</div>
		<div class="cartProdList">
			<table>
			<c:if test="${fn:length(prodInfo) == 0 }">
				<span class="noProdList">등록된 상품이 없습니다</span>
			</c:if>
			<c:forEach var="vo" items="${prodInfo }">
				<tr>
					<td>
						<div>
							<img src="${pageContext.request.contextPath}/resources/images/product/${vo.filePath }">
						</div>
						<div>
							<p>
								${vo.bnameKor }
							</p>
							<p>
								${vo.pnameEng }
							</p>
							<p>
								${vo.color }
							</p>
							<p>
								${vo.shoeSize }
								<input type="hidden" value="s${vo.shoeSize }" id="${vo.shoeSize }">
							</p>
						</div>
						<div class="clear"></div>
					</td>
					<td>
						<div class="border-grey-right padding-5all">
							<button onclick="sumMinus(this)">-</button>
							<input type="number" value="${vo.quantity }">
							<button onclick="sumPlus(this)">+</button>
						</div>
						<div>
							<button onclick="cartStockUpdate(this, '${vo.serial}', '${vo.shoeSize }')">변경
							</button>
						</div>
					</td>
					<td>
						<c:if test="${vo.disPrice != vo.price }">
							<p style="font-size:14px; color:#CECECE; text-decoration: line-through; padding:0px 10px">
								<span><fmt:formatNumber value="${vo.price}" type="number"/></span>원
							</p>
							<p>
								<span style="color:red">
								<fmt:formatNumber value="${vo.disPrice}" type="number"/></span>원
							</p>
						</c:if>
						<c:if test="${vo.disPrice == vo.price }">
							<p>
								<span style="color:red">
								<fmt:formatNumber value="${vo.disPrice}" type="number"/></span>원
							</p>
						</c:if>
					</td>
					<td>
						<button onclick="cartStockDelete('${vo.serial }','${vo.shoeSize }')"><i class="fa fa-trash" aria-hidden="true"></i>삭제</button>
					</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div class="explane">
			비 로그인 상태에서 장바구니에 담은 상품은 저장되지 않습니다.
			<br>
			수량 변경 후 변경 버튼을 눌러야 정상적으로 결제 항목이 변경됩니다.
		</div>
		<div class="cartTotalPrice">
			<table>
				<tr>
					<td>
						<div>
							<div>
								주문금액
							</div>
							<div>
								<c:set var="b_sum" value="0"></c:set>
								<c:forEach items="${prodInfo }" var="vo">
									<c:set var="b_sum" value="${b_sum + vo.price*vo.quantity }"></c:set>
								</c:forEach>
								<fmt:formatNumber value="${b_sum}" type="number"/>
								<span class="won"></span>
							</div>
						</div>
					</td>
					<td class="icon-minus">
						<div>
							<div>
								총 할인금액
							</div>
							<div>
								<c:set var="d_sum" value="0"></c:set>
								<c:forEach items="${prodInfo }" var="vo">
									<c:if test="${vo.disRate ne null }">
										<c:set var="d_sum" value="${d_sum + (vo.price-vo.disPrice)*vo.quantity }"></c:set>
									</c:if>
								</c:forEach>
								<fmt:formatNumber value="${d_sum}" type="number"/>
								<span class="won"></span>
							</div>
						</div>
					</td>
					<td class="icon-result">
						<div>
							<div>
								결제예정금액
							</div>
							<div>
								<c:set var="a_sum" value="0"></c:set>
								<c:forEach items="${prodInfo }" var="vo">
									<c:set var="a_sum" value="${b_sum - d_sum }"></c:set>
								</c:forEach>
								<span style="color:red;"><fmt:formatNumber value="${a_sum}" type="number"/></span>
								<span class="won"></span>
							</div>
						</div>					
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<c:if test="${fn:length(prodInfo) != 0 }">
	<div class="cartFooter">
		<div>
			<button onclick="moveToPayment()">주문하기</button>
		</div>
		<div style="display:none;">
			<span style="font-size:18px; font-weight:800;">주문정보</span>
			<table>
				<tr>
					<th>배송지 선택</th>
					<td>
						<sec:authorize access="isAnonymous()">
							<input type="radio" checked="checked" name="isSame">신규 입력
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<input type="radio" checked="checked" name="isSame">주문자와 동일
							<input type="radio" name="isSame">신규 입력
						</sec:authorize>
					</td>
				</tr>
				<tr>
					<th>이름<span class="required"></span></th>
					<td>
						<input type="text" name="name" style="width:300px">
					</td>
				</tr>
				
				<tr>
					<th>휴대폰 번호<span class="required"></span></th>
					<td class="cartTels">
						<input type="text" name="tel" style="width:300px"> 
					</td>
				</tr>
				<tr>
					<th>주소<span class="required"></span></th>
					<td class="cartAddress">
						<div>
							<input type="text" id="zipcode" name="zipcode" style="width:185px"  value="우편번호" readonly="readonly"><button onclick="getAddress()" class="findAddrBtn">우편번호 찾기</button>
						</div>
						<div>
							<input type="text" id="address" name="address" readonly>
						</div>
						<div>
							<input type="text" id="addressExtra" name="addressExtra">
						</div>
					</td>
				</tr>
				<tr>
					<th>배송 시 요청사항</th>
					<td class="cartNeeds">
						<div>
							<select name="needs" onchange="needsChange(this.value)">
								<option>배송 시 요청사항을 선택하세요.</option>
								<option>배송 전에 연락주세요.</option>
								<option>부재 시 문 앞에 놓아주세요.</option>
								<option>부재 시 경비실에 맡겨주세요.</option>
								<option>직접 수령하겠습니다.</option>
								<option value="write">직접 입력</option>
							</select>
						</div>
						<div>
							<input type="text" id="needs" name="needs">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div style="display:none;">
			<div style="font-size:18px; font-weight:800;">
				결제 정보
			</div>
			<div>
				<span>총 정상가</span>
				
				<span><fmt:formatNumber value="${b_sum}" type="number"/><span class="won"></span></span>
			</div>
			<div>
				<span>총 배송비</span>
				<span>0<span class="won"></span></span>
			</div>
			<div>
				<span>총 할인금액</span>
				<span><fmt:formatNumber value="${d_sum }" type="number"/><span class="won"></span></span>
			</div>
			<div>
				<span>총 결제 예정금액</span>
				<span style="color:red"><fmt:formatNumber value="${a_sum }" type="number"/><span class="won red"></span></span>
			</div>
			<div>
				<button onclick="callPayment()">결제하기</button>
			</div>
		</div>
		<div style="display:none;">
			<div style="font-size:18px; font-weight:800;">
				결제 수단 선택
			</div>
			<div>
				<ul class="list-style-none">
					<li>
						<input type="radio" name="payment" id="kakaopay" style="display:none;">
						<label for="kakaopay">
							카카오페이
						</label>
					</li>
				</ul>
				<div>
					상품 품절로 인해 주문 후 취소될 수 있습니다. 품절 취소 시 결제하신 수단으로 자동 환불됩니다.
					<br>※ 결제하신 수단으로 환불이 불가능할 경우 별도 안내드립니다.
				</div>
			</div>
		</div>
		<div class="clear" style="display:none;"></div>
	</div>
	</c:if>
</div>
</div>
</div>