<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		method:'post',
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
		method:'post',
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

var scrollLocation;
$(function(){ 
	scrollLocation = document.querySelector(".cartFooter div:first-child").offsetTop;
	window.scrollTo({top:scrollLocation, behavior:'smooth'});
	let ulWidth = Math.floor($('.list-style-none').css('width').replace('px', ''));
	console.log(ulWidth);
	$('.list-style-none label').css('width', (ulWidth/5)-3);
});

window.addEventListener('scroll', () => {
	if(document.documentElement.scrollTop > scrollLocation){
		let target = $('.cartFooter > div:nth-child(3)');
		target.css('position','fixed');
		target.css('top', '150px');
		target.css('right','200px');
		let width = $('.cartFooter > div:nth-child(1)').width();
		target.css('width',width*0.35);
		console.log('경계경보!!');
	}
})

</script>


<div class="body">
<div class="container-fluid">
<div class="cartWrap">
	<div class="cartHeader">
		<h2>장바구니</h2>
		<span class="cartProgress">
			<span class="cartInProgress"> 장바구니 > </span>주문서 작성/결제 > 주문 완료
		</span>
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
									<c:set var="b_sum" value="${b_sum + vo.price }"></c:set>
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
										<c:set var="d_sum" value="${d_sum + vo.disPrice }"></c:set>
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
	<div class="cartFooter">
		<div>
			<button onclick="">주문하기</button>
		</div>
		<div>
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
						<input type="text" name="id" style="width:300px">
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
					<td  class="cartAddress">
						<div>
							<input type="text" id="zipcode" name="id" style="width:185px"  value="우편번호" readonly="readonly"><button onclick="getAddress()" class="findAddrBtn">우편번호 찾기</button>
						</div>
						<div>
							<input type="text" id="address" name="id" readonly>
						</div>
						<div>
							<input type="text" id="addressExtra" name="id">
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
							<input type="text" id="needs">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div>
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
				<button>결제하기</button>
			</div>
		</div>
		<div>
			<div style="font-size:18px; font-weight:800;">
				결제 수단 선택
			</div>
			<div>
				<ul class="list-style-none">
					<li>
						<input type="radio" id="kakaopay" style="display:none;">
						<label for="kakaopay">
							카카오페이
						</label>
					</li>
					<li>
						<label for="phone">
							휴대폰결제
						</label>
					</li>
										<li>
						<label for="phone">
							휴대폰결제
						</label>
					</li>
										<li>
						<label for="phone">
							휴대폰결제
						</label>
					</li>
										<li>
						<label for="phone">
							휴대폰결제
						</label>
					</li>
				</ul>
				<div>
					상품 품절로 인해 주문 후 취소될 수 있습니다. 품절 취소 시 결제하신 수단으로 자동 환불됩니다.
					<br>※ 결제하신 수단으로 환불이 불가능할 경우 별도 안내드립니다.
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
</div>