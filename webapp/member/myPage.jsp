<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>myPage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="../css/myPage.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rubik&display=swap" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <!-- import -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
    <script src="https://use.fontawesome.com/826a7e3dce.js"></script>
    <style>
    	*{
    		font-family: 'Nanum Gothic', sans-serif;
    	}
    </style>
</head>

<body>
    <div id="loadHeader"></div>
	<div id="category_form">
    <div class="category_div">
        <ul class="category" id="category">
            <li id="s1" class="active" value="1">회원정보 수정</li>
            <li id="s2" value="2">나의 예약</li>
            <li id="s3" value="3">찜 리스트</li>
            <li id="s4" value="4">다녀온 식당</li>
            <li id="s5" value="5">나의 리뷰</li>
            <li id="s6" value="6">내가 한 질문</li>
            <li id="s7" value="7">회원 탈퇴</li>
        </ul>
    </div>
    </div>

    <section class="hero is-fullheight modal_event">
        <div class="hero-body">
            <div class="container">
                <h1 class="title" id="scroll1" style="font-weight:bold; background-color: #ced6e0;">회원 정보 수정</h1>
                
                <form class="box" id="userModifyForm">
                    <h4 class="subtitle is-4" id="bs_Account_name">
                    <c:if test="${memDTO.real_name==''} ">
                    ${memDTO.nickname }
                    </c:if>
                    <c:if test="${memDTO.real_name!=''} ">
                    ${memDTO.real_name }
                    </c:if>
                    </h4>
                    <br />

                    <div class="field">
                        <label class="label">Email(ID)</label>
                        <div class="control">
                            <input class="input is-rounded is-primary input_1" name="id" id="id" type="email"
                                value="${memDTO.id }" readonly />
                        </div>
                    </div>
                    <br />
                    <label class="label">전화번호</label>
                    <div class="field has-addons">
                        <p class="control">
                            <a class="button is-static is-rounded "> +82 </a>
                        </p>
                        <p class="control is-expanded">
                            <input onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="input is-rounded"
                                name="tel" id="tel" type="text" value="${memDTO.tel }" />
                        </p>
                    </div>
                    <div id="telDiv"></div>
                    <br />

                    <div class="field">
                        <label class="label">기존 비밀번호</label>
                        <p class="control has-icons-left">
                            <input class="input is-rounded is-warning" name="beforePwd" id="beforePwd" type="password" placeholder="기존 비밀번호 입력"
                                required />
                            <span class="icon is-small is-left"> <i class="fas fa-lock"></i> </span>
                        </p>
                    </div>
                    
                    <div id="beforePwdDiv"></div>
                    <br />

                    <div class="field">
                        <label class="label">새 비밀번호 입력</label>
                        <p class="control has-icons-left">
                            <input class="input is-rounded is-danger" name="pwd" id="pwd" type="password"
                                placeholder="수정할 비밀번호 입력" required />
                            <span class="icon is-small is-left"> <i class="fas fa-lock"></i> </span>
                        </p>
                    </div>

                    <div class="field">
                        <p class="control has-icons-left">
                            <input class="input is-rounded is-danger" name="repwd" id="repwd" type="password"
                                placeholder="수정할 비밀번호 재확인" required />
                            <span class="icon is-small is-left"> <i class="fas fa-lock"></i> </span>
                        </p>
                    </div>
                    <div id="pwdDiv"></div>
                    <br />
                    <div class="field is-grouped">
                        <div class="control">
                            <button type="button" class="button is-link" id="userModifyBtn">&nbsp;&nbsp;회원정보수정</button>
                        </div>
                    </div>
                </form>
                
                <br />
                <br />

                <h1 class="title" id="scroll2" style="font-weight:bold; border-radius: 6px; background: linear-gradient(to right,#EAB543,#fff);"><span style="color:white;">&nbsp;&nbsp;나의 예약</span></h1>

                <div>
                    <div class="box" id="reservation_box">
                        <section id="my_reservation_list">
                        
                        <div id="my_reservation_list_show" style="margin-top:6.5px;">
                            	
                        </div>
                        
                            <!-- <div id="reservation_SlideAction">
                                
                            </div> -->
                        </section>
                        <!-- <div id="slidebtn_myreserve">
                            <button id="sld" class="button is-info" style="width: 100%;">더보기</button>
                        </div> -->
                    </div>
                </div>
                <br />
                <br />

                <h1 class="title" id="scroll3" style="font-weight:bold; border-radius: 6px; background: linear-gradient(to right,#55E6C1,#fff);"><span style="color:white;">&nbsp;&nbsp;찜 리스트</span></h1>

                <div>
                    <div class="box" id="my_like_box">
                        <section id="my_like_list">
                            <div class="column is-center" id="my_like_list_id">
                           
                            <div id="my_wish_list_show" style="margin-bottom:24px;">
                            	
                            </div>
                                
                            
							<div id="my_Wish_list_SlideAction">
							
							</div>
                                
                            </div>
                        </section>
                        <div id="slidebtn_like">
                            
                        </div>
                    </div>
                </div>
                <br />
                <br />

                <h1 class="title" id="scroll4" style="font-weight:bold; border-radius: 6px; background: linear-gradient(to right,#3B3B98,#fff);"><span style="color:white;">&nbsp;&nbsp;다녀온 식당</span></h1>

                <div>
                    <div class="box" id="after_box">
                        <section id="after_list" style="line-height: 15px;">
                            <div class="column is-center">
                            	<div id="visited_list_show">
                            	
                            	</div>

                                <div id="restaurant_visited_SlideAction">
                                    
                                </div>
                            </div>
                        </section>
                        <div id="slidebtn_after">
                            
                        </div>
                    </div>
                </div>
                <br />
                <br />

                <h1 class="title" id="scroll5" style="font-weight:bold; border-radius: 6px; background: linear-gradient(to right,#FD7272,#fff);"><span style="color:white;">&nbsp;&nbsp;나의 리뷰</span></h1>

                <div>
                    <div class="box">
                        <section id="my-restaurang-review-list">
                        	<div id="my_review_list_show">
                        	
                        	</div>
                            <div id="my_review_SlideAction">
                                
                    		</div>
    </section>
    <div id="slidebtn_review">
        
    </div>
    </div>
    </div>
    <br />
    <br />

    <h1 class="title" id="scroll6" style="font-weight:bold; border-radius: 6px; background: linear-gradient(to right,#ced6e0,#fff);"><span style="color:white;">&nbsp;&nbsp;내가 한 질문</span></h1>

    <div>
        <div class="box" id="question_box">
            <section id="my_question_list">
            
            	<div id="my_qna_list_show" style="margin-bottom:24px;">
            	
            	</div>
         
                <div id="question_SlideAction">
                    
                </div>
            </section>
            <div id="slidebtn_question">
                
            </div>
        </div>
    </div>

    <br />
    <br />

    <h1 class="title" id="scroll7" style="font-weight:bold;border-radius: 6px; background: linear-gradient(to right,#e74c3c,#fff);"><span style="color:white;">&nbsp;&nbsp;회원 탈퇴</span></h1>

    <!-- <div class="field">
					<label class="label">비밀번호 입력</label>
					<p class="control has-icons-left">
						<input class="input is-rounded is-warning" type="password"
							placeholder="비밀번호 입력" required> <span
							class="icon is-small is-left"> <i class="fas fa-lock"></i>
						</span>
					</p>
				</div> -->
    <div>
        <div class="box" id="dropout_box">
            <table id="dropTable">
                <tr>
                    <td style="line-height: 40px;" width="130" ;>
                    <label class="label">비밀번호 입력</label></td>
                    <td>
                    	<input id="pwdInput" class="input is-rounded is-warning" type="password" style="width: 450px !important;" placeholder="비밀번호 입력"/>
                    	<br><br>
                    	<div id="pwdInputDiv" ></div>
                    </td>
                    
                </tr>
        
                <tr>
                    <td class="dropTd" colspan="2">
                        <br />
                        <br />
                        <label class="checkbox">
                            <input id="withdrawChk" type="checkbox" /> 탈퇴하시면 계정이 완전히 사라집니다.<br />
                            	탈퇴하시겠습니까?
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="dropTd" colspan="2">
                        <br />
                        <button type="button" id="withdrawBtn" class="button is-danger"><span style="color:white;">회원 탈퇴</span></button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </div>
    </div>
    </section>

    <!-- modal -->
    <div id="kk">
        <div class="modal">
            <div class="modal-background"></div>
            <div class="modal-content">
                <p class="image is-1by1">
                    <img src="" class="icon_img" />
                </p>
            </div>
            <button class="modal-close is-large" aria-label="close"></button>
        </div>
    </div>
    
    <div id="loadFooter"></div>
    
    <div id="review_modal"class="modal">
		<div id="modal-back" class="modal-background"></div>
		<div class="modal-card">
			<header class="modal-card-head">
				<p class="modal-card-title">review</p>
				<button type="button" class="delete" aria-label="close"></button>
			</header>
			<section class="modal-card-body">
				<div id="score" class="score" style="width: 150px; height: 50px;">
               <jsp:include page="../member/reviewForm_star.jsp">
                  <jsp:param name="r_width" value="150" />
                  <jsp:param name="r_height" value="40" />
                  <jsp:param name="r_score" value="0" />
                  <jsp:param name="r_num" value="0" />
                  <jsp:param name="r_cursor_stat" value="5" />
               </jsp:include>
               
               <!-- 리뷰 FORM 시작 -->
               <form id="reviewForm">
					<input name="score" id="review_score" type="hidden" value="">
					<input id="seq_restaurant" name="seq_restaurant" type="hidden" value="">
				</div>
				<div class="field">
					<label class="label">Subject</label><div id="subjectDiv"></div>
					<div class="control has-icons-left has-icons-right">
						<input id="subject" name="subject" class="input is-danger" type="text" placeholder="Subject input" value="" />
						<span class="icon is-small is-left"> 
							<i class="fas fa-envelope"></i>
						</span>
					</div>
				</div>

				<div class="field">
					<label class="label">Img</label>
					<div class="file is-info has-name">
						<label class="file-label"> <input multiple="multiple" class="file-input" type="file" name="img[]" id="image" />
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
					<div id="contentDiv"></div>
					<div class="control">
						<textarea id="content" name="content" class="textarea" placeholder="Textarea"></textarea>
					</div>
				</div>
			</form>
				<div class="field is-grouped"> 
					<div class="control">
						<button type="button" class="button is-link" id="reviewSubmit">Submit</button>
					</div>
					<div class="control">
						<button type="button" id="cancle" class="button is-link is-light">Cancel</button>
					</div>
				</div>
			</section>
		</div>
