<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>restaurant View</title>
        
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
       <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
       <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
       <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css" />
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />
       <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet" />
       <link rel="stylesheet" href="../css/restaurant_View.css" />
       
    </head>
    <body>
        <div id="loadHeader" style="margin-bottom: 50px;"></div>
        
        <input type="hidden" id="seq_restaurant" value="${seq_restaurant}">
        <input type="hidden" id="pg" value="${pg}">
        <input type="hidden" id="member_seq" value="${sessionScope.memDTO_seq }">
        <input type="hidden" id="member_id" value="${sessionScope.memDTO.id}">
        <input type="hidden" id="memberSession" value="${sessionScope.memDTO}">
        
        <section class="hero is-fullheight">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title">
                        레스토랑 뷰
                    </h1>

                    <div class="column is-center">
                        <div class="box">
                            <div class="column is-fullwidth">
                                <article class="media">
                                    <figure class="media-left">
                                        <p class="image is-150x150">
                                            <!-- <img src="http://placehold.it/150x150" /> -->
                                        </p>
                                    </figure>
                                    <!-- //메인 이미지 -->
                                    
                                    <div id="titleRst" class="field">
                                        <h1 class="title"><span id="restaurant_name"></span></h1>
                                        <label class="label is-medium"><span id="category"></span></label>
                                        <label class="label is-medium"><span id="zipcode"></span></label>
                                    </div>
                                    <!-- // -->

                                    <div id="media-right" class="media-right">
                                    	

                                       <div id="score" class="title score0" style="width:250px; height:60px;">
                                            <jsp:include page="../member/star.jsp">
                                                <jsp:param name="width" value="250" />
                                                <jsp:param name="height" value="63" />
                                                <jsp:param name="score" value="${starValue}" />	
                                                <jsp:param name="num" value="0" />
                                                <jsp:param name="cursor_stat" value="1" />
                                            </jsp:include>
                                       </div>
                                        
                                        <div id="fieldGp" class="field is-grouped">
                                            <div class="control">
                                               <c:if test="${owner}">
                                                  <div style="width: 247px" class="tag is-info is-light">등록하신 식당입니다</div>
                                               </c:if>
                                               <c:if test="${owner ne true}">
                                                  <button id="reviewBtn" class="button is-link"><i class="fas fa-comments"></i><span>리뷰쓰기</span></button>
                                                   <button id="basketBtn" class="button is-link"><i class="fas fa-heart"></i><span></span></button>
                                                   <button id="reservationBtn" class="button is-link"><i class="fas fa-location-arrow"></i><span>즉시예약</span></button>
                                               </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- //평점, 버튼들 -->
                                    
                                    
                                </article>
                                <div class="columns">
                                    <div id="columnNa" class="column is-one-quarter"></div>
                                    <div id="column" class="column">
                                        <div class="box">
                                            <div class="content is-medium">
                                                <span>주소 : </span><span id="addr"></span><br />
                                                <span>연락처 : </span><span id="tel"></span> <br />
                                                <span>가게소개 : </span><span id="content"></span> <br />
                                                <!-- <span class="breakTime">점심시간 : </span><span id="">13:00~14:00</span>  <br /> -->
                                            </div>
                                        </div>
                                        <!-- //가게 정보 -->

                                        <div class="box">
                                            <div style="font-weight: 700" id="menubar" class="content is-medium">
                                            
                                            </div>
                                        </div>
                                        <!-- //메뉴 -->

										<div id="map" style="width:1077px; height:350px; margin-bottom:50px"></div>
										<!-- //지도에 위치표시 -->

                                        <div id="${seq_restaurant}" class="carousel-wrap sub_img">
                                        	<div id="a" style="width: 1000px; left: -180px;" class="owl-carousel">
                                            </div>
                                        </div>
                                        <!-- //이미지 슬라이드 -->
                                        
                                        <!-- 리뷰시작 -->
										<h1 class="title is-size-5">리뷰</h1>
                                       <div id="Restaurant_review_start">
											<!-- <div class="box" id="noreview" style="background-color:#ff7979; font-size: 28px;color:white; font-family: 'Jua', sans-serif;">아직 리뷰가 없습니다! 첫 리뷰를 작성해주세요</div> -->
									   </div>
										<!-- 리뷰 끝 -->
										
									<!-- 리뷰(2개이상일경우) -->
									<div id="rvList"></div>
									
									<!-- 슬라이드 버튼 -->
									<div id="slidebtn"></div>
																		
									</div>
									</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <a id="backToTop" class="scrolltop" href="#">
            <i class="fas fa-chevron-circle-up"></i>
        </a>
        <div id="loadFooter" style="margin-top: 50px;"></div>
    </body>


