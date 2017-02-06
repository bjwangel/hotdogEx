<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#codevember Sign In / Sign Up</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/loginPage.css">
</head>

<body>
	<section class="container">
		<article class="half">
			<h1>Login</h1>
			<div class="tabs">
				<span class="tab signin active"><a href="#signin">Sign in</a></span>
				<span class="tab signup"><a href="#signup">Sign up</a></span>
			</div>
			<div class="content">
				<div class="signin-cont cont">
					<form action="#" method="post" enctype="multipart/form-data">
						<input type="email" name="email" id="email" class="inpt" required="required" placeholder="Your email">
						<label for="email">Your email</label> 
						
						<input type="password" name="password" id="password" class="inpt" required="required"placeholder="Your password"> 
						<label for="password">Your password</label> <input type="checkbox" id="remember" class="checkbox" checked> 
							
						<label for="remember">Remember me</label>
						
						<div class="submit-wrap">
							<input type="submit" value="Sign in" class="submit"> <a
								href="#" class="more">Forgot your password?</a>
						</div>
					</form>
				</div>
				
				<div class="signup-cont cont">
					<form action="#" method="post" enctype="multipart/form-data">
						<input id="inputNickCheck" type="button" value="check" class="check"> <img id="img-checkemail" style="display: none;">
						<input type="text" name="nickname" id="inputnickname" class="inpt" required="required" placeholder="Your name">
						<label for="name">Your nick name</label> 
						
						<input type="email" name="email" id="inputEmail" class="inpt" required="required" placeholder="Your email"> 
						<label for="email">Your email</label> 
						
						<input type="password" name="password" id="inputPassword" class="inpt" required="required" placeholder="Your password">
						<label for="password">Your password</label>
						
						<input id="inputPassword2Check" type="button" value="check" class="check"> <img id="img-checkemail" style="display: none;">
						<input type="password" name="#inputPassword2" id="inputPassword2" class="inpt" required="required" placeholder="Check password">
						<label for="password">Check password</label>
						
						<div id="checkButton">
							<button type="button" class="SendCode" value="Send Code">Send Code</button>
							<label for="Code">Send Code</label>
						</div>

						<div class="submit-wrap">
							<input type="submit" value="Sign up" class="submit" id="SignUp"> <a
								href="#" class="more">가입 후 핫도그를 시작하세요</a>
						</div>
						
					</form>
				</div>
			</div>
		</article>
		<div class="half bg"></div>
	</section>
	<script src="${pageContext.request.contextPath }/assets/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>

	<!-- <script src="js/index.js"></script> -->
	<script>$('.tabs .tab').click(function(){
	    if ($(this).hasClass('signin')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.signin-cont').show();
	    } 
	    if ($(this).hasClass('signup')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.signup-cont').show();
	    }
	});
	$('.container .bg').mousemove(function(e){
	    var amountMovedX = (e.pageX * -1 / 30);
	    var amountMovedY = (e.pageY * -1 / 9);
	    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
	});</script>
	
	<script>
var email;
var password;
var nickname;
var code;

$(function(){
	
 /* $("#joinNextButton").prop("disabled",true);
 	$("#sendMailButton").prop("disabled", true);
	$("#inputCodeCheck").prop("disabled", true);
	$("#joinButton").prop("disabled", true); */
	
	$("#SignUp").prop("disabled", true);
	
//		회원가입 폼    		
	$("#inputNickCheck").click(function(){
			
			nickname = $("#inputnickname").val();
			console.log(nickname);
			
			if($("#inputnickname").val()==""){
				alert("닉네임을 입력해주세요");
				$("#inputnickname").focus();
				return false;
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/user/nickCheck?nickname=" + nickname,
				type:"get",
				dataType:"json",
				data:"",
				success: function(response){
					
					// 통신에러
					if( response.result == "fail" ) {
						console.log( response.message );
						return;
					}
				
				// 코드가 일치할 때
				if(response.data=="yes"){
					alert("사용가능한 닉네임입니다.");
					$("#sendMailButton").prop("disabled",false);
				}
					if(response.data=="no"){
						alert("이미 사용중인 닉네임입니다.")
					}
				}
			})
		})
		
		
		$("#inputPassword2Check").click(function(){
			
			nickname = $("#inputnickname").val();
			console.log(nickname);
			
			if($("#inputPassword").val()==""){
				alert("패스워드를 입력해주세요");
				$("#inputPassword").focus();
				return false;
			}
			
			if($("#inputPassword2").val()==""){
				alert("패스워드 체크를 입력해주세요");
				$("#inputPassword").focus();
				return false;
			}
			
			if($("#inputPassword").val()!=$("#inputPassword2").val()){
				alert("입력한 비밀번호가 다릅니다.");
				$("#inputPassword2").focus();
				return false;
			}else{
				alert("비밀번호 체크완료")
			}
		});
		
	$("#checkButton").on("click", "#inputCodeCheck", function(){
		
	});
	
		
		
	$(".SendCode").click(function(){
		alert("코드를 이메일로 발송하였습니다.")
		
		var formData = new FormData();
        email=$("#inputEmail").val();
        password=$("#inputPassword").val();
        nickname=$("#inputnickname").val();
        
        formData.append("email",email);
    	formData.append("password",password);
    	formData.append("nickname",nickname);
    	
		
		if($("#inputEmail").val()==""){
			alert("이메일을 입력해주세요");
			$("#inputEmail").focus();
			return false;
		}
		if($("#inputPassword").val()==""){
			alert("패스워드를 입력해주세요");
			$("#inputPassword").focus();
			return false;
		}
		if($("#inputPassword").val()!=$("#inputPassword2").val()){
			alert("입력한 비밀번호가 다릅니다.");
			$("#inputPassword2").focus();
			return false;
		}
		if($("#inputnickname").val()==""){
			alert("닉네임을 입력해주세요");
			$("#inputnickname").focus();
			return false;
		}
		
		
		
		
		

		// 배열에 TempUser 정보 넣어서 JSON 으로 던지기         {"data":arr}
		// var arr=[ $("#inputEmail").val() ,$("#inputPassword").val() ];
	
		$.ajax({
			url:"${pageContext.request.contextPath }/user/signupform",
			type:"post",
			data: formData , 
			processData : false,
            contentType : false
		})

		 $('.SendCode').replaceWith("<input id='inputCodeCheck' type='button' value='check' class='check'> <img id='img-checkemail' style='display: none;'><input type='number' name='code' id='inputCode' class='inpt' required='required' placeholder='Check Code'><label for='Code'>Send Code</label>"); 
		 return true;
	});
})
	
</script>
	
	
</body>
</html>