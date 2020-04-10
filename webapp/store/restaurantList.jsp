<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- import -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
</head>
<body>
	<div id="loadHeader"></div>
	<div id="search-close"
		style="width: 100%; height: 100%; position: absolute; display: none;"></div>
	<br />
	<br />
	<div id="panel-block">
		<p id="search_click" class="control has-icons-left">
			<input class="input is-warning" type="text" placeholder="Search" />
			<span class="icon is-left"> <i class="fas fa-search"
				aria-hidden="true"></i>
			</span>
		</p>
	</div>
	<div id="search-list"></div>

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
		<div class="practice" align="center">
			<ul class="practice2">
				<li class="practice_li"><img src="../img/dinner_item.jpg" />
					<div class="box">
						<div style="text-align: left; font-weight: bold;">
							ASHLEY
							<div class="score_form" style="float: right">
								<%@include file="../member/star.jsp"%>

								<jsp:include page="../member/star.jsp">
									<jsp:param name="width" value="150"/>
									<jsp:param name="height" value="50"/>
									<jsp:param name="score" value="2" />
									<jsp:param name="num" value="0" />
									<jsp:param name="cursor_stat" value="0" />
								</jsp:include>
							</div>
						</div>
						<p>레스토랑 양식</p>
						<p>서울특별시 은평구 가좌로 188-8(응암동, 서원타운)</p>
						<button class="button is-small is-warning">예약하기</button>
					</div></li>
				<li class="practice_li"><img src="../img/breakfast_item.jpg" />
					<div class="box">
						<div style="text-align: left; font-weight: bold;">
							Kimbob Heaven
							<div class="score_form" style="float: right">
								<jsp:include page="../member/star.jsp">
									<jsp:param name="width" value="150" />
									<jsp:param name="height" value="50"/>
									<jsp:param name="score" value="3" />
									<jsp:param name="num" value="1" />
									<jsp:param name="cursor_stat" value="0" />
								</jsp:include>
							</div>
						</div>
						<p>레스토랑 양식</p>
						<p>서울특별시 강남구 테헤란로52길 16(역삼동, 테헤란IPARK)</p>
						<button class="button is-small is-warning">예약하기</button>
					</div></li>
				<li class="practice_li"><img src="../img/dinner_item.jpg" />
					<div class="box">
						<div style="text-align: left; font-weight: bold;">
							곱창
							<div class="score_form" style="float: right">
								<jsp:include page="../member/star.jsp">
									<jsp:param name="width" value="150" />
									<jsp:param name="height" value="50"/>
									<jsp:param name="score" value="8" />
									<jsp:param name="num" value="2" />
									<jsp:param name="cursor_stat" value="0" />
								</jsp:include>
							</div>
						</div>
						<p>레스토랑 양식</p>
						<p>서울특별시 서대문구 가재울로10길 22(남가좌동, 샤론인텔리안)</p>
						<button class="button is-small is-warning">예약하기</button>
					</div></li>
				<li class="practice_li"><img src="../img/breakfast_item.jpg" />
					<div class="box">
						<div style="text-align: left; font-weight: bold;">
							Pork belly
							<div class="score_form" style="float: right">
								<jsp:include page="../member/star.jsp">
									<jsp:param name="width" value="150"/>
									<jsp:param name="height" value="50"/>
									<jsp:param name="score" value="7" />
									<jsp:param name="num" value="3" />
									<jsp:param name="cursor_stat" value="0" />
								</jsp:include>
							</div>
						</div>
						<p>레스토랑 양식</p>
						<p>서울특별시 서대문구 통일로34길 46(홍제동, 인왕산현대아파트)</p>
						<button class="button is-small is-danger">예약하기</button>
					</div></li>
				<li class="practice_li"><img src="../img/breakfast_item.jpg" />
					<div class="box">
						<div style="text-align: left; font-weight: bold;">
							Pork belly
							<div class="score_form" style="float: right">
								<jsp:include page="../member/star.jsp">
									<jsp:param name="width" value="150"/>
									<jsp:param name="height" value="50"/>
									<jsp:param name="score" value="0" />
									<jsp:param name="num" value="4" />
									<jsp:param name="cursor_stat" value="0" />
								</jsp:include>
								<!-- 받아온평균값*2를 value에 넣어주기 -->
							</div>
						</div>
						<p>레스토랑 양식</p>
						<p>서울특별시 서대문구 통일로 395(홍제동, 홍제 센트럴 아이파크)</p>
						<button class="button is-small is-warning">예약하기</button>
					</div></li>
				<li class="practice_li"><img src="../img/breakfast_item.jpg" />
					<div class="box">
						<div style="text-align: left !important; font-weight: bold;">
							Pork belly
							<div class="score_form" style="float: right">
								<jsp:include page="../member/star.jsp">
									<jsp:param name="width" value="150"/>
									<jsp:param name="height" value="50"/>
									<jsp:param name="score" value="9" />
									<jsp:param name="num" value="5" />
									<jsp:param name="cursor_stat" value="0" />
								</jsp:include>
								<!-- 받아온평균값*2를 value에 넣어주기 -->
							</div>
						</div>
						<p>레스토랑 양식</p>
						<p>서울특별시 서대문구 통일로21길 24-3(홍제동)</p>
						<button class="button is-small is-warning">예약하기</button>
					</div></li>
			</ul>
		</div>
	</section>

	<div style="height: 100px; margin: 0 auto; text-align: center;">여기가
		페이지 넣는곳</div>
	<div id="loadFooter"></div>
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../js/restaurantList.js"></script>
</body>
</html>
