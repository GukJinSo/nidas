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

// 핸드폰 인증
function hpCheck() {
	$.ajax({
		url : 'sendSMS.do',
		data : {
			hp : $('#hp').val(),
		},
		type : 'post',
		success : function(data) {
			$('#hpNotice').html('인증번호가 전송되었습니다');
			$('#hpCheckBtn').html('인증번호 재전송');
			$('#isHpChecked').value('true');
		},
		error : function(err) {
			console.log(err);
			console.log("휴대폰 인증 에러");
		}
	})
}

function frmSubmit(){
	if (isHpChecked) {
		frm.submit();
	}
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
								</td>
								<td></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td colspan="2">
									<input type="text" id="id" name="id" maxlength="15">
								</td>
								<td></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td colspan="2">
									<input type="password" id="password" name="password" maxlength="20">
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td colspan="2">
									<input type="password" id="passwordAgain" name="passwordAgain" maxlength="20">
								</td>
							</tr>
							<tr>
								<th>핸드폰 번호</th>
								<td>
									<input type="text" id="hp" name="hp" maxlength="11">
									<input type="text" id="hpCode" name="hpCode" maxlength="4" placeholder="인증번호 입력란">
									<p id="hpNotice" class="notice"></p>
								</td>
								<td>
									<button type="button" id="hpCheckBtn"class="btn btn-secondary" onclick="hpCheck()">인증번호 전송</button>
									<input type="hidden" value="false" id="isHpChecked">
								</td>
							</tr>
							
							<tr>
								<th>성별</th>
								<td>
									<input type="radio" name="gender" value="m"> 남자 
									<input type="radio" name="gender" value="w"> 여자
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