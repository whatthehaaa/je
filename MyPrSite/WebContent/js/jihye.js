$(document).ready(function(){
	var check = false;
	var popUp;
   /**
    * join_intro.jsp
    */
   $("#chk").click(function(){
      if($("#chk").is(":checked")){
         $(".join_check").prop("checked", true);
      }else{
         $(".join_check").prop("checked", false);
      }
   });
   
   $(".confirm").click(function(){
      if($("#chk1").is(":checked") == false || $("#chk2").is(":checked") == false){
         alert("필수항목을 체크해 주세요(●'◡'●)");
         return false;
      }else{
         join_intro1.submit();
      }
   });
   
   /**
    * join.jsp
    */
   $("#register").click(function(){
      if(!ruleCheck()){
            return false;
         }else if($("#id_msg").text() != "사용가능한 아이디 입니다"){
        	 alert("아이디를 확인해주세요 :)");
        	 $("#id").focus();
        	 return false;
         }else if($("#pass").val()==""){
            alert("비밀번호를 입력해주세요 :)");
            $("#pass").focus();
            return false;
         }else if($("#cpass").val()==""){
            alert("비밀번호를 확인을 해주세요 :)");
            $("#cpass").focus();
            return false;
         }else if($("#name").val()==""){
            alert("이름을 입력해주세요 :)");
            $("#name").focus();
            return false;
         }else if($("#year").val()==""){
            alert("년도를 입력해주세요 :)");
            $("#year").focus();
            return false;
         }else if($("#month").val()=="월"){
            alert("월을 입력해주세요 :)");
            $("#month").focus();
            return false;
         }else if($("#day").val()=="일"){
            alert("일을 입력해주세요 :)");
            $("#day").focus();
            return false;
         }else if($("#gender").val()=="성별"){
            $("#gender").val("선택 안함");
            $("#gender").focus();
            return true;
         }else if($("#hp").val()==""){
            alert("핸드폰번호를 입력해주세요 :)");
            $("#hp").focus();
            return false;
         }else if($("#hp_msg").text() != "사용가능한 전화번호 입니다"){
        	 alert("이미 사용중인 번호입니다. 다른 번호를 입력해주세요");
        	 $("#hp").focus();
        	 return false;
         }else {
            join1.submit();
            /*location.href="http://localhost:9000/MyPrSite/index.jsp";*/
         }
   });
   
   $("#id").focusout(function(){
	  /* alert($("#id_msg").css("color"));*/
      if(!ruleCheck()){
    	  return false;
      }else{
    	  $.ajax({
			   url:"idDuplCheck.jsp?id="+$("#id").val(),
			   success:function(result){
				   if(result == 0){
					   $("#id_msg").text("사용가능한 아이디 입니다");
				       $("#id_msg").css("color", "blue");
				       $("#pass").focus();
				   }else{
					   $("#id_msg").removeClass("warning");
					   $("#id_msg").addClass("warning");
					   $("#id_msg").text("이미 사용중인 아이디 입니다");
				       $("#id_msg").css("color", "red");
				       $("#id").focus();
				   }
			   }
		   });
      }
   });
   
   $("#pass").blur(function(){
      var pass_check = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{7,15}$/;

      if(!pass_check.test($("#pass").val())){
         $("#pass_msg").addClass("warning");
         $("#pass_msg").text("비밀번호는 영문과 숫자를 조합한 7~15자 이내로 입력해주세요");
         $("#pass_msg").css("color","red");
         $("#pass").focus();
         return false;
      }else if(pass_check.test(pass.value)){
         $("#pass_msg").text("사용가능한 비밀번호 입니다");
         $("#pass_msg").css("color","blue"); 
         $("#cpass").focus();
         return true;
      }
   });
   
   $("#cpass").blur(function(){
      if($("#pass").val() == $("#cpass").val()){
         $("#cpass_msg").text("비밀번호가 일치합니다")
                     .css("color", "blue");
         $("#name").focus();
         return true;
      }else if($("#pass").val() != $("#cpass").val()){
         $("#cpass_msg").addClass("warning");
         $("#cpass_msg").text("비밀번호가 일치하지 않습니다");
         $("#cpass_msg").css("color", "red");
         pass.focus();
         return false;
      }
   });
   
   $("#year").focusout(function(){
      if($("#year").val() != ""){
         if($("#year").val()>=1000 && $("#year").val()<=9999){
            $("#month").focus();
         }else {
            alert("년도(4자리)를 입력하세요");
            $("#year").val("");
            $("#year").focus();
            return false;
         }
      }
   });
   
   $("#email").blur(function(){
      var email_check = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

      if($("#email").val() == ""){
         return true;
      }else {
         if(!email_check.test($("#email").val())){
            $("#email_msg").addClass("warning");
            $("#email_msg").text("이메일 형식에 맞춰 작성해주세요");
            $("#email_msg").css("color","red");
            $("#email").focus();
            return false;
         }else {
            $("#email_msg").text("사용가능한 이메일 입니다");
            $("#email_msg").css("color", "blue");
            $("#hp").focus(); 
            return true;
         }
      }
   });
   
   $("#hp").blur(function(){
	   if($("#hp").val() == ""){
		   return false;
	   }else{
		   $.ajax({
			   url:"hpDuplCheck.jsp?hp="+$("#hp").val(),
			   success:function(result){
				   if(result == 0){
					   $("#hp_msg").text("사용가능한 전화번호 입니다");
				       $("#hp_msg").css("color", "blue");
				   }else{
					   $("#hp_msg").removeClass("warning");
					   $("#hp_msg").addClass("warning");
					   $("#hp_msg").text("이미 사용중인 전화번호 입니다");
				       $("#hp_msg").css("color", "red");
				       $("#hp").focus();
				   }
			   }
		   });
	   }
   });
   
   /**
    * board_update
    */
   $("input[type='file']#u_bfile").on('change', function(){
      if(window.FileReader){
         var fileName = $(this)[0].files[0].name;
         $("span#bfile").text("").text(fileName);
      }
   });
   
   /**
    * mypage1_intro
    */
   $("#mypage1_intro_btn").click(function(){
      if($("#mypage1_intro_pass").val() == ""){
         alert("비밀번호를 입력해주세요");
         $("#mypage1_intro_pass").focus();
         return false;
      }else if($("#mypage1_intro_pass").val() != $("#user_pass").val()){
         alert("비밀번호가 일치하지 않습니다");
         $("#mypage1_intro_pass").val("");
         $("#mypage1_intro_pass").focus();
         return false;
      }else{
         mypage1_intro.submit();
      }
      
   });
   
   /**
    * mypage
    */
   $("#btnUpdate").click(function(){
       if($("#m_name").val()==""){
            alert("이름을 입력해주세요 :)");
            $("#m_name").focus();
            return false;
        }else if($("#m_cpass").val()=="" || ($("#m_pass").val() != $("#m_cpass").val())){
            alert("비밀번호를 확인을 해주세요 :)");
            $("#m_cpass").focus();
            return false;
         }else if($("#m_name").val()==""){
            alert("이름을 입력해주세요 :)");
            $("#m_name").focus();
            return false;
         }else if($("#m_year").val()==""){
            alert("년도를 입력해주세요 :)");
            $("#m_year").focus();
            return false;
         }else if($("#m_month").val()==""){
            alert("월을 입력해주세요 :)");
            $("#m_month").focus();
            return false;
         }else if($("#m_day").val()==""){
            alert("일을 입력해주세요 :)");
            $("#m_day").focus();
            return false;
         }else if($("#m_hp").val()==""){
            alert("핸드폰번호를 입력해주세요 :)");
            $("#m_hp").focus();
            return false;
         }else if($("#m_hp_msg").text() != "사용가능한 전화번호 입니다"){
        	 alert("이미 사용중인 번호입니다. 다른 번호를 입력해주세요");
        	 $("#m_hp").focus();
        	 return false;
         }else {
            mypage1.submit();
            /*location.href="http://localhost:9000/MyPrSite/index.jsp";*/
         }
   });
   
   $("#m_cpass").blur(function(){
      if($("#m_pass").val() == $("#m_cpass").val()){
    	  $("#m_cpass_msg").removeClass("warning");
         $("#m_cpass_msg").text("비밀번호가 일치합니다");
         $("#m_cpass_msg").css("color", "blue");
         $("#m_year").focus();
         return true;
      }else if($("#m_pass").val() != $("#m_cpass").val()){
         $("#m_cpass_msg").addClass("warning");
         $("#m_cpass_msg").text("비밀번호가 일치하지 않습니다");
         $("#m_cpass_msg").css("color", "red");
         m_pass.focus();
         return false;
      }
   });
   
   $("#m_year").focusout(function(){
      if($("#m_year").val() != ""){
         if($("#m_year").val()>=1000 && $("#m_year").val()<=9999){
            $("#m_month").focus();
         }else {
            alert("년도(4자리)를 입력하세요");
            $("#m_year").val("");
            $("#m_year").focus();
            return false;
         }
      }
   });
   
   $("#m_email").blur(function(){
      var email_check = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

      if($("#m_email").val() == ""){
         return true;
      }else {
         if(!email_check.test($("#m_email").val())){
            $("#m_email_msg").addClass("warning");
            $("#m_email_msg").text("이메일 형식에 맞춰 작성해주세요");
            $("#m_email_msg").css("color","red");
            $("#m_email").focus();
            return false;
         }else {
        	$("#m_email_msg").removeClass("warning");
            $("#m_email_msg").text("사용가능한 이메일 입니다");
            $("#m_email_msg").css("color", "blue");
            return true;
         }
      }
   });
   
   $("#m_hp").blur(function(){
	   if($("#m_hp").val() == ""){
		   return false;
	   }else{
		   $.ajax({
			   url:"http://localhost:9000/MyPrSite/join/hpDuplCheck.jsp?hp="+$("#m_hp").val(),
			   success:function(result){
				   if(result == 0){
					   $("#m_hp_msg").removeClass("warning");
					   $("#m_hp_msg").text("사용가능한 전화번호 입니다");
				       $("#m_hp_msg").css("color", "blue");
				   }else{
					   $("#m_hp_msg").addClass("warning");
					   $("#m_hp_msg").text("이미 사용중인 전화번호 입니다");
				       $("#m_hp_msg").css("color", "red");
				       $("#m_hp").focus();
				   }
			   }
		   });
	   }
   });
   
   /**
    * 비밀번호 변경
    */
   $("#change_pass").click(function(){
	   if($("#m_pass").attr("disabled") == 'disabled'){
		   $("#m_pass").attr("disabled", false);
	   }else{
		   $("#m_pass").attr("disabled", true);
	   }
	   
   });
   
   /**
    * 마이페이지 정규식 체크
    */
   $("#m_pass").blur(function(){
	      var pass_check = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{7,15}$/;

	      if(!pass_check.test($("#m_pass").val())){
	         $("#m_pass_msg").addClass("warning");
	         $("#m_pass_msg").text("비밀번호는 영문과 숫자를 조합한 7~15자 이내로 입력해주세요");
	         $("#m_pass_msg").css("color","red");
	         $("#m_pass").focus();
	         return false;
	      }else if(pass_check.test($("#m_pass").val())){
	    	 $("#m_pass_msg").removeClass("warning");
	         $("#m_pass_msg").text("사용가능한 비밀번호 입니다");
	         $("#m_pass_msg").css("color","blue"); 
	         $("#m_cpass").focus();
	         return true;
	      }
	   });
   
   /**
    * 회원탈퇴
    */
   $("#withdrawal").click(function(){
	  alert("탈퇴가 완료되었습니다 :)"); 
   });
   
   
 
});

	function ruleCheck(){
		var id_check = /^[A-Za-z0-9]{5,13}$/;
	    
		if($("#id").val() == ""){
			alert("아이디를 입력해주세요 :)");
	        $("#id").focus();
			return false;
		}else{
			if(id_check.test($("#id").val())){
				   return true;
			}else {
			    $("#id_msg").addClass("warning");
			    $("#id_msg").text("아이디는 5~13이내로 입력해주세요")
			             .css("color", "red");
			    $("#id").focus();
			     return false;
			 }
		}
	}