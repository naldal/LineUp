$(document).ready(function(){
	
	$('.reviewBtn').click(function(){
		$('.modal').css('display','flex');
	});
	
	$('#modal-back,#cancle,.delete').click(function(){
		$('.modal').css('display','none');
	});
	
	$('#star_form span').click(function() {
		var val=$(this).attr('class');
		$('#score').val(val);
	});
	
});