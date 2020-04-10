$("#loadHeader").load("../../layout/header_bulma.html");
$("#loadFooter").load("../../layout/footer.html");

$("#chkall").click(function () {
    if ($("#chkall").prop("checked")) {
        $("input[name=chk]").prop("checked", true);
    } else {
        $("input[name=chk]").prop("checked", false);
    }
});

if ($("#chk1").prop("checked") == true && $("#chk2").prop("checked") == true) {
    $("#chkall").prop("checked", true);
}

let check = 0;
$('#id').focusout(function () {
	$('#idDiv').empty();
	
    if ($('#id').val() == "") {
        $('#idDiv').text('필수 정보입니다.')
        $('#idDiv').css('font-size', '10pt')
        $('#idDiv').css('color', '#d35400');
        $('#idDiv').css('margin-top', '-9px');
        $('#idDiv').css('margin-bottom', '9px');
        $('#idDiv').css('margin-left', '150px');
        $('#idDiv').css('width', '198px');
    } else {
        $.ajax({
            type: 'POST',
            url: '/LineUp/member/loginCheck',
            data: 'id=' + $('#id').val(),
            dataType: 'text',
            success: function (data) {
                if (data == 'exist') {
                    check = 0;
                    $('#idDiv').text('중복된 이메일(아이디) 입니다.')
                    $('#idDiv').css('font-size', '10pt')
                    $('#idDiv').css('color', '#d35400');
                    $('#idDiv').css('margin-top', '-9px');
                    $('#idDiv').css('margin-bottom', '9px');
                    $('#idDiv').css('margin-left', '184px');
                    $('#idDiv').css('width', '198px');

                } else if (data == 'non_exist') {
                	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
                    if(!reg_email.test($('#id').val())) {
                    	check = 0;
						$('#idDiv').text("이메일 양식에 맞지 않습니다.");
						$('#idDiv').css('font-size', '10pt')
						$('#idDiv').css('color', '#d35400');
						$('#idDiv').css('margin-top', '-9px');
						$('#idDiv').css('margin-bottom', '9px');
						$('#idDiv').css('margin-left', '198px');
						$('#idDiv').css('width', '170px');
	                  }                              	
                    } else {                       
                    	 check = 1;
                         $('#idDiv').text("사용 가능한 이메일(아이디) 입니다.");
                         $('#idDiv').css('font-size', '10pt')
                         $('#idDiv').css('color', '#2980b9');
                         $('#idDiv').css('margin-top', '-9px');
                         $('#idDiv').css('margin-bottom', '9px');
                         $('#idDiv').css('margin-left', '198px');
                         $('#idDiv').css('width', '219px');
                    }                              	
            }
        });
    }

});


