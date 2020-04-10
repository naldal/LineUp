<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap"	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
<link rel="stylesheet" href="../css/store_information_management.css" />
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css" />
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript"	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/store_information_management.js"></script>

<body>
	<div id="loadHeader"></div>
	<div id="wrap" class="modal_event">
		<div id="category_form">
			<div class="category_div">
				<ul class="category" id="category">
					<li id="s1" class="active" value="1">가게정보 수정</li>
					<li id="s2" value="2">예약관리</li>
					<li id="s3" value="3">나의 가게 리뷰 확인</li>
				</ul>
			</div>
		</div>
		<section class="hero is-fullheight">
			<div class="hero-body">
				<div class="container">
				
					<h1 class="title">가게정보관리 페이지</h1>
					<!-- //가게정보관리 페이지 -->

					<div class="column is-center">
						<div class="column is-four-fifths box" style="padding:30px 80px;">

								<h3 id="scroll1" class="title">가게정보 수정</h3>
								<div class="field">
									<label for="" class="label">가게이름</label> <input
										id="restaurant_name" name="restaurant_name" class="input is-rounded" type="text" required />
								</div>
								<div id="restaurant_nameDiv"></div>
								<!-- //가게이름 -->

								<label class="label">가게주소</label>
								<div class="field has-addons">
									<p class="control">
										<input id="restaurant_zipcode" name="restaurant_zipcode" class="input is-rounded" type="text" />
									</p>
									<p class="control">
										<a  id="addrBtn" onclick="execPostCode()" class="button is-rounded"> 우편번호조회 </a>
									</p>
								</div>
								<div class="field">
									<input id="restaurant_addr" name="restaurant_addr" class="input is-rounded" type="text"/>
								</div>
								<!-- //가게주소 -->

								<label class="label">대표자</label>
								<div class="field">
									<input id="restaurant_real_name" name="restaurant_real_name" class="input is-rounded is-success" type="text"
										value="홍길동"  readonly="readonly" />
								</div>
								<!-- //대표자 -->

								<label class="label">사업자등록번호</label>
								<div class="field">
									<input id="restaurant_company_num" name="restaurant_company_num" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										class="input is-rounded is-success" type="text"
										value="94677410415" readonly="readonly" />
								</div>
								<!-- 사업자등록번호 -->

								<label class="label">전화번호</label>
								<div class="field has-addons">
									<p class="control">
										<a class="button is-static is-rounded"> +82 </a>
									</p>
									<p class="control is-expanded">
										<input onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"class="input is-rounded" type="text" id="restaurant_tel" name="restaurant_tel"	required />
									</p>
								</div>
								<!-- 전화번호 -->

								<label class="label">카테고리</label>
								<div class="field">
									<div class="field-body">
										<div class="field is-narrow">
											<div class="controll">
												<div class="select">
													<select id="restaurant_category" name="category">
														<option value="한식">한식</option>
														<option value="일식">일식</option>
														<option value="중식">중식</option>
														<option value="양식">양식</option>
														<option value="분식">분식</option>
														<option value="동남아">동남아</option>
														<option value="패스트푸드">패스트푸드</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 카테고리 -->

								<label class="label is-menu">메뉴등록(버튼을 눌러 메뉴를 추가하세요)</label>
								<div id="menupan-table">
									<table class="table">
										<thead>
											<tr>
												<th width="200px">메뉴이름</th>
												<th width="200px">가격</th>
												<th width="100px">VEGAN</th>
												<th width="100px">SPICY</th>
												<th >
													<span class="icon has-text-success">
														<a id="add_rows">
															<i class="fas fa-plus-circle"></i>
														</a>
													</span>
												</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
									
								</div>
								<!-- //메뉴 -->

								<label class="label" style="margin-top:40px; ">메인사진</label>
								<div class="file is-primary has-name" style="width:420px;">
									<label class="file-label"> <input id="img_main" name="img_main" class="file-input" accept=".jpg,.jpeg,.png,.gif,.bmp"
										type="file" > <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-upload"></i>
										</span> <span class="file-label"> Choose a file… </span>
									</span> <span class="file-name"> 가게를 대표할 사진을 올리세요 </span>
									</label>
								</div>
								<div id="main_img" style="margin-top:15px">
									<figure class="image is-150x150">

									</figure>
								</div>
								<!-- //메인사진 -->

								<label class="label" style="margin-top:30px;">서브사진</label>
								<div class="field">
									<div id="subimg" class="file is-warning has-name">
										<label class="file-label"> <input multiple="multiple" class="file-input" accept=".jpg,.jpeg,.png,.gif,.bmp"
											id="img_sub" type="file" name="img_sub[]"> <span class="file-cta">
												<span class="file-icon"> <i class="fas fa-upload"></i>
											</span> <span class="file-label"> Choose a file… </span>
										</span> <span class="file-name"> 가게 내부나 음식사진을 올리세요 </span>
										</label>
									</div>
								</div>
								<div id="sub_img">
									
								</div>
								<div class="field is-grouped is-grouped-right">
									<p class="control">
										<a id="restaurant_update" class="button is-primary"> 가게수정 </a>
									</p>
									<p class="control">
										<a id="restaurant_delete"class="button is-light"> 가게삭제 </a>
									</p>
								</div>
						<!-- //등록 취소 버튼 -->

						</div>
						<div>
							<form action="" class="box" style="width:80%;">
								<h3 id="scroll2" style="font-weight: 800;" class="subtitle">예약관리</h3>
								<div class="field">
									<div id="date-form" style="margin-bottom: 20px;"
										class="control">
										<img class="previous-day" src="../img/꺽쇠2.png" width="30px"
											height="30px" style="float: left"> <input id="date"
											class="input is-info" type="text" readonly="readonly">
										<img class="next-day" src="../img/꺽쇠1.png" width="30px"
											height="30px" style="float: left">

										<div class="field is-grouped is-grouped-right">
											<p class="control">
												<a id="changeBtn" class="button is-light"> 대기 시작 </a>
											</p>
										</div>
									</div>
									<article class="message">
										<div class="message-header">
											<table>
												<tr>
													<td>고객 성명</td>
													<td>인원수</td>
													<td>휴대폰 번호</td>
													<td>예약 시간</td>
													<td>방문 확인</td>
													
												</tr>
											</table>
										</div>
										<div id="Reservation-Management">
											<!-- 예약한사람들 목록 4명까지보임 -->
										</div>
										<div id="rvList1">
											<!-- 나머지 예약한사람들 목록 숨기 펼치기 -->
										</div>
										<footer id="Reservation-List"> 펼치기 </footer>
									</article>

								</div>

							</form>
							<div>
								<div id="review_box_shadow" class="box" style="width:80%;">
									<h3 id="scroll3" style="font-weight: 800;" class="subtitle">나의
										가게 리뷰 확인</h3>
									<section id="my-restaurang-review-list">
										<div id="reviewList1">
										</div>
										<div id="rvList2">
											
										</div>
										<div id="slidebtn2">
											<button id="sld2" class="button is-info" style="width: 100%;">더보기</button>
										</div>
									</section>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

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
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/owl.carousel.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/restaurantPost.js"></script>
<script src="../js/FileReader.js"></script>
</html>