<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<style>

#review_star_form span {
   position: relative;
   float: left;
   cursor: pointer;
   z-index: 5;
}

#review_star_form {
   position: absolute;
   height: auto;
}

#review_star_form img {
   position: absolute;
   margin:0;
   left:0;
}

.review_ii #red {
   position: absolute;
   margin:0;
   left:0
}

.review_ii {
   position: absolute;
   overflow: hidden;
   height: 50px !important;
   margin:0;
   z-index: 1;
}

</style>

<div id="review_star_form">
   <img src="../img/review_회색별.png" /> 
   <span class="1"></span> <span class="2"></span>
   <span class="3"></span> <span class="4"></span> 
   <span class="5"></span>   <span class="6"></span> 
   <span class="7"></span> <span class="8"></span>
   <span class="9"></span> <span class="10"></span>
</div>
<div class="review_ii">
   <img id="red" />
</div>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

   $(document).ready(function() {
      let r_score = ${param.r_score}; 
      let r_num = ${param.r_num};
      let r_cursor_stat = ${param.r_cursor_stat};
      let r_width=${param.r_width};
      let r_height=${param.r_height};
      
      $('.score').eq(r_num).find('.review_ii #red').css('max-width',r_width).css('width',r_width);
      $('.score').eq(r_num).find('#review_star_form span').css('width',r_width/10).css('height',r_height);
      $('.score').eq(r_num).find('#review_star_form img').attr('style','width:'+r_width+'px !important');
      
      if(r_cursor_stat==5){
         $('#review_star_form span').click(function() {
            $('.score').eq(r_num).find('.review_ii').css('width', (($('#review_star_form img').width()/10) * $(this).attr('class')) + 'px');
            $('.score').eq(r_num).find('.review_ii #red').attr('src','../img/노란별.png');
            $('#review_score').val($(this).attr('class'));
         });
      }
   });
</script>
