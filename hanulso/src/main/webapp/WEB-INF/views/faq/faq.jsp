<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file = "../header.jsp"%>

<div class="sub_title">
	<h2>자주하는 질문(FAQ)</h2>
	<%@ include file = "../map.jsp" %>
</div>
<!-- container end -->
<div class = "Searchbox">
	<div class="container">
		<div class="search_wrap">
			<div class="record_group">
				<p>총게시글<span>${pvo.total}</span>건</p>
			</div>
			<div class="search_group">
				<form name="myform" method="get" action="/faq/list">
				<%@ include file = "../search.jsp" %>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- search end -->


<div class ="container">  
	<div class="bord_list">
		<div class="faq-group">
				<c:set var = "num" value = "${pvo.total -((pvo.cri.pageNum-1)*10)}"/>
					<c:forEach var="list" items="${list }">

						<button class="accordion">
								${list.title }
						</button>
						<div class="panel">
								<p>${list.content }</p>
						</div>	
					</c:forEach>
				<c:set var = "num" value="${num-1 }"/>	
		</div>
	
	<div class= "paging">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<c:if test = "${!pvo.prev}">
			  		<li class="page-item"><a class="page-link" href="/faq/list?pageNum=${pvo.startPage }&amount=${pvo.cri.amount }">
			  		<i class="fa  fa-angle-double-left"></i></a>
			  		<li class="page-item"><a class="page-link" href="/faq/list?pageNum=${pvo.cri.pageNum-1 }&amount=${pvo.cri.amount }">
			  		<i class="fa  fa-angle-left"></i></a></li>
			  	</c:if>
			  	<c:forEach var="num" begin="${pvo.startPage }" end="${pvo.endPage }">
			    	<li class="page-item">
			    	<a class="page-link" href="/faq/list?pageNum=${num }&amount=${pvo.cri.amount}">
			    	${num }</a></li>
			    </c:forEach>	
			    <c:if test = "${!pvo.next }">
			    	<li class="page-item"><a class="page-link" href="/faq/list?pageNum=${pvo.cri.pageNum+1 }&amount=${pvo.cri.amount }">
			    	<i class="fa fa-angle-right"></i></a></li>
			    	<li class="page-item"><a class ="page-link" href="/faq/list?pageNum=${pvo.endPage }&amount=${pvo.cri.amount}">
			    	<i class="fa  fa-angle-double-right"></i></a>
			    </c:if>
			  </ul>
			</nav>
			<a href="/faq/write" class="btn_write" id="adminonly">글쓰기</a>
		</div>
	</div>
</div>
	<!-- end contents -->
	<script>
		$(function() {
			$(".accordion").on("click",function() {
				$(".panel").not($(this).next().slideToggle()).slideUp();
				$(".accordion").not($(this)).removeClass("active");
				$(this).toggleClass("active");
			});
		});
	</script>
	
	<script>
		$("#adminonly").on("click",function(){
		var user = "<c:out value='${user.id}'/>" 
			if(user == "ADMIN"){
				return true;
			}else{
				alert("관리자만 글쓰기가 가능합니다");
				return false;
			}
			
		})
	</script>

<%@ include file = "../footer.jsp"%>