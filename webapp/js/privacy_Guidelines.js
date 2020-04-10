
$(document).ready(function(){
	$("#loadHeader").load("../layout/header_bulma.jsp");
	$("#loadFooter").load("../layout/footer.html");
	
	$('#Privacy_Policy_List li').click(function(){
		let val=$(this).val();
		let temp='temp'+val;
		let offset = $('#'+temp).offset().top;
		$('html, body').animate({scrollTop : offset},400);
	});
});