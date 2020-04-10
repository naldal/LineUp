$(document).ready(function(){
	
	$('.qna_img').click(function(){
		$("#img_modal .modal").addClass("is-active");
		$('.icon_img').attr('src',$(this).attr('src'));
	});
	
	$("#img_modal img").click(function(){
		$("#img_modal .modal").removeClass("is-active");
	});
	
	//답변 버튼
	$('#answerBtn').click(function(){
		if($(this).text()=='답변'){
			$('#answer').html("<textarea style='width:640px; height:140px; resize:none;'></textarea>");
			$(this).text('답변 등록');
			$(this).click(function(){
				let text = $('#answer textarea').val();
				$.ajax({
					type: 'post',
					url: '/LineUp/member/qnaReply',
					data: "reply="+text+"&seq="+$('#seq').val(),
					success: function(){
						location.href="/LineUp/member/qna_View?seq="+$('#seq').val()+"&pg="+$('#pg').val();
					}
					
				});
			});
		}
		
	});
	
	
	//삭제 버튼
	$('#delBtn').click(function(){
		
		Swal.fire({
			  title: 'Are you sure?',
			  text: "게시글을 삭제 하시겠습니까?!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
		}).then((resert)=>{
			if(resert.value==true){
				$.ajax({
					type: 'post',
					url: '/LineUp/member/qnaDelete',
					data: "seq="+$('#seq').val(),
					success: function(){
						Swal.fire(
						  'Deleted!',
					      'Your file has been deleted.',
					      'success'
						).then(()=>{
							location.href="/LineUp/home/qna?pg=1";
						})
					}
					
				});
			}
		})
	});
	
});