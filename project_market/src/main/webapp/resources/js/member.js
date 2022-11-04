
 function check(){
	 if($.trim($("#member_id").val())==""){
		 alert("아이디를 입력하세요.");
		 $("#member_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_pw").val())==""){
		 alert("비밀번호를 입력하세요.");
		 $("#member_pw").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_pw2").val())==""){
		 alert("비밀번호를 확인하세요.");
		 $("#member_pw2").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_pwd").val()) != $.trim($("#member_pwd2").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비밀번호가 다릅니다.");
		 $("#member_pwd1").val("");
		 $("#member_pwd2").val("");
		 $("#member_pwd1").focus();
		 return false;
	 }
	 if($.trim($("#member_name").val())==""){
		 alert("회원이름을 입력하세요.");
		 $("#member_name").val("").focus();
		 return false;
	 }

	 if($.trim($("#member_addr1").val())==""){
		 alert("주소를 입력하세요.");
		 $("#member_addr1").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_addr2").val())==""){
		 alert("상세주소를 입력하세요.");
		 $("#member_addr2").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_phone2").val())==""){
		 alert("휴대전화번호를 입력하세요.");
		 $("#member_phone2").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_phone3").val())==""){
		 alert("휴대전화번호를 입력하세요.");
		 $("#member_phone3").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_email").val())==""){
		 alert("메일 아이디를 입력하세요.");
		 $("#member_email").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_domain").val())==""){
		 alert("메일 주소를 입력하세요.");
		 $("#member_domain").val("").focus();
		 return false;
	 }	 	 
 }
 
function post_search(){
	alert("우편번호 검색 버튼을 클릭하세요.");
}

function post_check(){
	window.open("zipcode_find.nhn","우편번호검색",
			"width=420,height=200,scrollbars=yes");
	//폭이 420이고 높이가 200,스크롤바가 생성되는 새로운 공지창을 만듬
}

/* 아이디 중복 체크*/
function id_check(){
	$("#checkid").hide();//idcheck span 아이디 영역을 숨긴다.
	var memid=$("#member_id").val();
	
	//1.입력글자 길이 체크
	if($.trim($("#member_id").val()).length < 4){
		var newtext='<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#checkid").text('');
		$("#checkid").show();
		$("#checkid").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#member_id").val("").focus();
		return false;
	};
	if($.trim($("#member_id").val()).length >12){
		var newtext='<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#checkid").text('');
		$("#checkid").show();
		$("#checkid").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#member_id").val("").focus();
		return false;
	};
	//입력아이디 유효성 검사
	if(!(validate_userid(memid))){
		var newtext='<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#checkid").text('');//문자 초기화
		$("#checkid").show();//span 아이디 영역을 보이게 한다.
		$("#checkid").append(newtext);
		$("#member_id").val("").focus();
		return false;
	};
	

	//아이디 중복확인
    $.ajax({
        type:"POST",
        url:"/member_idcheck.do",
        data: {"memid":memid},        
        success: function (data) { 

      	  if(data==1){	//중복 ID
      		var newtext='<font color="red">중복 아이디입니다.</font>';
      			$("#checkid").text('');
        		$("#checkid").show();
        		$("#checkid").append(newtext);
          		$("#member_id").val('').focus();
          		return false;
	     
      	  }else{	//사용 가능한 ID
      		var newtext='<font color="blue">사용가능한 아이디입니다.</font>';
      		$("#checkid").text('');
      		$("#checkid").show();
      		$("#checkid").append(newtext);
      		$("#member_id").focus();
      	  }  	    	  
        }
        ,
    	  error:function(e){
    		  alert("data error"+e);
    	  }
      });//$.ajax	
};
/*아이디 중복 체크 끝*/


	
function validate_userid(memid)
{
  var pattern= new RegExp(/^[a-z0-9_]+$/);
  //영문 소문자,숫자 ,_가능,정규표현식
  return pattern.test(memid);
};
 
function domain_list() {
	 var num=f.mail_list.selectedIndex;
	/*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	*/
	if ( num == -1 ) {
	//num==-1은 해당 리스트목록이 없다
	return true;
	 }
	 if(f.mail_list.value=="0") // 직접입력
	 {
	/*리스트에서 직접입력을 선택했을때*/
	 f.member_domain.value="";
	//@뒤의 도메인입력란을 빈공간시켜라.
	 f.member_domain.readOnly=false;
	//@뒤의 도메인입력란을 쓰기 가능
	f.member_domain.focus();
	//도메인입력란으로 입력대기상태
	}
	 
	 else {
	//리스트목록을 선택했을때
	 
	f.member_domain.value=f.mail_list.options[num].value;
	/*num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
	*/
	f.member_domain.readOnly=true;
	 }
 }

 
 /* 회원정보 수정 경고창 */
function memberedit_check(){
	if($.trim($("#member_pw").val())==""){
		 alert("회원비번을 입력하세요.");
		 $("#member_pw").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_pw2").val())==""){
		 alert("회원비번확인을 입력하세요.");
		 $("#member_pw2").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_pw").val()) != $.trim($("#member_pw2").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비밀번호가 다릅니다.");
		 $("#member_pw").val("");
		 $("#member_pw2").val("");
		 $("#member_pw").focus();
		 return false;
	 }
	 if($.trim($("#member_name").val())==""){
		 alert("이름을 입력하세요.");
		 $("#member_name").val("").focus();
		 return false;
	 }
	 /*if($.trim($("#join_zip1").val())==""){
		 alert("우편번호를 입력하세요!");
		 $("#join_zip1").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_zip2").val())==""){
		 alert("우편번호를 입력하세요!");
		 $("#join_zip2").val("").focus();
		 return false;
	 }*/
	 if($.trim($("#member_addr1").val())==""){
		 alert("주소를 입력하세요.");
		 $("#member_addr1").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_addr2").val())==""){
		 alert("상세주소를 입력하세요.");
		 $("#member_addr2").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_phone2").val())==""){
		 alert("휴대전화번호를 입력하세요.");
		 $("#member_phone2").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_phone3").val())==""){
		 alert("휴대전화번호를 입력하세요.");
		 $("#member_phone3").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_email").val())==""){
		 alert("메일 아이디를 입력하세요.");
		 $("#member_email").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_domain").val())==""){
		 alert("메일 주소를 입력하세요.");
		 $("#member_domain").val("").focus();
		 return false;
	 }	 

	 
}
 
 












 
 
 
 