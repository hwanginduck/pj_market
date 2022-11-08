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

$(".chkbox").click(function () {
	$("#allChecking").prop("checked", false);
});