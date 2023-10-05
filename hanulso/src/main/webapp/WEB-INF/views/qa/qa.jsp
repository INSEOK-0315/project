<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>

<!-- sub contents -->
<div class="sub_title">
	<h2>질문과답변</h2>
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
				<form name="myform" method="get" action="/qa/list"><!-- get방식으로 요청 -->
				<%@ include file = "../search.jsp" %>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- search end -->
<div class="container">
  <div class="notice_list">
	<table class="notice_table">
		<caption class="sr-only">질문과 답변 리스트</caption>
		<colgroup>
			<col width="10%">
			<col width="*">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>답변상태</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:set var ="num" value="${pvo.total - ((pvo.cri.pageNum-1)*10) }"/>
		<c:forEach var = "list" items ="${list }">
			<tr>
				<td>${num }</td>
				<td class="title"><a href="qaview?qbno=${list.qbno }&pageNum=${pvo.cri.pageNum}
					&amount=${pvo.cri.amount}">${list.title}</a></td>
				
				<c:choose>
				<c:when test="${list.state eq 1}">
					<td><span class = "waiting">답변대기</span></td>
				</c:when>
				<c:otherwise>
					<td><span class = "complete">답변완료</span></td>
				</c:otherwise>
				</c:choose>
								
				<td>${list.writer }</td>
				<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"/></td>
				<td>${list.viewcount }</td>
			</tr>
			<c:set var="num" value="${num-1}"/>
		</c:forEach>	
		</tbody>
	</table>
  </div>
  
  <div class= "paging">
		<nav aria-label="Page navigation">
		  <ul class="pagination">
		  	<c:if test = "${!pvo.prev}">
		  		<li class="page-item"><a class="page-link" href="/qa/list?pageNum=${pvo.startPage }&amount=${pvo.cri.amount }">
		  		<i class="fa  fa-angle-double-left"></i></a>
		  		<li class="page-item"><a class="page-link" href="/qa/list?pageNum=${pvo.cri.pageNum-1 }&amount=${pvo.cri.amount }">
		  		<i class="fa  fa-angle-left"></i></a></li>
		  	</c:if>
		  	<c:forEach var="num" begin="${pvo.startPage }" end="${pvo.endPage }">
		    	<li class="page-item">
		    	<a class="page-link" href="/qa/list?pageNum=${num }&amount=${pvo.cri.amount}">
		    	${num }</a></li>
		    </c:forEach>	
		    <c:if test = "${!pvo.next }">
		    	<li class="page-item"><a class="page-link" href="/qa/list?pageNum=${pvo.cri.pageNum+1 }&amount=${pvo.cri.amount }">
		    	<i class="fa fa-angle-right"></i></a></li>
		    	<li class="page-item"><a class ="page-link" href="/qa/list?pageNum=${pvo.endPage }&amount=${pvo.cri.amount}">
		    	<i class="fa  fa-angle-double-right"></i></a>
		    </c:if>
		  </ul>
		</nav>
		<a href="/qa/write" class="btn_write" id="useronly">글쓰기</a>
	</div>
	
</div>
<!-- end contents -->

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

<%@ include file = "../footer.jsp" %>