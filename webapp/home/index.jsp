
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css" /> -->
        <!-- import -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top5.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
        
        <!-- font -->
        <link href="https://fonts.googleapis.com/css?family=Gugi|Rubik&display=swap&subset=korean" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/owl.carousel.min.js"></script>   
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />
</head>
<input type="hidden" id="pg" name="pg" value="${pg }">

<body style="background-color: white;">
    <div style="border-bottom: 1px solid rgba(0, 0, 0, 0.1)" id="loadHeader"></div>
    <p style="text-align: center; font-size: 25pt; margin-top: 100px;">
    SEARCH WHAT YOU WANT!</p>

    <!-- search box -->
    <div class="panel-block" style="border-bottom: none;">

      <div id="inputBox" style="position: relative;">

         <div id="searchOptionBox" style="position: absolute; top:0; left:-25%">
         <select name="searchOption" id="searchOption">
               <option value="">Options</option>
               <option value="addr" >Location</option>
               <option value="restaurant_name" >Restaurants</option>
               <option value="category" >Category</option>
         </select>
         </div> 
                  <p class="control has-icons-left">
            <input class="input is-warning" id="searchText" style="" name="searchText" type="text" placeholder="Search" />
            <span class="icon is-left">
               <i class="fas fa-search" aria-hidden="true"></i>
            </span>
         </p>
          <div id="searchBtnDiv" style="position:absolute; top:0; right:-19%">
                <button id="searchHomeBtn" class="button is-primary"  style="left:32%;">Click here!</button>
          </div>
          
       </div>
    </div>

   <div id="search-list"></div>
   
    <div class="vegan">
        <p>
            Are you Vegan?&nbsp;&nbsp; 
            <input type="radio" id="vegan" name="vegan" value="veganYes">yes&nbsp;&nbsp; 
            <input type="radio"  id="vegan" name="vegan" value="veganNo" checked> no
        </p>
    </div>

    <div class="carousel-wrap" style="margin-top: 15px;">
        <!-- pic size w1135 h500 -->
        <div class="owl-carousel">
            <div class="item">
                <div class="top5" style="width: 1350px; height: 700px;"> 
                    <div class="grid-container" style="padding: 0; width: 100%;">
                        <div class="grid-item" id="item1">
                         <a href="../home/aboutUs">
                        <img src="${pageContext.request.contextPath}/img/top10.jpg"
                            style="margin: 0 auto; width: 100%; height: inherit;"></a>
                         </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="top1" style="width: 1350px; height: 700px;">
                    <div class="grid-container" style="padding: 0; width: 100%;">
                        <div class="grid-item" id="item1">
                        <a href="../home/aboutUs">
                        <img src="${pageContext.request.contextPath}/img/top4.jpg"
                                style="margin: 0 auto; width: 100%; height: inherit;" id="items"></a></div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="top2" style="width: 1350px; height: 700px;">
                    <div class="grid-container" style="padding: 0; width: 100%;">
                        <div class="grid-item" id="item1">
                        <a href="../home/infoPage">
                        <img src="${pageContext.request.contextPath}/img/top5.jpg"
                            style="margin: 0 auto; width: 100%; height: inherit;"></a></div>
                    </div>
                </div>
            </div>

            <div class="item">
                <div class="top3" style="width: 1350px; height: 700px;"> 
                    <div class="grid-container" style="padding: 0; width: 100%;">
                        <div class="grid-item" id="item1"><a href="../home/aboutUs"><img src="${pageContext.request.contextPath}/img/top1.jpg"
                            style="margin: 0 auto; width: 100%; height: inherit;"></a></div>
                    </div>
                </div>
            </div>

            <div class="item">
                <div class="top4" style="width: 1350px; height: 700px;">
                    <div class="grid-container" style="padding: 0; width: 100%;">
                        <div class="grid-item" id="item1"><a href="../home/aboutUs"><img src="${pageContext.request.contextPath}/img/top6.jpg"
                            style="margin: 0 auto; width: 100%; height: inherit;"></a></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div id="best_restaurang_list">
        <div>
            <p style="font-size: 25pt; margin-bottom: 15px; text-align: center;">
                <strong>Today's Restaurants</strong>
            </p>
        </div>
        <div id="carousel" style="width:9999px;">
           <c:forEach var="row" items="${indexTodayRestaurant }">
            <div id="list-cover" class="carousel1 no" onclick="location.href='../restaurant/detailRestaurant?pg=${pg }&seq_member=${row.seq_member }&seq_restaurant=${row.seq_restaurant}';">
                <div id="list-cover-subject">
                    <h2>${row.restaurant_name }</h2>
                </div>
                <div id="best-list" class="best-1">
                    <div class="card">
                        <div class="card-image">
                            <figure class="image is-3by2">
                                <img src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/${row.main_img}" alt=""> 
                            </figure>
                        </div>
                        <div class="card-content">
                            <div class="content">
                                <h4>${row.category }</h4>
                                <p>${row.addr }<br>${row.tel }</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>

    <!-- Reviews -->

    <section class="restaurantList">
        <div class="container">
            <div class="heading">
                <p style="font-size: 25pt; margin-top: 60px; text-align: center;">
                    <strong>Reviews</strong>
                </p>
            </div>
          
    		<c:forEach var="row" items="${indexReview }">
            <div id="l1" class="box">
               <%--  <div class="card-image">
                    <figure class="image is-1by1">
                        <img src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/${row.main_img}">
                    </figure>
                </div> --%>
                <div class="content">
                    <h4>${row.restaurant_name}</h4>
                    <span>${row.nickname}</span>
                    <p> ${row.subject }<br>
                       ${row.content}</p>
                    <div class="text-button">
                    <a href="../restaurant/detailRestaurant?pg=${pg }&seq_member=${row.seq_member }&seq_restaurant=${row.seq_restaurant}">Continue Reading</a>
                    </div>
                </div>
            </div>
			</c:forEach>
          
        </div>

    </section>
    <div id="loadFooter" style="margin-top: 50px;"></div>
</body>

<script type="text/javascript" src="../js/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/js/bulma-carousel.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
   $("#loadHeader").load("../layout/header.jsp");
   $("#loadFooter").load("/LineUp/layout/footer.html");

   


</script>

</html>