<!-- 이미지 모달 -->
    <div id="kk">
        <div id="imageModal" class="modal"> 
            <div class="modal-background"></div>
            <div class="modal-content">
                <p class="image">
                    <img width="max-content" src="" class="icon_img" />
                </p>
            </div>
            <button class="modal-close is-large" aria-label="close"></button>
        </div>
    </div>
<!-- 이미지 모달 끝 -->

<!-- 예약 모달 -->
 <div id="reservation_modal">
	<div id="reserveModal" class="modal">
	      <div id="modal-back" class="modal-background"></div>
	      <div class="modal-card">
	         <header class="modal-card-head">
	            <p class="modal-card-title">Reservation</p>
	            <button type="button" class="delete" aria-label="close"></button>
	         </header>
	         <section class="modal-card-body" style="padding:0%">
	            <section class="section" style="padding:0%">
	            <div class="container">
	                <div class="column is-center">
	                <!-- 예약 form 시작 -->
	                    <form class="box" style="width: 100%; height:100%">
	                        <div class="field">
	                            <label class="label">Nickname</label>
	                            <span style="margin-left:-1px;" id="reserve_nick" >${memDTO.real_name }</span>
	                        </div>
	                        <br>
	                        <div class="field">
	                            <label class="label">Phone Number</label>
	                            <input type="text" id="reserve_tel" class="input is-rounded" value="${memDTO.tel }" />
	                        </div>
	                        <div id="reserve_telDiv"></div>
	                        <br>
	                        <div id="re" class="field">
	                            <label class="label">Number of people to book</label>
	                            <div class="select">
	                                <select name="howmany" id="howmany">
	                                    <option value="1">1</option>
	                                    <option value="2">2</option>
	                                    <option value="3">3</option>
	                                    <option value="4">4</option>
	                                    <option value="5">5</option>
	                                    <option value="6">6</option>
	                                    <option value="7">7</option>
	                                    <option value="8">8</option>
	                                    <option value="9">9</option>
	                                    <option value="10">10</option>
	                                    <option value="11">11+</option>
	                                </select>
	                            </div>
	                            <br><br>
	                            <div id="ab">
	                                <button type="button" id="in_reservationBtn" class="button is-warning">Reservation</button>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        	</section>
	         </section>
	      </div>
	</div>
</div>
<!-- 예약 모달 끝 -->

<!-- 리뷰하기 모달 시작 -->
<div id="reviewModal" class="modal">
      <div id="modal-back" class="modal-background"></div>
      <div class="modal-card">
         <header class="modal-card-head">
            <p class="modal-card-title">review</p>
            <button class="delete" aria-label="close"></button>
         </header>
         <section class="modal-card-body">
            <div id="score" class="score" style="width: 150px; height: 50px;">
               <jsp:include page="../member/reviewForm_star.jsp">
                  <jsp:param name="r_width" value="150" />
                  <jsp:param name="r_height" value="40" />
                  <jsp:param name="r_score" value="0" />
                  <jsp:param name="r_num" value="1" />
                  <jsp:param name="r_cursor_stat" value="5" />
               </jsp:include>
               
   			<!-- 리뷰 FORM 시작 -->
   			<form id="reviewForm">
               <input name="score" id="review_score" type="hidden" value="">
               <input name="seq_restaurant" type="hidden" value="${seq_restaurant}">
	            </div>
	            <div id="subject" class="field">
	               <label class="label">Subject</label>
	               <div class="control has-icons-left has-icons-right">
	                  <input class="input is-danger" type="text" placeholder="Subject input" name="subject" /> 
	                  <span class="icon is-small is-left"> 
	                     <i class="fas fa-envelope"></i>
	                  </span>
	               </div>
	            </div>
	
	            <div class="field">
	               <label class="label">Img</label>
	               <div class="file is-info has-name">
	                  <label class="file-label"> <input multiple="multiple" class="file-input" type="file" name="multi[]" /> 
		                  <span class="file-cta"> 
			                  <span class="file-icon"> 
			                  	<i class="fas fa-upload"></i>
			                  </span> 
			                  <span class="file-label"> Info file… </span>
		                  </span> 
		                  <span class="file-name"></span>
	                  </label>
	               </div>
	            </div>
	
	            <div class="field">
	               <label class="label">Message</label>
	               <div class="control">
	                  <textarea class="textarea" placeholder="Textarea" name="content"></textarea>
	               </div>
	            </div>
   			</form>

            <div class="field is-grouped">
               <div class="control">
                  <button id="reviewSubmit" class="button is-link">Submit</button>
               </div>
               <div class="control">
                  <button id="cancle" class="button is-link is-light">Cancel</button>
               </div>
            </div>
         </section>
      </div>
