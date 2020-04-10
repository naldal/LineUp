<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>레스토랑 리스트</title>
<link rel="stylesheet" href="../css/category.css" />
<link rel="stylesheet" href="../css/restaurantList.css" />
<link rel="stylesheet" href="../css/listTop.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<!-- import -->
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>	
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
</head>
<body>
		<input type="hidden" id="pg1" name="pg" value="${pg }">
		<input type="hidden" id="searchOption1" name="searchOption" value="${searchOption }">
		<input type="hidden" id="searchText1" name="searchText" value="${searchText }">
		<input type="hidden" id="vegan1" name="vegan" value="${vegan }">
        <input type="hidden" id="member_seq" value="${sessionScope.memDTO_seq }">
        <input type="hidden" id="member_id" value="${sessionScope.memDTO.id}">
        <input type="hidden" id="memberSession" value="${sessionScope.memDTO}">
        
	<div id="loadHeader"></div>
	<div id="search-close"
		style="width: 100%; height: 100%; position: absolute; display: none;"></div>
	<br />
	<br />
	<h2 align="center" id="top">Click the location and What you want to eat!</h2>
	<br>

	<div id="panel-block">
		
		
		
		<div style="position: relative;">		 
		<p id="search_click" class="control has-icons-left">
			<input class="input is-warning" id="searchText" name="searchText" type="text" placeholder="Search" />
			<span class="icon is-left"> 
			<i class="fas fa-search" aria-hidden="true"></i>
			</span>
		</p>

			<div style="position: absolute; left:-20%; top:0">
				<select name="searchOption" id="searchOption">
					<option value="">Options
					<option value="addr" >Location
					<option value="restaurant_name" >Restaurants
					<option value="category" >Category
				</select>
			</div>
				
			<div id="searchBtnDiv" style="position:absolute; right:-12%; top:0%">
				<button id="searchBtn" class="button is-primary" style="border-radius: 5px" onclick="searchBtn()">Enter! </button>
			</div>
			<div id="search-list"></div>

		</div>
		

	</div>
		<br>
	    <div class="vegan">
        <p>
            Are you Vegan?&nbsp;&nbsp; 
            <input type="radio" id="vegan" name="vegan" value="veganYes">yes&nbsp;&nbsp; 
            <input type="radio"  id="vegan" name="vegan" value="veganNo" checked> no
        </p>
    </div>

	<div class="flex_container">
		<div class="box">
			<div class="content">
				<p>
					<strong style="color: #0c2461;">Leisure</strong><br /> <br />
					What is this life if, full of care, We have no time to stand and
					stare. ​ No time to stand beneath the boughs And stare as long as
					sheep or cows. ​ No time to see, when woods we pass, Where
					squirrels hide their nuts in grass. ​ No time to see, in broad day
					light, Streams full of stars, like skies at night. ​ No time to
					turn at beauty's glance, And A poor life this if, full of care, We
					have no time to stand and stare. watch her feet, how they can
					dance.
				</p>
			</div>
		</div>

		<div class="box" id="slides1" style="padding: 0;">
			<div class="content" class="slide1">
				<img src="../img/listpic1.jpg" id="pic1" alt="" />
			</div>
		</div>
	</div>
	<div class="flex_container2">
		<div class="box" id="slides2" style="padding: 0;">
			<div class="content" class="slide2">
				<img src="../img/listpic2.jpg" id="pic2" alt="" />
			</div>
		</div>
		<div class="box">
			<div class="content">
				<p>
					<strong>Elizabeth Browning</strong><br /> <br /> How do I love
					thee? Let me count the ways. I love thee to the depth and breadth
					and height My soul can reach, when feeling out of sight For the
					ends of Being and ideal Grace. I love thee to the level of
					everyday's Most quiet need, by sun and candle-light. I love thee
					freely, as men strive for Right; I love thee purely, as they turn
					from Praise. I love thee with the passion put to use In my old
					griefs, and with my childhood's faith. I love thee with a love I
					seemed to lose With my lost saint - I love thee with the breath,
					Smiles, tears, of all my life! - and if God choose, I shall but
					love thee better after death.
				</p>
			</div>
		</div>
	</div>
	<!-- //top pics and texts -->

	<section class="dinner-menu">
	<c:set var="index" value="0"/>
		<c:forEach var="row" items="${restaurantList }" varStatus="i">
		   <input name="seq_restaurant" id="seq_restaurant" type="hidden" value="${row.seq_restaurant}">
		
		<div class="practice" align="center">
			<ul class="practice2">
				<li class="practice_li">
					<img src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/${row.main_img }" />
					<div class="box">
						<div style="text-align: left; color:#555 ; margin-top:10px; font-weight: bold; font-size: 30px !important;">
							<a style="font-family: 'Gothic A1', sans-serif; transition:0.5s" href="detailRestaurant?pg=${pg }&seq_member=${row.seq_member }&seq_restaurant=${row.seq_restaurant}&company_num=${row.company_num}">${row.restaurant_name }</a>
							<div class="score_form score${i.count-1}" style="float: right ; width: 155px; height: 50px; margin-top:-52px">

								<jsp:include page="../member/star.jsp">
									<jsp:param name="width" value="150"/>
									<jsp:param name="height" value="50"/>
									<jsp:param name="score" value="${row.score }" />
									<jsp:param name="num" value="${i.count-1}" />
									<jsp:param name="cursor_stat" value="0" />
								</jsp:include>
							</div>
						</div>
						<p style="margin-left: 17px">레스토랑 ${row.category }</p>
						<p style="margin-left: 16px; maring-top: 15px; font-size: 16px">${row.addr }<br>${row.zipcode }<br>${row.tel }</p>
                     <button style="background-color:#ff5e57; margin-top:-45px;height:38px;margin-right:7px;width:144px" id="${row.seq_restaurant}" class="button is-link reservationBtn" style="top:11%">
                     	<i class="fas fa-location-arrow"></i>
                     	<span>즉시예약</span>
                     </button>
					</div>
				</li>
			</ul>
		</div>
		
		<!-- 예약 모달 -->
 <div id="reservation_modal" class="reservation_modal">
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
		</c:forEach>
		
	</section>
	<div><a id="TopButton" class="ScrollButton TopButton" href="#loadHeader"><button class="button is-primary"  ">⬆</button></a></div>
	<div><a id="BottomButton" class="ScrollButton BottomButton" href="#loadFooter" ><button class="button is-primary"  ">⬇</button></a></div>

	                

	<div style="height: 100px; margin: 0 auto; width:200px;">
		${restaurantPaging.pagingHTML }
	</div>
			<div align="center" id="restaurantPaging"></div>
	<div id="loadFooter"></div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 
