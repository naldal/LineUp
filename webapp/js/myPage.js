
$("#loadHeader").load("../layout/header_bulma.jsp");
$("#loadFooter").load("../layout/footer.html");


$('#userModifyBtn').click(function(){
	$('#telDiv').empty();
	$('#beforePwdDiv').empty();
	$('#pwdDiv').empty();
	if($('#tel').val()=="") {
		$('#telDiv').text('필수 정보입니다.')
        $('#telDiv').css('font-size', '13pt')
        $('#telDiv').css('color', 'red');
        $('#telDiv').css('margin-top', '-10px');
        $('#telDiv').css('width', '300px');
	} else if($('#beforePwd').val()=="") {
		$('#beforePwdDiv').text('필수 정보입니다.')
        $('#beforePwdDiv').css('font-size', '13pt')
        $('#beforePwdDiv').css('color', 'red');
        $('#beforePwdDiv').css('margin-top', '-10px');
        $('#beforePwdDiv').css('width', '300px');
	} else if($('#pwd').val()=="" || $('#repwd').val()=="") {
		$('#pwdDiv').text('필수 정보입니다.')
        $('#pwdDiv').css('font-size', '13pt')
        $('#pwdDiv').css('color', 'red');
        $('#pwdDiv').css('margin-top', '-10px');
        $('#pwdDiv').css('width', '300px');
	} else if($('#pwd').val()!=$('#repwd').val()) {
		$('#pwdDiv').text('새 비밀번호가 일치하지 않습니다.')
        $('#pwdDiv').css('font-size', '13pt')
        $('#pwdDiv').css('color', 'red');
        $('#pwdDiv').css('margin-top', '-10px');
        $('#pwdDiv').css('width', '300px');
	} else {
		$.ajax({
			type : 'post',
			url : '/LineUp/member/userModify',
			data : $('#userModifyForm').serialize(),
			dataType : 'text',
			success : function(data) {
				if(data=="fail") {
					$('#beforePwdDiv').text('기존 비밀번호가 일치하지 않습니다.')
			        $('#beforePwdDiv').css('font-size', '13pt')
			        $('#beforePwdDiv').css('color', 'red');
			        $('#beforePwdDiv').css('margin-top', '-10px');
			        $('#beforePwdDiv').css('width', '300px');
				} else if(data=="success") {
					Swal.fire({
						  position: 'top',
						  icon: 'success',
						  title: '회원 정보가 성공적으로 수정됐습니다.',
						  showConfirmButton: false,
						  timer: 1900
						})
						setTimeout(function(){
							location.href="/LineUp/member/myPage"
						}, 2000);
					
				}
			}
		});
	}
});

/*------------------ 더보기 및 접기 설정 시작 --------------- */

var sldnAfter = 0;
$("#restaurant_visited_SlideAction").hide();
$("#slidebtn_after").click(function() {
    if (sldnAfter == 0) {
        $("#restaurant_visited_SlideAction").slideToggle();
        $(this).find('button').text("접기");
        sldnAfter = 1; 
    } else {
        $("#restaurant_visited_SlideAction").slideToggle();
        $(this).find('button').text("더보기");
        sldnAfter = 0;
    }
});


var sldnReview = 0;
$("#my_review_SlideAction").hide();
$("#slidebtn_review").click(function() {
    if (sldnReview == 0) {
        $("#my_review_SlideAction").slideToggle();
        $(this).find('button').text("접기");
        sldnReview = 1; 
    } else {
        $("#my_review_SlideAction").slideToggle();
        $(this).find('button').text("더보기");
        sldnReview = 0;
    }
});


var sldnQuestion = 0;
$("#question_SlideAction").hide();
$("#slidebtn_question").click(function() {
    if (sldnQuestion == 0) {
        $("#question_SlideAction").slideToggle();
        $(this).find('button').text("접기");
        sldnQuestion = 1; 
    } else {
        $("#question_SlideAction").slideToggle();
        $(this).find('button').text("더보기");
        sldnQuestion = 0;
    }
});

//
//$("#reservation_SlideAction").hide();
//$("#slidebtn_myreserve button").click(function() {
//    if ($(this).text() == "접기") {
//        $(this).text("더보기");
//    } else {
//        $(this).text("접기");
//    }
//    $("#reservation_SlideAction").slideToggle();
//});

//$("#my_Wish_list_SlideAction").hide();
//$("#slidebtn_like button").click(function() {
//    if ($(this).text() == "접기") {
//        $(this).text("더보기");
//    } else {
//        $(this).text("접기");
//    }
//    $("#my_Wish_list_SlideAction").slideToggle();
//});