let num = 0;
$(".custom_prev").click(function (e) {
    num = num + 1;
    if (num == 1) {
        if ($("#chk1").prop("checked") == false || $("#chk2").prop("checked") == false) {
//            alert("필수약관에 동의하셔야 합니다.");
        	Swal.fire({
        		  position: 'top-end',
        		  icon: 'success',
        		  title: '필수약관에 동의하셔야 합니다',
        		  showConfirmButton: false,
        		  timer: 1500
        		});
            num = num - 1;
            e.stopImmediatePropagation();
        } else {

        	$('#pwdDiv').text('영문, 숫자 혼합하여 6~20자리 이내로 작성하십시오');
        	$('#pwdDiv').css('font-size', '14px');
        	$('#pwdDiv').css('margin-top', '-12px');
        	$('#pwdDiv').css('margin-bottom', '3px');
        	$('#pwdDiv').css('margin-left', '200px');
        	$('#pwdDiv').css('width', '296px');
            
        	$('#pwd').focusout(function(){
        		var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
        		if(!reg_pwd.test($('#pwd').val())){
        			$('#pwdDiv').text('영문, 숫자 혼합하여 6~20자리 이내로 작성하십시오');
        			$('#pwdDiv').css('color', '#d35400');
        		} else {
        			$('#pwdDiv').empty();
        		}    		
        	});
        	
        	$('#repwd').focusout(function(){
        		if ($("#pwd").val() != $("#repwd").val()) {
        			 $('#repwdDiv').text('비밀번호가 일치하지 않습니다.');
        	            $('#repwdDiv').css('font-size', '10pt');
        	            $('#repwdDiv').css('color', '#d35400');
        	            $('#repwdDiv').css('margin-top', '-9px');
        	            $('#repwdDiv').css('margin-bottom', '9px');
        	            $('#repwdDiv').css('margin-left', '184px');
        	            $('#repwdDiv').css('width', '198px');
        		} else if($('#pwd').val() == $('#repwd').val()){
        			var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
            		if(!reg_pwd.test($('#pwd').val())){
            			$('#pwdDiv').text('영문, 숫자 혼합하여 6~20자리 이내로 작성하십시오');
            			$('#pwdDiv').css('color', 'red');
            		} else {
            			$('#pwdDiv').empty();
            			$('#repwdDiv').empty();
            		}    		
        			
        		} else {
        			$('#repwdDiv').empty();
        		}
    		});
    	}
        
    } else if (num == 2) {
        
        $('#telDiv').empty();
        $('#real_nameDiv').empty();
        $('#company_numDiv').empty();
        
        if ($('#pwd').val() == "" || $('#repwd').val() == "") {
        	$('#pwdDiv').empty();
        	$('#pwdDiv').text('영문, 숫자 혼합하여 6~20자리 이내로 작성하십시오.');
            $('#pwdDiv').css('font-size', '10pt');
            $('#pwdDiv').css('color', '#d35400');
            $('#pwdDiv').css('margin-top', '-9px');
            $('#pwdDiv').css('margin-bottom', '9px');
            $('#pwdDiv').css('margin-left', '184px');
            $('#pwdDiv').css('width', '326px');
            num = num - 1;
            e.stopImmediatePropagation();
        } else if ( $('#id').val()=='') {
            $('#idDiv').text('아이디를 입력해주세요.')
            $('#idDiv').css('font-size', '10pt')
            $('#idDiv').css('color', '#d35400');
            $('#idDiv').css('margin-top', '-9px');
            $('#idDiv').css('margin-bottom', '9px');
            $('#idDiv').css('margin-left', '196px');
            $('#idDiv').css('width', '170px');
            num = num - 1;
            e.stopImmediatePropagation();
        } else if ($('#real_name').val() == "") {
            $('#real_nameDiv').text('필수 정보입니다.')
            $('#real_nameDiv').css('font-size', '10pt')
            $('#real_nameDiv').css('color', '#d35400');
            $('#real_nameDiv').css('margin-top', '-9px');
            $('#real_nameDiv').css('margin-bottom', '9px');
            $('#real_nameDiv').css('margin-left', '184px');
            $('#real_nameDiv').css('width', '198px');
            num = num - 1;
            e.stopImmediatePropagation();
        } else if ($('#company_num').val() == "") {
            $('#company_numDiv').text('필수 정보입니다.')
            $('#company_numDiv').css('font-size', '10pt')
            $('#company_numDiv').css('color', 'red');
            $('#company_numDiv').css('margin-top', '-9px');
            $('#company_numDiv').css('margin-bottom', '9px');
            $('#company_numDiv').css('margin-left', '150px');
            $('#company_numDiv').css('width', '198px');
            num = num - 1;
            e.stopImmediatePropagation();
        } else if ($('#tel').val() == "") {
            $('#telDiv').text('필수 정보입니다.')
            $('#telDiv').css('font-size', '10pt')
            $('#telDiv').css('color', '#d35400');
            $('#telDiv').css('margin-top', '-9px');
            $('#telDiv').css('margin-bottom', '9px');
            $('#telDiv').css('margin-left', '150px');
            $('#telDiv').css('width', '198px');
            num = num - 1;
            e.stopImmediatePropagation();
        } else {
        	Swal.fire({
      		  position: 'top-end',
      		  icon: 'success',
      		  title: '이메일이 발송되었습니다!',
      		  showConfirmButton: false,
      		  timer: 1500
        	});
        	
            $.ajax({
                type: 'POST',
                url: '/LineUp/member/enter_register',
                data: $('#enterprise_form').serialize(),
                success: function () {
//                	alert("회원가입이 완료되었습니다");
                	Swal.fire({
                		  position: 'top-end',
                		  icon: 'success',
                		  title: '회원가입이 완료되었습니다',
                		  showConfirmButton: false,
                		  timer: 1500
                	});
                }
            });
        }
    }

});
