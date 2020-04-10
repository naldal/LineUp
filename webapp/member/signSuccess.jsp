<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입 성공</title>
</head>
<body>
<form action="signSuccess">
    <div id="ssWrapper">
    <div id="loadHeader"></div>
    <br><br>
    <div id="ssBoxes">
    <input type="hidden" name="checkEmail" value="${param.id}">
        <div class="ssTextBox" align="center">
       <h1> <p class="ssText">LineUp </p><br><font color=gray>${param.id}님 홈페이지 회원가입이 완료되었습니다.<br>Now, you can login!</font></h1>
    	</div>
	</div>
    </div>
    <br><br><br>
    </form>
   <div id="loadFooter"></div>
</body>
<script src="../js/bulma-steps.min.js"></script>
<script>
    bulmaSteps.attach();
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../js/SignUp_Enterprise.js"></script>
<script>
$("#loadHeader").load("../layout/header_bulma.jsp");
$("#loadFooter").load("../layout/footer.html");
$.ajax({
    type: 'GET',
    url: '/LineUp/member/signSuccess',
    data: 'id=${param.id}',
    success: function () {
    },
	error : function(e){
	console.log("ssssssss");
}
});
</script>
</html>