</div>

<!-- reservation modal -->
<div id="reservation_modal"class="modal">
	<form>
		<div id="modal-back" class="modal-background"></div>
		<div class="modal-card">
			<header class="modal-card-head">
				<p class="modal-card-title">Reservation</p>
				<button type="button" class="delete" aria-label="close"></button>
			</header>
			<section class="modal-card-body">
					
				<section class="section">
            <div class="container">
                <div class="column is-center">
                    <form class="box" style="width: 40%;">
                        <div class="field">
                            <label for="" class="label">Nickname</label>
                            <span style="margin-left:10px;" id="reserve_nick">${memDTO.nickname }</span>
                        </div>
                        <br>
                        <div class="field">
                            <label for="" class="label">Phone Number</label>
                            <input type="text" id="reserve_tel" class="input is-rounded" value="${memDTO.tel }" />
                        </div>
                        <br>
                        <div id="re" class="field">
                            <label for="" class="label">Number of people to book</label>
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

				<!-- <div class="field is-grouped">
					<div class="control">
						<button class="button is-link">Submit</button>
					</div>
					<div class="control">
						<button type="button" id="cancle" class="button is-link is-light">Cancel</button>
					</div>
				</div> -->
			</section>
		</div>
	</form>
</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/js/bulma-carousel.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/myPage.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/owl.carousel.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	
	
	$("#kk img").click(function(){
		$("#kk .modal").removeClass("is-active");
	});
	
	/* Review button============================= */

 	$("#ll #reviewBtn").click(function(){
		$("#ll .modal").addClass("is-active");
	});
	
	$("#ll .modal-close").click(function(){
		$("#ll .modal").css('display', 'none');
		
	});
	
	/* Reservation button=========================== */
	/* $('#reservation_modal #reservationBtn').click(function(){
		$('#reservation_modal .modal').addClass("is-active");
	});
	
	$('#reservation_modal .modal-close').click(function(){
		$('#reservation_modal .modal').css('display', 'none');
	}); */
	
});




</script>


</html>