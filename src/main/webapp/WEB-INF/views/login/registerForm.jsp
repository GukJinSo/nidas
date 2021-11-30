<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.notice{
		color: red;
	}

</style>
<script>

// 클라이언트 유효성 검사
// 서버 단에서도 유효성 검사를 진행할 것이다
var isIdChecked = false;
var isPwChecked = false;
var isHpChecked = false;

// 아이디 중복 검사
function idExistCheck(){
	if ( frm.id.value.length >= 6 ){ // 아이디 6글자 이상
		$.ajax({
			url : 'idExistCheck.do',
			data : { id : $('#id').val() },
			type : 'post',
			success : function(result){
				let idText;
				if (result){
					idText = '사용 가능한 아이디입니다';
					isIdChecked = true;
				} else {
					idText = '이미 사용중인 아이디입니다';
					isIdChecked = false;
				}
				$('#idNotice').text(idText);
			},
			error : function(err) {
				console.log(err);
				console.log("idExistCheck err");
			}
		});
	} else {
		$('#idNotice').text('아이디는 최소 6글자 이상입니다');
	}
}

// 비밀번호 일치 검사, 정규식 검사
function pwCheck(){
	const pwPattern = new RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$");
	let pwText;	
	let pw = frm.password.value;
	if ( pw.length >= 8 ) {
		if ( pw == frm.passwordAgain.value ) {
			if ( pwPattern.test(pw) ){
				pwText = '비밀번호가 일치합니다';
				isPwChecked = true;
			} else {
				pwText = '비밀번호는 8글자 이상 20글자 이하, 숫자, 대소문자, 특수문자를 모두 포함해야 합니다';
				isPwChecked = false;
			}
		} else {
			pwText = '비밀번호가 일치하지 않습니다';
			isPwChecked = false;
		}
	} else {
		pwText = '비밀번호는 8글자 이상 20글자 이하, 숫자, 대소문자, 특수문자를 모두 포함해야 합니다';
		isPwChecked = false;
	}
	$('#pwNotice').text(pwText);
}

// 핸드폰 인증
function sendSMS() {
	$.ajax({
		url : 'sendSMS.do',
		data : {
			hp : $('#hp').val(),
		},
		type : 'post',
		success : function(result) {
			$('#hpNotice').html('인증번호가 전송되었습니다');
			$('#hpCheckBtn').html('인증번호 재전송');
		},
		error : function(err) {
			console.log(err);
			console.log("휴대폰 인증 에러");
		}
	})
}

function checkSMS(){
	let hpCode = frm.hpCode.value;
	if ( hpCode.length == 4 ){
		$.ajax({
			url : 'checkSMS.do',
			data : {
				hp : $('#hp').val(),
				hpCode : hpCode
			},
			type : 'post',
			success : function(result) {
				let hpText;
				if (result){
					hpText = '인증되었습니다';
					isHpChecked = true;
				} else {
					hpText = '인증번호가 틀렸거나 유효시간이 지났습니다';
					isHpChecked = false;
				}
				$('#hpNotice').text(hpText);
			},
			error : function(err) {
				console.log(err);
				console.log("휴대폰 인증 에러");
			}
		})
	}
}


function frmSubmit(){
	if ( frm.name.value == "" || frm.name.value.length < 2 ){
		frm.name.focus();
		$('#nameNotice').text('이름은 2자 이상 입력하세요');
		return;
	}
	
	if ( frm.id.value == "" || isIdChecked == false ){
		frm.id.focus();
		let idText;
		idText = (frm.id.value == "") ? '아이디를 입력하세요' : '';
		idText = (isIdChecked == false) ? '아이디를 중복 체크하세요' : '';
		$('#idNotice').text(idText);
		return;
	}
	if ( frm.password.value == "" || frm.passwordAgain.value == "" || isPwChecked == false ){
		frm.passwordAgain.focus();
		let pwText;
		pwText = (frm.password.value == "" || frm.passwordAgain.value == "") ? '비밀번호를 입력하세요' : '';
		pwText = (isPwChecked == false) ? '비밀번호가 일치하지 않습니다' : '';
		$('#pwNotice').text(pwText);
		return;
	}
	if ( frm.hp.value == "" || isHpChecked == false ){
		frm.hp.focus();
		let hpText;
		hpText = (frm.hp.value == "") ? '번호를 입력하세요' : '';
		hpText = (isHpChecked == false ) ? '연락처 SMS 인증이 필요합니다' : '';
		$('#hpNotice').text(hpText);
		return;
	}
	if ( frm.gender.value == "" ){
		frm.gender[0].focus();
		$('#genderNotice').text('성별을 선택하세요');
		return;
	}
	frm.submit();
}

</script>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
        	<div class="title" align="center">
	        	<h4 class="title">나이다스 멤버십 회원가입</h4>
    	    	<p class="description">멤버가 되어 나이다스가 제공하는 최고의 제품과 혜택을 만나보세요</p>
        	</div>
        	
        	<div class="form">
        		<form action="memberInsert.do" method="post" id="frm">
					<table class="table">
						<tbody>
							<tr>
								<th>이름</th>
								<td colspan="2">
									<input type="text" id="name" name="name" maxlength="6">
									<p id="nameNotice" class="notice"></p>
								</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td colspan="2">
									<input type="text" id="id" name="id" maxlength="15" onkeyup="idExistCheck();">
									<p id="idNotice" class="notice"></p>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td colspan="2">
									<input type="password" id="password" name="password" maxlength="20" onkeyup="pwCheck()">
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td colspan="2">
									<input type="password" id="passwordAgain" name="passwordAgain" maxlength="20" onkeyup="pwCheck()">
									<p id="pwNotice" class="notice"></p>
								</td>
							</tr>
							<tr>
								<th>핸드폰 번호</th>
								<td>
									<input type="text" id="hp" name="hp" maxlength="11"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									<input type="text" id="hpCode" name="hpCode" maxlength="4" placeholder="인증번호 입력란" onkeyup="checkSMS()">
									<p id="hpNotice" class="notice"></p>
								</td>
								<td>
									<button type="button" id="sendSMSBtn"class="btn btn-secondary" onclick="sendSMS()">인증번호 전송</button>
								</td>
							</tr>
							
							<tr>
								<th>성별</th>
								<td>
									<input type="radio" name="gender" value="m"> 남자 
									<input type="radio" name="gender" value="w"> 여자
									<p id="genderNotice" class="notice"></p>
								</td>
							</tr>
						</tbody>
					</table>
					<button type="button" class="btn btn-secondary" id="registerBtn" onclick="frmSubmit()">회원가입</button>
				</form>
        	</div>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
</body>