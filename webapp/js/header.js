$("#dogface").fadeOut(0.01);
$("#dogface").fadeIn(1800);
$("#p1").fadeOut(1);
$("#p1").fadeIn(2000);
$("#p2").fadeOut(1);
$("#p2").fadeIn(3000);


/*href="/LineUp/restaurant/restaurant_registerForm"*/

$(document).ready(function(){
	setTimeout(function(){
		var offset = $('.navbar-item ').offset();	
	    $('html').animate({scrollTop : offset.top}, 400);
	}, 2000);
	
});


$('#register').click(function(){
	var id = $('#sessionDTO').val();
	$.ajax({
		type: 'post',
		url: '/LineUp/restaurant/hasRestaurant',
		data: 'id='+id,
		success: function(data){
			if(data == 'hasNoRes') {
				location.href = "/LineUp/restaurant/restaurant_registerForm";
			} else if(data == 'hasRes') {
				Swal.fire({
					  icon: 'error',
					  title: '이미 가게를 등록하셨습니다',
				});
			}
		}
	});
});