	$('#img_main').on('change', function(){
		
		if($('#img_main').val()!=''){
			$('#main_img figure').empty();
			default_Main_files.splice(0,1);
			readURL(this);
		}
   	});
    
   	function readURL(input){
   		if(input.files && input.files[0]){
   			default_Main_files.push(input.files[0]);
   			var reader = new FileReader();
   			reader.onload = function(e){
   				$('#main_img figure').append('<img class="m_Img" style="width:150px; height:auto;">'
						+"<span class='ll' style='position: absolute;width: 20px;height: 20px;left: 129px; top: 1px'>"
						+"<a class='delete'></a>"
						+"</span>");
   				$('#main_img figure .m_Img ').attr('src', e.target.result);
   				
   				$('#main_img figure .delete').click(function(){
   			   		$('#main_img figure').empty();
   			   		default_Main_files.splice(0,1);
   			   	});
   			}
   			reader.readAsDataURL(input.files[0]);
   			
   		}
   	}
   	
   	
   	$('#img_sub').on('change', function(){
   		if($('#img_sub').val()!=''){
   			readSubURL(this);
   		}
   	});
   	
   	function readSubURL(input){
   		if(input.files && input.files[0]){
   			var files = input.files;
   			var filesArr = Array.prototype.slice.call(files);
   			//alert(filesArr.length);
   				filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: 'Something went wrong!',
						  footer: '<a href>Why do I have this issue?</a>'
						});
					return;
				}
				sub_files.push(f);
				//alert(f.name);
				var reader = new FileReader();
				reader.onload=function(e){
					$('#sub_img').append("<span class='sub_span' style='width:100%; height:100%; max-width:150px; max-height:150px; margin:5px; display: inline-block; position:relative' >"
							+"<img class='m_Img' src='"+e.target.result+"'style='width:150px; height:150px;'>"
							+"<span class='del_span' style='position: absolute;width: 20px;height: 20px;left: 129px; top: 1px'>"
								+"<a class='delete'></a>"
							+"</span>"
						+"</span>" );
					$('#sub_img span .delete').click(function(){
						if($(this).closest('.sub_span').index() != -1){
							sub_files.splice($(this).closest('.sub_span').index(),1);
							$(this).closest('.sub_span').remove();
						}
					});
				}
				reader.readAsDataURL(f);
			});
   		}
   	}
   	
   
   
   