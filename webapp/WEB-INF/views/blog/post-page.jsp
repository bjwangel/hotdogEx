<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/template/images/favicon.png">
	<title>Hot dog</title>
	<!-- Bootstrap Core CSS -->

	<link href="${pageContext.request.contextPath}/assets/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/template/vendor/fontawesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/template/vendor/animateit/animate.min.css" rel="stylesheet">

	<!-- Vendor css -->
	<link href="${pageContext.request.contextPath}/assets/template/vendor/owlcarousel/owl.carousel.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/template/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

	<!-- Template base -->
	<link href="${pageContext.request.contextPath}/assets/template/css/theme-base.css" rel="stylesheet">

	<!-- Template elements -->
	<link href="${pageContext.request.contextPath}/assets/template/css/theme-elements.css" rel="stylesheet">	
    
	<!-- Responsive classes -->
	<link href="${pageContext.request.contextPath}/assets/template/css/responsive.css" rel="stylesheet">

	<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->		

	<!-- Template color -->
	<link href="${pageContext.request.contextPath}/assets/template/css/color-variations/blue.css" rel="stylesheet" type="text/css" media="screen" title="blue">

	<!-- LOAD GOOGLE FONTS -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800" rel="stylesheet" type="text/css" />

	<!-- CSS CUSTOM STYLE -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/css/custom.css" media="screen" />

    <!--VENDOR SCRIPT-->
    <script src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>

</head>

<body class="wide">
	
	<!-- WRAPPER -->
	<div class="wrapper">

		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->


