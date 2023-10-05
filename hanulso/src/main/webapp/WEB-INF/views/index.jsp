<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLOG PROJECT</title>
</head>
<%@ include file="header.jsp" %>
<body>
	<section id="main_visual">
		<div class="visual_wrap">
			<h2 class="sr-only">메인 비쥬얼</h2>
			<ul>
				<li><img src="resources/images/바리스타.jpg" class="w100"></li>
				<li class="one"></li>
			</ul>
			<div class="visual_inner">
				<p class="title">
				<strong  style="font-size: 25px;">BLOG</strong><br/>
				<strong>PORTFOLIO</strong> </p>
			</div>
		</div>
	</section>
	
</body>

<script>
	
	var user = "<c:out value='${user.id}'/>"
	
	if(${msg == 'success'}){
		alert(user+"님 환영합니다!");
	}
	
</script>
<%-- <%@ include file ="footer.jsp" %> --%>
</html>