//$("#restaurant_visited_SlideAction").hide();
//$("#slidebtn_after button").click(function() {
//    if ($(this).text() == "접기") {
//        $(this).text("더보기");
//    } else {
//        $(this).text("접기");
//    }
//    $("#restaurant_visited_SlideAction").slideToggle();
//});

//$("#my_review_SlideAction").hide();
//$("#slidebtn_review button").click(function() {
//    if ($(this).text() == "접기") {
//        $(this).text("더보기");
//    } else {
//        $(this).text("접기");
//    }
//    $("#my_review_SlideAction").slideToggle();
//});

/*$("#question_SlideAction").hide();
$("#slidebtn_question button").click(function() {
    if ($(this).text() == "접기") {
        $(this).text("더보기");
    } else {
        $(this).text("접기");
    }
    $("#question_SlideAction").slideToggle();
});*/
/* --------------------- 더보기 및 접기 설정 끝 --------------------- */

$(document).ready(function() {
	var seq_restaurant;

    /* --------------------- 예약 / 찜 / 다녀온 식당 / 리뷰 / 식당 정보 뿌리기 시작 ---------------------- */
    $.ajax({
    	type : 'post',
    	url : '/LineUp/member/getMyPage',
    	data : 'id='+$('#id').val(),
    	dataType : 'json',
    	success : function(data) {
    		
    		//찜리스트
    		if(data.basketList=="") {
    			$('#my_wish_list_show').append(
						'<h5 class="title is-5" style="color: #218c74; text-align: center;">현재 찜해두신 음식점이 없습니다.</h4>'
						);
    		} else if(data.basketList.length>2){
    			$('#slidebtn_like').append (
						'<button id="sld" class="button is-info" style="width: 100%;">더보기</button>'
				);
    		}
    			
    			$.each(data.basketList, function(index, items){
        			if(index<2){
        			$('#my_like_list_id #my_wish_list_show').append(
        					'<div class="box my_Wish_list" style="position: relative;">'
        					+ '<div class="column is-fullwidth">'
        					+'<article class="media">'
        					+'<figure class="media-left">'
        					+'<p class="image is-96x96">'
        					+'<img src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/meal.jpg" />'
        					+'</p>'
        					+'</figure>'
        					+'<div class="field basket_infoField" id="'+items.seq_restaurant+'" style="margin-left: 50px; width: 700px;">'
        					+'<h4 class="title is-4">'+items.restaurant_name+'</h4>'
        					+'<label class="label is-4">'+items.category+'</label>'
        					+'<label class="label is-4">'+items.addr+'</label>'
        					+'</div>'
        					+'<div class="media-right" style="position: absolute;">'
        					+'<div class="scoreBasket'+index+'" style="width:150px; height:50px; margin-left: 250px;">'
							
							+'</div>'
        					+'<div class="field is-grouped fieldBtn" style="position: absolute; right: -300px; bottom: -65px;">'
        					+'<div class="control reservationBtn" style="right: 300px;">'
        					+'<button id="basketCancel'+items.seq_restaurant+'" class="button is-danger is-small basketCancel" value="'+items.seq_restaurant+'">찜 취소</button>'
        					+'<button id="'+items.seq_restaurant+'" class="button is-link is-small basketBtn" value="'+items.seq_restaurant+'" style="margin-left: 5px;">즉시 예약</button>'
        					+'</div>'
        					+'</div>'
        					+'</div>'
        					+'</article>'
        					+'</div>'
        					+'</div>'
        					);
        			} else {
        				$('#my_Wish_list_SlideAction').append(
        						'<div class="box my_Wish_list" style="position: relative;">'
            					+ '<div class="column is-fullwidth">'
            					+'<article class="media">'
            					+'<figure class="media-left">'
            					+'<p class="image is-96x96">'
            					+'<img src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/meal.jpg" />'
            					+'</p>'
            					+'</figure>'
            					+'<div class="field basket_infoField" id="'+items.seq_restaurant+'" style="margin-left: 50px; width: 700px;">'
            					+'<h4 class="title is-4">'+items.restaurant_name+'</h4>'
            					+'<label class="label is-4">'+items.category+'</label>'
            					+'<label class="label is-4">'+items.addr+'</label>'
            					+'</div>'
            					+'<div class="media-right" style="position: absolute;">'
            					+'<div class="scoreBasket'+index+'" style="width:150px; height:50px; margin-left: 250px;">'
    							
    							+'</div>'
            					+'<div class="field is-grouped fieldBtn" style="position: absolute; right: -300px; bottom: -65px;">'
            					+'<div class="control reservationBtn" style="right: 300px;">'
            					+'<button id="basketCancel'+items.seq_restaurant+'" class="button is-danger is-small" value="'+items.seq_restaurant+'">찜 취소</button>'
            					+'<button id="'+items.seq_restaurant+'" class="button is-link is-small basketBtn" value="'+items.seq_restaurant+'" style="margin-left: 5px;">즉시 예약</button>'
            					+'</div>'
            					+'</div>'
            					+'</div>'
            					+'</article>'
            					+'</div>'
            					+'</div>'
        				);
        			}
        			
        			//찜리스트 상자 클릭시 해당 레스토랑 뷰로 이동
    				$('.basket_infoField').click(function(){
    					
    					let seq = $(this).attr('id');
    					location.href="/LineUp/restaurant/detailRestaurant?seq_restaurant="+seq;
    				});
    				
    				$('.scoreBasket'+index).load('../member/star4.jsp',{
    					width: "150",
    					height: "40",
    					score: items.score,
    					num: index,
    					cursor_stat: "2"
    				});
        		});//basket each
    		
    		
    		//나의 예약
    		if(data.myReservation=="") {
    			$('#my_reservation_list_show').append(
						'<h5 class="title is-5" style="color: #218c74; text-align: center;">현재 예약하신 음식점이 없습니다.</h4>'
						);
    		} else {
    			
    			$.each(data.myReservation, function(index, items){
    				
    				$('#my_reservation_list_show').append(
        					'<div class="column is-center reservation_wrap" style="position: relative;">'
        					+ '<div class="box my_Reservation_Box">'
        					+ '<div class="column is-fullwidth">'
        					+ '<article class="media reservation_media">'
        					+ '<figure class="media-left">'
        					+ '<p class="image is-96x96">'
        					+ '<img src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/meal.jpg" />'
        					+ '</p>'
        					+ '</figure>'
        					+ '<div class="field reservation_infoField"  id="'+items.seq_restaurant+'" style="margin-left: 50px; width: 700px;">'
        					+ '<h4 style="font-weight:700;" class="title is-4">'+items.restaurant_name+'</h4>'
        					+ '<label style="font-size: 10px; font-family: Nanum Gothic, sans-serif;" class="label is-4">'+items.category+'</label>'
        					+ '<label class="label is-4">'+items.addr+'</label>'
        					+ '</div>'
        					+ '<div class="media-right score_Form" style="position: absolute;">'
        					+'<div class="scoreReservation'+index+'" style="width:150px; height:50px; margin-left: 250px;">'
							
							+'</div>'
        					+ '<div class="field is-grouped fieldBtn" style="position: absolute; right: -300px; bottom: -65px;">'
        					+ '<div class="control cancelReservationBtn" style="right: 300px;">'
        					+ '<button style="width:300px; height:50px; margin-bottom:9px; left:42%;border-radius:10px;background-color:#999;" id="'+items.seq_restaurant+'" class="button is-link is-small">예약 취소</button>'
        					+ '</div>'
        					+ '</div>'
        					+ '</div>'
        					+ '</article>'
        					+ '</div>'
        					+ '</div>'
        					+ '</div>'
        			);
    				
    				//예약 상자 클릭시 해당 레스토랑 뷰로 이동
    				$('.reservation_infoField').click(function(){
    					
    					let seq = $(this).attr('id');
    					location.href="/LineUp/restaurant/detailRestaurant?seq_restaurant="+seq;
    				});
    				
    				$('.scoreReservation'+index).load('../member/star3.jsp',{
    					width: "150",
    					height: "40",
    					score: items.score,
    					num: index,
    					cursor_stat: "2"
    				});
    				
    		});//reservation each
    		}//reservation if/else
    		
    		//QNA
    		
    		if(data.qnaList=="") {
    			$('#my_qna_list_show').append(
    					'<h5 class="title is-5" style="color: #218c74; text-align: center;">현재 문의하신 질문이 없습니다.</h4>'
    			);
    		} else if(data.qnaList.length>2) {
    			$('#slidebtn_question').append(
						'<button id="sld" class="button is-info" style="width: 100%;">더보기</button>'
				);
    		}
    			$.each(data.qnaList, function(index, items){
        			if(index<3) {
        				$('#my_qna_list_show').append(
            					'<div class="box ques" id="'+items.seq_qna+'">'
            					+ '<article class="media">'
            					+ '<div class="media-left">'
            					+ '<figure class="image is-64x64">'
            					+ '<img src="../img/question_icon.png" alt="Image" />'
            					+ '</figure>'
            					+ '</div>'
            					+ '<div class="media-content">'
            					+ '<div class="content">'
            					+ '<p style="padding-top: 0;">'
            					+ '<div class="control">'
            					+ '<div class="tag is-primary is-small qna_status_'+items.status+'"></div>'
            					+ '</div><br/>'
            					+ '<small>'+items.log_time+'</small> <br />'
            					+ '<span class="ques_span">'+items.subject_qna+'</span>'
            					+ '</p>'
            					+ '</div>'
            					+ '<nav class="level is-mobile"></nav>'
            					+ '</div>'
            					+ '</article>'
            					+ '</div>'
            			);
        			} else {
        				
        				$('#question_SlideAction').append(
        						'<div class="box ques" id="'+items.seq_qna+'">'
            					+ '<article class="media">'
            					+ '<div class="media-left">'
            					+ '<figure class="image is-64x64">'
            					+ '<img src="../img/question_icon.png" alt="Image" />'
            					+ '</figure>'
            					+ '</div>'
            					+ '<div class="media-content">'
            					+ '<div class="content">'
            					+ '<p style="padding-top: 0;">'
            					+ '<div class="control">'
            					+ '<div class="tag is-danger is-small qna_status_'+items.status+'"></div>'
            					+ '</div><br/>'
            					+ '<small>'+items.log_time+'</small> <br />'
            					+ '<span class="ques_span">'+items.subject_qna+'</span>'
            					+ '</p>'
            					+ '</div>'
            					+ '<nav class="level is-mobile"></nav>'
            					+ '</div>'
            					+ '</article>'
            					+ '</div>'
        				);
        			
        				
        			}
        			
        			if(items.status=="0") {
        				$('.qna_status_0').attr("class", "tag is-info is-small qna_status_0");
        				$('.qna_status_0').text("답변 대기중");
        				$('.qna_status_0').css("font-weight", "bold");
        				$('.qna_status_0').css("background-color", "#3298dc");
        				$('.qna_status_0').css("color", "#fff");
        				
        			} else if(items.status=="1") {
        				$('.qna_status_1').text("처리됨");
        				$('.qna_status_1').css("font-weight", "bold");
        				$('.qna_status_1').css("background-color", "#f14668");
        				$('.qna_status_1').css("color", "#fff");
        			}
        			
        		});//question each
    		//question if/else

    		$('.ques').click(function(){
    			let seq_qna = $(this).attr('id');
    			location.href='/LineUp/member/qna_View?seq='+seq_qna+'&pg=1'	
    		});
    		
    		
    		//다녀온 식당
    		if(data.visitedList=="") {
    			$('#visited_list_show').append(
    				'<h5 class="title is-5" style="color: #218c74; text-align: center;">아직 다녀온 식당이 없습니다.</h4>'
    			);
    		} else if(data.visitedList.length>2){
    			 $('#slidebtn_after').append(
   						 '<button id="sld" class="button is-info" style="width: 100%; margin-top: -10px;">더보기</button>'
   				 );
    		}
    		
    			$.each(data.visitedList, function(index, items){
    				/*alert(items.score);*/
       			 if(index<2) {
       				 $('#visited_list_show').append(
       						 '<div class="box restaurant_visited_list" style="position: relative;">'
       						 + '<div class="column is-fullwidth">'
       						 + '<article class="media">'
       						 + '<figure class="media-left">'
       						 + '<p class="image is-96x96">'
       						 + '<img src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/meal.jpg" />'
       						 + '</p>'
       						 + '</figure>'
       						 + '<div class="field visited_infoField" id="'+items.seq_restaurant+'" style="margin-left: 50px; width: 700px;">'
       						 + '<h4 class="title is-4" style="color: #2C3A47;">'+items.restaurant_name+'</h4>'
       						 + '<label class="label is-4" style="color: #636e72;">'+items.category+'</label>'
       						 + '<label class="label is-4" style="color: #636e72;">'+items.addr+'</label>'
       						 + '</div>'
       						 + '<div class="media-right" style="position: absolute;">'
       						+'<div class="scoreVisited'+index+'" style="width:150px; height:50px; margin-left: 250px;">'
							
							+'</div>'
       						 + '<div class="field is-grouped fieldBtn" style="position: absolute; right: -300px; bottom: -65px;">'
       						 + '<div class="control" style="right: 300px;">'
       						 + '<div id="review'+items.seq_review+index+'" class="button is-link is-small" value="'+items.seq_restaurant+'"></div>'
       						 + '</div></div></div>'
       						 + '</article></div></div>'
       				 );
       			 } else {
       				 $('#restaurant_visited_SlideAction').append(
       						 '<div class="box restaurant_visited_list" style="position: relative;">'
       						 + '<div class="column is-fullwidth">'
       						 + '<article class="media">'
       						 + '<figure class="media-left">'
       						 + '<p class="image is-96x96">'
       						 + '<img src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/meal.jpg" />'
       						 + '</p>'
       						 + '</figure>'
       						 + '<div class="field visited_infoField" id="'+items.seq_restaurant+'" style="margin-left: 50px; width: 700px;">'
       						 + '<h4 class="title is-4">'+items.restaurant_name+'</h4>'
       						 + '<label class="label is-4">'+items.category+'</label>'
       						 + '<label class="label is-4">'+items.addr+'</label>'
       						 + '</div>'
       						 + '<div class="media-right" style="position: absolute;">'
       						+'<div class="scoreVisited'+index+'" style="width:150px; height:50px; margin-left: 250px;">'
							
							+'</div>'
       						 + '<div class="field is-grouped fieldBtn" style="position: absolute; right: -300px; bottom: -65px;">'
       						 + '<div class="control" style="right: 300px;">'
       						 + '<div id="review'+items.seq_review+index+'" class="button is-link is-small" value="'+items.seq_restaurant+'"></div>'
       						 + '</div></div></div>'
       						 + '</article></div></div>'
       				 );
       			 }
       			 
       			 if(items.seq_review!=null) {
       				 $('#review'+items.seq_review+index).attr('class', 'tag is-primary is-small');
       				 $('#review'+items.seq_review+index).text("리뷰 작성되었습니다.");
       			 }	else {
       				 $('#review'+items.seq_review+index).attr('class', 'button is-link is-small reviewBtn');
       				 $('#review'+items.seq_review+index).text("리뷰 쓰기");
       			 }
       			 
       			$('.visited_infoField').click(function(){
					
					let seq = $(this).attr('id');
					location.href="/LineUp/restaurant/detailRestaurant?seq_restaurant="+seq;
				});
       			
       			$('.scoreVisited'+index).load('../member/star2.jsp',{
					width: "150",
					height: "40",
					score: items.score,
					num: index,
					cursor_stat: "2"
				});
       			 
       		});//visited each
    		
    		
    		/* 리뷰 등록 창 띄우기 시작 */

    	    $(".reviewBtn").click(function(){
    	    	
    	    	let seq	= $(this).attr('value');
    	    	//alert(seq);
    	        $("#review_modal").addClass("is-active");
    	        $("#review_modal").css('display', 'flex');
    	        $('input[type=hidden][name=seq_restaurant]').val(seq);
    	     });
    	     
    	     $("#modal-back,#cancle,.delete").click(function(){
    	        $("#review_modal").css('display', 'none');
    		});
    	    /* 리뷰 등록 창 띄우기 끝 */
    	     
    	     /* 리뷰 등록 버튼 활성화 시작*/
    	     
    	     $('#reviewSubmit').click(function(){
    	    	 $('#subjectDiv').empty();
    	    	 $('#contentDiv').empty();
    	    	 
    	    	 if($('#subject').val()=="") {
    	    		 $('#subjectDiv').text("리뷰 제목을 입력해주세요.");
    	    		 $('#subjectDiv').css('color', '#FF607F');
    	    		 $('#subjectDiv').css('font-weight', 'bold');
    	    	 } else if($('#content').text()=="") {
    	    		 $('#contentDiv').text("리뷰 내용을 입력해주세요.")
    	    		 $('#contentDiv').css('color', '#FF607F')
    	    		 $('#contentDiv').css('font-weight', 'bold');
    	    	 } else {
    	    		 let formData = new FormData($('#reviewForm')[0]);
    	    		 $.ajax({
        	    		 type : 'post',
        	    		 enctype : 'multipart/form-data',
        	    		 processData : false,
        	    		 contentType : false,
        	    		 url : '/LineUp/member/reviewWrite',
        	    		 data : formData,
        	    		 success : function(data) {
        	    			 Swal.fire({
          						  position: 'top',
          						  icon: 'success',
          						  title: '리뷰를 등록했습니다.',
          						  showConfirmButton: false,
          						  timer: 1900
          						})
          						setTimeout(function(){
          							location.href="/LineUp/member/myPage"
          						}, 2000);
        	    		 }
        	    	 });
    	    	 }
    	    	 
    	    	 
    	     });
    	     
    	     /* 리뷰 등록 버튼 활성화 끝*/

    	     //나의 리뷰
    	     
    	     if(data.reviewList=="") {
    	    	 $('#my_review_list_show').append(
    	    			 '<h5 class="title is-5" style="color: #218c74; text-align: center;">작성하신 리뷰가 없습니다.</h4>'
    	    	 );
    	     } else if(data.reviewList.length>2){
    	    	 $('#slidebtn_review').append(
 						'<button id="sld" class="button is-info" style="width: 100%;">더보기</button>'
 				);
    	     }
    	    	 $.each(data.reviewList, function(index, items){
    	    			if(index<2) {
    	    				$('#my_review_list_show').append(
    	        					'<div class="box">'
    	        					+ '<div class="modal-card" style="width: 100%;">'
    	        					+ '<div class="media">'

    	        					+ '<div class="media-left">'
    	        					+ '</div>'

    	        					+ '<div class="media-content">'
    	        					+ '<p class="title is-2">'+items.restaurant_name+'</p>'
    	        					+ '<p class="subtitle is-6" style="margin-top: 5px;">&emsp;-'+items.name+'님의 리뷰-</p>'
    	        					+ '</div>'
    	        					+'<div class="score'+index+'" style="width:150px; height:50px; margin-right: 160px;">'
									
									+'</div>'		
    	        					+'</div>'
    	        					+ '<div class="carousel-wrap" style="margin-top:0;">'
    	        					+ '<div class="owl-carousel '+items.seq_review+'" id="'+items.seq_review+'">'
    	        					
    	        					+ '</div>'
    	        					+ '</div>'
    	        					+ '</div>'
    	        					+ '<div id="content" style="width: 100%;">'
    	        					+ '<h2 style="font-weight:bold; font-size: 20px;">'+items.subject+'</h2>'
    	        					+ '<p style="margin-top: 10px;">'+items.content+'</p>'
    	        					+ '<time>'+items.log_time+'</time>'
    	        					+ '</div>'
    	        					+ '</div>'
    	        					
    	        			);
    	    			} else {
    	    				$('#my_review_SlideAction').append(
    	    						'<div class="box">'
    	        					+ '<div class="modal-card" style="width: 100%;">'
    	        					+ '<div class="media">'
    	        				
    	        					+ '<div class="media-content">'
    	        					+ '<p class="title is-2">'+items.restaurant_name+'</p>'
    	        					
    	        					+ '<p class="subtitle is-6" style="margin-top: 5px;">&emsp;-'+items.name+'님의 리뷰-</p>'
    	        					+ '</div>'
    	        					+'<div class="score'+index+'" style="width:150px; height:50px; margin-right: 160px;">'
									
									+'</div>'
    	        					+ '</div>'
    	        					+ '<div class="carousel-wrap" style="margin-top:0;">'
    	        					+ '<div class="owl-carousel '+items.seq_review+'" id="'+items.seq_review+'">'
    	        					
    	        					+ '</div>'
    	        					+ '</div>'
    	        					+ '</div>'
    	        					+ '<div id="content" style="width: 100%;">'
    	        					+ '<h2 style="font-weight:bold; font-size: 20px;">'+items.subject+'</h2>'
    	        					+ '<p style="margin-top: 10px;">'+items.content+'</p>'
    	        					+ '<time>'+items.log_time+'</time>'
    	        					+ '</div>'
    	        					+ '</div>'
    	    				);
    	    				
    	    				
    	    			}
    	    			
    	    			$('.score'+index).load('../member/star.jsp',{
    						width: "150",
    						height: "40",
    						score: items.score,
    						num: index,
    						cursor_stat: "2"
    					});
    	    		});//review each
    	     
    		
    		//리뷰이미지 뿌리기 시작
    		
    		$.each(data.reviewImageList, function(index, items ){
    			/*alert(items.subject);
    			alert(items.image);*/
    			//alert("아아아 = " + $('.carousel-wrap').find('div').attr('id'));
    		
    			if($('.carousel-wrap').find('.'+items.seq_review).attr('id')==items.seq_review) {
    				$('#'+items.seq_review).append(
    						'<div class="item">'
    						+ '<img style="cursor: pointer; width: 200px; height: 150px;" src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/review_img/'+items.image+'" />'
    						+ '</div>'
    				);
    			}
    			
    			if(items.image==null) {
    				$('#'+items.seq_review).attr('style', 'display: none !important');
    			}
    		});//리뷰이미지 뿌리기 끝
    		
    		$(".owl-carousel").owlCarousel({
    	        loop: true,
    	        margin: 10,
    	        nav: true,
    	        navText: ["<p class='owl-before'> ❮ </p>", "<p class='owl-after'> ❯ </p>"],
    	        autoplay: true,
    	        autoplayHoverPause: true,
    	        responsive: {
    	            0: {
    	                items: 1
    	            },
    	            600: {
    	                items: 3
    	            },
    	            1000: {
    	                items: 5
    	            }
    	        }

    	    });
    		
    		$('.owl-prev').unwrap();
    		$('.owl-prev').css('top','0').css('position','absolute');
    		$('.owl-prev .owl-before').css('margin-top','70px').css('margin-left','12px');
    		$('.owl-next').css('top','0').css('position','absolute');
    		$('.owl-next .owl-after').css('margin-top','70px').css('margin-left','20px');
    		
    		$('.carousel-wrap img').click(function(){
    	        $("#kk img").attr("src", $(this).attr("src"));
    	        $("#kk .modal").addClass("is-active");
    	    });
    		
    		/*찜에서 예약하기 버튼*/
    		
    		$('.reservationBtn .basketBtn').click(function(){
//    			seq_restaurant = $(this).find('button').attr('id');
    			seq_restaurant = $(this).attr('id');
    	    	$('#reservation_modal').addClass('is-active');
    	    	$("#reservation_modal").css('display', 'flex');
    	    });
    		
    		/*찜 취소 버튼*/
    		
    		$('.reservationBtn .basketCancel').click(function(){
    			seq_restaurant = $(this).val();
    			
    			Swal.fire({
    				  title: '찜 취소',
    				  text: "해당 음식점 찜 하기를 취소하시겠습니까?",
    				  icon: 'warning',
    				  showCancelButton: true,
    				  confirmButtonColor: '#3085d6',
    				  cancelButtonColor: '#d33',
    				  confirmButtonText: 'Yes, delete it!'
    				}).then((result) => {
    				  if (result.value) {
    				    Swal.fire(
    				      '취소 완료',
    				      '해당 음식점을 찜 목록에서 제거했습니다.',
    				      'success'
    				    ) 
    				    setTimeout(function(){
    				    	$.ajax({
        	    				type: 'post',
        	    				url: '/LineUp/member/cancelBasket',
        	    				data: 'id='+$('#id').val()+'&seq_restaurant='+seq_restaurant,
        	    				success: function() {
        	    					location.href="/LineUp/member/myPage";
        	    				}
        	    				
        	    			});
						}, 2000);
    				     
    				    
    				  }
    				})
    		});
    		
    		/*예약취소 버튼*/
    		
    		$('.cancelReservationBtn').click(function(){
    			seq_restaurant = $(this).find('button').attr('id');
    			
    			Swal.fire({
    				  title: '즉시 예약 취소',
    				  text: "정말로 예약을 취소하시겠습니까?",
    				  icon: 'warning',
    				  showCancelButton: true,
    				  confirmButtonColor: '#3085d6',
    				  cancelButtonColor: '#d33',
    				  confirmButtonText: 'Yes'
    				}).then((result) => {
    				  if (result.value) {
    				    
    				    $.ajax({
            				type : 'post',
            				url : '/LineUp/restaurant/cancelReservation',
            				data : 'id='+$('#id').val()+'&seq_restaurant='+seq_restaurant,
            				dataType : 'text',
            				success : function(data) {
            					/*alert(data);*/
            					if(data=='success') {
            						Swal.fire({
            							  position: 'top',
            							  icon: 'success',
            							  title: '예약 취소',
            							  text: '해당 음식점의 예약을 취소했습니다.',
            							  showConfirmButton: false,
            							  timer: 1500
            							});
            						
            						 setTimeout(function(){
            							 location.href="/LineUp/member/myPage";
            							}, 2000);
            						
            					} else {
            						Swal.fire({
            							  icon: 'error',
            							  title: 'Oops...',
            							  text: '예약을 취소할 수 없습니다',
            							});
            						location.href="/LineUp/member/myPage";
            					}
            				}
            			});
    				  }
    				})
    		});
    		
    		/*예약 모달 벗어나기*/
    		
    		$("#modal-back,#cancle,.delete").click(function(){
    	        $("#reservation_modal").css('display', 'none');
    	        
    	     });
    		
    		/*예약모달 안쪽 최종 예약 버튼*/
    		
    		$('#in_reservationBtn').click(function(){
    			//let seq_restaurant = $('.reservationBtn button').attr('id');
    			$.ajax({
    				type : 'post',
    				url : '/LineUp/restaurant/reservation',
    				data : 'id='+$('#id').val()+'&tel='+$('#reserve_tel').val()+'&howmany='+$('#howmany').val()+'&seq_restaurant='+seq_restaurant,
    				dataType : 'text',
    				success : function(data) {
    					//예약 승인시
    					if(data=="success") {
    						Swal.fire({
    							  position: 'top',
    							  icon: 'success',
    							  title: '즉시 예약 성공',
    							  text: '바로 방문해 예약자 성함을 말씀해주세요!',
    							  showConfirmButton: false,
    							  timer: 1500
    							});
    						setTimeout(function(){
    							location.href="/LineUp/member/myPage";
   							}, 3000);
    						
    					} else {
//    						alert("죄송합니다. 지금은 예약이 불가능합니다.");
    						Swal.fire({
    							  icon: 'error',
    							  title: 'Oops...',
    							  text: '죄송합니다. 지금은 예약이 불가능합니다',
    							});
    						location.href="/LineUp/member/myPage";
    					}
    				}
    			});
    		});
    		
    		$("#category_form #category li").click(function() {
    	        let offset = $("div #scroll" + $(this).val()).offset();
    	        let val;
    	        if ($(this).val() == 1) val = 100;
    	        else if ($(this).val() == 2) val = 500;
    	        else if ($(this).val() == 3) val = 300;
    	        else if ($(this).val() == 4) val = 300;
    	        else if ($(this).val() == 5) val = 300;
    	        else if ($(this).val() == 6) val = 300;
    	        else if ($(this).val() == 7) val = 300;
    	        
    	        $("#category_form #category li").removeClass();
    	        $("#category_form #category li")
    	            .eq($(this).val() - 1)
    	            .addClass("active");
    	        $("html, body").animate({ scrollTop: offset.top - val }, 400);
    	    });
    		
    		
    	},
    	error : function(e) {
    		console.log(e);
    	}
    	
    });
    
    
    
    
    /* --------------------- 예약 / 찜 / 다녀온 식당 / 리뷰 / 식당 정보 뿌리기 끝   ---------------------- */

    
    
    
    
}); //document.ready 끝

