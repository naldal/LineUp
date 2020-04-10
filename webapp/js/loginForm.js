$("#loadHeader").load("../layout/header_bulma.jsp");
$("#loadFooter").load("../layout/footer.html");
$(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
        $("#backToTop").fadeIn(500);
    } else {
        $("#backToTop").fadeOut("slow");
    }
});
$("#backToTop").click(function(e) {
    e.preventDefault();
    $("html, body").animate({ scrollTop: 0 }, 200);
});

$('#submit').click(function(){
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#id').val()=="") {
		$('#idDiv').text("아이디를 입력해주세요.");
		$('#idDiv').css("color", "#db4437");
		$('#idDiv').css("font-size", "10pt");
		$('#idDiv').css("font-weight", "bold");
	} else if($('#pwd').val()=="") {
		$('#pwdDiv').text("비밀번호를 입력해주세요.");
		$('#pwdDiv').css("color", "#db4437");
		$('#pwdDiv').css("font-size", "10pt");
		$('#pwdDiv').css("font-weight", "bold");
	}
	else {
		let timerInterval
		Swal.fire({
		  title: '로그인 중입니다...',
		  html: 'I will close in <b></b> milliseconds.',
		  timer: 2000,
		  timerProgressBar: true,
		  onBeforeOpen: () => {
		    Swal.showLoading()
		    timerInterval = setInterval(() => {
		      const content = Swal.getContent()
		      if (content) {
		        const b = content.querySelector('b')
		        if (b) {
		          b.textContent = Swal.getTimerLeft()
		        }
		      }
		    }, 100)
		  },
		  onClose: () => {
		    clearInterval(timerInterval)
		  }
		}).then((result) => {
		  /* Read more about handling dismissals below */
		  if (result.dismiss === Swal.DismissReason.timer) {
		    console.log('I was closed by the timer')
		  }
		});
		
		
		$.ajax({
			type : 'post',
			url : '/LineUp/member/login',
			data : {'id':$('#id').val(), 'pwd':$('#pwd').val()},
			dataType : 'text',
			success : function(data) {
				if(data == "success") {
					location.href = "/LineUp/home/index";
				} else if (data == "email_confirm") {
					alert("보내드린 메일에서 email 인증해주세요.");
					location.href = "/LineUp/member/loginForm";
				} else if(data == "fail") {
					$('#loginResultDiv').text('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');
					$('#loginResultDiv').css("color", "#db4437");
					$('#loginResultDiv').css("font-size", "10pt");
					$('#loginResultDiv').css("font-weight", "bold");
					$('#loginResultDiv').css("margin-bottom", "10px");
					$('#loginResultDiv').css("margin-top", "-25px");
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
});

$('#pwd').keyup(function(e){
	if(e.keyCode==13) {
		$('#submit').trigger('click');
	}
});
