$("#loadHeader").load("../layout/header_bulma.html");
$("#loadFooter").load("../layout/footer.html");

var calendar = new Date();
var year = calendar.getFullYear();
var month = calendar.getMonth() + 1;
var date = calendar.getDate();
var day = calendar.getDay();
var cnt = 0;
var lastDay = new Date("2020", "02", "0").getDate();
$("#date").val(year + "년" + month + "월" + date + "일");

$(".previous-day").click(function() {
    //가게 오픈시점까지 되돌릴수 있다.
    date = date - 1;
    if (date < 1) {
        month = month - 1;
        if (month < 1) {
            year = year - 1;
            month = 12;
        }
        date = new Date(year, month, "0").getDate();
    }
    $("#date").val(year + "년" + month + "월" + date + "일");
    $(".next-day").removeAttr("src");
    $(".next-day").attr("src", "꺽쇠1.png");
    $(".next-day").css("pointer-events", "auto");

    if (date == calendar.getDate()) {
        $("#changeBtn").text("대기 시작");
    }
});
$(".next-day").click(function() {
    //바로 다음날까지만 넘길수있다.

    date = date + 1;
    if (date > new Date(year, month, "0").getDate()) {
        month = month + 1;
        date = 1;
        if (month > 12) {
            year = year + 1;
            month = 1;
        }
    }
    if (year == calendar.getFullYear() && month == calendar.getMonth() + 1 && date == calendar.getDate() + 1) {
        $(".next-day").removeAttr("src");
        $(".next-day").attr("src", "꺽쇠1-1.png");
        $(".next-day").css("pointer-events", "none");
        $("#changeBtn").text("휴일");
    }
    $("#date").val(year + "년" + month + "월" + date + "일");
});

$("#add_rows").click(function() {
    $(".table > tbody:last").append(
        '<tr class="menu-table"><td><input class="input is-small" type="text"/></td><td><input class="input is-small" type="text" placeholder="only number"></td><td id="del-position"><a class="del_row"><span class="icon has-text-danger"><i class="fas fa-ban"></i></span></a></td></tr>'
    );
    $(".fas.fa-ban").css("cursor", "pointer");
    $(".del_row").click(function() {
        $(this)
            .parents(".menu-table")
            .remove();
    });
});

$(".review-content").click(function() {
    if ($(this).text() == "접기") {
        $(this)
            .prev("#content")
            .css("max-height", "150px");
        $(this).text("펼치기");
    } else if ($(this).text() == "펼치기") {
        $(this)
            .prev("#content")
            .css("max-height", "none");
        $(this).text("접기");
    }
});
$("#Reservation-List").click(function() {
    if ($(this).text() == "접기") {
        $(this)
            .prev("#Reservation-Management")
            .css("max-height", "50px");
        $(this).text("펼치기");
    } else {
        $(this)
            .prev("#Reservation-Management")
            .css("max-height", "none");
        $(this).text("접기");
    }
});

$("#review-List").click(function() {
    if ($(this).text() == "접기") {
        $(this)
            .prev("#my-restaurang-review-list")
            .css("max-height", "435px");
        $(this).text("더보기");
    } else {
        $(this)
            .prev("#my-restaurang-review-list")
            .css("max-height", "none");
        $(this).text("접기");
    }
});

$(".category_div li").click(function() {
    let val = $(this).val();
    let offset = $("#scroll" + val).offset();
    $("html, body").animate({ scrollTop: offset.top }, 400);
});

$("body").on("mousewheel", function(e) {
    let wheel = e.originalEvent.wheelDelta;
    if (wheel > 0) {
        //스크롤 올릴때
    } else if (wheel < 0) {
        //내릴때
    }
});
