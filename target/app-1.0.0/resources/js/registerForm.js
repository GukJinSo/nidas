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