$("#loadHeader").load("../layout/header_bulma.jsp");
$("#loadFooter").load("../layout/footer.html");
 
$(document).ready(function(){	
	$.ajax({
		type: 'post',
		url: '/LineUp/restaurant/getDetailRestaurant',
		data: 'seq_restaurant='+$('#seq_restaurant').val()+'&pg='+$('#pg'),
		dataType: 'json',
// data에 restaurantInfoDTO 식당 정보 (이미지, 메뉴 제외 / 가게주인seq, 별점포함 )
// restaurantMenuDTOList(레스토랑 메뉴)
// restaurantImageDTOList(레스토랑 이미지들)
// restaurantReviewDTOListWithName(레스토랑 리뷰들+해당리뷰 작성자의 이름 추가)
		
		success: function(data) {
			let index1 = 0 ;
			let img_index = [];

			//뷰 상단의 가게정보들을 넣습니다.
			$('#restaurant_name').text(data.restaurantInfoDTO.restaurant_name);
			$('#category').text(data.restaurantInfoDTO.category);
			$('#zipcode').text(data.restaurantInfoDTO.addr);
			
			$('#addr').text(data.restaurantInfoDTO.addr);
			$('#tel').text(data.restaurantInfoDTO.tel);
			$('#content').text(data.restaurantInfoDTO.content);
			
			
			//가게 메뉴들
			if(data.restaurantMenuDTOList == '') {
				$('#menubar').append(
						'<div class="box" id="noreview" style="background-color:#ff7979; font-size: 18px;color:white; font-family: "Jua", sans-serif;">	메뉴가 없습니다</div>'	
				);
			}
			
			
			$.each(data.restaurantMenuDTOList, function(index, items){
				$('#menubar').append(
					'<span>'+items.menu_name+'</span>     --------------------------------------------------------     <span>'+items.menu_price+'</span>&nbsp;&nbsp'
				);
				if(items.vegan!='' && items.spicy=='') {
					$('#menubar').append(
						'<span class="tag is-success is-light">'+items.vegan+'</span><br/>'
					)
				} else if(items.spicy!='' && items.vegan=='') {
					$('#menubar').append(
						'<span class="tag is-danger is-light">'+items.spicy+'</span><br/>'
					);
				} else if(items.spicy!='' && items.vegan!=''){
					$('#menubar').append(
						'<span class="tag is-success is-light">'+items.vegan+'</span>&nbsp;&nbsp;'
						+'<span class="tag is-danger is-light">'+items.spicy+'</span><br/>'
					);
				} else {
					$('#menubar').append(
							'<br/>'
					);
				}
			});
			
			
			//뷰 좌상단의 메인이미지/로고를 넣습니다
			if(data.main_img == '') {
				$('figure.media-left > p.image.is-150x150').append(
					'<img src="http://placehold.it/150x150" />'
				);
			} else {
				$('figure.media-left > p.image.is-150x150').append(
					'<img style="cursor:pointer; width: 150px !important; height: 150px !important" src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/'+data.main_img+'">'
				)
			}
			
			
			//가게 서브이미지들 뿌리기
			$.each(data.restaurantImageDTOList, function(index, items){
				if($('.sub_img').attr('id')==items.seq_restaurant){
					$('#a').append(
						'<div class="item">'
						+'<img style="cursor:pointer; width: 336px !important; height: 190px !important" src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/sub_imgs/'+items.sub_img+'">'
						+'</div>'
					);
				} else if(items.sub_img == '') {
					$('#a').append(
						'<div class="item">'
						+'가게 사진이 없습니다.'
						+'</div>'
					);
				} else {
					
				}
			});
			//가게 서브이미지 끝 
			
			if(data.restaurantReviewDTOListWithName == '') {
				$('#Restaurant_review_start').append(
					'<div class="box" id="noreview" style="background-color:#ff7979; font-size: 18px;color:white; font-family: "Jua", sans-serif;">아직 리뷰가 없습니다! 첫 리뷰를 작성해주세요</div>'
				);
			} else {
				// 리뷰시작
				$.each(data.restaurantReviewDTOListWithName, function(index, items){
					
					if(index < 1) {				
						$('#Restaurant_review_start').append(
								'<div class="card" style="padding-bottom:20px; margin-bottom:8px">'+
								'<div class="card-content" style="padding-bottom:0px">'+
								'<div class="media">'+
								'<div class="media-left">'
								+ '</div>'
								+ '<div class="media-content">'
								+ '<span>'
								+ '<p class="title is-4">'+items.real_name+''+items.nickname+'</p>'
								+ '<p class="subtitle is-6" style="margin-bottom:2px">'+items.id+'</p>'
								+ '</span>'
								+'<div class="score'+(index+3)+'" style="width:150px; height:50px;">'
								
								+'</div>'
								+ '</div></div>'
								+ '<div class="carousel-wrap" style="margin-top:0;">'
								+ '<div class="review_c owl-carousel '+items.seq_review+'" id ="'+items.seq_review+'">'
								
								+ '</div>'
								+ '</div>'
								+ '</div>'
								+ '<div id="content" style="width: 100%;">'
								+ '<div style="margin-top:-50px; margin-left:20px;">'
								+ '<p style="font-size:20px; margin-bottom:10px">'+items.content+'</p>'
								+ '<time>'+items.log_time+'</time>'
								+ '</div>'
								+ '</div>'
								+ '</div>'
						);
					} else if(index >= 1){
						
						$('#rvList').append(
								'<div class="card" style="padding-bottom:20px; margin-bottom:8px">'+
								'<div class="card-content" style="padding-bottom:0px">'+
								'<div class="media">'+
								'<div class="media-left">'
								+ '</div>'
								+ '<div class="media-content" style="margin-left:-14px">'
								+ '<span>'
								+ '<p class="title is-4">'+items.real_name+''+items.nickname+'</p>'
								+ '<p class="subtitle is-6" style="margin-bottom:2px">'+items.id+'</p>'
								+ '</span>'
								+'<div class="score'+(index+3)+'" style="width:150px; height:50px;">'
								
								+'</div>'
								+ '</div></div>'
								+ '<div class="carousel-wrap" style="margin-top:0;">'
								+ '<div class="review_c owl-carousel '+items.seq_review+'" id ="'+items.seq_review+'">'
								+ '</div>'
								+ '</div>'
								+ '</div>'
								+ '<div id="content" style="width: 100%;">'
								+ '<div style="margin-top:-50px; margin-left:20px;">'
								+ '<p style="font-size:20px; margin-bottom:10px">'+items.content+'</p>'
								+ '<time>'+items.log_time+'</time>'
								+ '</div>'
								+ '</div>'
								+ '</div>'
							);
						}
					
						$('.score'+(index+3)).load('../member/star.jsp',{
							width: "150",
							height: "40",
							score: items.score,
							num: index+3,
							cursor_stat: "4"
						});
						index1++;
					}) //리뷰 끝
					
					if(data.restaurantReviewDTOListWithName.length >= 0) {
						$('#slidebtn').append(
								'<button id="sld" class="button is-info" style="width: 100%;">더보기</button>'
						);
					}
					
				}
			
	               
	                  		
			//리뷰 이미지 뿌리기 시작
	  		$.each(data.restaurantReviewImageDTO, function(index, items){
	  		
      			if( $('.carousel-wrap').find('.'+items.seq_review).attr('id')==items.seq_review) {
      				$('#'+items.seq_review).append(
  						'<div class="item">'
                        + '<img style="cursor: pointer; width: max-content; height: 150px;" src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/review_img/'+items.image+'" />'
                        + '</div>'
      				);
      			} 

	  		});
	  		
	    	 $(".owl-carousel").owlCarousel({
	            loop: true,
	            margin: 10,
	            nav: true,
	            navText: ["<i class='fa fa-caret-left fa-3x'></i>", "<i class='fa fa-caret-right fa-3x'></i>"],
	            autoplay: false,
	            autoplayHoverPause: true,
	            /*  responsive: {
	                0: {
	                    items: 1
	                },
	                600: {
	                    items: 3
	                },
	                1000: {
	                    items: 5
	                }
	            }*/
	        });
	    	 
	    	 for(x=1; x<index1+1; x++){
	    		 if($('.carousel-wrap .owl-carousel').eq(x).find('img').length==0){
		    			$('.carousel-wrap .owl-carousel').eq(x).empty();
		    		}
		    	}
	          
	        // img 모달창
	    	 for(x=0; x<index1; x++){
	             if($('.carousel-wrap .review_c').eq(x).find('img').length==0){
	                $('.carousel-wrap .review_c').eq(x).empty();
	             };
	          }
	        $(".carousel-wrap img").click(function() {
	            $("#kk img").attr("src", $(this).attr("src"));
	            $("#kk .modal").addClass("is-active");
	        });
	        $("#kk").click(function() {
	            $("#imageModall").removeClass("is-active");
	        });
	        
	        // 모달취소
	        $('button.delete').click(function(){
	            $('#reserveModal').removeClass('is-active');
	           
	        });
	        
	        $('button.modal-close.is-large').click(function(){
	            $("#imageModal").removeClass("is-active");
	        });
	        
	        $('.delete, #modal-back, .modal-background').click(function(){
	        	$('#reviewModal').removeClass('is-active');
	        	$('#imageModal').removeClass('is-active');
	        })
	        
	        
	        
	            
	        // 가게 지도 
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.5030893, 127.024397), // 지도의 중심좌표37.5030893, 127.024397,
		        level: 3 // 지도의 확대 레벨
		    };  
	
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			var geocoder = new kakao.maps.services.Geocoder();
			var loc = data.restaurantInfoDTO.addr;
			geocoder.addressSearch(loc, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+data.restaurantInfoDTO.restaurant_name+'</div>'
			        });
			        infowindow.open(map, marker);
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			
		} //ajax success
	});
	
	$(window).scroll(function() {
	    if ($(this).scrollTop() > 100) {
	        $("#backToTop").fadeIn(500);
	    } else {
	        $("#backToTop").fadeOut("slow");
	    }
	});
	$("#backToTop").click(function(e) {
	    e.preventDefault();
	    $("html, body").animate({ scrollTop: 0 }, 200);
	});
	
	var sldn = 0;
	$("#rvList").hide();
	$("#slidebtn").click(function() {
	    if (sldn == 0) {
	        $("#rvList").slideToggle();
	        $("#sld").text("접기");
	        sldn = 1;
	        
	        var offset = $('#rvList').offset();
	        $('html').animate({scrollTop: offset.top}, 400);
	        
	    } else {
	        $("#rvList").slideToggle();
	        $("#sld").text("더보기");
	        sldn = 0;
	        
	        var offset = $('#Restaurant_review_start').offset();
	        $('html').animate({scrollTop: offset.top}, 400);
	    }
	});
});