</div>
<!-- 리뷰 모달 끝 -->

</body>
<script type="text/javascript" 	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	/* 찜 기능 스크립트 */
	var basketCheck = 0;
	 $('#basketBtn').click(function(){
		basketCheck = basketCheck+1;
		
		if(basketCheck == 1) {
			$.ajax({
				type: 'post',
				url: '/LineUp/restaurant/getIntoBasket',
				data: 'seq_restaurant='+$('#seq_restaurant').val()+'&seq_member='+$('#member_seq').val(),
				success: function() {
			     	Swal.fire({
		     		  position: 'top-end',
		     		  icon: 'success',
		     		  title: '레스토랑을 찜했습니다!',
		     		  showConfirmButton: false,
		     		  timer: 1500
		     		});
				},
				error: function() {
					Swal.fire({
					  icon: 'error',
					  title: '찜할 수 없습니다',
					  text: '로그인 해주세요'
					});
				}
			});
		} else {
				Swal.fire({
				  icon: 'error',
				  title: '찜할 수 없습니다',
				  text: '이미 찜한 식당입니다'
				});
			}
		}
     );
	 
	 /* 예약 기능 스크립트 */
	 $('#reservationBtn').click(function(){
		
		var phoneCheck = "0";
		
		if($('#memberSession').val() == '') {
			 Swal.fire({
				  icon: 'error',
				  title: '먼저 로그인 해주세요',
				  footer: '<a href="/LineUp/member/loginForm">로그인 하기</a>'
			})
		 } else {
			$('#reserveModal').addClass('is-active');
			
			
			$('#reserve_telDiv').text('정확한 전화번호를 입력해주세요. 확인문자가 발송됩니다')
			$('#reserve_telDiv').css('margin-left', '17px');
			$('#reserve_telDiv').css('margin-top', '-7px');
			
			$('#reserve_tel').focusout(function(){
				if($('#reserve_tel').val()==''){
					$('#reserve_telDiv').text('전화번호를 입력해주세요');
					$('#reserve_telDiv').css('margin-left', '17px');
					$('#reserve_telDiv').css('margin-top', '-7px');
				} else {
					var reg = $('#reserve_tel').val().split('-').join('');
					var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
					if(regPhone.test(reg) == false) {
						$('#reserve_telDiv').text('전화번호 양식에 맞춰서 입력해주세요 (010-xxxx-xxxx)');
						$('#reserve_telDiv').css('margin-left', '17px');
						$('#reserve_telDiv').css('margin-top', '-7px');
					} else {
						$('#reserve_telDiv').text('전화번호 양식에 맞게 입력하셨습니다.');
						$('#reserve_telDiv').css('margin-left', '17px');
						$('#reserve_telDiv').css('margin-top', '-7px');
						
						phoneCheck = "1";
					}
				}
				
			});
			
			$('#in_reservationBtn').click(function(){
				if(phoneCheck == "1") {
					$.ajax({
						type: 'post',
						url: '/LineUp/restaurant/reservation',
						data: 'id='+$('#member_id').val()+'&tel='+$('#reserve_tel').val()+'&howmany='+$('#howmany').val()+'&seq_restaurant='+$('#seq_restaurant').val(),
						success : function(data) {
	    					if(data=="success") {
	    						Swal.fire({
	   				     		  position: 'top-end',
	   				     		  icon: 'success',
	   				     		  title: '예약성공!',
	   				     		  showConfirmButton: false,
	   				     		  timer: 1500
	   				     		});
	    						
	    						setTimeout(function(){
	    							var messagebody = $('#restaurant_name').text()+'에 예약되었습니다. LineUp을 이용해주셔서 감사합니다';
		    						var adminTel = '01063568057'; 
		    						location.href = '/LineUp/sendMessage/sendSms?reserved_tel='+$('#reserve_tel').val()+'&adminTel='+adminTel+'&messagebody='+messagebody;	
	    						}, 1500);
	    						
	    						location.replace = 'LineUp/home/index';
	    					} else {
	    						Swal.fire({
	   							  icon: 'error',
	   							  title: '예약할 수 없습니다',
	   							  text: '이미 한개 이상의 식당에 예약했습니다'
	   							});
	    					}
	    				},
	    				error : function(){
	    					Swal.fire({
							  icon: 'error',
							  title: '예약할 수 없습니다',
							  text: '이미 예약한 식당입니다'
							});
	    				}
					});
				} else { //phone check
					Swal.fire({
						  icon: 'error',
						  title: '전화번호 양식에 맞게 입력해주세요',
					});
				} 
			});
		 }
	 });
	 
	/* 리뷰모달 스크립트 */
	 $('#reviewBtn').click(function() {
		 if($('#memberSession').val() == '') {
			 Swal.fire({
			  icon: 'error',
			  title: '먼저 로그인 해주세요',
			  footer: '<a href="/LineUp/member/loginForm">로그인 하기</a>'
			});
		 } else if($('#memberSession').val() != '') {
			//리뷰모달 띄우기
			$('#reviewModal').addClass("is-active");
			$('button.delete').click(function(){
				$('#reviewModal').removeClass("is-active");	
			});
			
			var val=$(this).attr('class');
			$('#review_score').val(val);

		 }
	});
	
	/* 리뷰하기 기능  */
	 $('#reviewSubmit').click(function() { //review 모달의 Submit버튼을 눌렀을때 <start>
	 //이전에 예약했는지 확인
	 $.ajax({
		 type: 'post',
		 url: '/LineUp/member/hadReserved',
		 data: 'seq_restaurant='+$('#seq_restaurant').val()+'&seq_member='+$('#member_seq').val(),
		 success: function(data) {
			 if(data=='no_reserved') {
				 Swal.fire({
				  icon: 'error',
				  title: '아직 가게를 예약하지 않았습니다!',
				});
				 
				setTimeout(function (){
					$('.modal-background').trigger('click');
					$('#reservationBtn').trigger('click');	
				}, 1000);
				
				 
			 } else if(data=='reserved'){
				 let formData = new FormData($('#reviewForm')[0]);
		         $.ajax({
		             type: 'post',
		             enctype: 'multipart/form-data',
		             data: formData,
		             url: '/LineUp/restaurant/register_review',
		             processData: false,
		             contentType: false,
		             success: function () {
		           		 Swal.fire({
			     		  position: 'top-end',
			     		  icon: 'success',
			     		  title: '리뷰가 성공적으로 등록되었습니다',
			     		  showConfirmButton: false,
			     		  timer: 1500
			     		});
		             },
		             error : function() {
		            	 alert("review register error");
		             }
		             
				});
			 }
		 },
		 error: function() {
			 alert('reserved checking error');
		 }
	 });
	 
	}); //review 모달의 Submit버튼을 눌렀을때 <end>
	</script>

	
	<script src="../js/bulma-carousel.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67173284c36beba07df12fd9dbaa98a2&libraries=LIBRARY"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67173284c36beba07df12fd9dbaa98a2&libraries=services,clusterer,drawing"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/owl.carousel.min.js"></script>
	<script src="../js/restaurant_View.js"></script>

</html>