$('#withdrawBtn').click(function(){
  
	$('#pwdInputDiv').empty();
	$('#verifyDel').empty();
  	if($('#pwdInput').val()=="") {
	  	$('#pwdInputDiv').text("비밀번호를 입력하세요.");
	  	$('#pwdInputDiv').css('font-size', '13pt');
	      $('#pwdInputDiv').css('color', 'red');
	      $('#pwdInputDiv').css('margin-top', '-10px');
	      $('#pwdInputDiv').css('width', '300px');
	  } else if($('input[id="withdrawChk"]').is(":checked")==false){

    	Swal.fire({
    		  icon: 'error',
    		  title: 'Oops...',
    		  text: '탈퇴 동의 창을 체크해야만 삭제가 가능합니다.',
    		})
    		
	  } else {
		  $.ajax({
          type: 'POST',
          url: '/LineUp/member/deleteMember',
          data: {"id":$('#id').val(), "pwdInput":$('#pwdInput').val()},
          dataType: 'text',
          success: function(data) {
              if(data=="success") {
                  
                  Swal.fire({
						  position: 'top',
						  icon: 'success',
						  title: '회원 정보를 삭제했습니다.',
						  showConfirmButton: false,
						  timer: 1900
						})
						setTimeout(function(){
							location.href="/LineUp/home/index";
						}, 2000);
                  
              } else if(data=="fail"){
                  $('#pwdInputDiv').text('비밀번호가 일치하지 않습니다.');
                  $('#pwdInputDiv').css('font-size', '13pt');
        	      $('#pwdInputDiv').css('color', 'red');
        	      $('#pwdInputDiv').css('margin-top', '-10px');
        	      $('#pwdInputDiv').css('width', '300px');
              }
          },
          error : function(e) {
        	  console.log(e);
          } 
      });
	  }
});


