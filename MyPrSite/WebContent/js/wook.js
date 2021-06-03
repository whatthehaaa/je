$(document).ready(function(){
	
	
	//1. Ajax 서버  - DB연동 후 데이터 출력(JSON)
	/*
	face_file ,s_face_file ,area_select,introduce ,job_select_input_content ,
	category_tech1_input_content,univercity ,univercity_major ,attendance_status 
	,univercity_file ,s_univercity_file,certificate_name ,certificate_date,certificate_agency 
	,certificate_file ,s_certificate_file ,company ,department,position 
	,career_year ,career_month ,career_file ,s_career_file 
	
	*/
	 var arr = new Array();
	 var arr2=new Array();
	if(user_id!=null){
 		$.ajax({
			url:"profileAjaxProc.jsp",
			success:function(result){
				//JSON 형식으로 parsing
				var jdata = JSON.parse(result);
				//2-1. DHTML을 이용하여 테이블 생성 및 출력
				if(jdata.jlist[0].s_face_file!=null){
					
					$('#myhome_profile_photo').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file) +")";
				}
				//$("#file").val(jdata.jlist[0].s_face_file);
				$("#profile_name").text(jdata.jlist[0].name);
				$('#area_select').val(jdata.jlist[0].area_select).prop("selected",true);
				$("#introduce").text(jdata.jlist[0].introduce); 
	
				/////////////////// 전문분야 선택 부분 데이터 불러오는 부분 ////////////////////////////
				var sel= jdata.jlist[0].job_select_input_content
 			    var arrs = sel.split(",");
				for ( i in arrs){
					      arr.push(arrs[i]);
				}
				var radomvalue = Math.random();
				 $("#job_count_area").css("color","gray");
		    	$("#job_count_area").html("("+arr.length+" / 최대 5개)");
				$("#job_select_input_content").val(arr);
				 for( i in arr){
					$(".pf_job_select_area ul").append("<li class='job_select_content' >"+ arr[i]+"<button type='button'id='x_btn' name='"+radomvalue+"'>x</button></li>");
				}
				 $(".job_select_content>button[name='"+radomvalue+"']").click(function(){
		 	    		
				 	    /* alert(arr); */
				 	    var sel_text = $(this).parent().text();
							var xchar = sel_text.indexOf("x"); 
							
							if (xchar !== -1) { 
								sel_text = sel_text.slice(0, xchar) ; 
							}
		 	    		//$("h1").append(sel_text);
		 	    			var find =$.inArray(sel_text,arr)
		 	    			if(find>=0){
		 	    				arr.splice(find,1);
		 	    			
			 	    	
			 	    			$(this).parent().remove();	
			 	    			$("#job_select_input_content").val(arr);
						 	    $("#job_count_area").css("color","gray");
					    		$("#job_count_area").html("("+arr.length+" / 최대 5개)");
		 	    			}
		 	 	    		/*var find =arr.indexOf(sel1+":"+sel2); */
			 	    		
		 	    		
		 	    		 
		 			   }); 
			/////////////////// 보유기술 선택 부분 데이터 불러오는 부분 ////////////////////////////
			var sel_tech= jdata.jlist[0].category_tech1_input_content;
			var arr2s = sel_tech.split(",");
			for ( i in arr2s){
			      arr2.push(arr2s[i]);
		}
		
			var random = Math.random();
			$("#tech_count_area").css("color","gray");
    		$("#tech_count_area").html("("+arr2.length+" / 최대 6개)");
    		$("#category_tech1_input_content").val(arr2);
    		for( i in arr2){
    			$(".category-tech-select").append("<div>"+arr2[i]+"<button type='button'id='x_btn' name ='"+random+"'>x</button></div>");
    		}
    	   	check(random);
	    	function check(random){
		    	 $(".category-tech-select>div>button[name='"+random+"']").click(function(){
		    	 	    var sel_text = $(this).parent().text();
						var xchar = sel_text.indexOf("x"); 
						
						if (xchar !== -1) { 
							sel_text = sel_text.slice(0, xchar) ; 
						}
			 	  var find =$.inArray(sel_text,arr2)
 	    			if(find>=0){
 	    				arr2.splice(find,1);
 	    				$(this).parent().remove();	
		 	    		
		 	    		$("#tech_count_area").css("color","gray");
		 	    		$("#tech_count_area").html("("+arr2.length+" / 최대 6개)");
		 	    	    $("#category_tech1_input_content").val(arr2);	
 	    			}
	 	    		
	 			 });  
	    		
	    	}
    		
	    	$("#univercity_input").val(jdata.jlist[0].univercity);
	    	$("#univercity_major_input").val(jdata.jlist[0].univercity_major);
	    	$('#attendance_status').val(jdata.jlist[0].attendance_status).prop("selected",true);
	    	$("#file_name").append(jdata.jlist[0].univercity_file);
	    	
	  
	    	
	    	
	    	$('#certificate_name').val(jdata.jlist[0].certificate_name);
	    	$('#certificate_date').val(jdata.jlist[0].certificate_date);
	    	$('#certificate_agency').val(jdata.jlist[0].certificate_agency);
	    	$("#certificate_file_name").append(jdata.jlist[0].certificate_file);
	    	
	    	$('#company').val(jdata.jlist[0].company);
	    	$('#department').val(jdata.jlist[0].department);
	    	$('#position').val(jdata.jlist[0].position);
	    	$('#career_year').val(jdata.jlist[0].career_year).prop("selected",true);
	    	$('#career_month').val(jdata.jlist[0].career_month).prop("selected",true);
	    	$("#certificate_career_file_name").append(jdata.jlist[0].career_file);
	    	
	    	
	    	$("#top1").val(jdata.jlist[0].top1);
	    	$("#top2").val(jdata.jlist[0].top2);
	    	$("#top3").val(jdata.jlist[0].top3);
	    	$("#top1_file_name").append(jdata.jlist[0].top1_file);
	    	$("#top2_file_name").append(jdata.jlist[0].top2_file);
	    	$("#top3_file_name").append(jdata.jlist[0].top3_file);
	    	
	    	
	    	$("#video_name").val(jdata.jlist[0].video_name);
	    	$("#video_content").val(jdata.jlist[0].video_content);
	    	$("#video_file_name").append(jdata.jlist[0].video_file);
	    	$("#video_img_file_name").append(jdata.jlist[0].video_img_file);
    		
    		}
		});//ajax
 		
	}//id null 체크


	
	
	    $('#introduce').keyup(function (e){
	    	var content = $(this).val();
	    	 $('#introduce').css("font-weight","8");
	    	/* object.style.overflowStyle="scrollbar" */
	        if (content.length > 255){
	            alert("최대 255자까지 입력 가능합니다.");
	            $(this).val(content.substring(0, 255));
	            $('.counter').html("(255 / 최대 255자)");
	            $('.counter').css("color","red");
	        }else{
	        	$('.counter').css("color","gray");
	        	
		        $('.counter').html("("+content.length+" / 최대 255자)");    //글자수 실시간 카운팅
	        }
	    }); //keyup
	    
	    
	    
	    $(".job_select").change(function(){
	    	//alert($(this).val());
	    	$(".job_select_2").prop("disabled",false);
	    	if($(this).val()== "디자인"){
	    		
	    		$(".job_select_2 option:eq(1)").val("웹·모바일 디자인").text("웹·모바일 디자인");
	    		$(".job_select_2 option:eq(2)").val("제품·패키지").text("제품·패키지");
	    		$(".job_select_2 option:eq(3)").val("일러스트·캐리커처").text("일러스트·캐리커처");
	    	
	    	}else if($(this).val()== "IT·프로그래밍"){
	    		
	    		$(".job_select_2 option:eq(1)").val("웹사이트개발").text("웹사이트개발");
	    		$(".job_select_2 option:eq(2)").val("모바일개발").text("모바일개발");
	    		$(".job_select_2 option:eq(3)").val("데이터베이스").text("데이터베이스");
	    	
	    	}else if($(this).val()== "영상·사진·음향"){
	    		
	    		$(".job_select_2 option:eq(1)").val("영상촬영·편집").text("영상촬영·편집");
	    		$(".job_select_2 option:eq(2)").val("애니메이션").text("애니메이션");
	    		$(".job_select_2 option:eq(3)").val("3D·VR").text("3D·VR");
	    	
	    	}else if($(this).val()== "마케팅"){
	    		
	    		$(".job_select_2 option:eq(1)").val("SNS마케팅").text("SNS마케팅");
	    		$(".job_select_2 option:eq(2)").val("키워드·배너광고").text("키워드·배너광고");
	    		$(".job_select_2 option:eq(3)").val("브랜드·마케팅").text("브랜드·마케팅");
	    	
	    	}else if($(this).val()== "번역·통역"){
	    		
	    		$(".job_select_2 option:eq(1)").val("일반번역").text("일반번역");
	    		$(".job_select_2 option:eq(2)").val("통역").text("통역");
	    		$(".job_select_2 option:eq(3)").val("영상번역").text("영상번역");
	    	
	    	}
	
	    });//jobselect
	    

	    var count=0;
	  //  var radomvalue=0;
	   
	    $('.job_select , .job_select_2 ').change(function(){
	    	if(arr.length<5){
	 	    	 if($(".job_select option:selected").val() !="전문분야" && $(".job_select_2 option:selected").val() !="상세분야" ){
	  	    		 var sel1=$(".job_select option:selected").val();
	  	    		 var sel2=$(".job_select_2 option:selected").val();
	 	    		 if(arr.includes(sel1+":"+sel2)){
	 	    			 alert("중복되는 값이 있습니다.");
	 	    			
	 	    			$(".job_select option:eq(0)").prop("selected",true);
	 	 	    		$(".job_select_2 option:eq(0)").prop("selected",true);
	 	 	    		$(".job_select_2").prop("disabled",true);
	 	    		 }else{
		 	 	    	count++;
		 	 	    	//radomvalue++;
		 	 	    	var radomvalue = Math.random();
		 	 	    	arr.push(sel1+":"+sel2);
		 	 	    	//alert(arr.length);
		  	    		//alert(count);
		 	    		$(".pf_job_select_area ul").append("<li class='job_select_content' >"+ sel1 +":&nbsp&nbsp"+sel2+"<button type='button'id='x_btn' name='"+radomvalue+"'>x</button></li>");
		 	    		
		 	    		$(".job_select option:eq(0)").prop("selected",true);
		 	    		$(".job_select_2 option:eq(0)").prop("selected",true);
		 	    		$(".job_select_2").prop("disabled",true);
		 	    		
		 	    		
		 	    		$("#job_select_input_content").val(arr);
		 	    		$("#job_count_area").css("color","gray");
			    		$("#job_count_area").html("("+arr.length+" / 최대 5개)");
			    		if(arr.length==5){
			    			$("#job_count_area").css("color","red");
			    		}
		 	    		//alert(arr.includes(sel1+","+sel2));
	 	    		 }
	 	    		

	 	    	$(".job_select_content>button[name='"+radomvalue+"']").click(function(){
	 	    		
			 	    /* alert(arr); */
	 	    		
	 	    			var find =$.inArray(sel1+":"+sel2,arr)
	 	    			if(find>=0){
	 	    				arr.splice(find,1);
	 	    			
		 	    			count--;
		 	    			$(this).parent().remove();	
		 	    			$("#job_select_input_content").val(arr);
					 	    $("#job_count_area").css("color","gray");
				    		$("#job_count_area").html("("+arr.length+" / 최대 5개)");
	 	    			}
	 	 	    		/*var find =arr.indexOf(sel1+":"+sel2); */
		 	    		
	 	    		
	 	    		 
	 			   }); 
	 	    	}
	    	}else if(arr.length==5){
	    		alert("최대 5개 선택 가능합니다");
	    		$(".job_select option:eq(0)").prop("selected",true);
 	    		$(".job_select_2 option:eq(0)").prop("selected",true);
 	    		$(".job_select_2").prop("disabled",true);
 	    		
	    	}

	    });//'.job_select , .job_select_2 '
	    
	    
	    
	   
		var category_count =0;
	    $(".category-tech1-select").click(function(){
	    	//alert($(this).attr("id"));
	    		//$(this).css("color","rgb(79,123,240)");
	    	if($(this).text()=="디자인"){
	    		$(".category-tech2 *").remove();
	    		$(".category-tech2").append(
	    				"<div>Adobe Photoshop</div>",
	    				"<div>Adobe Illustrator</div>",
	    				"<div>Adobe Dreamweaver</div>",
	    				"<div>Adobe Flash</div>",
	    				"<div>Adobe XD</div>",
	    				"<div>Indesign</div>",
	    				"<div>MicroSoft PowerPoint</div>",
	    				"<div>Paint tool sai</div>",
	    				"<div>sketch up</div>",
	    				"<div>Corel Painter</div>",
	    				"<div>Sketch3</div>",
	    				"<div>Zeplin</div>",
	    				"<div>HTML & CSS</div>",
	    				"<div>Keyshot</div>",
	    				"<div>3D MAX</div>",
	    				"<div>Rhino3D</div>",
	    				"<div>CATIA</div>",
	    				"<div>3D CAD</div>",
	    				"<div>PRO-E</div>",
	    				"<div>Fusion360</div>",
	    				"<div>MAYA</div>",
	    				"<div>Zbrush</div>",
	    				"<div>Cinema4d</div>",
	    				"<div>Redshift</div>",
	    				"<div>Arnold</div>",
	    				"<div>Substance Painter</div>",
	    				"<div>CAD</div>",
	    				"<div>v-ray</div>"
	    		);
	    	}else if($(this).text()=="IT·프로그래밍"){
	    		$(".category-tech2 *").remove();
	    		$(".category-tech2").append(
	    				"<div>워드프레스</div>",
	    				"<div>HTML·CSS</div>",
	    				"<div>JavaScript</div>",
	    				"<div>Java</div>",
	    				"<div>Python</div>",
	    				"<div>PHP</div>",
	    				"<div>C#</div>",
	    				"<div>Ruby·RoR</div>",
	    				"<div>TypeScript</div>",
	    				"<div>React</div>",
	    				"<div>ASP.NET</div>",
	    				"<div>Bootstrap</div>",
	    				"<div>JSP</div>",
	    				"<div>Vue.js</div>",
	    				"<div>ASP</div>",
	    				"<div>Node.js</div>",
	    				"<div>Object-C</div>",
	    				"<div>Android Studio</div>",
	    				"<div>C#·.NET</div>",
	    				"<div>C&C++</div>",
	    				"<div>Visual Basic</div>",
	    				"<div>Lua</div>",
	    				"<div>Arduino</div>",
	    				"<div>SQL</div>",
	    				"<div>jQuery</div>",
	    				"<div>node.js</div>",
	    				"<div>Kudan</div>",
	    				"<div>Visual Studio</div>"
	    		);
	    	}else if($(this).text()=="영상·사진·음향"){
	    		$(".category-tech2 *").remove();
	    		$(".category-tech2").append(
	    				"<div>촬영</div>",
	    				"<div>편집</div>",
	    				"<div>후보정</div>",
	    				"<div>제작총괄</div>",
	    				"<div>인물</div>",
	    				"<div>제품</div>",
	    				"<div>프로필</div>",
	    				"<div>음식</div>",
	    				"<div>남자 성우</div>",
	    				"<div>여자 성우</div>",
	    				"<div>캐릭터 연기</div>",
	    				"<div>ARS 녹음</div>",
	    				"<div>내레이션</div>",
	    				"<div>채보/사보</div>",
	    				"<div>편곡</div>",
	    				"<div>작곡</div>",
	    				"<div>마스터링</div>",
	    				"<div>음원편집</div>",
	    				"<div>MC</div>",
	    				"<div>모델</div>",
	    				"<div>공연</div>"
	    		);		
	    	}else if($(this).text()=="마케팅"){
	    		$(".category-tech2 *").remove();
	    		$(".category-tech2").append(
	    				"<div>SNS 마케팅</div>",
	    				"<div>콘텐츠 제작</div>",
	    				"<div>키워드 광고</div>",
	    				"<div>블로그 마케팅</div>",
	    				"<div>카페 마케팅</div>",
	    				"<div>쇼핑몰 마케팅</div>",
	    				"<div>해외 마케팅</div>",
	    				"<div>언론 홍보 마케팅</div>",
	    				"<div>블로그체험단</div>",
	    				"<div>유튜브체험단</div>",
	    				"<div>밴드 마케팅</div>",
	    				"<div>카카오 마케팅</div>",
	    				"<div>트위터 마케팅</div>",
	    				"<div>옥외 광고 마케팅</div>",
	    				"<div>광고콘텐츠 제작</div>",
	    				"<div>TV·영상 광고 마케팅</div>"
	    		);			
	    	}else if($(this).text()=="번역·통역"){
	    		$(".category-tech2 *").remove();
	    		$(".category-tech2").append(
	    				"<div>영어 번역</div>",
	    				"<div>중국어 번역</div>",
	    				"<div>일본어 번역</div>",
	    				"<div>독일어 번역</div>",
	    				"<div>러시아어 번역</div>",
	    				"<div>베트남어 번역</div>",
	    				"<div>스페인어 번역</div>",
	    				"<div>이탈리아어 번역</div>",
	    				"<div>포르투갈어 번역</div>",
	    				"<div>프랑스어 번역</div>",
	    				"<div>영어 통역</div>",
	    				"<div>중국어 통역</div>",
	    				"<div>일본어 통역</div>",
	    				"<div>독일어 통역</div>",
	    				"<div>러시아어 통역</div>",
	    				"<div>베트남어 통역</div>",
	    				"<div>스페인어 통역</div>",
	    				"<div>이탈리아어 통역</div>",
	    				"<div>포르투갈어 통역</div>",
	    				"<div>프랑스어 통역</div>"
	    		);		

	    	}
		    var obj_name = $(this).text();
		   // var random =0;
		    $(".category-tech2>div").click(function(){
		    	var name_check = obj_name+":  "+$(this).text();
		    	if(arr2.includes(name_check)){
		    		alert("중복되는 값이 존재");
		    	}else if(arr2.length<6){
		    		arr2.push(name_check);
		    		category_count++;
		    		$("#tech_count_area").css("color","gray");
		    		$("#tech_count_area").html("("+arr2.length+" / 최대 6개)");
		    		//random++;
		    		var random = Math.random();
		    		/* alert(category_count); */
		    		
		    		$("#category_tech1_input_content").val(arr2);
		    		if(arr2.length==6){
		    			$("#tech_count_area").css("color","red");
		    		}
			    	$(".category-tech-select").append("<div>"+obj_name+":  "+$(this).text()+"<button type='button'id='x_btn' name ='"+random+"'>x</button></div>");
			    	/* alert(arr2); */
			    	check(random);
			    	function check(random){
				    	 $(".category-tech-select>div>button[name='"+random+"']").click(function(){
			 	    		
			 	    		/* alert(category_count); */
			 	    		//$(this).parent().text().pop();
			 	    		
			 	    		/*var find =arr2.indexOf($(this).parent().text().slice(0,-1));
					 	    arr2.splice(find,1);*/
					 	
					 	   /*  alert(arr2); */
					 	   
					 	  var find =$.inArray($(this).parent().text().slice(0,-1),arr2)
		 	    			if(find>=0){
		 	    				arr2.splice(find,1);
		 	    				$(this).parent().remove();	
				 	    		category_count--;
				 	    		$("#tech_count_area").css("color","gray");
				 	    		$("#tech_count_area").html("("+arr2.length+" / 최대 6개)");
				 	    	    $("#category_tech1_input_content").val(arr2);	
		 	    			}
			 	    		
			 			 });  
			    		
			    	}
			    	
			    	 
		    	}else if(arr2.length==6){
		    		alert("최대 6개까지 선택 가능합니다");
		    		
		    	}
	
		    	
		    })//

	    });//.category-tech1-select").click
	    
	    
	    
	    $(".attendance_status").change(function(){
	    	 $(".attendance_status").css("color","black");
	    });
	    $(".career_year").change(function(){
	    	 $(".career_year").css("color","black");		
	    });
	    $(".career_month").change(function(){
	    	 $(".career_month").css("color","black");		
	    });
	    $("#univercity_file").change(function(){
	    	if($(this).val().length == 0){
	        } else {
	          var fileName = $(this).val().split('/').pop().split('\\').pop();
	          $("#file_name").text("");
	          $("#file_name").append(fileName+" ");
	        //  $(this).parent('div').find('input:text').val(fileName);
	        }
	    	
	    });
	    $("#certificate_file").change(function(){
	    	if($(this).val().length == 0){
	        } else {
	          var fileName = $(this).val().split('/').pop().split('\\').pop();
	          $("#certificate_file_name").text("");
	          $("#certificate_file_name").append(fileName+" ");
	        //  $(this).parent('div').find('input:text').val(fileName);
	        }
	    	
	    });
	    $("#career_file").change(function(){
	    	if($(this).val().length == 0){
	        } else {
	          var fileName = $(this).val().split('/').pop().split('\\').pop();
	          $("#certificate_career_file_name").text("");
	          $("#certificate_career_file_name").append(fileName+" ");
	        //  $(this).parent('div').find('input:text').val(fileName);
	        }
	    	
	    });
	    $("#top1_file").change(function(){
	    	if($(this).val().length == 0){
	        } else {
	          var fileName = $(this).val().split('/').pop().split('\\').pop();
	          $("#top1_file_name").text("");
	          $("#top1_file_name").append(fileName+" ");
	        //  $(this).parent('div').find('input:text').val(fileName);
	        }
	    	
	    });
	    $("#top2_file").change(function(){
	    	if($(this).val().length == 0){
	    	} else {
	    		var fileName = $(this).val().split('/').pop().split('\\').pop();
	    		$("#top2_file_name").text("");
	    		$("#top2_file_name").append(fileName+" ");
	    		//  $(this).parent('div').find('input:text').val(fileName);
	    	}
	    	
	    });
	    $("#top3_file").change(function(){
	    	if($(this).val().length == 0){
	    	} else {
	    		var fileName = $(this).val().split('/').pop().split('\\').pop();
	    		$("#top3_file_name").text("");
	    		$("#top3_file_name").append(fileName+" ");
	    		//  $(this).parent('div').find('input:text').val(fileName);
	    	}
	    	
	    });
	    $("#video_file").change(function(){
	    	if($(this).val().length == 0){
	    	} else {
	    		var fileName = $(this).val().split('/').pop().split('\\').pop();
	    		$("#video_file_name").text("");
	    		$("#video_file_name").append(fileName+" ");
	    		//  $(this).parent('div').find('input:text').val(fileName);
	    	}
	    	
	    });
	    $("#video_img_file").change(function(){
	    	if($(this).val().length == 0){
	    	} else {
	    		var fileName = $(this).val().split('/').pop().split('\\').pop();
	    		$("#video_img_file_name").text("");
	    		$("#video_img_file_name").append(fileName+" ");
	    		//  $(this).parent('div').find('input:text').val(fileName);
	    	}
	    	
	    });
	    $("#file").change(function(){
	    	 readURL(this);
	    })
	    
	   function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
/*                     $('#myhome_profile_photo').attr('src', e.target.result); */
                    $('#myhome_profile_photo').css("background-image","url("+e.target.result)+")";
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
	     
	    $("#save").click(function(){
	    	
	    	profileWriteForm.submit();
	    });
	    
	    
    });//ready