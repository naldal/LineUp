<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

#star_form span {
	position: relative;
	float: left;
	cursor: pointer;
	z-index: 5;
}

#star_form {
	position: absolute;
	height: auto;
}

#star_form img {
	position: absolute;
	margin:0;
	left:0;
}

.ii #red {
	position: absolute;
	margin:0;
	left:0
}

.ii {
	position: absolute;
	overflow: hidden;
	height: 50px !important;
	margin:0;
	z-index: 1;
}

</style>

<div id="star_form">
	<img src="../img/회색별.png" /> <span class="1"></span> <span class="2"></span>
	<span class="3"></span> <span class="4"></span> <span class="5"></span>
	<span class="6"></span> <span class="7"></span> <span class="8"></span>
	<span class="9"></span> <span class="10"></span>
</div>
<div class="ii">
	<img id="red" />
</div>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		let score = ${param.score}; 
		let num = ${param.num};
		let cursor_stat = ${param.cursor_stat};
		let width=${param.width};
		let height=${param.height};
		
		$('.ii #red').eq(num).css('max-width',width).css('width',width);
		$('#star_form span').eq(num).css('width',width/10).css('height',height);
		$('#star_form img').eq(num).attr('style','width:'+width+'px !important');
		
		if(cursor_stat==0){
			$('.practice2 .practice_li').eq(num).find('.ii').attr('style','height:'+height+'px !important; width:'+width/10*score+'px;')
			$('.ii #red').attr('src','../img/노란별.png');
		}
		
		if(cursor_stat==1){
			$('.media .media-right #score').eq(num).find('.ii').attr('style','height:'+height+'px !important; width:'+width/10*score+'px;');
			$('.ii #red').attr('src','../img/노란별1.png');
		}
		
		if(cursor_stat==2){
			$('#my-restaurang-review-list .box').eq(num).find('.ii').attr('style','height:'+height+'px !important; width:'+width/10*score+'px;');
				$('.ii #red').attr('src','../img/노란별.png');
		}
		if(cursor_stat==3){
			$('#my_reservation_list .reservation_wrap').eq(num).find('.ii').attr('style','height:'+height+'px !important; width:'+width/10*score+'px;');
			$('#my_like_box .my_Wish_list').eq(num).find('.ii').attr('style','height:'+height+'px !important; width:'+width/10*score+'px;');
			$('#after_box .restaurant_visited_list').eq(num).find('.ii').attr('style','height:'+height+'px !important; width:'+width/10*score+'px;');
			$('.ii #red').attr('src','../img/노란별.png');
		}
		
		if(cursor_stat==5){
			$('#star_form span').eq(num).click(function() {
				$('.ii').eq(num).css('width', (($('#star_form img').width()/10) * $(this).attr('class')) + 'px');
				$('.ii #red').eq(num).attr('src','../img/노란별.png');
			});
		}
	});
</script>
