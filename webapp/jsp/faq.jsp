<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <div class="tile is-parent">
                            <article class="tile is-child notification is-primary">
                                <p class="title icon_title">계정 관리</p>

                                <figure class="image is-128x128">
                                    <img src="../img/계정관리.png" id="aa" class="icon_img" />
                                </figure>
                            </article>
                        </div>

                        <div class="tile is-parent">
                            <article class="tile is-child notification is-warning">
                                <p class="title icon_title">예약 관리</p>

                                <figure class="image is-128x128">
                                    <img src="../img/예약관리.png" class="icon_img" />
                                </figure>
                            </article>
                        </div>

                        <div class="tile is-parent">
                            <article class="tile is-child notification is-danger">
                                <p class="title">오류 및 기술지원</p>

                                <figure class="image is-128x128">
                                    <img src="../img/오류_기술지원.png" class="icon_img" />
                                </figure>
                            </article>
                        </div>

                        <div class="tile is-parent">
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

                    <section class="hero is-warning">
                        <div class="hero-body">
                            <div class="container">
                                <h1 class="title">예약관리</h1>
                                <h2 class="subtitle">예약 신청과 승인 및 취소 등에 대한 궁금증을 모아놨습니다.</h2>
                            </div>
                        </div>
                    </section>
                    <br />
                    <br />
                    <br />

                    <div class="accordion">
                        <input type="checkbox" id="answer01" />
                        <label for="answer01">예약 신청<em></em></label>
                        <div id="ex">
                            <div class="box" id="11">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="11">
                                                작성자 : 김형선<br />
                                                <small>1주일 전에 업데이트됨</small> <br />
                                                <span class="ques_span">
                                                    예약 신청을 누르고 나서 결과는 어떻게 확인하나요?
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
                                            <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>1주일 전에 업데이트됨</small> <br />
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
                                            <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>1주일 전에 업데이트됨</small> <br />
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

                        <input type="checkbox" id="answer02" />
                        <label for="answer02">예약 취소<em></em></label>
                        <div>
                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>1주일 전에 업데이트됨</small> <br />
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

                        <input type="checkbox" id="answer03" />
                        <label for="answer03">예약 승인<em></em></label>
                        <div>
                            <div class="box" id="33">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image" />
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p class="ques_p" id="22">
                                                작성자 : 김형선<br />
                                                <small>1주일 전에 업데이트됨</small> <br />
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
    </body>
    <!-- <script type="text/javascript" src="/node_modules/bulma-accordion/dist/js/bulma-accordion.min.js"></script> -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/faq.js"></script>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        $(".modal_event img").click(function() {
            $("#kk img").attr("src", $(this).attr("src"));
            $(".modal").addClass("is-active");
        });
        $("#kk").click(function() {
            $(".modal").removeClass("is-active");
        });
    </script>
</html>
