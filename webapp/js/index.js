/* $("#loadHeader").load("../layout/header.html");  
$("#loadFooter").load("../layout/footer.html"); */

var totalSlide = $("#best_restaurang_list #list-cover").length;
var sliderWidth = 390;
var left = 0;
$(document).ready(function() {
    setInterval(sliderRight, 3000);
});

function sliderRight() {
    left = left - sliderWidth;
    if (left == -1950) {
        left = 0;
    }
    $("#carousel").css("left", left);
}


$(".owl-carousel").owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    navText: ["<i class='fa fa-caret-left'></i>", "<i class='fa fa-caret-right'></i>"],
    autoplay: true,
    autoplayHoverPause: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 1
        },
        1000: {
            items: 1
        }
    }
});


$(document).ready(function(){

	//버튼 클릭시 검색한 내용이 레스토랑 리스트에서 뜬다
	$('#searchHomeBtn').click(function(){
		 if($('#searchOption').val()==''){
        	Swal.fire('Please, Choose the option')
	 			return false;
	 		}else{
	 			Swal.fire({
	 				  position: 'center',
	 				  icon: 'success',
	 				  title: 'Thank you for searching us!',
	 				  showConfirmButton: false,
	 				  timer: 1500
	 				})
						location.href="/LineUp/restaurant/restaurantList?pg=1"+"&searchOption="+$('#searchOption').val()+"&searchText="+$('#searchText').val()+"&vegan="+$('input[name="vegan"]:checked').val();

	 		}
		 
	});
	
});

