// 상품등록 대분류 선택시 중분류 필터

function categoryChange(e) {

		var good_홈스마트 = [ "스마트 조명", "스마트 전동 블라인드", "스마트 공기청정기", "스마트 컨르롤 시스템",
				"와이파이 스피커" ];
		var good_가구 = [ "게임용가구", "가구세트", "침대", "쇼파", "책상/선반유닛", "식탁/책상",
				"수납장/장식장", "TV/멀티가구", "서랍장/서랍장유닛", "옷장", "의자", "야외용 가구",
				"거실장/찬장/콘솔테이블", "어린이가구", "칸막이/파티션", "이동식 선반", "바테이블/의자",
				"암체어/카우치", "카페가구", "영유아 가구" ];
		var good_홈오피스 = [ "사무용의자", "책상/컴퓨터책상", "책상/의자 세트", "서랍 유닛", "수납유닛/수납장",
				"칸막이/파티션", "작업등", "케이블/충전기", "서류/미디어정리용품" ];
		var good_침대매트리스 = [ "침대", "침구", "매트리스", "침대협탁", "매트리스 베이스", "침대헤드",
				"침대수납", "침대갈빗살", "침대다리" ];
		var good_어린이GaGu = [ "어린이", "영유아" ];
		var good_조명 = [ "일반조명", "장식조명", "시스템조명", "스마트조명", "야외용조명", "욕실조명",
				"LED전구" ];
		var good_수납정리 = [ "책상/선반유닛", "수납솔루션시스템", "수납장/장식장", "TV/멀티미디어 가구",
				"서랍장/서랍장유닛", "옷장", "소형수납/정리", "거실장/찬장/콘솔테이블", "후크/벽수납",
				"스텐드옷걸이/신발수납", "이동식선반", "가방", "이동보조상품", "벽선반", "슬라이딩도어시스템" ];
		var good_주방용품 = [ "식품보관정리", "디너웨어", "서빙웨어", "커피/차", "테이블텍스타일", "조리도구",
				"유리제품/유리병", "주방가구", "식기세척용품", "식기도구", "칼/도마", "제빵도구", "주방텍스타일",
				"넵킨/넵킨홀더", "어린이식기" ];
		var good_주방가구 = [ "주방 부속품", "주방 팬트리", "주방 벽수납", "주방 조리대", "주방 가전",
				"주방 아일랜드/카트", "주방 손잡이", "주방조명", "주방 싱크대/수도꼭지", "주방 벽패널",
				"주방 모듈형", "주방 도어/서랍앞판", "주방 캐비넷" ];
		var good_욕실 = [ "욕실 세면대하부장", "욕실 용품", "욕실 수납", "욕실 거울", "욕실 세탁용품",
				"욕실 텍스타일", "욕실 조명", "욕실 세면대 세트", "욕실 스툴/벤치", "욕실 세면기",
				"욕실 사워기", "욕실 수도꼭지" ];
		var good_텍스타일 = [ "침구", "커튼/블라인드", "쿠션/쿠션커버", "어린이 텍스타일", "야외용 쿠션",
				"담요/스로우", "테이블 텍스타일", "패브릭/재봉용품", "주방 텍스타일", "영유아 텍스타일",
				"목욕가운/판쵸우의", "위자패드", "러그" ];
		var target = document.getElementById("good");

		if (e.value == "홈스마트")
			var d = good_홈스마트;
		else if (e.value == "가구")
			var d = good_가구;
		else if (e.value == "홈오피스")
			var d = good_홈오피스;
		else if (e.value == "침대매트리스")
			var d = good_침대매트리스;
		else if (e.value == "어린이GaGu")
			var d = good_어린이GaGu;
		else if (e.value == "조명")
			var d = good_조명;
		else if (e.value == "수납정리")
			var d = good_수납정리;
		else if (e.value == "주방용품")
			var d = good_주방용품;
		else if (e.value == "주방가구")
			var d = good_주방가구;
		else if (e.value == "욕실")
			var d = good_욕실;
		else if (e.value == "텍스타일")
			var d = good_텍스타일;
		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
	
//상품 등록시 이미지 업로드 미리보기
function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
	
	
// 상품등록시 옵션 갯수 추가 버튼	
$(document).ready(function() {
	var i=2; // 변수설정은 함수의 바깥에 설정!
  $("#option_plus").click(function() {
    
    $("#option_space").append("<tr><td><input type='text' id='option-insert-bar' name='options_name"+i+"' /></td><td><input type='text' id='option-insert-bar' name='options_price"+i+"'/></td><td><input type='text' id='option-insert-bar'name='options_sale"+i+"'/></td></tr>");
    
    
    i++; // 함수 내 하단에 증가문 설정
    

  });
});
