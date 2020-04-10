$(document).ready(function(){
	$("#loadHeader").load("../layout/header_bulma.jsp");  
	$("#loadFooter").load("../layout/footer.html"); 

//	멤버데이터 가져오기
//	memberDTOList
	$.ajax({
		type: 'post',
		url: '/LineUp/admin/getMemberData',
		data: 'page='+$('#page').val(),
		dataType:'json',
		success: function(data){
//			alert(JSON.stringify(data)); ok
			if(data.isAdmin=='ADMIN') {
				$.each(data.memberDTOList, function(index, items){
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
						+'<th><button id="'+items.seq_member+'" class="button is-danger deletem">삭제</button></td></th>'
						+'</tr>'
					);
				});	//each 끝
				
				$('#adminPagingDiv').html(data.adminPaging.pagingHTML);
				
				$('.deletem').click(function(){
				
					Swal.fire({
						  title: '정말 삭제하시겠습니까?',
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '네 삭제합니다'
						}).then((result) => {
						  if (result.value) {
							  $.ajax({
								  type: 'post',
								  url: '/LineUp/admin/deleteMember',
								  data: 'seq_member='+$('.deletem').attr('id')+'&page='+$('#page').val(),
								  success: function(){
									 Swal.fire(
								      'Deleted!',
								      '삭제된 회원은 <a href="/LineUp/admin/deletedMember">여기에서 복구할 수 있습니다</a>.',
								      'success'
								    )
								    setTimeout(function (){
										  location.reload();
									}, 2000);
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
	});
	
});
