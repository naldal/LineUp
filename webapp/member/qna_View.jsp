<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
<link	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap"	rel="stylesheet">
<link rel="stylesheet" href="../css/qna_View.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/load.js"></script>

<div id="loadHeader"></div>

<input type="hidden" id="pg" name="pg" value="${pg}">
<input type="hidden" id="seq" name="seq" value="${seq}">
<form>
	<div id="qna_view_form" class="box">
		<p id="qna_view_subject">문의하기</p>
		<table style="width: 100%">
			<thead>
				<tr>
					<td width="20%" style="font-weight: bold;">문의 현황</td>
					<td width="80%">${qnaDTO.member_id } 님의 문의 조회 결과입니다.</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="font-weight: bold;">문의 신고 유형</td>
					<td>${qnaDTO.category_qna }</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">문의 날짜</td>
					<td>${qnaDTO.log_time }</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">처리 현황</td>
					<td style="padding:20px"> 
					<c:if test="${qnaDTO.status eq 0}">
							<span class="tag is-info">대기중</span> 
					</c:if>
					<c:if test="${qnaDTO.status eq 1}">
							<span class="tag is-danger">처리됨</span> 
					</c:if>
					
					</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">제목</td>
					<td>${qnaDTO.subject_qna }</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">문의 내용</td>
					<td style="white-space: pre-line;">${qnaDTO.content_qna }</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">답변 내용</td>
					<td id="answer" style="white-space: pre-line;">${qnaDTO.reply}</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">첨부이미지</td>
					<td>
						<c:if test="${qnaDTO.img == 'null' || qnaDTO.img eq 'null'}">
								첨부이미지가 없습니다.
						</c:if>
						<c:if test="${qnaDTO.img != 'null' || qnaDTO.img ne 'null'}">
							<c:forEach items="${fn:split(qnaDTO.img,'/')}" var="item">
								<span style=" display: inline-block;   width: 100px;   height: 100px;">
										<img class="qna_img" src="http://localhost:8080/LineUp/restaurant_register_imgs/qna_img/${item}" style="max-width:100px; max-height:100px;cursor:pointer;">
								</span>
							</c:forEach>						
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="buttons">
			<c:if test="${position == 'ADMIN'}">
				<p id="answerBtn" class="button is-warning is-light">답변</p>
				<p id="delBtn" class="button is-danger is-light" >삭제</p>
				<input type= hidden id="seq" value="${seq}">
				<input type= hidden id="pg" value="${pg}">
			</c:if>
			<p id="listBtn" class="button is-success is-light" onclick="location.href='/LineUp/home/qna?pg=${pg}'">목록</p>
		</div>
	</div>
</form>

<div id="img_modal">
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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/qna_View.js"></script>