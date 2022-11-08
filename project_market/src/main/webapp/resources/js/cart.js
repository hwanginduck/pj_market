
//전체선택하면 모두 체크 되게하는 것
$("#allChecking").click(function() {
	var chk = $("#allChecking").prop("checked");
	if (chk) {
		$(".chkbox").prop("checked", true);
		itemSum();
		console.log(chk)
	} else {
		$(".chkbox").prop("checked", false);
		itemSum();
		console.log(chk)
	}
});

//선택한 것들 모두 더하기
function itemSum() {
	var str = "";
	var sum = 0;
	var count = $(".chkbox").length;
	for (var i = 0; i < count; i++) {
		if ($(".chkbox")[i].checked == true) {
			sum += parseInt($(".chkbox")[i].value);
		}
	}
	$("#total_sum").html(sum + " 원");
	$("#amount").val(sum);
} 

// 전체 선택에서 개별 선택을 풀면 전체 선택도 풀림
$(".chkbox").click(function () {
	$("#allChecking").prop("checked", false);
});


// 숫자변화를 감지해서 가격을 조정해준다
  $( document ).ready( function() {
      var a = $( '#a' ).val();
      var b = $( '#b' ).val();
      var c = $( '#c' ).val();
      var abc = (a + b) * c;
      $( '#abc' ).text( abc );
    $( '#c' ).on( 'input', function() {
      var a = $( '#a' ).val();
      var b = $( '#b' ).val();
      var c = $( '#c' ).val();
      var abc = (a + b) * c;
      $( '#abc' ).text( abc );
    } );
  } );