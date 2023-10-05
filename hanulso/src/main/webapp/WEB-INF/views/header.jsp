<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Blog</title>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
  	<script src="https://kit.fontawesome.com/31a5a12e84.js" crossorigin="anonymous"></script>
  	<link href="/resources/css/mystyle.css" rel="stylesheet">
  	<link href="/resources/css/common.css" rel="stylesheet">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="/resources/js/jquery-3.3.1.min.js"></script>
  	<script src="/resources/js/common.js"></script>
  	

</head>
<body>
<header>
<div id="BlogHead" role="banner" class="blog_head" style="height:105px;">
	<div class="inner_header">
		<h1>
			<a href="/">
				<span class="logo"><strong>BLOG</strong></span>
			</a>
		</h1>
		<div id="BlogGnb" role="navigation" class="gnb_blog">
			<ul class="list_blog">
			<c:choose>
				<c:when test="${empty user }">
					<li>
						<a href="/notice/list?type=&keyword=" class="link_blog">공지사항 </a>
					</li>
					<li>
						<a href="/post/list?type=&keyword=" class="link_blog">게시글</a>
					</li>
					<li>
						<a href="/qa/list?type=&keyword=" class="link_blog">질문과답변</a>
					</li>
					<li>
						<a href="/faq/list" class="link_blog">FAQ</a>
					</li>
					<c:forEach var="notice" items="${notice }">
					<li>
						<a href="/notice/noticeview?bno=${notice.bno}" class="link_blog"><i class="fas fa-bullhorn"></i>
						[공지사항]	${notice.title}</a>
					</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<li>
						<a href="/notice/list?type=&keyword=" class="link_blog">공지사항 </a>
					</li>
					<li>
						<a href="/post/list?type=&keyword=" class="link_blog">게시글</a>
					</li>
					<li>
						<a href="/qa/list?type=&keyword=" class="link_blog">질문과답변</a>
					</li>
					<li>
						<a href="/faq/list" class="link_blog">FAQ</a>
					</li>
					<li>
						<a href="/member/view?bno=${user.bno }" class="link_blog">마이페이지</a>
					</li>
					<c:forEach var="notice" items="${notice }">
					<li class="">
						<a href="/notice/noticeview?bno=${notice.bno}" class="link_blog"><i class="fas fa-bullhorn"></i>
						[공지사항]	${notice.title}</a>
					</li>
					</c:forEach>
					</c:otherwise>
				</c:choose>	
			</ul>
		</div>
		<div class="info_blog">
			<div class="logn_blog">
			
				<c:choose>
					<c:when test="${empty user }">
						<li>
	        				<i class="fa fa-user-circle-o fa-2x" aria-hidden="true" onclick="location.href='/login/login'"
	        				style="margin-top:5px;"></i>
						</li>
					</c:when>
					<c:otherwise>	
						
						<li>
							<ul class = "member_depth">
								<span>		
        							<a href="/login/logout" onclick="return confirm('로그아웃 하시겠어요?')">
        								<img class="user_img" src='/upload/${user.profileimg }'>
        							</a>      							
        						</span>
							</ul>
						</li>
					</c:otherwise>
				</c:choose>	
			</div>
		</div>
	</div>
</div>
</header>



</html>