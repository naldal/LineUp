<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
<link rel="stylesheet" href="../css/review.css" />
<link	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap"	rel="stylesheet">


<!-- import -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/review.js"></script>

<button class="reviewBtn">리뷰쓰기</button>
<div class="modal">
	<form>
		<div id="modal-back" class="modal-background"></div>
		<div class="modal-card">
			<header class="modal-card-head">
				<p class="modal-card-title">review</p>
				<button class="delete" aria-label="close"></button>
			</header>
			<section class="modal-card-body">
				<div id="score" style="width: 150px; height: 50px;">
					<jsp:include page="../member/star.jsp">
						<jsp:param name="width" value="150" />
						<jsp:param name="height" value="40" />
						<jsp:param name="score" value="0" />
						<jsp:param name="num" value="0" />
						<jsp:param name="cursor_stat" value="5" />
					</jsp:include>
					<input id="score" type="hidden" value="">
				</div>
				<div id="subject" class="field">
					<label class="label">Subject</label>
					<div class="control has-icons-left has-icons-right">
						<input class="input is-danger" type="text"
							placeholder="Subject input" value="" /> <span
							class="icon is-small is-left"> <i class="fas fa-envelope"></i>
						</span>
					</div>
				</div>

				<div class="field">
					<label class="label">Img</label>
					<div class="file is-info has-name">
						<label class="file-label"> <input multiple="multiple"
							class="file-input" type="file" name="multiple_file" /> <span
							class="file-cta"> <span class="file-icon"> <i
									class="fas fa-upload"></i>
							</span> <span class="file-label"> Info file… </span>
						</span> <span class="file-name"> Screen Shot 2017-07-29 at
								15.54.25.png </span>
						</label>
					</div>
				</div>

				<div class="field">
					<label class="label">Message</label>
					<div class="control">
						<textarea class="textarea" placeholder="Textarea"></textarea>
					</div>
				</div>

				<div class="field is-grouped">
					<div class="control">
						<button class="button is-link">Submit</button>
					</div>
					<div class="control">
						<button id="cancle" class="button is-link is-light">Cancel</button>
					</div>
				</div>
			</section>
		</div>
	</form>
</div>
