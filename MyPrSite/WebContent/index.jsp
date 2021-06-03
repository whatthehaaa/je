<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_gun/myprsite.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/redmond/jquery-ui.min.css"/>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>
$(function(){

    
      $.ajax({
         url:"indexAjaxProc.jsp",
         success:function(result){
            //JSON 형식으로 parsing
            var jdata = JSON.parse(result);
            //2-1. DHTML을 이용하여 테이블 생성 및 출력
            
          
            
             
                     
             if(jdata.jlist[0].s_face_file_1!=null){
                
                $('.design_one').tooltip({
                  items:'[data-photo]',
                   content:function(){
                       var photo = $(this).data('photo');
                       var info = $(this).data('info');
                       return '<img src="'+photo+'.png"/>' +info;
                   }
               });

               $('.design_img #design_one').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_1) +")";
               $('#main_p1').attr("href","http://localhost:9000/MyPrSite/prsite.jsp?id="+jdata.jlist[0].id_1);
               
               $('.software_img #design_one').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_1) +")";
               $('.video_img #design_one').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_1) +")";
               $('.marketing_img #design_one').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_1) +")";
               $('.translation_img #design_one').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_1) +")";
            } 
             if(jdata.jlist[0].s_face_file_2!=null){
                
                $('.design_two').tooltip({
                    items:'[data-photo]',
                     content:function(){
                         var photo = $(this).data('photo');
                         var info = $(this).data('info');
                         return '<img src="'+photo+'.png"/>' +info;
                     }
                 });
                
               $('.design_img #design_two').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_2) +")";
               $('#main_p2').attr("href","http://localhost:9000/MyPrSite/prsite.jsp?id="+jdata.jlist[0].id_2);
               $('.software_img #design_two').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_2) +")";
               $('.video_img #design_two').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_2) +")";
               $('.marketing_img #design_two').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_2) +")";
               $('.translation_img #design_two').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_2) +")";
             } 
             if(jdata.jlist[0].s_face_file_3!=null){
                
                $('.design_three').tooltip({
                  items:'[data-photo]',
                   content:function(){
                       var photo = $(this).data('photo');
                       var info = $(this).data('info');
                       return '<img src="'+photo+'.png"/>' +info;
                   }
               });
                
               $('.design_img #design_three').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_3) +")";
               $('#main_p3').attr("href","http://localhost:9000/MyPrSite/prsite.jsp?id="+jdata.jlist[0].id_3);
               $('.software_img #design_three').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_3) +")";
               $('.video_img #design_three').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_3) +")";
               $('.marketing_img #design_three').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_3) +")";
               $('.translation_img #design_three').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_3) +")";
             } 
             if(jdata.jlist[0].s_face_file_4!=null){
                
                $('.design_four').tooltip({
                    items:'[data-photo]',
                     content:function(){
                         var photo = $(this).data('photo');
                         var info = $(this).data('info');
                         return '<img src="'+photo+'.png"/>' +info;
                     }
                 });
                  
               $('.design_img #design_four').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_4) +")";
               $('#main_p4').attr("href","http://localhost:9000/MyPrSite/prsite.jsp?id="+jdata.jlist[0].id_4);
               $('.software_img #design_four').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_4) +")";
               $('.video_img #design_four').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_4) +")";
               $('.marketing_img #design_four').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_4) +")";
               $('.translation_img #design_four').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_4) +")";
             } 
             if(jdata.jlist[0].s_face_file_5!=null){
                
                $('.design_five').tooltip({
                    items:'[data-photo]',
                     content:function(){
                         var photo = $(this).data('photo');
                         var info = $(this).data('info');
                         return '<img src="'+photo+'.png"/>' +info;
                     }
                 });
                  
               $('.design_img #design_five').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_5) +")";
               $('#main_p5').attr("href","http://localhost:9000/MyPrSite/prsite.jsp?id="+jdata.jlist[0].id_5);
               $('.software_img #design_five').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_5) +")";
               $('.video_img #design_five').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_5) +")";
               $('.marketing_img #design_five').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_5) +")";
               $('.translation_img #design_five').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file_5) +")";
             } 
               
            
         
          }
      });//ajax
    
});
</script>
</head>
<body>
  <!-- header -->
  <jsp:include page="header.jsp" /> 
  <!-- content -->
  <div class="content">
    <div>
      <section class="section1">    
        <div class="main_img_page">  
          <!-- <a href="http://localhost:9000/Saram/index.jsp"><img src="http://localhost:9000/Saram/images/logo.png" class="logo_img"></a> -->
          <div class="search">
              <span>175만건의 포트폴리오, 98.4%의 만족도</span>
              <h1>나의 PR 공유 <a href=""> 사람온테스트</a></h1>
              <div class="search_bar">
                <input id='saram' type="text" placeholder="검색....." autocomplete='on'><div><button><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"></button></div>
              </div>
          </div>       
        
        <div class="main_btn_page">
         <div class="main_btn_icon">
            <a href="http://localhost:9000/MyPrSite/cat/cat_design.jsp"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_design_3.png"></a>
            <a href="http://localhost:9000/MyPrSite/cat/cat_programming.jsp"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_it_3.png"></a>
            <a href="http://localhost:9000/MyPrSite/cat/cat_media.jsp"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_content_3.png"></a>
            <a href="http://localhost:9000/MyPrSite/cat/cat_marketing.jsp"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_marketing_3.png"></a> 
            <a href="http://localhost:9000/MyPrSite/cat/cat_translation.jsp"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_papers_3.png"></a>
            <div class="main_btn_text">
               <a href="http://localhost:9000/MyPrSite/cat/cat_design.jsp"><span>디자인</span></a>
               <a href="http://localhost:9000/MyPrSite/cat/cat_programming.jsp"><span>IT·프로그래밍</span></a>
               <a href="http://localhost:9000/MyPrSite/cat/cat_media.jsp"><span>영상·사진·음향</span></a>
               <a href="http://localhost:9000/MyPrSite/cat/cat_marketing.jsp"><span>마케팅</span></a>
               <a href="http://localhost:9000/MyPrSite/cat/cat_translation.jsp"><span>번역·통역</span></a>
            </div>
            </div>         
        </div>
        </div>
      </section>
      
      <section class="section2">
        <div class="pr_list">
          <div class="design_pr">
            <span>대표 포토폴리오!!</span>
         
            <div class="design_img">
            
              <a href ="" id="main_p1"><div class="design_one" id="design_one" data-photo="https://media.vlpt.us/post-images/leejh3224/346b08f0-e5d7-11e9-a7c9-f7e46d949a35/css"
                                         data-info="<span>CSS 전문가</span></br><span>CSS 교육과정 이수</span>"></div></a>
                                         
              <a href ="" id="main_p2"><div class="design_two" id="design_two" data-photo="https://arsfutura-production.s3.amazonaws.com/jobs/icons/000/000/009/original/91de50e59c"
                                         data-info="<span>JS 전문가</span></br><span>JS 교육과정 이수</span>"></div></a>
                                         
              <a href ="" id="main_p3"><div class="design_three" id="design_three" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/512px-HTML5_logo_and_wordmark.svg"
                                         data-info="<span>HTML 전문가</span></br><span>HTML 교육과정 이수</span>"></div></a>
                                         
              <a href ="" id="main_p4"><div class="design_four" id="design_four" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Adobe_Photoshop_CC_icon.svg/1200px-Adobe_Photoshop_CC_icon.svg"
                                         data-info="<span>포토샵 전문가</span></br><span>포토샵 교육과정 이수</span>"></div></a>
                                         
              <a href ="" id="main_p5"><div class="design_five" id="design_five" data-photo="https://cdn.inflearn.com/wp-content/uploads/ai-icon"
                                         data-info="<span>일러스트 전문가</span></br><span>일러스트 교육과정 이수</span>"></div></a> 
            </div>  
          </div>
          <%-- <div class="software_pr">
            <span>IT·프로그래밍 카테고리에서 인기있어요!</span>
            <button type="button">></button>
            <button type="button"><</button>
              <div class="software_img">
                <a href =""><div class="design_one" id="design_one" data-photo="https://media.vlpt.us/post-images/leejh3224/346b08f0-e5d7-11e9-a7c9-f7e46d949a35/css"
                                            data-info="<span>CSS 전문가</span></br><span>CSS 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_two" id="design_two" data-photo="https://arsfutura-production.s3.amazonaws.com/jobs/icons/000/000/009/original/91de50e59c"
                                            data-info="<span>JS 전문가</span></br><span>JS 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_three" id="design_three" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/512px-HTML5_logo_and_wordmark.svg"
                                            data-info="<span>HTML 전문가</span></br><span>HTML 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_four" id="design_four" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Adobe_Photoshop_CC_icon.svg/1200px-Adobe_Photoshop_CC_icon.svg"
                                            data-info="<span>포토샵 전문가</span></br><span>포토샵 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_five" id="design_five" data-photo="https://cdn.inflearn.com/wp-content/uploads/ai-icon"
                                               data-info="<span>일러스트 전문가</span></br><span>일러스트 교육과정 이수</span>"></div></a>
             </div>
          </div> --%>
          <%-- <div class="video_pr">
            <span>영상·사진·음향 카테고리에서 인기있어요!</span>
            <button type="button">></button>
            <button type="button"><</button>
            <div class="video_img">
            <a href =""><div class="design_one" id="design_one" data-photo="https://media.vlpt.us/post-images/leejh3224/346b08f0-e5d7-11e9-a7c9-f7e46d949a35/css"
                                            data-info="<span>CSS 전문가</span></br><span>CSS 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_two" id="design_two" data-photo="https://arsfutura-production.s3.amazonaws.com/jobs/icons/000/000/009/original/91de50e59c"
                                            data-info="<span>JS 전문가</span></br><span>JS 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_three" id="design_three" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/512px-HTML5_logo_and_wordmark.svg"
                                            data-info="<span>HTML 전문가</span></br><span>HTML 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_four" id="design_four" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Adobe_Photoshop_CC_icon.svg/1200px-Adobe_Photoshop_CC_icon.svg"
                                            data-info="<span>포토샵 전문가</span></br><span>포토샵 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_five" id="design_five" data-photo="https://cdn.inflearn.com/wp-content/uploads/ai-icon"
                                               data-info="<span>일러스트 전문가</span></br><span>일러스트 교육과정 이수</span>"></div></a>
            </div>
          </div> --%>
          <%-- <div class="computer_pr">
            <span>마케팅 카테고리에서 인기있어요!</span>
            <button type="button">></button>
            <button type="button"><</button>
            <div class="marketing_img">
            <a href =""><div class="design_one" id="design_one" data-photo="https://media.vlpt.us/post-images/leejh3224/346b08f0-e5d7-11e9-a7c9-f7e46d949a35/css"
                                            data-info="<span>CSS 전문가</span></br><span>CSS 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_two" id="design_two" data-photo="https://arsfutura-production.s3.amazonaws.com/jobs/icons/000/000/009/original/91de50e59c"
                                            data-info="<span>JS 전문가</span></br><span>JS 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_three" id="design_three" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/512px-HTML5_logo_and_wordmark.svg"
                                            data-info="<span>HTML 전문가</span></br><span>HTML 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_four" id="design_four" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Adobe_Photoshop_CC_icon.svg/1200px-Adobe_Photoshop_CC_icon.svg"
                                            data-info="<span>포토샵 전문가</span></br><span>포토샵 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_five" id="design_five" data-photo="https://cdn.inflearn.com/wp-content/uploads/ai-icon"
                                               data-info="<span>일러스트 전문가</span></br><span>일러스트 교육과정 이수</span>"></div></a>
            </div>
          </div> --%>
          <%-- <div class="commu_pr">
            <span>번역·통역 카테고리에서 인기있어요!</span>
            <button type="button">></button>
            <button type="button"><</button>
            <div class="translation_img">
            <a href =""><div class="design_one" id="design_one" data-photo="https://media.vlpt.us/post-images/leejh3224/346b08f0-e5d7-11e9-a7c9-f7e46d949a35/css"
                                            data-info="<span>CSS 전문가</span></br><span>CSS 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_two" id="design_two" data-photo="https://arsfutura-production.s3.amazonaws.com/jobs/icons/000/000/009/original/91de50e59c"
                                            data-info="<span>JS 전문가</span></br><span>JS 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_three" id="design_three" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/512px-HTML5_logo_and_wordmark.svg"
                                            data-info="<span>HTML 전문가</span></br><span>HTML 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_four" id="design_four" data-photo="https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Adobe_Photoshop_CC_icon.svg/1200px-Adobe_Photoshop_CC_icon.svg"
                                            data-info="<span>포토샵 전문가</span></br><span>포토샵 교육과정 이수</span>"></div></a>
                                            
                 <a href =""><div class="design_five" id="design_five" data-photo="https://cdn.inflearn.com/wp-content/uploads/ai-icon"
                                               data-info="<span>일러스트 전문가</span></br><span>일러스트 교육과정 이수</span>"></div></a>
            </div>
          </div> --%>
        </div>
      </section>
      
    </div>
  </div>
  <!-- footer -->
  <jsp:include page="footer.jsp" /> 
  <script>
      $(function() {
         var languages = [
            "사람온", "디자인", "IT","프로그래밍", "영상",
            "사진", "음향", "마케팅", "번역", "통역",
            "프론트", "백엔드", "반응형", "Java", "JavaScript",
            "CSS", "홍길동", "Window", "Python", "Ruby",
            "Scala", "Scheme" 
         ]; 
      
         $( "#saram" ).autocomplete({
            source: languages
         });
      });
</script>
</body>
</html>