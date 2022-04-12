<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="body">
<div class="container-fluid">
	<div class="register">
		<h2>NIDAS 회원가입</h2>
		<p>멤버가 되어 NIDAS가 제공하는 최고의 제품과 혜택을 만나보세요</p>

		<div></div>
       	<div class="form">
       		<form action="memberInsert.do" method="post" id="frm">
				<table>
					<tbody>
						<tr>
							<th width="30%">이름</th>
							<td>
								<input type="text" id="name" name="name" maxlength="6" placeholder="이름을 입력해주세요 (~6자)">
								<p id="nameNotice" class="notice"></p>
							</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" id="id" name="id" maxlength="15" placeholder="아이디를 입력해주세요 (~15자)" onkeyup="idExistCheck();">
								<p id="idNotice" class="notice"></p>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" id="password" name="password" maxlength="20" placeholder="비밀번호를 입력해주세요 (~20자)" onkeyup="pwCheck()">
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" id="passwordAgain" name="passwordAgain" placeholder="비밀번호를 재입력해주세요" maxlength="20" onkeyup="pwCheck()">
								<p id="pwNotice" class="notice"></p>
							</td>
						</tr>
						<tr>
							<th>핸드폰 번호</th>
							<td>
								<input type="text" id="hp" name="hp" maxlength="11" placeholder="번호를 '-' 없이 입력해주세요"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								<button type="button" style="width:34%" id="sendSMSBtn" class="btn btn-secondary" onclick="sendSMS()">인증번호 전송</button>
							</td>
						</tr>
						<tr>
							<th>인증 번호</th>
							<td>
								<input type="text" id="hpCode" name="hpCode" maxlength="4" placeholder="인증번호 입력란 (4자리 입력 시 자동 확인됩니다)" onkeyup="checkSMS()">
								<p id="hpNotice" class="notice"></p>
							</td>
						</tr>				
						<tr>
							<th>성별</th>
							<td style="text-align: left;">
								<div class="genderDiv">
									<input type="radio" name="gender" value="m"> 남자 
									<input type="radio" name="gender" value="w"> 여자
								</div>
								<p id="genderNotice" class="notice"></p>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
       	</div>
		<div></div>
		<button type="button" class="btn btn-secondary" id="registerBtn" onclick="frmSubmit()">회원가입</button>
   	</div>
</div>
</div>

<script src="resources/js/registerForm.js"></script>