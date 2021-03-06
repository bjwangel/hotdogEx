<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->

<html class="no-js">
<!--<![endif]-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
<title>Hot dog</title>

<head>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/fontawesome/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/animateit/animate.min.css"
	rel="stylesheet">

<!-- Vendor css -->
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/owlcarousel/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Template base -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/theme-base.css"
	rel="stylesheet">

<!-- Template elements -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/theme-elements.css"
	rel="stylesheet">

<!-- Responsive classes -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/responsive.css"
	rel="stylesheet">

<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

<!-- Template color -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/color-variations/blue.css"
	rel="stylesheet" type="text/css" media="screen" title="blue">

<!-- LOAD GOOGLE FONTS -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800"
	rel="stylesheet" type="text/css" />

<!-- CSS CUSTOM STYLE -->
<link
	rel="${pageContext.request.contextPath}/assets/template/stylesheet"
	type="text/css" href="${pageContext.request.contextPath}/assets/template/css/custom.css" media="screen" />

<!--VENDOR SCRIPT-->
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>

<!-- User Profile -->
<script
	src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/userProfile.css"
	rel="stylesheet">
<body class="boxed background-grey">
	<div class="wrapper" style="border:none;">

		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->
		<c:choose>
		<c:when test="${map.userVo.users_no == authUser.users_no}" >
			<c:import url="/WEB-INF/views/includes/navigation-blog.jsp" />
		</c:when>
	</c:choose>


		<!-- CONTENT -->
		<section class="content">
			<div class="container list_container">
			    <div class="hr-title hr-long center"><abbr>Diary List</abbr></div>			    
				<!-- Blog post-->
				
				<div class="isotope" data-isotope-item-space="3" data-isotope-col="3" data-isotope-item=".post-item">
					
				</div>
				<!-- END: Blog post-->
			</div>
			<div class="row">
				<div id="load-more-link" class="text-center m-t-40"><a href="javascript:;" class="button border rounded">Load more</a></div>
				<div id="write" class="text-center m-t-40"><a href="${pageContext.request.contextPath}/post/${authUser.nickname}/write" class="button border rounded">Posting</a></div>
			</div>
		</section>

		<!-- END: SECTION -->

		<!-- FOOTER -->
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
		<!-- END: FOOTER -->

	</div>
	<!-- END: WRAPPER -->
	<!-- Theme Base, Components and Settings -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>



	<!-- post 최신 글 9개 불러오는 ajax list -->
	<script>
	
	
	var nickname = "${map.userVo.nickname}"
	var image_path = "${pageContext.request.contextPath}/hotdog/image/user/"
	var post = "${pageContext.request.contextPath }/post/" + nickname + "/postView?post_no="
	
	var isEnd = false;
	var authUser = ${authUser.users_no};
	var users_no = "${map.userVo.users_no}"
	var page = 0;	// 게시글의 0번째 인덱스 
	var pluspage = 10;	// 게시글이 15개씩 fetchList로 로딩 되니까 fetchList가 요청될 시 15만큼 더해서 db인덱스값을 더해서 요청한다.
	
	
	console.log(page)
	
	var render = function(vo){
			
		var htmls =  "<div class='post-item'><div class='post-image'><img src='" + image_path + vo.post_image + "'></a></div><div class='post-content-details'>" + 
				  "<div class='post-title'><h3>" + vo.title + "</h3></div>" +
				  "<div class='post-description'><div class='post-info'><a class='read-more' id='viewDiary' data-no='" + vo.post_no + "' href='" + post + vo.post_no + "'>read more <i class='fa fa-long-arrow-right'></i></a></div>" +
				  "</div></div><div class='post-meta'><div class='post-date'><span class='post-date-year'>" + vo.regdate + "</span></div>" +
				  "<div class='post-comments' data-no='" + vo.post_no + "'><span class='fa fa-hand-pointer-o'>" + vo.count + "</span></a></div>" +
				  "</div></div>"
			
					  $(".isotope").append(htmls);
		};

	var fetchList = function(){
		"use strict";
		console.log("fetchList")
		  
		console.log(page);
		
		  if(isEnd == true){
			  return;
		  }
		
		  $.ajax({
			url: "${pageContext.request.contextPath }/post/api/list?p=" + page + "&no=" + users_no,
			type: "get",
			dataType: "json",
			data:"",
			success: function(response){
				console.log(response)
				if(response.result != "success"){
					console.error(response.message);
					isEnd = true;
					return;
				}
				
			$(response.data).each(function(index, vo){
				render(vo);
				INSPIRO.masonryIsotope('reload');
				
				console.log("render")
			});
			
			if( response.data.length < 5 ) {
				isEnd = true;
				$( "#load-more-link" ).prop( "disabled", true );
				}
			},
		error: function(jqXHR, status, e){
			console.error(status + ":" + e)
		}
	}); 
	};
	
	fetchList();

	$(function(){
		$("#load-more-link").click(function(e){
			page = page +  pluspage;
			fetchList();
			
		});
	});
	
	
	


	</script>


	<!-- user profile modal -->
	<script>
	$(document).on('ready', function(){
	    $modal = $('.modal-frame');
	    $overlay = $('.modal-overlay');

	    /* Need this to clear out the keyframe classes so they dont clash with each other between ener/leave. Cheers. */
	    $modal.bind('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e){
	      if($modal.hasClass('state-leave')) {
	        $modal.removeClass('state-leave');
	      }
	    });

	    $('.closeProfile').on('click', function(){
	      $overlay.removeClass('state-show');
	      $modal.removeClass('state-appear').addClass('state-leave');
	    });

	    $('.openProfile').on('click', function(){
	      $overlay.addClass('state-show');
	      $modal.removeClass('state-leave').addClass('state-appear');
	    });

	  });
	
	</script>
	
	<script>

	$(document).on("click", "#viewDiary", function(){
				
		var postNo = $(this).data("no");
		$.ajax({
			url : "${pageContext.request.contextPath }/post/api/updateHits?postNo="+postNo,
			type : "get",
			success: function() { 
				console.log("success");
			},
			error : function(jqXHR, status, e) {
				console.log(status + ":" + e);
			}
		});
	})
</script>


</body>
</html>