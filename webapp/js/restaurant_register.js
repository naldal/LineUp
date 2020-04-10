$("#loadHeader").load("../layout/header_bulma.jsp");
$("#loadFooter").load("../layout/footer.html");


$("#add_rows").click(function () {
    if ($('.table > tbody tr').length < 20) {
        $(".table > tbody:last").append('<tr class="table_tr"><td><input class="input" name="menuName" type="text"/></td><td><input class="input" name="price" type="text" placeholder="only number"></td><td style="text-align:center; "><input type="checkbox" name="vegan" style="margin-top:13px "></td><td style="text-align:center;"><input type="checkbox" name="spicy" style="margin-top:13px"></td></tr>');
        $(".table > tbody > tr:last").append('<span><a class="del_rows"><i class="fas fa-ban"></i></a></span>');
    }
    $(".del_rows")
        .css("margin-top", "20px")
        .css("display", "inline-block");
    $(".del_rows").click(function () {
        $(this)
            .parents(".table_tr")
            .remove();
    });
});

// $("#del_rows").click(function() {
//     $(".table > tbody:last > tr:last").remove();
// });

$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $("#backToTop").fadeIn(500);
    } else {
        $("#backToTop").fadeOut("slow");
    }
    $("#backToTop").click(function (e) {
        e.preventDefault();
        $("html, body").animate({ scrollTop: 0 }, 600);
    });
});

$(document).ready(function () {
	if($('#sessionValue').attr("value") == ''){
//		alert('로그인 해주세요.');
		Swal.fire({
			  icon: 'error',
			  title: '로그인 해주세요',
			});

		location.replace('/LineUp/member/loginForm');
	}
	
    /* restaurant register */
    $('#regi_submit').click(function () {
        $('#restaurant_name_Div').empty();
        $('#addr_Div').empty();
        $('#tel_Div').empty();
        $('#file_Div').empty();

        if ($('#restaurant_name').val() == '') {
            $('#restaurant_name_Div').text('레스토랑 이름을 입력해주세요');
            $('#restaurant_name_Div').css('font-size', '10pt');
            $('#restaurant_name_Div').css('margin-left', '18pt');
            $('#restaurant_name_Div').css('margin-top', '5pt');
        } else if ($('#addr').val() == '') {
            $('#addr_Div').text('주소를 입력해주세요')
            $('#addr_Div').css('font-size', '10pt');
            $('#addr_Div').css('margin-left', '12pt');
            $('#addr_Div').css('margin-top', '-6pt');
        } else if ($('#tel').val() == '') {
            $('#tel_Div').text('전화번호를 입력해주세요');
            $('#tel_Div').css('font-size', '10pt');
            $('#tel_Div').css('margin-left', '18pt');
            $('#tel_Div').css('margin-top', '-3pt');
        } else if ($('#file').val() == '') {
            $('#file_Div').text('가게 대표사진을 넣어주세요');
            $('#file_Div').css('font-size', '8pt');
            $('#file_Div').css('margin-left', '18pt');
            $('#file_Div').css('margin-top', '4pt');
        } else {
            let formData = new FormData($('#restaurnat_reigster_form')[0]);
            $.ajax({
                type: 'post',
                enctype: 'multipart/form-data',
                data: formData,
                url: '/LineUp/restaurant/restaurant_register_imgs',
                processData: false,
                contentType: false,
                success: function () {
//                    alert("가게등록에 성공했습니다.");
                	Swal.fire({
                		  position: 'top-end',
                		  icon: '가게등록에 성공했습니다',
                		  showConfirmButton: false,
                		  timer: 1500
                		});
                    var menuBar = confirm("이어서 메뉴를 등록해주세요");
                    
                    if(menuBar) {
                    	$('#lookme').css('display', 'block');
                    	var scrollPosition = $('#lookme').offset().top;
                    	
                    	$('body').animate({
                    		scrollTop: scrollPosition
                    	}, 400);
                    	
                    	$('#menuSubmit').click(function(){
                    		const menu = [];
                    		let menulength = $('[name=menuName]').length;
                    		for(let i=0; i< menulength; i++){
                    			if($('[name=vegan]').eq(i).val()==false){
                    				$('[name=vegan]').eq(i).val()==null;
                    			} else {
                    				$('[name=vegan]').eq(i).val()=='vegan';
                    			}
                    			
                    			if($('[name=spicy]').eq(i).val()==false){
                    				$('[name=spicy]').eq(i).val()==null;
                    			} else {
                    				$('[name=spicy]').eq(i).val()=='spicy';
                    			}
                    			
                        		menu[i] = $('[name=menuName]').eq(i).val()+','+$('[name=price]').eq(i).val()+','+$('[name=vegan]').eq(i).prop('checked')+','+$('[name=spicy]').eq(i).prop('checked');
                        	}
                    		$.ajax({
                    			type: 'post',
                    			url: '/LineUp/restaurant/restaurant_menu',
                    			data: 'menu='+menu+'&company_num='+$('#company_num').val(),
                    			success: function () {
//                    				alert("메뉴등록성공!")
                    				Swal.fire({
                    					  position: 'top-end',
                    					  icon: '메뉴등록성공!',
                    					  showConfirmButton: false,
                    					  timer: 1500
                    					})
                    			},
                    			error: function(e){
//                    				alert("메뉴등록에 실패했습니다.");
                    				Swal.fire({
                    					  icon: 'error',
                    					  title: '메뉴등록에 실패했습니다'
                    					});
                    			}
                    		});
                    	});
                    } //if
                },
                error: function(e){
//                	alert('가게는 계정당 하나만 등록할 수 있습니다.');
                	Swal.fire({
  					  icon: 'error',
  					  title: '가게는 계정당 하나만 등록할 수 있습니다'
  					});
				}
            });
        }
    });
});
