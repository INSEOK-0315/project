<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="sub_title">
	<h2>공지사항</h2>
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
				<form name="myform" method="get" action="/notice/list">
					<%@ include file = "../search.jsp" %>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- search end -->

		  
<div class ="container">	
	<div class="notice_list">
		<table class="notice_table">
			<caption class="sr-only"></caption>
			<colgroup>
				<col width="10%">
				<col width="*" >
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:set var = "num" value = "${pvo.total -((pvo.cri.pageNum-1)*10)}"/>
			<c:forEach var="list" items="${list }">
				<tr>
					<td>${num}</td>
					<td class="title"><a href="noticeview?bno=${list.bno}&pageNum=${pvo.cri.pageNum}
					&amount=${pvo.cri.amount}">${list.title}</a></td>
					<td>${list.writer }</td>
					<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"/></td>
					<td>${list.viewcount }</td>
				</tr>
			<c:set var = "num" value="${num-1 }"/>
			</c:forEach>	
			</tbody>	
		</table>
	</div>
	
	<div class= "paging">
		<nav aria-label="Page navigation">
		  <ul class="pagination">
		  	<c:if test = "${!pvo.prev}">
		  		<li class="page-item"><a class="page-link" href="/notice/list?pageNum=${pvo.startPage }&amount=${pvo.cri.amount }">
		  		<i class="fa  fa-angle-double-left"></i></a>
		  		<li class="page-item"><a class="page-link" href="/notice/list?pageNum=${pvo.cri.pageNum-1 }&amount=${pvo.cri.amount }">
		  		<i class="fa  fa-angle-left"></i></a></li>
		  	</c:if>
		  	<c:forEach var="num" begin="${pvo.startPage }" end="${pvo.endPage }">
		    	<li class="page-item">
		    	<a class="page-link" href="/notice/list?pageNum=${num }&amount=${pvo.cri.amount}&keyword=${pvo.cri.keyword}">
		    	${num }</a></li>
		    </c:forEach>	
		    <c:if test = "${!pvo.next }">
		    	<li class="page-item"><a class="page-link" href="/notice/list?pageNum=${pvo.cri.pageNum+1 }&amount=${pvo.cri.amount }">
		    	<i class="fa fa-angle-right"></i></a></li>
		    	<li class="page-item"><a class ="page-link" href="/notice/list?pageNum=${pvo.endPage }&amount=${pvo.cri.amount}">
		    	<i class="fa  fa-angle-double-right"></i></a>
		    </c:if>
		  </ul>
		</nav>
		<a href="/notice/write" class="btn_write" id="adminonly" >글쓰기</a>
	</div>
</div>
	<!-- end contents -->
	
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
	
	<script>
		var result = "<c:out value='${result}'/>";
		
		if(parseInt(result)>0){
			alert('게시글이 등록 되었습니다');
		}
		
		if(result == "success"){
			alert("처리가 완료되엇습니다");
		}
			
	</script>
	

<%@ include file="../footer.jsp"%>