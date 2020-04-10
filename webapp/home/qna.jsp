<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
    <link	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700"	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap"	rel="stylesheet">
    <link rel="stylesheet" href="../css/qna.css" />
    
    <!-- import -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/qna.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
    <body>
        <div id="loadHeader"></div>
		<input type="hidden" value='${requestScope.pg }' id="pg" name="pg">
		<input type="hidden" value='${requestScope.step }' id="step" name="step">
		<input type="hidden" value='${requestScope.category }' class="category_search" name="category_search">
		<input type="hidden" value='${requestScope.search }' class="search_search" name="search_search">
		
        <div id="qna_form">
            <div style="text-align: center;">
                <button id="qna-btn" class="button is-info is-outlined" style="width: 250px; height: 100px;">Question</button>
                <button id='faq-btn' class="button is-danger is-outlined" style="width: 250px; height: 100px;">FAQ</button>
            </div>

            <div class="qna_wrap_search">
                <label class="label" style="font-size: 35pt; width: 150px;">QnA</label>
                <div class="field is-grouped">
                    <div class="control">
                        <div class="select">
                            <select id="category" name="category" >
                                <option selected value="subject">제목</option>
                                <option value="content">내용</option>
                                <option value="subject/content">제목+내용</option>
                            </select>
                        </div>
                    </div>
                    <p class="control is-expanded">
                        <input id="search" class="input" type="text" placeholder="Find a repository" />
                    </p>
                    <p class="control">
                        <a id = "searchBtn" class="button is-info"> Search </a>
                    </p>
                </div>
           	</div>
           	<div class="qna_wrap_list">
                <table id="qnaTable"class="table" style="width:900px; margin: 0 auto; margin-top: 10px;">
                    <thead>
                        <tr>
                            <th style="text-align: center;">Num</th>
                            <th style="width:180px;">Category</th>
                            <th>Subject</th>
                            <th style="text-align: center;">UserID</th>
                            <th style="text-align: center;">Date</th>
                            <th style="text-align: center; width:77px;">stat</th>
                        </tr>
                    </thead>
                    <tbody>
                      
                    </tbody>
                </table>
            </div>
           	<div class="qna_wrap_paging">
	            <div align="center">
	                <nav id="qnaPaging" class="pagination is-centered" role="navigation" aria-label="pagination">
						<!-- 페이징 -->
					</nav>
	            </div>
	       	</div>
        </div>
        
        
		<!--  QnA 모달 시작        -->
        <div class="modal">
            <div id="modal-back" class="modal-background"></div>
            <div class="modal-card">
            	<form id="qnaWriteForm" enctype="multipart/form-data">
	                <header class="modal-card-head">
	                    <p class="modal-card-title">Question</p>
	                    <button class="delete" aria-label="close"></button>
	                </header>
	                <section class="modal-card-body">
	                    <div class="field">
	                        <label class="label">USER_ID</label>
	                        <div class="control has-icons-left has-icons-right">
	                            <input id="name" name="name" class="input is-success" type="text" placeholder="Text input" value="${id}" readonly="readonly" />
	                            <span class="icon is-small is-left"> <i class="fas fa-user"></i> </span> <span class="icon is-small is-right"> <i class="fas fa-check"></i> </span>
	                        </div>
	                    </div>
	
	                    <div class="field">
	                        <label class="label" style="float:left">Subject</label> <span id="subject_alert"> </span>
	                        <div class="control has-icons-left has-icons-right">
	                            <input id="subject_qna" name="subject_qna" class="input is-danger" type="text" placeholder="Subject input" value="" style="padding: 5 15px;" />
	                        </div>
	                    </div>
	
	                    <div class="field">
	                        <label class="label">Category</label>
	                        <div class="control">
	                            <div class="select">
	                                <select id="category" name="category">
	                                    <option selected value="기타 신고 유형">기타 신고 유형</option>
	                                    <option value="예약관련문의">예약관련문의</option>
	                                    <option value="로그인/계정정지">로그인/계정 정지</option>
	                                    <option value="이용제한">이용 제한</option>
	                                    <option value="도용/해킹 의심">도용/해킹 의심</option>
	                                    <option value="악용 사례  & 스팸">악용 사례 & 스팸</option>
	                                </select>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="field">
	                        <label id=imgLabel class="label">Img</label>
	                        <span id="img_alert"></span>
	                        <div class="file is-info has-name">
	                            <label class="file-label">
	                                <input id="qnaImg" class="file-input" type="file" name="qnaImg[]" multiple="multiple"/>
	                                <span class="file-cta">
	                                    <span class="file-icon"> <i class="fas fa-upload"></i> </span> <span class="file-label"> Info file… </span>
	                                </span>
	                                <span class="file-name"> Screen Shot 2017-07-29 at 15.54.25.png </span>
	                            </label>
	                        </div>
	                        <div id="imgs">
	                        	
	                        </div>
	                    </div>
	
	                    <div class="field">
	                        <label class="label" style="float:left">Message</label> <span id="content_alert"> </span>
	                        <div class="control">
	                            <textarea id="content_qna" name="content_qna" class="textarea" placeholder="Textarea"></textarea>
	                        </div>
	                    </div>
	
	                    <div class="field is-grouped">
	                        <div class="control">
	                            <input type="button" id="submit" class="button is-link" value="Submit">
	                        </div>
	                        <div class="control">
	                            <button id="cancle" class="button is-link is-light">Cancel</button>
	                        </div>
	                    </div>
	                </section>
                </form>
            </div>
        </div>
        <div id="loadFooter"></div>
    </body>
</html>
