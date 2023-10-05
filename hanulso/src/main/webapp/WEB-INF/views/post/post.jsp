<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file = "../header.jsp"%>

<div class="sub_title">
	<h2>게시물</h2>
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
				<form name="myform" method="get" action="/post/list">
				<%@ include file = "../search.jsp" %>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- search end -->
	  
<div class="container">
	<div class="post_list">
		<!-- <div class ="row"> -->
		<c:forEach var="list" items="${list }">
			<div class="subcontent-inner">
				<div class = "post_inner_img">	
					<div class="subimg">
						<img class="postimg" src="/upload/${list.imgurl }" alt="">
					</div>
				</div>	
				
				<div class="subcont">
					<c:set var="num" value="${tot-((pvo.cri.pageNum-1)*10) }"/>
						<h2>
							<strong>
								<a href="/post/view?bno=${list.bno }">${list.title}</a>
							</strong>
						</h2>					
						<span>${list.content }</span>
						
						<div class="post_lnfo">
							<span>day | <fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"/></span>
						</div>
							<a href= "#" onclick="imgDownload()" data-down="${list.imgurl }" id="download">Download</a>	
					<c:set var ="num" value="${num-1 }"/>
				</div>	
				
				<div class="post_count">
					<div class = "col-lg-6" style="padding-bottom:10px;">
						<i class="fas fa-eye"></i> | ${list.viewcount }	
					</div>
				</div>
			</div>
		</c:forEach>
	<!-- </div> -->
</div>

	<div class="paging">	
		<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<c:if test = "${!pvo.prev }">
				  	<li class="page-item"><a class="page-link" href="/post/list?pageNum=${pvo.startPage }&=amount=${pvo.cri.amount}">
				  	<i class="fa  fa-angle-double-left"></i></a>
				    <li class="page-item"><a class="page-link" href="/post/list?pageNum=${pvo.cri.pageNum-1 }&=amount=${pvo.cri.amount}">
				    <i class="fa  fa-angle-left"></i></a></li>
			    </c:if>
			    <c:forEach var="num" begin="${pvo.startPage }" end="${pvo.endPage }">
			    	<li class="page-item">
			    	<a class="page-link" 
			    	href="/post/list?pageNum=${num }&amount=${pvo.cri.amount}">${num }</a></li>
			    </c:forEach>
			    <c:if test = "${!pvo.next }">
				    <li class="page-item"><a class="page-link" href="/post/list?pageNum=${pvo.cri.pageNum+1 }&=amount=${pvo.cri.amount}">
				    <i class="fa fa-angle-right"></i></a></li>
				    <li class="page-item"><a class ="page-link" href="/post/list?pageNum=${pvo.endPage }&=amount=${pvo.cri.amount}">
				    <i class="fa  fa-angle-double-right"></i></a>
			    </c:if>
				  </ul>
				</nav>
			<a href="/post/write" class="btn_write" id="useronly">글쓰기</a>
		</div>		
	</div>

	<!-- end contents -->

	<script>
		function imgDownload(){
			var fileName = document.getElementById('download'); // ID이름이 down인 요소를 가지고온다.
			var downFile = fileName.dataset.down; //Data - 요소들 중에 이름이 down인 요소의 값을 가져옴 , downFile에 다운로드 받고자하는 경로 이름이 저장됨.

			location.href="/post/download?fileName="+encodeURIComponent(downFile);
		}
	</script>
	
	<script>
		$("#useronly").on("click",function(){
		var user = "<c:out value='${user}'/>" 
		
			if(user != ""){
				return true;
			}else{
				alert("로그인 한 사람만 글쓰기가 가능합니다");
				return false;
			}
			
		})
	</script>
	
	
	
<%@ include file = "../footer.jsp"%>