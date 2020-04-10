<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />

        <link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Poppins:400,500,500i,700&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Sen&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="../css/header_bulma.css" />
    </head>
    <body>
        <section class="hero is-warning">
            <div class="hero-body">
                <div class="container" style="height: 70px;">
                    <h1 class="title" id="title">
                        LineUp
                    </h1>
                    <br />
                    <h2 id="subtitle">
                        You're in
                    </h2>
                </div>
            </div>
        </section>
        <nav class="navbar ">
            <div class="navbar-brand">
                
                <a class="navbar-item" href="/LineUp/home/index">
                    <img src="../img/final_logo.jpg" style="max-width: 120px; width: 100%; height: 100%; max-height: 120px;" />
                </a>

                <a class="navbar-item is-hidden-desktop" href="https://github.com/jgthms/bulma" target="_blank">
                    <span class="icon" style="color: #333;">
                        <i class="fa fa-github"></i>
                    </span>
                </a>

                <a class="navbar-item is-hidden-desktop" href="https://twitter.com/jgthms" target="_blank">
                    <span class="icon" style="color: #55acee;">
                        <i class="fa fa-twitter"></i>
                    </span>
                </a>

                <div class="navbar-burger burger" data-target="navMenubd-example">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>

            <div id="navbarBasic" class="navbar-menu">
                <div class="navbar-start">
                    <div class="navbar-item">
                        <a class="navbar-item" id="infoBtn">
                            Info
                        </a>

                        <a class="navbar-item" id="aboutUsBtn">
                            About Us
                        </a>

                        <a href="/LineUp/restaurant/restaurantList" class="navbar-item" id="restaurantBtn">
                            Restaurants
                        </a>
                        <div class="navbar-dropdown "></div>
                    </div>
                    <div class="navbar-item has-dropdown is-hoverable is-mega">
                        <div class="navbar-link">
                            Site Map
                        </div>
                        <div id="blogDropdown" class="navbar-dropdown " data-style="width: 18rem;">
                            <div class="container is-fluid">
                                <div class="columns">
                                    <div class="column">
                                        <a class="navbar-item" href="/LineUp/restaurant/restaurantList">
                                            <div class="navbar-content">
                                                <p>
                                                    <small class="has-text-info">Restaurant List</small>
                                                </p>
                                                <p>Shows the list of restaurants.</p>
                                            </div>
                                        </a>
                                        <a class="navbar-item" href="/LineUp/home/qna">
                                            <div class="navbar-content">
                                                <p>
                                                    <small class="has-text-info">Q & A</small>
                                                </p>
                                                <p>Ask questions and get answers.</p>
                                            </div>
                                        </a>
                                        
                                        <a class="navbar-item" href="///">
                                            <div class="navbar-content">
                                                <p>
                                                    <small class="has-text-info">FAQ</small>
                                                </p>
                                                <p>Show frequently asked questions from members.</p>
                                            </div>
                                        </a>
                                        
                                    </div>
                                    <div class="column">
                                    	
                                    	<c:if test="${memDTO!=null}">
                                        <a class="navbar-item" href="/LineUp/member/myPage">
                                            <div class="navbar-content">
                                                <p>
                                                    <small class="has-text-info">My Page</small>
                                                </p>
                                                <p>Shows the information for your account.</p>
                                            </div>
                                        </a>
                                        </c:if>
                                        
                                        <a class="navbar-item" href="/LineUp/home/contactUs">
                                            <div class="navbar-content">
                                                <p>
                                                    <small class="has-text-info">Contact Us</small>
                                                </p>
                                                <p>If you want to contact us, please press here.</p>
                                            </div>
                                        </a>
                                        <a class="navbar-item" href="/LineUp/home/privacy_Guidelines">
                                            <div class="navbar-content">
                                                <p>
                                                    <small class="has-text-info">Privacy Policy</small>
                                                </p>
                                                <p>Shows the member information processing policy.</p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="column">
                                    	
                                    	<c:if test="${sessionScope.memDTO_seq eq 181}">
                                        <a class="navbar-item" href="/LineUp/admin/memberManage">
                                            <div class="navbar-content">
                                                <p>
                                                    <small class="has-text-info">회원들을 관리하세요</small>
                                                </p>
                                                <p>Manage Members.</p>
                                            </div>
                                        </a>
                                        
                                        
                                        <c:if test="${sessionScope.memDTO_seq eq 181}">
                                        <a class="navbar-item" href="/LineUp/admin/deletedMember">
                                            <div class="navbar-content">
                                                <p>
                                                    <small class="has-text-info">삭제된 회원을 관리하세요</small>
                                                </p>
                                                <p>Manage Deleted Members</p>
                                            </div>
                                        </a>
                                        </c:if>
                                        
                                        <a class="navbar-item" href="/LineUp/admin/blockedMember">
                                            <div class="navbar-content">
                                                <p>
                                                    <small class="has-text-info">블랙회원을 관리하세요</small>
                                                </p>
                                                <p>Manage Blocked Members</p>
                                            </div>
                                        </a>
                                        </c:if>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="navbar-end">
                    <div class="navbar-item">
                        <div class="buttons">
                            <c:if test="${memDTO.position=='ENTERPRISE' && memDTO.store_exist==null}">
                            <a class="button is-warning" id="register"><strong>Register Restaurant</strong></a>
                        </c:if>
                        
                        <c:if test="${memDTO.position=='ENTERPRISE'}">
                        	<a class="button is-warning" id="business_myPage" href="/LineUp/restaurant/store_information_management"><strong>가게정보관리</strong></a>
                        </c:if>
                        
                      	<c:if test="${memDTO!=null}">
                            <a class="button is-warning" id="myPage" href="/LineUp/member/myPage"><strong>My Page</strong></a>
						</c:if>
						
						<c:if test="${memDTO==null}">
                            <a class="button is-primary" id="signUp" href="/LineUp/member/signUpBtns"><strong>Sign up</strong></a>
                            <a class="button is-light" id="login" href="/LineUp/member/loginForm"><strong>Log in</strong></a>
                        </c:if>
                        
                  		<c:if test="${memDTO!=null}">
                        	<a class="button is-danger" id="logout" href="/LineUp/member/logout"><strong>Logout</strong></a>
                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/menubarAction.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../js/header.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$('#infoBtn').click(function(){
	location.href="/LineUp/home/infoPage";
});

$('#aboutUsBtn').click(function(){
	location.href="/LineUp/home/aboutUs";
});



</script>
</html>