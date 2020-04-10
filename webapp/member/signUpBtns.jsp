<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
        <link rel="stylesheet" href="../css/signUpBtns.css" />
        <!-- import -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
    </head>
    <body>
        <div id="loadHeader"></div>
        <div class="hero is-fullheight">
            <div class="hero-body">
                <div class="container">
                    <div class="field has-text-centered">
                        <div class="hero-buttons">
                            <button onclick="window.location.href='/LineUp/member/signUp_individual'" class="button is-info is-light" value="개인회원가입">
                                <span>개인회원가입</span>
                            </button>

                            <button onclick="window.location.href='/LineUp/member/signUp_Enterprise'" class="button is-warning is-light" value="사업자회원가입">
                                <span>사업자회원가입</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="loadFooter"></div>
    </body>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$("#loadHeader").load("../layout/header_bulma.jsp");
	$("#loadFooter").load("../layout/footer.html");
</script>
