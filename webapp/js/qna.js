var sel_files=[];
$(document).ready(function(){
	
	$("#loadHeader").load("../layout/header_bulma.jsp");
	$("#loadFooter").load("../layout/footer.html");
	
	$('#searchBtn').click(function(event){
		$('#qnaTable tbody').empty();
		$('#qnaPaging').empty();
		$.ajax({
			type: 'post',
			url: '/LineUp/member/searchQnaList',
			data: "category="+$('#category').val()+"&search="+$('#search').val()+"&pg="+$('#pg').val(),
			dataType: 'json',
			success: function(data){
				$.each(data.qnaSearchList, function(index,items){
					alert(items);
					$('#qnaTable tbody').append($('<tr/>').append($('<th/>',{
								align: 'center',
								text:items.seq_qna
							})).append($('<td/>',{
								text: items.category_qna
							})).append($('<td/>').append($('<div/>',{
									style:"float:left",
									class:items.secret
								}).append($('<img/>',{
									width:'20px',
									height:'20px'
								}))
							).append($('<a/>',{
									href:"/LineUp/member/qna_View?seq="+items.seq_qna+"&pg="+$('#pg').val(),
									text:items.subject_qna
								})						
							)).append($('<td/>',{
								align: 'center',
								text: items.member_id
							})).append($('<td/>',{
								align: 'center',
								text: items.log_time
							})).append($('<td/>').append($('<span/>',{
									align: 'center',
									class:items.status
							}))
					))
					if($('#qnaTable tbody span').eq(index).attr('class')=='0'){
						$('#qnaTable tbody span').eq(index).attr('class','tag is-info');
						$('#qnaTable tbody span').eq(index).text('대기중');
						
					}else{
						$('#qnaTable tbody span').eq(index).attr('class','tag is-danger')
						$('#qnaTable tbody span').eq(index).text('처리됨');
					}
					if($('#qnaTable tbody div').eq(index).attr('class')=='1'){
						$('#qnaTable tbody div').eq(index).find('img').attr('src','../img/열쇠.png');
					}else{
						$('#qnaTable tbody div').eq(index).empty();
					}
				}); //each 리스트
				$('#qnaPaging').append(data.qnaSearchPaging);//each -- 페이징
			}
		});
	});

	if($('#step').val()==1){
		$.ajax({
			type: 'post',
			url: '/LineUp/member/getQnaFormList',
			data: 'pg='+$('#pg').val(),
			dataType: 'json',
			//async: false,
			success: function(data){
				$.each(data.qnaList, function(index,items){
					$('#qnaTable tbody').append($('<tr/>').append($('<th/>',{
								align: 'center',
								text:items.seq_qna
							})).append($('<td/>',{
								text: items.category_qna
							})).append($('<td/>').append($('<div/>',{
								style:"float:left",
								class:items.secret
							}).append($('<img/>',{
								width:'20px',
								height:'20px'
							}))
						).append($('<a>',{
									href:"/LineUp/member/qna_View?seq="+items.seq_qna+"&pg="+$('#pg').val(),
									text:items.subject_qna
								})						
							)).append($('<td/>',{
								align: 'center',
								text: items.member_id
							})).append($('<td/>',{
								align: 'center',
								text: items.log_time
							})).append($('<td/>').append($('<span/>',{
									align: 'center',
									class:items.status
							}))
					))
					if($('#qnaTable tbody span').eq(index).attr('class')=='0'){
						$('#qnaTable tbody span').eq(index).attr('class','tag is-info');
						$('#qnaTable tbody span').eq(index).text('대기중');
						
					}else{
						$('#qnaTable tbody span').eq(index).attr('class','tag is-danger')
						$('#qnaTable tbody span').eq(index).text('처리됨');
					}
					if($('#qnaTable tbody div').eq(index).attr('class')=='1'){
						$('#qnaTable tbody div').eq(index).find('img').attr('src','../img/열쇠.png');
					}else{
						$('#qnaTable tbody div').eq(index).empty();
					}
				}); //each -- qna리스트
				
				$('#qnaPaging').append(data.qnaPaging);//each -- 페이징
				
			}
		});
	}else if($('#step').val()==2){
		$('#category option').each(function(){
			if($(this).val()==$('.category_search').val()){
				$(this).prop("selected","selected"); 
			}
		});
		$('#search').val($('.search_search').val());
		$('#searchBtn').trigger('click');
	}
	
	$('#qna-btn').click(function(){
		$('.modal').css('display','flex');
		$('#subject_qna').focus();
	});
	
	$('#faq-btn').click(function(){
		location.href="/LineUp/home/faq";
	});
	
	$('#modal-back,#cancle,.delete').click(function(){
		$('.modal').css('display','none');
	});
	
	$('#submit').click(function(){
		$('#subject_alert').empty();
		$('#content_alert').empty();
		$('#img_alert').empty();
		if($('#subject_qna').val()==''){
			$('#subject_alert').text('* 제목을 입력해주세요.').css('color','red').css('font-weight','bold').css('font-size','10pt').css('margin-left','15px');
			$('#subject_qna').focus();
		}else if($('#content_qna').val()==''){
			$('#content_alert').text('* 내용을 입력해주세요.').css('color','red').css('font-weight','bold').css('font-size','10pt').css('margin-left','15px');
			$('#content_qna').focus();
		}else{
			var secret = confirm("해당글을 비공개로 등록하시겠습니까?");
			var formData = new FormData($('#qnaWriteForm')[0]);
			formData.append("secret", secret);
			for(i=0; i<imgTotal; i++){
				
				formData.append("imgs",sel_files[i]);
			}
			$.ajax({
				type: 'post',
				url: '/LineUp/member/qnaWrite',
				enctype: 'multipart/form-data',
	    		contentType: false, 
				processData: false,
				data: formData,
				dataType: "text",
				success: function(data){
					if(data=='false'){
//						alert('잘못된 접근입니다. \n로그인후 사용해주세요.');
						Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: '잘못된 접근입니다. \n로그인후 사용해주세요'
							});
						location.href="/LineUp/member/loginForm";
					}else{
//						alert('문의가 접수되었습니다.');
						Swal.fire({
							  position: 'top-end',
							  icon: '문의가 접수되었습니다.',
							  showConfirmButton: false,
							  timer: 1500
							});
						location.href="/LineUp/home/qna";
					}
				}
				
				
			});
		}
	});
	
	
	$('#qnaImg').on('change',function(){
		readURL(this);
	});
});

