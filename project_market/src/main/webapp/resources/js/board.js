function board_check() {
	if ($.trim($("#member_id").val()) == "") {
		alert("아이디를 입력하세요!");
		$("#member_id").val("").focus();
		return false;
	} 
	if ($.trim($("#review_sb").val()) == "") {
		alert("글제목을 입력하세요!");
		$("#review_sb").val("").focus();
		return false;
	}
	if ($.trim($("#product_num").val()) == "") {
		alert("상품코드를 입력하세요!");
		$("#product_num").val("").focus();
		return false;
	}
	if ($.trim($("#options_num").val()) == "") {
		alert("옵션코드를 입력하세요!");
		$("#options_num").val("").focus();
		return false;
	}
	if ($.trim($("#review_star").val()) == "") {
		alert("별점을 매겨주세요!");
		$("#review_star").val("").focus();
		return false;
	}
	if ($.trim($("#review_content").val()) == "") {
		alert("글내용을 입력하세요!");
		$("#review_content").val("").focus();
		return false;
	}
}