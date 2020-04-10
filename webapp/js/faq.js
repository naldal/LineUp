//헤더, 푸터 로드
$("#loadHeader").load("../layout/header_bulma.jsp");
$("#loadFooter").load("../layout/footer.html");
$('#res_form').hide();
$('#err_form').hide();
$('#offi_form').hide();


//카테고리 클릭시 아래 목록 변경
$('.faq ').click(function(){
	let cate_id = $(this).attr('id');
	
//	$('#cate_hidden').val(cate_id);
//	alert("cate_hidden = " + $('#cate_hidden').val());
	if(cate_id=="user") {
		$('#user_form').show();
		$('#res_form').hide();
		$('#err_form').hide();
		$('#offi_form').hide();
	} else if(cate_id=="res") {
		$('#user_form').hide();
		$('#res_form').show();
		$('#err_form').hide();
		$('#offi_form').hide();
	} else if(cate_id=="err") {
		$('#user_form').hide();
		$('#res_form').hide();
		$('#err_form').show();
		$('#offi_form').hide();
	} else if(cate_id=="offi") {
		$('#user_form').hide();
		$('#res_form').hide();
		$('#err_form').hide();
		$('#offi_form').show();
	}
});


//질문 클릭시 답변 페이지 이동
$('.box').click(function(){
	let ques_id = $(this).attr('id');
	location.href="/LineUp/home/faq_user1";
});

