

jQuery(document).ready(function() {
	jQuery('#loadHeader').load('../layout/header_bulma.jsp');
	jQuery('#loadFooter').load('../layout/footer.html');
	
	
	//input 검색창에서 엔터키 누르고 검색한 리스트가 뜬다
	jQuery("#searchText").keypress(function (e) {
     if (e.which == 13){
                if(jQuery('#searchOption').val()==''){
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
    	 				
    	 				disp();
    	 			restaurantSearchList(pg,searchOption,searchText,vegan);
    	 		}
     }
 });
	jQuery('#searchBtn').click(function(){
		disp();
	});
	
	    function restaurantSearchList(pg,searchOption,searchText,vegan){ //BoardPaging에  pagingHTML.append("[<a id='paging' href='boardList.do?pg="+(startPage-1)+"'>이전</a>]"); 여기에 길게 써도됨 대신 4번 다 써야함
			jQuery('#pg1').val(pg);
			jQuery('#searchText1').val(searchText);
			jQuery('#searchOption1').val(searchOption);
			jQuery('input[name="vegan1"]:checked').val(vegan);
			
			jQuery('#searchBtn').trigger('click');
			
		}
	    
	 
	
	function disp(){
	 	if(jQuery('#searchOption').val()==''){
	 	//	alert('searchOption 없음')
	 		//Swal.fire('Please, Choose the option');
	 		return false;
			}else{
			  jQuery.ajax({
			    	type : 'get',
					url : '/LineUp/restaurant/restaurantSearchList',
					data: "pg="+jQuery('#pg1').val()+"&searchOption="+jQuery('#searchOption').val()+"&searchText="+jQuery('#searchText').val()+"&vegan="+jQuery('input[name="vegan"]:checked').val(),
					dataType:'json',
					async: false,
					success : function(data){
					//	alert("검색완료.."+JSON.stringify(data.list));
						 jQuery('.practice').remove();
						 jQuery('#restaurantPagingList').remove();
						 jQuery.each(data.list, function(index,items){
							 jQuery('.dinner-menu').append(
							'<div class="practice" align="center">' 
								+'<ul class="practice2">'
									+'<li class="practice_li">'
									 	+'<img src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/'+items.main_img +'" />' 
									 	+'<div class="box">' 
									 		+'<div style="text-align: left; color:#555 ; margin-top:10px; font-weight: bold; font-size: 30px !important;">'
									 			+'<a style="font-family: Gothic A1, sans-serif; transition: 0.5s"  href="detailRestaurant?pg='+items.pg+'&seq_member='+items.seq_member+'&seq_restaurant='+items.seq_restaurant+'&company_num='+items.company_num+'">'+items.restaurant_name+'</a>'
									 			+'<div class="score_form score" style="float: right ; width: 155px; height: 50px; margin-top:-52px">' 
									 				+'<div class="score'+index+'" style="width:150px; height:50px;">'
									 				+'</div>'	
									 			+'</div>'
									 		+'</div>'
									 		+'<p style="margin-left: 17px">레스토랑 '+items.category+'</p>'
									 		+'<p style="margin-left: 16px; maring-top: 15px; font-size: 16px">'+items.addr+'<br>'+items.zipcode+'<br>'+items.tel+'</p>'
									 		+'<button style="background-color:#ff5e57; margin-top:-45px;height:38px;margin-right:7px;width:144px" id="reservationBtn" class="button is-link" style="top:11%">'
									 		+'<i class="fas fa-location-arrow"></i>'
									 			+'<span>즉시예약</span>'
									 				+'</button>'
									 	+'</div>'
									 +'</li>'
								+'</ul>'
							+'</div>'
							+'	<div id="reservation_modal">'
								+'<div id="reserveModal" class="modal">'
									     +' <div id="modal-back" class="modal-background"></div>'
									      	+'<div class="modal-card">'
									      	 +'<header class="modal-card-head">'
									           +' <p class="modal-card-title">Reservation</p>'
									           +' <button type="button" class="delete" aria-label="close"></button>'
									           +'</header>'
									           +' <section class="modal-card-body" style="padding:0%">'
									           	+' <section class="section" style="padding:0%">'
									           		+' <div class="container">'
									           		+' <div class="column is-center">'
									           		+'  <!-- 예약 form 시작 -->'
									           		+' <form class="box" style="width: 100%; height:100%">'
									           				+' <div class="field">'
									           				+'   <label class="label">Nickname</label>'
									           				+'    <span style="margin-left:-1px;" id="reserve_nick" >${memDTO.real_name }</span>'
									           				+' </div>'
									           				+'  <br>'
									           				+'<div class="field">'
									           				+' <label class="label">Phone Number</label>'
									           				+' <input type="text" id="reserve_tel" class="input is-rounded" value="${memDTO.tel }" />'
									           				+' </div>'
									           				+' <div id="reserve_telDiv"></div>'
									           				+' <br>'
									           				+'<div id="re" class="field">'
									           				+'  <label class="label">Number of people to book</label>'
									           				+'  <div class="select">'
									           					+'  <select name="howmany" id="howmany">'
									           						+' <option value="1">1</option>'
									           						+' <option value="2">2</option>'
									           						+' <option value="3">3</option>'
									           						+'  <option value="4">4</option>'
									           						+'   <option value="5">5</option>'
									           						+'   <option value="6">6</option>'
									           						+'   <option value="7">7</option>'
									           						+'   <option value="8">8</option>'
									           						+'  <option value="9">9</option>'
									           						+'   <option value="10">10</option>'
									           						+'   <option value="11">11+</option>'
									           						+' </select>'
									           						+'</div>'
									           						+'    <br><br>'
									           						+'  <div id="ab">'
									           						+'      <button type="button" id="in_reservationBtn" class="button is-warning">Reservation</button>'
									           						+'     </div>'
									           						+'   </div>'
									           						+'   </form>'
									           						+'  </div>'
									           						+'  </div>'
									           						+'</section>'
									           						+' </section>'
									           						+' </div>'
									           						+'</div>'
									           						+'</div>'
									           							
							 );
							 jQuery('.score'+index).load('../member/star.jsp',{
								 width: "150",
								 height: "50",
								 score: items.score,
								 num: index,
								 cursor_stat: "0"
							 });
						 });//each
							jQuery('#restaurantPaging').html(data.restaurantPaging.pagingHTML);

					}
				    
			    	});//ajax
			
		}//else
	}
	

    jQuery('#search-close').on('click', function() {
        jQuery('#search-list').css('display', 'none');
        jQuery('#search-close').css('display', 'none');
    });

    // navigation click actions
    jQuery('.scroll-link').on('click', function(event) {
        event.preventDefault();
        var sectionID = jQuery(this).attr('data-id');
        scrollToID('#' + sectionID, 750);
    });
    // scroll to top action
    jQuery('.scroll-top').on('click', function(event) {
        event.preventDefault();
        jQuery('html, body').animate(
            {
                scrollTop: 0
            },
            'slow'
        );
    });
    // mobile nav toggle
    jQuery('#nav-toggle').on('click', function(event) {
        event.preventDefault();
        jQuery('#main-nav').toggleClass('open');
    });
    
    
    
});
// scroll function
function scrollToID(id, speed) {
    var offSet = 0;
    var targetOffset = jQuery(id).offset().top - offSet;
    var mainNav = jQuery('#main-nav');
    jQuery('html,body').animate(
        {
            scrollTop: targetOffset
        },
        speed
    );
    if (mainNav.hasClass('open')) {
        mainNav
            .css('height', '1px')
            .removeClass('in')
            .addClass('collapse');
        mainNav.removeClass('open');
    }
}
if (typeof console === 'undefined') {
    console = {
        log: function() {}
    };
}



