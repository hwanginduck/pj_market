<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
<script src="/resources/js/jquery.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//우편번호, 주소 Daum API
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				document.getElementById('member_zip1').value = data.zonecode;
				document.getElementById('member_addr1').value = data.address;
			}
		}).open();
	}
</script>

</head>
<body>
	<div id="join_wrap" align="center">
		<h2 class="join_title">회원가입</h2>
		<form name="f" method="post" action="member_edit_ok.do"
			onsubmit="return memberedit_check()">
			<table id="join_t">
				<tr>
					<th>회원아이디</th>
					<td>${member_id}</td>
				</tr>
				<tr>
					<th>회원비번</th>
					<td><input type="password" name="member_pw" id="member_pw"
						size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>회원비번확인</th>
					<td><input type="password" name="member_pw2" id="member_pw2"
						size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>회원이름</th>
					<td><input name="member_name" id="member_name" size="14"
						class="input_box" value="${medit.member_name}" /></td>
				</tr>

				<tr>
					<th>우편번호</th>
					<td><input name="member_zip1" id="member_zip1" size="5"
						class="input_box" readonly onclick="post_search()"
						value="${medit.member_zip1}" /> <!-- -<input name="join_zip2" id="join_zip2" size="3" class="input_box" readonly 
      		onclick="post_search()"/> --> <input type="button"
						value="우편번호검색" class="input_button" onclick="openDaumPostcode()" />
					</td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input name="member_addr1" id="member_addr1" size="50"
						class="input_box" readonly value="${medit.member_addr1}"
						onclick="post_search()" /></td>
				</tr>

				<tr>
					<th>나머지 주소</th>
					<td><input name="member_addr2" id="member_addr2" size="37"
						class="input_box" value="${medit.member_addr2}" /></td>
				</tr>
				<tr>
					<th>휴대전화번호</th>
					<td><select name="member_phone">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="019">019</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
					</select>-<input name="member_phone2" id="member_phone2" size="4"
						maxlength="4" class="input_box" value="${medit.member_phone2}" />-<input
						name="member_phone3" id="member_phone3" size="4" maxlength="4"
						class="input_box" value="${medit.member_phone3}" /></td>
				</tr>

				<tr>
					<th>전자우편</th>
					<td><input name="member_email" id="member_email" size="10"
						class="input_box" value="${medit.member_email}" />@<input
						name="member_domain" id="member_domain" size="20"
						class="input_box" readonly value="${medit.member_domain}" /> <select
						name="mail_list" onchange="domain_list()">
							<option value="">=이메일선택=</option>
							<option value="daum.net">
								<c:if test="${member_domain == 'daum.net'}">${'selected'}</c:if>
								daum.net
							</option>
							<option value="nate.com">
								<c:if test="${member_domain == 'nate.com'}">${'selected'}</c:if>
								nate.com
							</option>
							<option value="naver.com">
								<c:if test="${member_domain == 'naver.com'}">${'selected'}</c:if>
								naver.com
							</option>
							<option value="hotmail.com">
								<c:if test="${member_domain == 'hotmail.com'}">${'selected'}</c:if>
								hotmail.com
							</option>
							<option value="gmail.com">
								<c:if test="${member_domain == 'gmail.com'}">${'selected'}</c:if>
								gmail.com
							</option>
							<option value="0">직접입력</option>
					</select></td>
				</tr>

			</table>

			<div id="member_menu">
				<input type="submit" value="회원수정" class="input_button"
					onClick="javascript:btn()" /> <input type="reset" value="수정취소"
					class="input_button" onclick="$('#member_pw').focus();" />
				   <input type="button" value="회원탈퇴" class="input_button"
     				onclick="location='member_del.do'" />	
			</div>

			<script>
				function btn() {
					alert('회원정보 수정 성공');
				}
			</script>

		</form>
	</div>
</body>
</html>
