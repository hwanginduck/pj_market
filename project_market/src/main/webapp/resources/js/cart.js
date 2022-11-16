
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

// 전체 선택에서 개별 선택을 풀면 전체 선택도 풀림
$(".chkbox").click(function () {
	$("#allChecking").prop("checked", false);
});


// 화면 로드시에 값가져가서 계산

  $( document).ready( function() {
 	var e = document.getElementById("forcount").value;
 	console.log(e);
  	var i = 0;
	do{
      var pp = $( '#product_price'+i ).val();
      var op = $( '#options_price'+i ).val();
      var pc = $( '#product_count'+i ).val();
     
      //String > int
      pp = Number(pp);
      op = Number(op);
      pc = Number(pc);
      
      var total = (pp + op) * pc;
      
      total = total.toLocaleString();
      
      $( '#total'+i ).text( total );
      $('#total'+i).attr('value',total);
     
      i += 1;
	}while(i<=e.length);
	
});

// count 바뀌면 합계 재계산

$(document).ready( function() {
	
	$('.quantity').on('change',function(){

		var e = document.getElementById("forcount").value;

	  	var i = 0;

		do{
			var pp = $( '#product_price'+i ).val();
			var op = $( '#options_price'+i ).val();
			var pc = $( '#product_count'+i ).val();
     
			//String > int
			pp = Number(pp);
			op = Number(op);
			pc = Number(pc);
      
      		
      
			var total = (pp + op) * pc;
			
			total = total.toLocaleString();
			
			$('#total'+i ).text( total );
			$('#total'+i).attr('value',total);
     
			i += 1;
		
		}while(i<=e.length);
   	});
});

//선택한 것들 모두 더하기
function itemSum() {
	var str = "";
	var sum = 0;
	var count = $(".chkbox").length;
	for (var i = 0; i < count; i++) {
		if ($(".chkbox")[i].checked == true) {
			sum += Number($("#total"+i).val().replace(/\,/g,""));
			console.log(sum);
		}
	}
	
	sum = sum.toLocaleString();
	
	$("#total_sum").html(sum + " 원");
	$('#total_sum').attr('value',sum);
	$("#amount").val(sum);
} 


$('.plus').on('click',function(e){
	var input = $(e.target).closest('.number-input').find('input');
	input[0]['stepUp']();
	input.trigger('change');
});

$('.minus').on('click',function(e){
	var input = $(e.target).closest('.number-input').find('input');
	input[0]['stepDown']();
	input.trigger('change');
});


var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
          },
      });