<section class="content">
    <div class="container">
        <div class="row">
            <div class="post-content post-classic post-content-single col-md-9">

                <div class="post-item">
                    <div class="post-image">
                        <a href="#">
                            <img alt="" src= "${pageContext.request.contextPath}/hotdog/image/user/${postVo.post_image}" >
                        </a>
                    </div>
                    <div class="post-content-details">
                        <div class="post-title">
                            <h2>${postVo.title}</h2>
                        </div>
                        <div class="post-info">
                            <span class="post-autor">Post by: <a href="#">${postVo.nickname}</a></span>
                        </div>
                        <div class="post-description">
							${postVo.content}
                        </div>
                    </div>
                    <div class="post-meta">
                        <div class="post-date">
                           	${postVo.regdate}
                        </div>

                        <div class="post-comments">
                            <a href="#">
                                <i class="fa fa-comments-o"></i>
                                <span class="post-comments-number">324</span>
                            </a>
                        </div>
                        <div class="post-comments">
                            <a href="#">
                                <i class="fa fa-share-alt"></i>
                                <span class="post-comments-number">324</span>
                            </a>
                        </div>
                    </div>
                </div>


                <div id="comments" class="comments">
                    <div class="heading">
                        <h4 class="comments-title">Comments <small class="number">(4)</small></h4>
                    </div>

                    <div class="comment">
                        <a href="#" class="pull-left">
                            <img alt="" src="${pageContext.request.contextPath}/assets/template/images/team/4.jpg" class="avatar">
                        </a>
                        <div class="media-body">

                            <h4 class="media-heading">Dia Perry</h4>
                            <p class="time">Jun 24, 2015 at 14:28 PM</p>

                            <p class="comment_section">Donec mollis semper rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
							
                            <a href="javascript:;" class="comment-reply pull-right"><i class="fa fa-reply"></i> Reply</a>

                        </div>
                    </div>
                    
                    <script>
      				
                    
                    
                    var render= function(){
                    	var textarea = "<form action='#'><textarea data-no='${authUser.nickname}' name='content' id='comments'></textarea>";
                    	  $(".comment_section").append(textarea);
                    }
                    
	                   $(".comments").on("click", ".comment-reply", function(){
	           	          render();
	           	          console.log("render");
	                	  $('.comment-reply').replaceWith("<button type='submit' class='btn chatBtn'><i class='fa fa-paper-plane'></i>&nbsp;Post comment</button>")
	                   })
	                   
	                
                    $(document).on("click", ".chatBtn", function(){
                    	var nickname = "${authUser.nickname}";
                    	var post_no = "${postVo.post_no}";
                		
                    	$.ajax({
                			url: "${pageContext.request.contextPath }/post/api//postComment/chatInsert?nickname=" + nickname + "&post_no=" + post_no,
                			type: "get",
                			dataType: "json",
                			data:"",
                			success: function(response){
                					console.log("render")
                				},
                		error: function(jqXHR, status, e){
                			console.error(status + ":" + e)
                			}
                		})
                	})   
	                   
	                   
	                   
                    </script>
                    
                    
                    
                    
                    
                    
                </div>
                
                <div class="comment-form">
                    <div class="heading heading_form">
                        <h4>Leave a comment</h4>
                    </div>
                    
                    
                    <form class="form-gray-fields" action="${pageContext.request.contextPath}/post/comment?">   
                            <div class="col-md-4 form_group_nickname">
                                <div class="form-group">
                                    <label for="name" class="upper">${authUser.nickname}</label>
                                </div>
                            </div>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="comment" class="upper">Your comment</label>
                                    <textarea aria-required="true" id="comment" placeholder="Enter comment" rows="9" name="comment" class="form-control required"></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>&nbsp;Post comment</button>
                                </div>
                            </div>
                        </div>

                    </form>
                    
                    
                    
                    
                </div>
            </div>
            
            
            
            <div class="sidebar sidebar-modern col-md-3">
                <!--widget newsletter-->
                <!-- <div class="widget clearfix widget-newsletter">
                                <form id="widget-subscribe-form-sidebar" action="include/subscribe-form.php" role="form" method="post" class="form-inline">
                                    <h4 class="widget-title">Newsletter</h4>
                                    <small>Stay informed on our latest news!</small>
                                    <div class="input-group">
                                        <input type="email" aria-required="true" name="widget-subscribe-form-email" class="form-control required email" placeholder="Enter your Email">
                                        <span class="input-group-btn">
                  <button type="submit" id="widget-subscribe-submit-button" class="btn btn-primary"><i class="fa fa-paper-plane"></i></button>
                  </span> </div>
                                </form>
                                <script type="text/javascript">
                                    jQuery("#widget-subscribe-form-sidebar").validate({
                                        submitHandler: function(form) {
                                            jQuery(form).ajaxSubmit({
                                                dataType: 'json',
                                                success: function(text) {
                                                    if (text.response == 'success') {
                                                        $.notify({
                                                            message: "You have successfully subscribed to our mailing list."
                                                        }, {
                                                            type: 'success'
                                                        });
                                                        $(form)[0].reset();

                                                    } else {
                                                        $.notify({
                                                            message: text.message
                                                        }, {
                                                            type: 'warning'
                                                        });
                                                    }
                                                }
                                            });
                                        }
                                    });

                                </script>
                            </div> -->
                <!--end: widget newsletter-->

                <!--widget tweeter-->
             	<!--<div class="widget clearfix widget-tweeter">
				     <h4 class="widget-title">Recent Tweets</h4>
				</div> -->
                <!--end: widget tweeter-->

                <!--widget tags -->
                <!-- <div class="widget clearfix widget-tags">
                    <h4 class="widget-title">Tags</h4>
                    <div class="tags">
                        <a href="#">Design</a>
                        <a href="#">Portfolio</a>
                        <a href="#">Digital</a>
                        <a href="#">Branding</a>
                        <a href="#">HTML</a>
                        <a href="#">Clean</a>
                        <a href="#">Peace</a>
                        <a href="#">Love</a>
                        <a href="#">CSS3</a>
                        <a href="#">jQuery</a>
                    </div>
                </div> -->
                <!--end: widget tags -->
                <!--widget archive-->
                <!-- <div class="widget clearfix widget-archive">
                    <h4 class="widget-title">Archive</h4>
                    <ul class="list list-lines">
                        <li>Jun 2015 </li>
                        <li>May 2015 </li>
                        <li>Apr 2015 </li>
                        <li>Mar 2015 </li>
                    </ul>
                </div> -->
                <!--end: widget archive-->
            </div>
        </div>
    </div>
</section>
<!-- END: SECTION -->

<c:import url="/WEB-INF/views/includes/footer.jsp" />

</div>
<!-- END: WRAPPER -->

<!-- GO TOP BUTTON -->
<a class="gototop gototop-button" href="#"><i class="fa fa-chevron-up"></i></a>

<!-- Theme Base, Components and Settings -->
<script src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

<!-- Custom js file -->
<script src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>

</body>
</html>