var imgTotal=0;
var num=1;
function readURL(input){
	if(input.files && input.files[0]){
		var files = input.files; 
		var filesArr = Array.prototype.slice.call(files);
		//alert(filesArr.length);
		imgTotal=imgTotal+filesArr.length;
		if(imgTotal>3){
			$('#subject_alert').empty();
			$('#content_alert').empty();
			$('#img_alert').empty();
			$('#img_alert').text("* 이미지는 3개까지 등록이 가능합니다.").css("color","red").css("font-weight","bold").css("font-size","9pt");
		}else{
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
//					alert('확장자는 이미지 확장자만 가능합니다.');
					Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: '확장자는 이미지 확장자만 가능합니다'
						});

					return;
				}
				
				sel_files.push(f);
				//alert(f.name);
				var reader = new FileReader();
				reader.onload=function(e){
					$('#imgs').append("<span class='imgs_span' style='width:100%; height:100%; max-width:100px; max-height:100px; margin:5px; display: inline-block; position:relative' >"
								+"<img class='img' src='"+e.target.result+"' width='100px' height='auto' style='border: 1px solid rgba(0,0,0,0.3);'>"
								+"<span class='ll' style='position: absolute;width: 20px;height: 20px;left: 79px; top: 1px'>"
									+"<a class='delete'></a>"
								+"</span>"
							+"</span>" );
					
					$('.delete').click(function(){
						if($(this).closest('.imgs_span').index() != -1){
							$('#img_alert').empty();
							sel_files.splice($(this).closest('.imgs_span').index(),1);
							imgTotal= imgTotal-1;
						}
						$(this).closest('.imgs_span').remove();
					});
				}
				num=1;
				reader.readAsDataURL(f);
				
			});
		}
	}
}