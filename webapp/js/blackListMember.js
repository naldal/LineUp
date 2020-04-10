$(document).ready(function(){
	$("#loadHeader").load("../layout/header_bulma.jsp");  
	$("#loadFooter").load("../layout/footer.html"); 
	
	$.ajax({
		type: 'post',
		url: '/LineUp/admin/getBlockedMember',
		dataType:'json',
		success: function(data){
	
		if(data.isAdmin=='ADMIN') {
			$.each(data.blackMemberList, function(index, items){
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
					+'<th id="reason">'+items.reason+'</th>'
					+'<th><button id="'+items.seq_member+'" class="button is-link strongrevert">차단해제</button></td></th>'
					+'</tr>'
				);
			});	// each 끝
			
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
	});
	
	$(document).on('click', '.strongrevert', function(){
		if(confirm('회원이 다시 회원가입할 수 있게됩니다')){
			$.ajax({
				 type: 'post',
				  url: '/LineUp/admin/strongrevert',
				  data: 'seq_member='+$('.strongrevert').attr('id'),
				  success: function(){
					  Swal.fire({
						  icon: 'success',
						  title: '회원을 복구했습니다',
						  timer: 1500
					  });
					  setTimeout(function (){
						  location.reload();
					  }, 2000);
				  }
			});
		}
	});
	
});