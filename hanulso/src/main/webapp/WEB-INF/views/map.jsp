<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="HeadContainer">
  <div class="location">
	<ul>
		<li class="btn_home">
			<a href="/"><i class="fa fa-home btn_plus"></i></a>
		</li>
		<li class="dropdown">
			<a href="">커뮤니티<i class="fa fa-plus btn_plus"></i></a>
			<div class="dropdown_menu">
				<a href="/notice/list">공지사항</a>
				<a href="/post/list">게시글</a>
				<a href="/qa/list">질문과답변</a>
				<a href="/faq/list">FAQ</a>
			</div>
		</li>
		<c:choose>
			<c:when test="${empty user }">
				<li class="dropdown">
				<a href="">회원가입<i class="fa fa-plus btn_plus"></i></a>
				<div class="dropdown_menu">
					<a href="/member/member">회원가입</a>
					<a href="/login/login">로그인</a>
				</div>	
				</li>
			</c:when>
			<c:otherwise>
				<li class="dropdown">
				<a href="">내정보<i class="fa fa-plus btn_plus"></i></a>
				<div class="dropdown_menu">
					<a href="/login/logout">로그아웃</a>
					<a href="/member/view?bno=${user.bno }">마이페이지</a>
				</div>	
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
  </div>
</div>


<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
		});
</script>

</body>
</html>