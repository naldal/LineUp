<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sign Up</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
<link rel="stylesheet" href="../css/bulma-steps.min.css" />
<link rel="stylesheet" href="../css/signUp_individual.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
</head>

<body>
	<div id="loadHeader"></div>
	<section class="hero is-fullheight" style="font-family:'Noto Sans KR', sans-serif;">
		<div class="hero-body">
			<div class="container">
				<h1 class="title">일반회원 등록페이지</h1>

				<!-- //제목 -->
				<div class="column is-center">

					<div style="margin-top: 50px;"></div>

					<div class="steps" id="stepsDemo">
						<div class="step-item is-active is-success">
							<div class="step-marker">1</div>
							<div class="step-details">
								<p class="step-title">Agreement</p>
							</div>
						</div>
						<div class="step-item">
							<div class="step-marker">2</div>
							<div class="step-details">
								<p class="step-title">Account</p>
							</div>
						</div>
						<div class="step-item">
							<div class="step-marker">3</div>
							<div class="step-details">
								<p class="step-title">Finish</p>
							</div>
						</div>
						<div style="margin-bottom: 100px;"></div>

						<!-- //step line -->
						<div class="steps-content" id="start_step">
							<!-- step start -->
							<div class="step-content is-active">
								<h2 class="subtitle" id="1_subtitle" style="margin-top: 100;">서비스
									이용약관</h2>
								<div id="TestBox">
									제 1조 (목적)<br /> 본 약관은 LINE UP 사이트(이하 "당 사이트")가 제공하는 모든 서비스(이하
									"서비스")의 이용조건 및 절차, 이용자와 당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을
									목적으로 합니다.<br /> <br /> 제 2조 (약관의 명시와 개정)<br /> 당 사이트는 이 약관의
									내용과 주소지, 관리자의 성명, 개인정보 보호책임자의 성명, 연락처(전화, 팩스, 전자우편 주소 등) 등을
									이용자가 알 수 있도록 당 사이트의 초기 서비스화면(전면)에 게시합니다. 당 사이트는 약관의 규제에 관한 법률,
									전자거래기본법, 전자서명법, 개인정보보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. 당
									사이트가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 당 사이트의 초기화면에 그
									적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 당 사이트는 이용자가 본 약관 내용에 동의하는 것을 조건으로
									이용자에게 서비스를 제공할 것이며, 이용자가 본 약관의 내용에 동의하는 경우, 당 사이트의 서비스 제공 행위 및
									이용자의 서비스 사용 행위에는 본 약관이 우선적으로 적용될 것입니다. 이 약관에 동의하는 것은 정기적으로 웹을
									방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는
									이용자의 피해는 당 사이트에서 책임지지 않습니다. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법,
									방송통신심의위원회 정보통신에 관한 심의규정, 저작권법 및 기타 관련 법령의 규정에 의합니다.<br /> <br />
									제 3조 (용어의 정의)<br /> 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br /> 이용자 :
									본 약관에 따라 당 사이트가 제공하는 서비스를 받는 자. 이용계약 : 서비스 이용과 관련하여 당 사이트와 이용자
									간에 체결하는 계약을 말합니다. 신 청 : 당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에
									동의하여 서비스 이용계약을 완료시키는 행위 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도약관 및
									이용규정에서 정의합니다.<br /> <br /> 제 4조 (이용계약의 성립)<br /> 이용계약은 이용자가
									본 이용약관 내용에 대한 동의와 이용신청에 대하여 당 사이트의 이용승낙으로 성립합니다. 본 이용약관에 대한 동의는
									이용신청 당시 해당 당 사이트의 '동의함' 또는 신청(등록)버튼을 누름으로써 의사표시를 합니다.<br /> <br />
									제 5조 (개인정보 사용에 대한 동의)<br /> 이용자의 개인정보에 대해서는 당 사이트의 개인정보 처리방침이
									적용됩니다. 다만, 당 사이트 이외의 링크된 사이트에서는 당 사이트의 개인정보 처리방침이 적용되지 않습니다.<br />
									<br /> 제 6조 (사용자의 정보 보안)<br /> 이용자가 당 사이트 서비스 신청 절차를 완료하는
									순간부터 이용자는 입력한 정보의 비밀을 유지할 책임이 있습니다. 이용자가 입력한 정보에 관한 모든 관리의 책임은
									이용자에게 있으며, 이용자가 입력한 정보가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 당 사이트에
									알려주셔야 합니다. 알리지 않음으로 인해 발생하는 모든 책임은 이용자 본인에게 있습니다. <br /> <br />
									제 7조 (서비스 이용시간)<br /> 서비스 이용시간은 당 사이트의 업무상 또는 기술상 특별한 지장이 없는 한
									연중무휴, 1일 24시간을 원칙으로 합니다. 제1항의 이용시간 중 정기점검 등의 필요로 인하여 당 사이트가 정한
									날 또는 시간은 예외로 합니다.<br /> <br /> 제 8조 (서비스의 중지 및 중지에 대한 공지)<br />
									당 사이트 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 당
									사이트의 관리 범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지
									못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 당 사이트는 관련 책임을 부담하지 아니합니다. 당 사이트가
									정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일 전에
									홈페이지에 서비스 중지사유 및 일시를 공지한 후 서비스를 중지할 수 있으며, 이 기간 동안 이용자가 공지내용을
									인지하지 못한 데 대하여 당 사이트는 책임을 부담하지 아니합니다. 부득이한 사정이 있을 경우 위 사전 공지기간은
									감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신
									메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을
									경우에 대하여도 당 사이트는 책임을 부담하지 아니합니다. 당 사이트의 사정으로 서비스를 영구적으로 중단하여야 할
									경우에는 제 2 항에 의거합니다. 다만, 이 경우 사전 공지기간은 1개월로 합니다. 당 사이트는 사전 공지 후
									서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 이용자 또는 제3자에게 어떠한 책임도 부담하지
									아니합니다. 당 사이트는 긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 예고없이 일시적으로
									서비스를 중단할 수 있으며, 새로운 서비스로의 교체 등 당 사이트가 적절하다고 판단하는 사유에 의하여 현재
									제공되는 서비스를 완전히 중단할 수 있습니다. 당 사이트는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스
									이용의 폭주 등으로 정상적인 서비스 제공이 불가능할 경우, 서비스의 전부 또는 일부를 제한하거나 중지할 수
									있습니다. 다만 이 경우 그 사유 및 기간 등을 이용자에게 사전 또는 사후에 공지합니다. 당 사이트는 당 사이트가
									통제할 수 없는 사유로 인한 서비스중단의 경우(시스템관리자의 고의•과실 없는 디스크장애, 시스템다운 등)에
									사전통지가 불가능하며 타인(PC통신회사, 기간통신사업자 등)의 고의•과실로 인한 시스템중단 등의 경우에는 통지하지
									않습니다. 당 사이트는 서비스를 특정범위로 분할하여 각 범위별로 이용가능시간을 별도로 지정할 수 있습니다. 다만
									이 경우 그 내용을 공지합니다. 당 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스
									사용을 제한 및 중지하거나 이용자의 동의 없이 이용계약을 해지할 수 있습니다. 이 경우 당 사이트는 위 이용자의
									접속을 금지할 수 있습니다.<br /> <br />
								</div>
								<label class="checkbox"> <input type="checkbox"
									id="chk1" name="chk" /> <span class="icon"></span> <span
									class="text">홈페이지 이용약관에 동의합니다.</span>
								</label>

								<h2 style="margin-top: 50px;" class="subtitle">개인정보처리방침</h2>
								<div id="TestBox">
									LINE UP은(는) 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고
									원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다. <br /> <br />
									제1조(개인정보의 처리목적) LINE UP은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는
									개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에
									따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. <br /> <br />1. 홈페이지 회원 가입
									및 관리 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제
									시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인,
									각종 고지․통지, 고충처리 등을 목적으로 개인정보를 처리합니다. <br />2. 재화 또는 서비스 제공
									물품배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증,
									요금결제․정산, 채권추심 등을 목적으로 개인정보를 처리합니다. 3. 고충처리 민원인의 신원 확인, 민원사항 확인,
									사실조사를 위한 연락․통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다. <br /> <br />제2조(개인정보의
									처리 및 보유기간) ① LINE UP은(는) 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를
									수집시에 동의받은 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다. ② 각각의 개인정보 처리 및 보유
									기간은 다음과 같습니다.<br /> <br /> 1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지
									탈퇴시까지 다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지 1) 관계 법령 위반에 따른 수사․조사
									등이 진행중인 경우에는 해당 수사․조사 종료시까지 2) 홈페이지 이용에 따른 채권․채무관계 잔존시에는 해당
									채권․채무관계 정산시까지 3) 예외사유시에는 보유기간까지 2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및
									요금결제․정산 완료시까지 다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료시까지 1) 「전자상거래 등에서의
									소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록 - 표시․광고에 관한 기록
									: 6월 - 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년 - 소비자 불만 또는 분쟁처리에 관한
									기록 : 3년 2)「통신비밀보호법」제41조에 따른 통신사실확인자료 보관 - 가입자 전기통신일시, 개시․종료시간,
									상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년 - 컴퓨터통신, 인터넷 로그기록자료, 접속지
									추적자료 : 3개월 3) 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」시행령 제29조에 따른 본인확인정보
									보관 : 게시판에 정보 게시가 종료된 후 6개월 제4조(개인정보처리의 위탁) ① LINE UP 은(는) 원활한
									개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다. ② LINE UP 은(는) 위탁계약
									체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁
									제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를
									안전하게 처리하는지를 감독하고 있습니다. ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보
									처리방침을 통하여 공개하도록 하겠습니다. 제5조(정보주체와 법정대리인의 권리․의무 및 행사방법) ① 정보주체는
									LINE UP에 대해 언제든지 개인정보 열람․정정․삭제․처리정지 요구 등의 권리를 행사할 수 있습니다. ②
									제1항에 따른 권리 행사는 LINE UP에 대해 개인정보보호법 시행령 제41조제1항에 따라 서면, 전자우편,
									모사전송(FAX) 등을 통하여 하실 수 있으며, LINE UP은(는) 이에 대해 지체없이 조치하겠습니다. ③
									제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이
									경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. ④ 개인정보 열람 및
									처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
									⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를
									요구할 수 없습니다. ⑥ LINE UP 은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의
									요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다. 제7조(개인정보의 파기) ① LINE
									UP 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당
									개인정보를 파기합니다. ② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고
									다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나
									보관장소를 달리하여 보존합니다. ③ 개인정보 파기의 절차 및 방법은 다음과 같습니다. 1. 파기절차 LINE UP
									은(는) 파기 사유가 발생한 개인정보를 선정하고, LINE UP의 개인정보 보호책임자의 승인을 받아 개인정보를
									파기합니다. 2. 파기방법 LINE UP 은(는) 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수
									없도록 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다. 제8조(개인정보의
									안전성 확보조치) LINE UP은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다. 1.
									관리적 조치 : 내부관리계획 수립․시행, 정기적 직원 교육 등 2. 기술적 조치 : 개인정보처리시스템 등의
									접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 3. 물리적 조치 : 전산실,
									자료보관실 등의 접근통제 제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항) ① LINE
									UP은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는
									‘쿠기(cookie)’를 사용합니다. ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터
									브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다. 가. 쿠키의
									사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을
									파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다. 나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의
									도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 다. 쿠키 저장을 거부할
									경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다. 제11조(개인정보 열람청구) 정보주체는 개인정보 보호법
									제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. LINE UP은(는) 정보주체의 개인정보
									열람청구가 신속하게 처리되도록 노력하겠습니다.
								</div>
								<label class="checkbox"> <input type="checkbox"
									id="chk2" name="chk" /> <span class="icon"></span> <span
									class="text">개인정보처리방침에 동의합니다.</span>
								</label>
								<div style="margin-top: 50px;">
									<label class="checkbox"> <input type="checkbox"
										name="chk" id="chkall" /> <span class="icon"></span> <span
										class="text">모든 약관을 이해하였으며 이에 동의합니다.</span>
									</label>
								</div>
							</div>
							<!-- //first step -->

							<form id="individual_form">
								<div class="step-content has-text-centered input_step">

									<div class="field is-horizontal">
										<div class="field-label is-normal">
											<label class="label">닉네임</label>
										</div>
										
										<div class="field-body">
											<div class="field">
												<div class="control has-icon has-icon-right">
													<input class="input" type="text" name="nickname"
														id="nickname" placeholder="NickName"
														data-validate="require" />
												</div>
											</div>
										</div>
									</div>
										<div id="nickNameDiv"></div>

									<div class="field is-horizontal">
										<div class="field-label is-normal">
											<label class="label">이메일</label>
										</div>
										<div class="field-body">
											<div class="field">
												<div style="width: 60%;" class="control">
													<input class="input" id="id" name="id" type="text"
														placeholder="Email" autofocus data-validate="require" />
												</div>
											</div>
										</div>
									</div>
									<div id="idDiv"></div>
									<div class="field is-horizontal">
										<div class="field-label is-normal">
											<label class="label">비밀번호</label>
										</div>
										<div class="field-body">
											<div class="field">
												<div class="control has-icon has-icon-right">
													<input class="input" id="pwd" type="password" name="pwd"
														id="lastname" placeholder="Password"
														data-validate="require" />
												</div>
											</div>
										</div>
									</div>
									<div id="ppwdDiv"></div>
									<div class="field is-horizontal">
										<div class="field-label is-normal">
											<label class="label">비밀번호 확인</label>
										</div>
										<div class="field-body">
											<div class="field">
												<div class="control has-icon has-icon-right">
													<input class="input" id="repwd" type="password" name="repwd"
														placeholder="rePassword" data-validate="require" />
												</div>
											</div>
										</div>
									</div>
									<div id="pwdDiv"></div>

									<div class="field is-horizontal">
										<div class="field-label is-normal">
											<label class="label">전화번호</label>
										</div>
										<div class="field-body">
											<div class="field">
												<div class="control has-icon has-icon-right">
													<input class="input" type="text" name="tel" id="tel"
														placeholder="PhoneNumber" data-validate="require" />
												</div>
											</div>
										</div>
									</div>
									<div id="telDiv"></div>
								</div>
							</form>
							<!-- //second step -->
							<div class="step-content has-text-centered">
								<div class="column is-center">
									<div class="column is-four-fifths"
										style="text-align: center; margin: 100px auto;">
										<h1 class="title">Your Account has successfully created!
														<br> Check your Email and Click the link to login! 
										
										</h1>
									</div>
								</div>
							</div>
						</div>
						<!-- step end -->
						<div class="steps-actions" id="action_step">
							<div class="steps-action">
								<a href="#" data-nav="previous" class="button is-light">이전으로</a>
							</div>
							<div class="steps-action">
								<a href="#" id="prev" data-nav="next" class="button is-light">다음으로</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<div id="loadFooter"></div>
</body>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/signUp_individual.js"></script>
<script>
	bulmaSteps.attach();
</script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$("#loadHeader").load("../layout/header_bulma.jsp");
	$("#loadFooter").load("../layout/footer.html");
	
</script>
</html>