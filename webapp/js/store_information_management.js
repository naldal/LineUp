var default_Main_files = [];
var main_temp;

var default_Sub_files = [];
var sub_files = [];


var temp_tel = [];
var temp_name = [];
$(document).ready(function() {
	
	$("#loadHeader").load("../layout/header_bulma.jsp");
	$("#loadFooter").load("../layout/footer.html");
	
	var temp = new Date();
	tempDate = temp.getFullYear()+"/";
	if(temp.getMonth()<10)	tempDate = tempDate+"0"+(temp.getMonth()+1)+"/";		
	else tempDate = tempDate+(temp.getMonth()+1)+"/"; 
	if(temp.getDay()<10)	tempDate = tempDate+"0"+temp.getDate();		
	else tempDate = tempDate+temp.getDate(); 
	
    var calendar = new Date();
    var year = calendar.getFullYear();
    var month = calendar.getMonth() + 1;
    var MM = month;
    var date = calendar.getDate();
    var DD = date;
    var day = calendar.getDay();
    var cnt = 0;
    var lastDay = new Date("2020", "02", "0").getDate();
    $("#date").val(year + "년" + month + "월" + date + "일");

    $(".previous-day").click(function() {
        // 가게 오픈시점까지 되돌릴수 있다.
        date = date - 1;
        if (date < 1) {
            month = month - 1;
            if (month < 1) {
                year = year - 1;
                month = 12;
            }
            MM = month;
            date = new Date(year, month, "0").getDate();
        }
        $("#date").val(year + "년" + month + "월" + date + "일");
        $(".next-day").removeAttr("src");
        $(".next-day").attr("src", "../img/꺽쇠1.png");
        $(".next-day").css("pointer-events", "auto");

        if (date == calendar.getDate()) {
            $("#changeBtn").text("대기 시작");
        }
        if(month<10) MM = '0'+month;
        else MM= month;
        if(date<10) DD = '0'+date;
        else DD= date; // 전날
        
        $.ajax({
    		type: 'post',
    		url: '/LineUp/restaurant/getReservationList',
    		data: 'company_num='+$('#company_num').val()+'&date='+year+'/'+ MM +'/'+ DD,
    		dataType: 'json', 
    		success: function(data){
    			$('#Reservation-Management').empty();
    			$('#rvList1').empty();
    			if(year+'/'+ MM +'/'+ DD != tempDate){
    				$.each(data.reservationList, function(index, items){
    					
        				if(index<4){
        					$('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
        						text: items.name
        					})).append($('<td/>',{
        						text: items.howmany+'명'
        					})).append($('<td/>',{
        						text: items.tel
        					})).append($('<td/>',{
        						text: items.log_time
        					})).append($('<td/>',{
        						text: "수락"
        					})))).appendTo($('#Reservation-Management'));
        				}else{
        					$('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
        						text: items.name
        					})).append($('<td/>',{
        						text: items.howmany+'명'
        					})).append($('<td/>',{
        						text: items.tel
        					})).append($('<td/>',{
        						text: items.log_time
        					})).append($('<td/>',{
        						text: "수락"
        					})))).appendTo($('#rvList1'));
        				}
    				});
				}else{
					$.each(data.reservationList, function(index, items){	
    						$('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
    			                  text: items.name
    			               })).append($('<td/>',{
    			                  text: items.howmany+'명'
    			               })).append($('<td/>',{
    			                  text: items.tel
    			               })).append($('<td/>',{
    			                  text: items.log_time
    			               })).append($('<td/>',{
    			                  
    				               }).append($('<input/>',{
    				                  type: 'button',
    				                  class: 'visitCheck',
    				                  value: '확인'
    				               })
    				           )))).appendTo($('#Reservation-Management'));
    						
    						$('.visitCheck').click(function(){
    							
    							if(confirm("예약한 인원이 다녀갔나요?")) {
    								
    								$.ajax({
    									type: 'post',
    									url: '/LineUp/restaurant/visitCheckYes',
    									data: 'seq_restaurant='+seq_restaurant+'&tel='+items.tel,
    									success: function() {
    										location.href="/LineUp/restaurant/store_information_management";
    									}
    								});
    							} else {
    								
    								$.ajax({
    									type: 'post',
    									url: '/LineUp/restaurant/visitCheckNo',
    									data: 'seq_restaurant='+seq_restaurant+'&tel='+items.tel,
    									success: function() {
    										location.href="/LineUp/restaurant/store_information_management";
    									}
    									
    								});
    							}
    						});
					});
					$.each(data.reservedList, function(index, items){
	
    					$('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
  		                  text: items.name
  		               })).append($('<td/>',{
  		                  text: items.howmany+'명'
  		               })).append($('<td/>',{
  		                  text: items.tel
  		               })).append($('<td/>',{
  		                  text: items.log_time
  		               })).append($('<td/>',{
   						text: "수락"
   					})))).appendTo($('#rvList1'));
    				});
    			}
    		}
    	});// ajax종료
        
    });
    
    
    $(".next-day").click(function() {
        // 바로 다음날까지만 넘길수있다.
        date = date + 1;
        if (date > new Date(year, month, "0").getDate()) {
            month = month + 1;
            date = 1;
            if (month > 12) {
                year = year + 1;
                month = 1;
            }
            MM=month;
            DD=date;
        }
        if (year == calendar.getFullYear() && month == calendar.getMonth() + 1 && date == calendar.getDate() + 1) {
            $(".next-day").removeAttr("src");
            $(".next-day").attr("src", "../img/꺽쇠1-1.png");
            $(".next-day").css("pointer-events", "none");
            $("#changeBtn").text("휴일");
            $('#Reservation-Management').empty();
			$('#rvList1').empty();
        }else{
        	if(month<10) MM = '0'+month;
            else MM= month;
            if(date<10) DD = '0'+date;
            else DD= date; // 다음날
            $.ajax({
        		type: 'post',
        		url: '/LineUp/restaurant/getReservationList',
        		data: 'company_num='+$('#company_num').val()+'&date='+year+'/'+ MM +'/'+ DD,
        		dataType: 'json', 
        		success: function(data){
        			//alert(JSON.stringify(data));
        			$('#Reservation-Management').empty();
        			$('#rvList1').empty();
        			if(year+'/'+ MM +'/'+ DD != tempDate){
        				$.each(data.reservationList, function(index, items){
            				if(index<4){
            					//alert('실행');
            					$('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
            						text: items.name
            					})).append($('<td/>',{
            						text: items.howmany+'명'
            					})).append($('<td/>',{
            						text: items.tel
            					})).append($('<td/>',{
            						text: items.log_time
            					})).append($('<td/>',{
            						text: "수락"
            					})))).appendTo($('#Reservation-Management'));
            				}else{
            					$('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
            						text: items.name
            					})).append($('<td/>',{
            						text: items.howmany+'명'
            					})).append($('<td/>',{
            						text: items.tel
            					})).append($('<td/>',{
            						text: items.log_time
            					})).append($('<td/>',{
            						text: "수락"
            					})))).appendTo($('#rvList1'));
            				}
        				});
    				}else{
    					//alert('입장');
    					$.each(data.reservationList, function(index, items){
    						//alert('입장1');
        						$('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
        			                  text: items.name
        			               })).append($('<td/>',{
        			                  text: items.howmany+'명'
        			               })).append($('<td/>',{
        			                  text: items.tel
        			               })).append($('<td/>',{
        			                  text: items.log_time
        			               })).append($('<td/>',{
        			                  
        				               }).append($('<input/>',{
        				                  type: 'button',
        				                  class: 'visitCheck',
        				                  value: '확인'
        				               })
        				           )))).appendTo($('#Reservation-Management'));
        						
        						$('.visitCheck').click(function(){
        							
        							if(confirm("예약한 인원이 다녀갔나요?")) {
        								
        								$.ajax({
        									type: 'post',
        									url: '/LineUp/restaurant/visitCheckYes',
        									data: 'seq_restaurant='+seq_restaurant+'&tel='+items.tel,
        									success: function() {
        										location.href="/LineUp/restaurant/store_information_management";
        									}
        								});
        							} else {
        								
        								$.ajax({
        									type: 'post',
        									url: '/LineUp/restaurant/visitCheckNo',
        									data: 'seq_restaurant='+seq_restaurant+'&tel='+items.tel,
        									success: function() {
        										location.href="/LineUp/restaurant/store_information_management";
        									}
        									
        								});
        							}
        						});
    					});
    					$.each(data.reservedList, function(index, items){
    						//alert("여기는 도나");
        					$('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
      		                  text: items.name
      		               })).append($('<td/>',{
      		                  text: items.howmany+'명'
      		               })).append($('<td/>',{
      		                  text: items.tel
      		               })).append($('<td/>',{
      		                  text: items.log_time
      		               })).append($('<td/>',{
       						text: "수락"
       					})))).appendTo($('#rvList1'));
        				});//안들어오나

        			}
        		}
        	});// ajax종료
        }
        $("#date").val(year + "년" + month + "월" + date + "일");
    });
    
    /*-------------------------------------- */
    $('#restaurant_update').click(function(){
    	if(default_Main_files.length==0){
//    		alert("메인이미지를 등록해 주세요.");
    		Swal.fire({
    			  icon: 'error',
    			  title: '메인이미지를 등록해 주세요'
    			});
    	}else{
    		let formData = new FormData();
	    	let menulength=$('[name=menuName]').length;
	    	if(main_temp == default_Main_files[0]){
	    		formData.append("img_main", "");
	    	}else{
	    		formData.append("img_main", default_Main_files[0]);
	    	}
	    	if(default_Sub_files.length!=0){
	    		$.each(default_Sub_files,function(index, items){
	    			formData.append("default_img_sub",items);
	    		})
	    	}else{
	    		formData.append("default_img_sub","");
	    	}
	    	
	    	if(sub_files.length != 0 ){
	    		$.each(sub_files,function(index, items){
	    			formData.append("img_sub",items);
	    		})
	    	}else{
	    		formData.append("img_sub",null);
	    	}    
	    	
	    	const menu = [];
	    	for(let i=0; i<menulength; i++){
	    		menu[i] = $('[name=menuName]').eq(i).val()+','+$('[name=price]').eq(i).val()+','+$('[name=vegan]').eq(i).prop('checked')+','+$('[name=spicy]').eq(i).prop('checked');
	    	}
	    	
	    	formData.append('restaurant_name',$('#restaurant_name').val());
	    	formData.append('zipcode',$('#restaurant_zipcode').val());
	    	formData.append('addr',$('#restaurant_addr').val());
	    	formData.append('tel',$('#restaurant_tel').val());
	    	formData.append('cateroty',$('#cateroty').val());
	    	formData.append('menu',menu);
	    	
	    	$.ajax({
	    		type: 'post',
	    		url: '/LineUp/restaurant/restaurantUpdate',
	    		enctype: 'multipart/form-data',
	    		contentType: false, // 요청 컨텐트 타입
				processData: false, // 데이터를 컨텐트 타입에 맞게 변환 여부
				data: formData,
	    		success: function(){
//	    			alert("데이터 수정 성공")
	    			Swal.fire({
	    				  position: 'top-end',
	    				  icon: 'success',
	    				  title: '데이터 수정 성공!',
	    				  showConfirmButton: false,
	    				  timer: 1500
	    				});
	    		}
	    	});
    	}
    }); 
    
    $('#restaurant_delete').click(function(){
    	let msg = "확인을 누르실경우 가게와 관련된 모든정보가 삭제됩니다."
		Swal.fire({
			  title: 'Are you sure?',
			  text: msg,
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((resert)=>{
				if(resert.value==true){
					Swal.fire({
					  title: 'Enter your password',
					  input: 'password',
					  inputPlaceholder: 'Enter your password',
					  inputAttributes: {
					    maxlength: 10,
					    autocapitalize: 'off',
					    autocorrect: 'off'
					  }
					}).then((pwd)=>{
						$.ajax({ 
							type: 'post',
							url: '/LineUp/member/confirm_password',
							data: "pwd="+pwd.value,
							dataType: 'text',
							async: false,
							success: function(data){
								if(data=='false'){
									Swal.fire({
										  icon: 'error',
										  title: '비밀번호가 맞지 않습니다',
										  text: '다시 시도해주세요'
										});
								}else{
									Swal.fire(
										      'Deleted!',
										      'Your file has been deleted.',
										      'success'
								    ).then(()=>{
								    	location.href="/LineUp/home/index";
								    })
								}
							}
						});
					})
				}
		})
    }); 
    
    /*---------------------------------------   */
 
    /*---------------------------------------	*/
    
    if(MM<10)
    	var MM = '0'+MM;
    
    if(DD<10)
    	var DD = '0'+DD;
    
	$.ajax({
		type: 'post',
		url: '/LineUp/restaurant/getStoreInformationManagement',
		data: 'date='+year+'/'+ MM +'/'+ DD,
		dataType: 'json',
		success: function(data){
			// 가게 정보
			var seq_restaurant = data.restaurantDTO.seq_restaurant;
			$('#restaurant_name').val(data.restaurantDTO.restaurant_name);
			$('#restaurant_zipcode').val(data.restaurantDTO.zipcode);
			$('#restaurant_addr').val(data.restaurantDTO.addr);
			$('#restaurant_real_name').val(data.restaurantDTO.real_name);
			$('#restaurant_company_num').val(data.restaurantDTO.company_num);
			$('#restaurant_tel').val(data.restaurantDTO.tel);
			$('#restaurant_category option').each(function(){
				if($(this).val()==data.restaurantDTO.category){
					$(this).prop("selected","selected");
				}
			})
			// 가게 메뉴판
			$.each(data.menuList, function(index, items){
				$(".table > tbody:last").append(
				'<tr class="menu-table"> <td><input class="input is-small" name="menuName"type="text" value='+items.menu_name+'></td>	<td><input class="input is-small" type="text" name="price"placeholder="only number" value='+items.menu_price+'></td>	<td style="text-align:center;"><input type="checkbox" name="vegan"></td> <td style="text-align:center;"><input type="checkbox" name="spicy"></td> <td id="del-position"><a class="del_row"><span class="icon has-text-danger">	<i class="fas fa-ban"></i></span></a>	</td></tr>'
				);
				 if(items.vegan == 'true'){
					 $('input:checkbox[name=vegan]').eq(index).prop('checked', true);
				 }
				 if(items.spicy == 'true'){
					 $('input:checkbox[name=spicy]').eq(index).prop('checked', true);
				 }
			});// each종료
			// 가게 이미지 리스트
			$.each(data.restaurantImgList, function(index, items){
				if(index==0){
					$('#main_img figure').append('<img class="m_Img"  src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/'+items.main_img+'" style="width:150px;height:auto;">'
							+"<span class='ll' style='position: absolute;width: 20px;height: 20px;left: 129px; top: 1px'>"
							+"<a class='delete'></a>"
							+"</span>");
					main_temp=items.main_img;
					default_Main_files.push(main_temp);
				};
				// http://192.168.0.14:8080/LineUp/restaurant_register_imgs/main_imgs/'+items.main_img
				// 임시 변경
				$('#sub_img').append("<span class='sub_span' style='width:100%; height:100%; max-width:150px; max-height:150px; margin:5px; display: inline-block; position:relative' >"
						+"<img class='m_Img' src='http://192.168.0.14:8080/LineUp/restaurant_register_imgs/sub_imgs/"+items.sub_img+"'style='width:150px; height:150px;'>"
						+"<span class='del_span' style='position: absolute;width: 20px;height: 20px;left: 129px; top: 1px'>"
							+"<a class='delete'></a>"
						+"</span>"
					+"</span>" );
				default_Sub_files.push(items.sub_img);
			});// each종료
			
			// 레스토랑 예약리스트
			$.each(data.reservationList, function(index, items){
				
	               $('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
	            	   id: 'name1',
	            	   value: items.name,
	            	   text: items.name
	               })).append($('<td/>',{
	                  text: items.howmany+'명'
	               })).append($('<td/>',{
	            	   id: 'tel1',
	            	   value: items.tel,
	                  text: items.tel
	               })).append($('<td/>',{
	                  text: items.log_time
	               })).append($('<td/>',{
	                  
		               }).append($('<input/>',{
		                  type: 'button',
		                  class: 'visitCheck',
		                  value: '확인'
		               })
		           ))
		           )).appendTo($('#Reservation-Management'));
	               temp_tel.push(items.tel);
	               temp_name.push(items.name);
	               
				$('.visitCheck').click(function(){
					var tel1 = $(this).closest('.message-header').index();
					var telInput;
					var nameInput;
					$.each(temp_tel,function(i,item){
						// alert(tel1);
						if(tel1==i){
							// alert("출력 텔 = "+item);
							telInput = item;
							return false;
						}
					});
					$.each(temp_name,function(i,item){
						if(tel1==i){
							// alert("출력 네임 = " + item);
							nameInput = item;
							return false;
						}
					});
					
					//alert("찍자 텔 = " + telInput);
					//alert("찍자 네임 = " + nameInput);
					
					const swalWithBootstrapButtons = Swal.mixin({
						  customClass: {
						    confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						  },
						  buttonsStyling: false
						})

						swalWithBootstrapButtons.fire({
						  title: '예약한 고객이 다녀갔나요??',
						  text: "방문을 확인해주세요!",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonText: '예! 다녀갔습니다 ^_^',
						  cancelButtonText: '아니요ㅡ ㅡ',
						  reverseButtons: true
						}).then((result) => {
						  if (result.value) {
						    swalWithBootstrapButtons.fire(
						      '감사합니다.',
						      '방문이 확인됐습니다.',
						      'success'
						    )
						    
						    $.ajax({
								type: 'post',
								url: '/LineUp/restaurant/visitCheckYes',
								data: 'seq_restaurant='+seq_restaurant+'&tel='+telInput+'&name='+nameInput,
								success: function() {
									location.href="/LineUp/restaurant/store_information_management";
								}
							});

						    
						  } else if (
						     // Read more about handling dismissals below
						    result.dismiss === Swal.DismissReason.cancel
						  ) {
						    swalWithBootstrapButtons.fire(
						      '확인 감사합니다.',
						      'error'
						    )
						    $.ajax({

								type: 'post',
								url: '/LineUp/restaurant/visitCheckNo',
								data: 'seq_restaurant='+seq_restaurant+'&tel='+telInput+'&name='+nameInput,
								success: function() {
									location.href="/LineUp/restaurant/store_information_management";
								}
								
							});

						    
						  }
						})
					
					/*
					 * if(confirm("예약한 인원이 다녀갔나요?")) {
					 * 
					 * $.ajax({ type: 'post', url:
					 * '/LineUp/restaurant/visitCheckYes', data:
					 * 'seq_restaurant='+seq_restaurant+'&tel='+items.tel,
					 * success: function() {
					 * location.href="/LineUp/restaurant/store_information_management"; }
					 * }); } else {
					 * 
					 * $.ajax({ type: 'post', url:
					 * '/LineUp/restaurant/visitCheckNo', data:
					 * 'seq_restaurant='+seq_restaurant+'&tel='+items.tel,
					 * success: function() {
					 * location.href="/LineUp/restaurant/store_information_management"; }
					 * 
					 * }); }
					 */
				});
			});// each종료
			
			$.each(data.reservedList, function(index, items){
				$('<div/>',{id:'users',class:'message-header'}).append($('<table/>').append($('<tr/>').append($('<td/>',{
	                  text: items.name
	               })).append($('<td/>',{
	                  text: items.howmany+'명'
	               })).append($('<td/>',{
	                  text: items.tel
	               })).append($('<td/>',{
	                  text: items.log_time
	               })).append($('<td/>',{
  						text: "수락"
  					})))).appendTo($('#rvList1'));
			});
		
			
			
			
			// 리뷰리스트
			$.each(data.reviewList, function(index, items){
				if(index<3){
				$('#my-restaurang-review-list #reviewList1').append(
						'<div class="box" style="overflow: auto;">'
							+'<div class="modal-card" style="width: 100%;">'
								+'<div class="media">'
									+'<div class="media-left">'
										+'<figure class="image is-48x48">'
											+'<img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image" />'									
										+'</figure>'
									+'</div>'
									+'<div class="media-content">'
										+'<p class="title is-4">'+items.name+'</p>'
										+'<p class="subtitle is-6">'+items.id+'</p>'
									+'</div>'
									+'<div class="score'+index+'" style="width:150px; height:50px;">'
										
									+'</div>'
								+'</div>'
								+'<div class="carousel-wrap" style="width: 100%; margin: 15px;">'
									+'<div class="owl-carousel '+items.seq_review+'" id="'+items.seq_review+'">'
										
									+'</div>'
								+'</div>'
							+'</div>'
							+'<div id="content" style="width: 100%;">'
								+'<h4 style="font-weight:bold;">'+items.subject+'</h4>'
								+'<p>'+items.content+'</p>'
								+'<time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>'
							+'</div>'
						+'</div>'
					);
				}else{
					$('#my-restaurang-review-list #rvList2').append(
							'<div class="box" style="overflow: auto;">'
								+'<div class="modal-card" style="width: 100%;">'
									+'<div class="media">'
										+'<div class="media-left">'
											+'<figure class="image is-48x48">'
												+'<img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image" />'									
											+'</figure>'
										+'</div>'
										+'<div class="media-content">'
											+'<p class="title is-4">'+items.name+'</p>'
											+'<p class="subtitle is-6">'+items.id+'</p>'
										+'</div>'
										+'<div class="score'+index+'" style="width:150px; height:50px;">'
											
										+'</div>'
									+'</div>'
									+'<div class="carousel-wrap" style="width: 100%; margin: 15px;">'
									+'<div class="owl-carousel '+items.seq_review+'" id="'+items.seq_review+'">'
									
									+'</div>'
									+'</div>'
								+'</div>'
								+'<div id="content" style="width: 100%;">'
									+'<h4 style="font-weight:bold;">'+items.subject+'</h4>'
									+'<p>'+items.content+'</p>'
									+'<time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>'
								+'</div>'
							+'</div>'
						);
				}
				$(".del_row").click(function() {
		            $(this)
		                .parents(".menu-table")
		                .remove();
		        });
				$('.score'+index).load('../member/star.jsp',{
					width: "150",
					height: "40",
					score: items.score,
					num: index,
					cursor_stat: "2"
				});
				 // carousel 끝
			});
			
			
			
			$.each(data.reviewImageList, function(index, items ){
	             if($('.carousel-wrap').find('.'+items.seq_review).attr('id')==items.seq_review) {
	                $('#'+items.seq_review).append(
	                      '<div class="item">'
	                      + '<img style="cursor: pointer; width: 200px; height: 150px;" src="http://192.168.0.14:8080/LineUp/restaurant_register_imgs/review_img/'+items.image+'" />'
	                      + '</div>'
	                );
	             }
	             
	             if(items.image==null) {
	                $('#'+items.seq_review).attr('style', 'display: none !important');
	             }
	        });
			
			$('#main_img figure .delete').click(function(){
				$('#main_img figure').empty();
				main_temp = '';
				default_Main_files.splice(0,1);
			});
			
			$('#sub_img span .delete').click(function(){
				default_Sub_files.splice($(this).closest('.sub_span').index(),1);
				$(this).closest('.sub_span').remove();
			});
			
		
			$(".owl-carousel").owlCarousel({
		        loop: true,
		        margin: 10,
		        nav: true,
		        navText: ["<p class='owl-before'> ❮ </p>", "<p class='owl-after'> ❯ </p>"],
		        autoplay: true,
		        autoplayHoverPause: true,
		        responsive: {
		            0: {
		                items: 1
		            },
		            600: {
		                items: 3
		            },
		            1000: {
		                items: 5
		            }
		        }
		    }); 
			$('.owl-prev').unwrap();
			$('.owl-prev').css('top','0').css('position','absolute');
			$('.owl-prev .owl-before').css('margin-top','70px').css('margin-left','12px');
			$('.owl-next').css('top','0').css('position','absolute');
			$('.owl-next .owl-after').css('margin-top','70px').css('margin-left','20px');
			
			$('.carousel-wrap img').click(function(){
		        $("#kk img").attr("src", $(this).attr("src"));
		        $(".modal").addClass("is-active");
		    });
		    $("#kk").click(function () {
		        $(".modal").removeClass("is-active");
		    });
		}
	
	});

	/*---------------------------------------	*/
	
    
    $("#add_rows").click(function() {
    	if($('.table > tbody tr').length<20){
	        $(".table > tbody:last").append(
	            '<tr class="menu-table"><td><input class="input is-small" name="menuName"type="text"/></td><td><input class="input is-small" type="text" name="price"placeholder="only number"></td><td style="text-align:center;"><input type="checkbox" name="vegan"></td><td style="text-align:center;"><input type="checkbox" name="spicy"></td><td id="del-position"><a class="del_row"><span class="icon has-text-danger"><i class="fas fa-ban"></i></span></a></td></tr>'
	        );
    	}
        $(".fas.fa-ban").css("cursor", "pointer");
        $(".del_row").click(function() {
            $(this)
                .parents(".menu-table")
                .remove();
        });
    });

    var sldn1 = 0;
    $("#rvList1").hide();
    $("#Reservation-List").click(function() {
        if (sldn1 == 0) {
            $("#rvList1").slideToggle();
            $("#Reservation-List").text("접기");
            sldn1 = 1;
        } else {
            $("#rvList1").slideToggle();
            $("#Reservation-List").text("더보기");
            sldn1 = 0;
        }
    });

    var sldn2 = 0;
    $("#rvList2").hide();
    $("#slidebtn2").click(function() {
        if (sldn2 == 0) {
            $("#rvList2").slideToggle();
            $("#sld2").text("접기");
            sldn2 = 1;
        } else {
            $("#rvList2").slideToggle();
            $("#sld2").text("더보기");
            sldn2 = 0;
        }
    });

    $("#category_form #category li").click(function() {
        let offset = $("div #scroll" + $(this).val()).offset();
        let val;
        if ($(this).val() == 1) val = 100;
        else if ($(this).val() == 2) val = 500;
        else if ($(this).val() == 3) val = 300;
        $("#category_form #category li").removeClass();
        $("#category_form #category li")
            .eq($(this).val() - 1)
            .addClass("active");
        $("html, body").animate({ scrollTop: offset.top - val }, 400);
    });

    $("body").on("mousewheel", function(e) {
        let wheel = e.originalEvent.wheelDelta;
        let scroll1 = $("div #scroll1").offset().top - 100;
        let scroll2 = $("div #scroll2").offset().top - 500;
        let scroll3 = $("div #scroll3").offset().top - 300;
        let scrollTop = $(window).scrollTop();

        $("#category_form #category li").removeClass();
        if (wheel > 0) {
            // 스크롤 올릴때

            if (scroll2 > scrollTop) {
                $("#category_form #category li")
                    .eq(0)
                    .addClass("active");
            } else if (scroll2 < scrollTop && scroll3 > scrollTop) {
                $("#category_form #category li")
                    .eq(1)
                    .addClass("active");
            } else if (scroll3 < scrollTop) {
                $("#category_form #category li")
                    .eq(2)
                    .addClass("active");
            }
        } else if (wheel < 0) {
            // 내릴때

            if (scroll2 > scrollTop) {
                $("#category_form #category li")
                    .eq(0)
                    .addClass("active");
            } else if (scroll2 <= scrollTop && scroll3 > scrollTop) {
                $("#category_form #category li")
                    .eq(1)
                    .addClass("active");
            } else if (scroll3 <= scrollTop) {
                $("#category_form #category li")
                    .eq(2)
                    .addClass("active");
            }
        }
    });
    
    // 제목 유효성 검사 시작
    $('#restaurant_name').focusout(function(){
    	$('#restaurant_nameDiv').empty();
    	if($('#restaurant_name').val()=='') {
    		$('#restaurant_nameDiv').text('레스토랑 이름이 비어있습니다')
    		$('#restaurant_nameDiv').css('margin-left', '15px');
    		$('#restaurant_nameDiv').css('margin-top', '-10px');
    		$('#restaurant_nameDiv').css('color', '#c23616');
    	}
    });
    
    
}); // document ready 끝
