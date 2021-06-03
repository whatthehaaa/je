$(document).ready(function(){
	fullset();
	quickClick();	
	/*typing();*/
    $(".tooltip_event").tooltip();

});

function typing(){
	var typing = document.getElementById('typing');
	
	var typewriter = new Typewriter(typing, {
		loop: true
	});
	
	var one = document.getElementById("typing").getAttribute("one");	
	var two = document.getElementById("typing").getAttribute("two");	
	var three = document.getElementById("typing").getAttribute("three");	
								
								
typewriter.typeString('#'+one)
    .pauseFor(2500)
    .deleteAll()
    .typeString('#'+two)
    .pauseFor(2500)
    .deleteChars(7)
    .typeString('#'+three)
    .pauseFor(2500)
    .deleteChars(7)
    .start();

}

   function moveBar(){
            var ele = document.getElementById('progressing');
            var ele1 = document.getElementById('progressing1');
            var ele2= document.getElementById('progressing2');
            
			var one = document.getElementById("progressing").getAttribute("value");
			var two = document.getElementById("progressing1").getAttribute("value");
			var three = document.getElementById("progressing2").getAttribute("value");

			

            var width = 1;
            
            var id =setInterval(frame, 35);
            var id1 =setInterval(frame1, 35);
            var id2 =setInterval(frame2, 35);
            
            function frame(){
                if(width>=Number(one)){
                    clearInterval(id);
                }else{
                    width ++;
                    ele.style.width=width+"%";
                    ele.innerHTML=width+"%";
                }
            }
            function frame1(){
                if(width>=Number(two)){
                    clearInterval(id1);
                }else{
                    width ++;
                    ele1.style.width=width+"%";
                    ele1.innerHTML=width+"%";
                }
            }
            function frame2(){
               if(width>=Number(three)){
                    clearInterval(id2);
                }else{
                    width ++;
                    ele2.style.width=width+"%";
                    ele2.innerHTML=width+"%";
                }
            }
        }

function play(con){
		var player = document.getElementById("m_video_file");
		var con = con;
		player.currentTime = 0; 
		if(con==0){
			player.play();
		}else{
			player.pause();
}
}
	

function fullset(){
	var info = new Array();
	
	info[1] = document.getElementById("frame").getAttribute("one");
	info[2] = document.getElementById("frame").getAttribute("two");
	info[3] = document.getElementById("frame").getAttribute("three");
	info[4] = document.getElementById("frame").getAttribute("four");
	
	var pageindex = $("#fullpage > .fullsection").size(); //fullpage 안에 섹션이(.fullsection) 몇개인지 확인하기
	console.log(pageindex)
/*	for(var i=1;i<=pageindex;i++){
		$("#fullpage > .quick > ul").append("<li></li>");
	}*/
	$("#frame div.quick ul :first-child").addClass("on"); //일단 화면이 로드 되었을때는 퀵버튼에 1번째에 불이 들어오게
	//마우스 휠 이벤트
	$(window).bind("mousewheel", function(event){
		var page = $(".quick ul li.on");
		//alert(page.index()+1);  // 현재 on 되어있는 페이지 번호
		if($("body").find("#fullpage:animated").length >= 1) return false;
		//마우스 휠을 위로
		if(event.originalEvent.wheelDelta >= 0) {
			var before=page.index();
			if(page.index() >= 0) page.prev().addClass("on").siblings(".on").removeClass("on");//퀵버튼옮기기
			
			var pagelength=0;
			for(var i=1; i<(before); i++)
			{
				pagelength += $(".full"+i).height();
			}
			
			if(page.index()==3){								
				play(0);
			}else{
				play(1);
			}
			
			if(page.index() > 0){ //첫번째 페이지가 아닐때 (index는 0부터 시작임)
				page=page.index()-1;
				$("#fullpage").animate({"top": -pagelength + "px"},1000, "swing");
				$('.page'+i).fadeIn(1000);
				console.log('page'+i);
				$('.page'+(i+1)).fadeOut(200);
				console.log("위로:"+'page'+(i+1));		
				$(".page_intro").html("<h4>--"+info[i]+"</h4>");    
      			moveBar();	
			}else{
				alert("첫번째페이지 입니다.");
			}	
		}else{ // 마우스 휠을 아래로	
			var nextPage=parseInt(page.index()+1); //다음페이지번호
			var lastPageNum=parseInt($(".quick ul li").size()); //마지막 페이지번호
			//현재페이지번호 <= (마지막 페이지 번호 - 1)
			//이럴때 퀵버튼옮기기
			if(page.index() <= $(".quick ul li").size()-1){ 
				page.next().addClass("on").siblings(".on").removeClass("on");			
				
			}
			
			if(nextPage < lastPageNum){ //마지막 페이지가 아닐때만 animate !
				var pagelength=0;
				for(var i = 1; i<(nextPage+1); i++){ 
					//총 페이지 길이 구하기
					//ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐
					pagelength += $(".full"+i).height();
				}
				$("#fullpage").animate({"top": -pagelength + "px"},1000, "swing");
				$('.page'+nextPage).fadeOut(200);
				console.log('page'+nextPage);
				$('.page'+i).fadeIn(1000);
				console.log("사라짐"+'page'+i);	
				$(".page_intro").html("<h4>--"+info[i]+"</h4>");
			}
			else{ // 현재 마지막 페이지 일때는
				alert("마지막 페이지 입니다!");
			};		
			console.log(page.index())
			if(page.index()==0){	
				typing();
				moveBar();
			}
			
			if(page.index()==1){								
				play(0);
			}else{
				play(1);
			}
			
		}
	});
	$(window).resize(function(){ 


		//페이지가 100%이기때문에 브라우저가 resize 될때마다 스크롤 위치가 그대로 남아있는것을 방지하기 위해
		var resizeindex = $(".quick ul li.on").index()+1;
		
		var pagelength=0;
		for(var i = 1; i<resizeindex; i++){ 
			//총 페이지 길이 구하기
			//ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐
			pagelength += $(".full"+i).height();
		}

		$("#fullpage").animate({"top": -pagelength + "px"},0);
	});
}
// 사이드 퀵버튼 클릭 이동
function quickClick(){
	var info = new Array();

	info[1] = document.getElementById("frame").getAttribute("one");
	info[2] = document.getElementById("frame").getAttribute("two");
	info[3] = document.getElementById("frame").getAttribute("three");
	info[4] = document.getElementById("frame").getAttribute("four");

	$(".quick li").click(function(){
		var gnbindex = $(this).index()+1;
		var length=0;
		for(var i=1; i<(gnbindex); i++)
		{
			length+=$(".full"+i).height();
		}
		if($("body").find("#fullpage:animated").length >= 1) return false;
		$(this).addClass("on").siblings("li").removeClass("on");
											
		console.log(gnbindex)
		if(gnbindex==2){	
			typing();
			moveBar();
		}
		
		if(gnbindex==3){
			play(0);
		}else{
			play(1);
		}

		$('.page'+i).fadeIn(1000);
		console.log('page'+i);
		$(".page_intro").html("<h4>--"+info[i]+"</h4>");
		$("#fullpage").animate({"top": -length + "px"},800, "swing");
		return false;
	});
	
	
}
