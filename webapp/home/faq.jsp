<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="../css/faq.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Gugi|Rubik&display=swap&subset=korean" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Serif+KR&display=swap" rel="stylesheet" />
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

        <title>FAQ</title>
    </head>
    <body>
        <div id="loadHeader"></div>
        <section class="hero is-fullheight modal_event">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title is-1">FAQ</h1>
                    <br />
                    <br />
                    <div class="tile">
                        <div class="tile is-parent faq" id="user" style="cursor: pointer;">
                            <article class="tile is-child notification is-primary">
                                <p class="title icon_title">계정 관리</p>

                                <figure class="image is-128x128">
                                    <img src="../img/계정관리.png" id="aa" class="icon_img" />
                                </figure>
                            </article>
                        </div>

                        <div class="tile is-parent faq" id="res" style="cursor: pointer;">
                            <article class="tile is-child notification is-warning">
                                <p class="title icon_title">예약 관리</p>

                                <figure class="image is-128x128">
                                    <img src="../img/예약관리.png" class="icon_img" />
                                </figure>
                            </article>
                        </div>

                        <div class="tile is-parent faq" id="err" style="cursor: pointer;">
                            <article class="tile is-child notification is-danger">
                                <p class="title">오류 및 기술지원</p>

                                <figure class="image is-128x128">
                                    <img src="../img/오류_기술지원.png" class="icon_img" />
                                </figure>
                            </article>
                        </div>

                        <div class="tile is-parent faq" id="offi" style="cursor: pointer;">
                            <article class="tile is-child notification is-info">
                                <p class="title icon_title" style="color: #000000;">공지 사항</p>

                                <figure class="image is-128x128">
                                    <img src="../img/공지사항.png" class="icon_img" />
                                </figure>
                            </article>
                        </div>
                    </div>
                    <br />
                    <br />
                    
                    <!-- ******************* 계정관리 ********************** -->
                    
                    <div id="user_form">
                    <section class="hero is-primary">
                        <div class="hero-body">
                            <div class="container">
                                <h1 class="title" style="color:#3f3f3f;">계정관리</h1>
                                <h2 class="subtitle" style="color:#545454;">수정 및 삭제 등의 계정관리에 대한 궁금증을 모아놨습니다.</h2>
                            </div>
                        </div>
                    </section>
                    <br />
                    <br />
                    <br />

                    <div class="accordion">
                        <input type="checkbox" id="answer01" />
                        <label for="answer01">계정 및 가게 생성<em></em></label>
                        <div id="ex">
                            <div class="box" id="user1">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    사업자 계정만 만들었는데 가게 등록은 어떻게 하나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                            
                            <div class="box" id="res2">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    개인 계정만 있는데 사업자 계정은 어떻게 만들어 이용하나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>

                            <div class="box" id="res3">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    사업자 계정을 생성하면 개인 계정과 같은 기능을 이용할 수 없나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>

                        <input type="checkbox" id="answer02" />
                        <label for="answer02">계정 및 가게 수정<em></em></label>
                        <div>
                            <div class="box" id="res4">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    가게를 만들고 나서 다른 가게를 추가할 수 있나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>

                        <input type="checkbox" id="answer03" />
                        <label for="answer03">계정 및 가게 삭제<em></em></label>
                        <div>
                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                           <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                               계정 삭제는 어디서 하나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>
                        
                        </div>
                    </div>
                    
                    
                    
                    <!-- ****************** 예약관리 ************************ -->
					
				<div id="res_form">
                    <section class="hero is-warning">
                        <div class="hero-body">
                            <div class="container">
                                <h1 class="title" style="color:#3f3f3f;">예약관리</h1>
                                <h2 class="subtitle" style="color:#545454;">예약 신청과 승인 및 취소 등에 대한 궁금증을 모아놨습니다.</h2>
                            </div>
                        </div>
                    </section>
                    <br />
                    <br />
                    <br />

                    <div class="accordion">
                        <input type="checkbox" id="answer04" />
                        <label for="answer04">예약 신청<em></em></label>
                        <div id="ex">
                            <div class="box" id="res1">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p">
                                                작성자 : smith<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    How do I check the results after I apply for a reservation?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                            
                            <div class="box" id="res2">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                           <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    사업자의 경우 신청 온 예약은 어떻게 확인하고 수락하나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>

                            <div class="box" id="res3">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    예약신청 예약신청 예약신청 예약신청 예약신청 예약신청예약신청?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>

                        <input type="checkbox" id="answer05" />
                        <label for="answer05">예약 취소<em></em></label>
                        <div>
                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    예약을 취소하려면 어떻게 하나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>

                        <input type="checkbox" id="answer06" />
                        <label for="answer06">예약 승인<em></em></label>
                        <div>
                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    예약을 취소하려면 어떻게 하나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>
                        
                        </div>
                    </div>
                    
                    <!-- **************** 오류 및 기술지원 ************** -->
                    
                    <div id="err_form">
                    <section class="hero is-danger">
                        <div class="hero-body">
                            <div class="container">
                                <h1 class="title" style="color:#3f3f3f;">오류 및 기술지원</h1>
                                <h2 class="subtitle" style="color:#545454;">페이지 내의 기능 및 오류 사항에 대한 궁금증을 모아뒀습니다.</h2>
                            </div>
                        </div>
                    </section>
                    <br />
                    <br />
                    <br />

                    <div class="accordion">
                        <input type="checkbox" id="answer07" />
                        <label for="answer07">오류<em></em></label>
                        <div id="ex">
                            <div class="box" id="err1">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                           <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                            
                            <div class="box" id="22">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                           <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    사업자의 경우 신청 온 예약은 어떻게 확인하고 수락하나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>

                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    예약신청 예약신청 예약신청 예약신청 예약신청 예약신청예약신청?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>

                        <input type="checkbox" id="answer08" />
                        <label for="answer08">기술지원<em></em></label>
                        <div>
                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    예약을 취소하려면 어떻게 하나요?
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>
                        
                        </div>
                    </div>
                    
                    <!-- ********************* 공지사항 ********************** -->
                    
                    <div id="offi_form">
                    <section class="hero is-info">
                        <div class="hero-body">
                            <div class="container">
                                <h1 class="title" style="color:#3f3f3f;">공지사항</h1>
                                <h2 class="subtitle" style="color:#545454;">고객님들에게 알려드릴 공지 내용들을 모아뒀습니다.</h2>
                            </div>
                        </div>
                    </section>
                    <br />
                    <br />
                    <br />

                    <div class="accordion">
                        <input type="checkbox" id="answer09" />
                        <label for="answer09">안내사항<em></em></label>
                        <div id="ex">
                            <div class="box" id="offi1">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p">
                                                작성자 : 운영자<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    Line Up이 4월 6일부로 서비스를 오픈합니다!
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                            
                            <div class="box" id="22">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                          <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                  4월 11일 정기점검을 합니다!
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>

                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    곧 새로운 예약 시스템을 도입할 예정입니다.
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>

                        <input type="checkbox" id="answer10" />
                        <label for="answer10">LineUp 소식<em></em></label>
                        <div>
                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                    저희 Line Up이 이번에 맛있는 녀석들에서 소개됩니다.
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>

                        <input type="checkbox" id="answer11" />
                        <label for="answer11">이벤트<em></em></label>
                        <div>
                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="../img/question_icon.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>Updated 1 week ago</small> <br />
                                                <span class="ques_span">
                                                 Line Up 외국인 친구 소개 이벤트!!
                                                </span>
                                            </p>
                                        </div>
                                        <nav class="level is-mobile"></nav>
                                    </div>
                                </article>
                            </div>
                        </div>
                        
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
		
        <div id="loadFooter"></div>
    </body>
    <!-- <script type="text/javascript" src="/node_modules/bulma-accordion/dist/js/bulma-accordion.min.js"></script> -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/faq.js"></script>
</html>