<!-- 	<script src="../js/restaurant_View.js"></script> -->
	<script src="../js/bulma-carousel.min.js"></script>

	<script type="text/javascript" src="../js/restaurantList.js"></script>
	<a id="footer"></a>
</body>
<script type="text/javascript" src="../js/restaurantList.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	//Swal.fire('Any fool can use a computer')
 	$('#pg').val('${param.pg}');
	$('#searchOption').val('${param.searchOption}');
	$('#searchText').val('${param.searchText}'); 
	
	$('#searchBtn').trigger('click');
	
	$(".TopButton").click(function() {
  	  // $("body").scrollTop(0);
		alert("top");
         $('html').animate({scrollTop : 0}, 200);
     });
  
     $(".BottomButton").click(function() {
  	  // $("body").scrollTop($(document).height());
		
         $('html').animate({scrollTop : ($('#footer').offset().top)}, 200);
     });
	
	 /* 예약 기능 스크립트 */
	 
	 $('#modal-back').click(function(){
		 $('#reserveModal').removeClass('is-active');
	 })
	 
	 $('.reservationBtn').click(function(){
		var seq_restaurant = $(this).attr('id');
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
						$('#reserve_telDiv').text('전화번호 양식에 맞춰서 입력해주세요 (010-xxxx-xxxx 혹은 010xxxxxxxx)');
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
						data: 'id='+$('#member_id').val()+'&tel='+$('#reserve_tel').val()+'&howmany='+$('#howmany').val()+'&seq_restaurant='+seq_restaurant,
						success : function(data) {
	    					if(data=="success") {
	    						Swal.fire({
	   				     		  position: 'top-end',
	   				     		  icon: 'success',
	   				     		  title: '예약성공!',
	   				     		  showConfirmButton: false,
	   				     		  timer: 1500
	   				     		});
	    						/* location.href="/LineUp/member/myPage"; */
								var messagebody = $('#restaurant_name').text()+'에 예약되었습니다. LineUp을 이용해주셔서 감사합니다';
	    						var adminTel = '01063568057'; 
	    						location.href = '/LineUp/sendMessage/sendSms?reserved_tel='+$('#reserve_tel').val()+'&adminTel='+adminTel+'&messagebody='+messagebody;
	    						
	    						
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
	 
	 
     
 
       $(window).scroll(function() {
           if ($(this).scrollTop() > 600) {
               $('.ScrollButton').fadeIn();
           } else {
               $('.ScrollButton').fadeOut();
           }
       }); 
           
       
}); 
</script>
</html>
