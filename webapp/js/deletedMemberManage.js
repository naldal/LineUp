$(document).ready(function(){
	$("#loadHeader").load("../layout/header_bulma.jsp");  
	$("#loadFooter").load("../layout/footer.html"); 

//	삭제된 멤버데이터 가져오기
//	deletedMemberDTOList
	$.ajax({
		type: 'post',
		url: '/LineUp/admin/getDeletedMemberData',
		dataType:'json',
		success: function(data){
			
//			alert(JSON.stringify(data)); ok
			if(data.isAdmin=='ADMIN') {
				$.each(data.deletedMemberDTOList, function(index, items){
					$('#tdStart').append(
						'<tr id="'+items.seq_member+'" class="'+items.position+'">'
						+'<th id="seq_member">'+items.seq_member +'</th>'
						+'<th id="position">'+items.position +'</th>'
						+'<th id="real_name">'+items.real_name +'</th>'
						+'<th id="nickname">'+items.nickname +'</th>'
						+'<th id="id">'+items.id +'</th>'
						+'<th id="tel">'+items.tel +'</th>'
						+'<th id="company_num">'+items.company_num +'</th>'
						+'<th id="log_time">'+items.log_time +'</th>'
						+'<th id="authStatus">'+items.authStatus +'</th>'
						+'<th id="reservation">'+items.reservation +'</th>'
						+'<th><button id="'+items.seq_member+'" class="button is-primary revert">복구</button></th>'
						+'<th><button type="button" style="background-color: #000; color:#fff" id="'+items.seq_member+'" class="button bk"><i class="fas fa-user-slash"></i></button></td></th>'
						+'</tr>'
					);
				});	//each 끝
				
				$('.revert').click(function(){
					Swal.fire({
						  title: '정말 복구하시겠습니까?',
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '복구합니다'
						}).then((result) => {
						  if (result.value) {
							  $.ajax({
								  type: 'post',
								  url: '/LineUp/admin/revertMember',
								  data: 'seq_member='+$('.revert').attr('id'),
								  success: function(){
										 location.href="/LineUp/admin/memberManage";
									  }
								  });
							   }
						});				
				});
			} else {
				Swal.fire({
				  icon: 'error',
				  title: '관리자가 아닙니다',
				  timer: 1500
				});
				location.replace("/LineUp/home/index");
			}
		},
		error: function(data) {
			alert("error");
		}
	}); //삭제된 멤버데이터 뿌리기 끝

	
	
//	블랙리스트 버튼 누룰시.
	$(document).on('click', '.bk',function(){

		Swal.fire({
			  title: '블랙리스트 이동 사유를 작성해주세요',
			  input: 'text',
			  inputAttributes: {
			    autocapitalize: 'off'
			  },
			  showCancelButton: true,
			  confirmButtonText: '제출',
			  showLoaderOnConfirm: true,
			}).then((result) => {
			  if (result.value) {
			    Swal.fire({
			      icon:'success'
			    })
				  $.ajax({
					type:'post',
					url: '/LineUp/admin/goToBlack',
					data: 'seq_member='+$('.bk').attr('id')+"&reason="+result.value,
					success : function() {
						Swal.fire({
						  icon: 'success',
						  title: '블랙리스트로 이동되었습니다',
						  footer: '<a href="/LineUp/admin/blockedMember">블랙리스트 관리하기</a>'
						});
						 setTimeout(function (){
							  location.reload();
						  }, 2000);
					}
				});
			 }
		})
	});
}); //document function end

