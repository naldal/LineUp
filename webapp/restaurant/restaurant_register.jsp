<%@ page language="java" pageEncoding="UTF-8"%>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>restaurant registration</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css" />

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi|Rubik&display=swap&subset=korean" rel="stylesheet">

<!-- relavent css -->
<link rel="stylesheet" href="../css/restaurant_register.css">

<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/owl.carousel.min.js"></script>
<script src="https://use.fontawesome.com/826a7e3dce.js"></script>
</head>

<body>
	<div id="loadHeader" style="margin-bottom: 50px;"></div>
	<div id="sessionValue" style="display: none" value="${memDTO }"></div>
	
	<section class="hero is-fullheight">
		<div class="hero-body">
			<div class="container">
				<h1 class="title" style="font-family: Nanum Gothic, sans-serlf;">
					가게등록 페이지</h1>
				<!-- //제목 -->
				<div class="box" style="padding-left: 80px;">
					<div class="column is-center">
						<div class="column is-four-fifths">
							<form id="restaurnat_reigster_form" method="post"
								enctype="multipart/form-data">
								<div class="field">
									<label for="" class="label">가게이름</label> <input
										class="input is-rounded" type="text" name="restaurant_name"
										id="restaurant_name"
										placeholder="Type here your restaurant's name"  value="에슐리" required />
									<div id="restaurant_name_Div"></div>
								</div>
								<!-- //가게이름 -->

								<label class="label">가게주소</label>
								<div class="field has-addons">
									<!-- zipcode input -->
									<p class="control">
										<input id="zipcode" name="zipcode" class="input is-rounded"
											type="text" placeholder="Type here your address" />
									</p>
									<p class="control">
										<a id="addrBtn" onclick="execPostCode()"
											class="button is-rounded"> 우편번호조회 </a>
									</p>
								</div>
								<!-- addr -->
								<div class="field">
									<input id="addr" name="addr" class="input is-rounded"
										type="text" placeholder="detail address" />
								</div>
								<div id="addr_Div"></div>
								<!-- //가게주소 -->

								<label class="label">대표자</label>
								<div class="field">
									<input class="input is-rounded is-success"
										value="${memDTO.real_name}" type="text" name="real_name"
										id="real_name" placeholder="Type representative's name"
										readonly="readonly" required />

								</div>
								<!-- //대표자 -->

								<label class="label">사업자등록번호</label>
								<div class="field">
									<input onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										class="input is-rounded is-success" type="text"
										id="company_num" name="company_num"
										value="${memDTO.company_num}"
										placeholder="Type your corporate registration number"
										readonly="readonly" required />

								</div>
								<!-- //사업자등록번호 -->

								<label class="label">전화번호</label>
								<div class="field has-addons">
									<p class="control">
										<a class="button is-static is-rounded"> +82 </a>
									</p>
									<p class="control is-expanded">
										<input onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
											id="tel" name="tel" class="input is-rounded" type="text"
											placeholder="Type your contactable number" required />
									</p>
								</div>
								<div id="tel_Div"></div>
								<!-- //전화번호 -->

								<label class="label">카테고리</label>
								<div class="field">
									<div class="field-body">
										<div class="field is-narrow">
											<div class="controll">
												<div class="select">
													<select id="category" name="category">
														<option value="한식">한식</option>
														<option value="일식">일식</option>
														<option value="중식">중식</option>
														<option value="양식">양식</option>
														<option value="분식">분식</option>
														<option value="그릭">동남아</option>
														<option value="그릭">패스트푸드</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<label class="label">가게간단설명</label>
								<div class="field">
									<div class="field-body">
										<div class="field is-narrow">
											<div class="controll">
												 <textarea style="resize: none;" class="textarea" cols="80" id="content" name="content" placeholder="가게에 대한 간략한 소개를 해주세요"></textarea>
											</div>
										</div>
									</div>
								</div>
								<!-- //카테고리 -->

								<label class="label">메인사진/로고</label>
								<div class="file is-primary has-name">
									<label class="file-label" style="width:426px"> 
									<input class="file-input" type="file" id="main_img" name="img"> <span class="file-cta"> 
									<span class="file-icon"> <i	class="fas fa-upload"></i></span> 
									<span class="file-label"> Choose a file… </span>
									</span> <span class="file-name"> 가게를 대표할 사진을 올리세요 </span>
										<div id="file_Div"></div>
									</label>
								</div>
								<!-- //메인사진 -->

								<label class="label">서브사진</label>
								<div class="field">
									<div class="file is-warning has-name">
										<label class="file-label" style="width:476px"> 
										<input class="file-input"
											multiple="multiple" type="file" name="multiimg[]"> <span
											class="file-cta"> <span class="file-icon"> <i
													class="fas fa-upload"></i>
											</span> <span class="file-label"> Choose a file… </span>
										</span> <span class="file-name"> 가게 내부나 음식사진을 올리세요 </span>
										</label>
							</form>

							<div class="field is-grouped">
								<div class="control">
									<input type="button" id="regi_submit" class="button is-primary"
										value="가게등록">

								</div>
								<div class="control">
									<button class="button is-link is-light">Cancel</button>
								</div>
							</div>
						</div>
						<!-- //등록 취소 버튼 -->
					</div>
				</div>

			</div>
		</div>
	</section>

	<!------------------------------------------------------------------------------------->

	<section id="lookme" class="hero is-fullwidth" id="menu_section" style="display: none; background-color: #ff7979">
			<div class="container" >
				<div class="box" style="width:1344px; padding-bottom: 30px; margin-left: 0 auto; padding-left: 5%;">
					<label class="label is-menu">메뉴등록 (버튼을 눌러 메뉴를 추가하세요)</label> <span
						class="icon has-text-success"> <a id="add_rows"> <i
							class="fas fa-plus-circle"></i>
					</a>
					</span> <span class="icon has-text-danger"> <a id="del_rows"> <i
							class="fas fa-ban"></i>
					</a>
					</span>
					<table class="table">
						<thead>
							<tr>
								<th style="width:200px; text-align: center"><abbr title="Menu">메뉴이름</abbr></th>
								<th style="width:200px; text-align: center"><abbr title="Price">가격</abbr></th>
								<th style="width:100px; text-align: center"><abbr title="Menu">VEGAN</abbr></th>
								<th style="width:100px; text-align: center"><abbr title="Price">SPICY</abbr></th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
					<!-- //메뉴 -->
					<button id="menuSubmit" style="margin-top:60px" class="button is-primary">메뉴등록완료</button>
				</div>
			</div>
	</section>
	<!------------------------------------------------------------------------------------->




	<a id="backToTop" class="scrolltop" href="#"> <i
		class="fas fa-chevron-circle-up"></i>
	</a>
	<div id="loadFooter" style="margin-top: 50px;"></div>

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




</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/restaurant_register.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/restaurantPost.js"></script>

</html>