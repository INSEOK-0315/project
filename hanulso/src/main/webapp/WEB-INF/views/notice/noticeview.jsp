<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="sub_title">
	<h2>공지사항</h2>
	<%@ include file = "../map.jsp" %>
</div>

<div class="container">
   <div class="board_view">
      <h2>${view.title}</h2>
      <p class="info"><span class="user">${view.writer}</span> <fmt:formatDate value="${view.regdate }" pattern="yyyy-MM-dd"/> 
      <i class="fa fa-eye"></i> ${view.viewcount}</p>
      <div class="board_body">
         ${view.content}
      </div>
      <div class="prev_next">
      	<c:choose>
      		<c:when test = "${prevo.bno != null}">
      			<a href="noticeview.do?bno=${prevo.bno }" class="btn_prev"><i class="fa fa-angle-left"></i>
           <span class="prev_wrap">
              <strong>이전글</strong><span>${prevo.title }</span>
           </span>
           </a>
      		</c:when>
      		<c:otherwise>
      			<a class="btn_prev"><i class="fa fa-angle-left"></i>
           <span class="prev_wrap">
              <strong>이전글</strong><span>없음</span>
           </span>
           </a>
      		</c:otherwise>
      	</c:choose>
          <div class="btn_3wrap">
          	<a href="list?pageNum=${cri.pageNum }&amount=${cri.amount}" }>목록</a>
         	<a href="noticemodify?bno=${view.bno }&pageNum=${cri.pageNum }&amount=${cri.amount}" id="check">수정</a> 
            <a href="delete?bno=${view.bno }" id="checkdelete" onClick="return confirm('삭제하시겠어요?')">삭제</a>
          </div>	       
         <c:choose> 
         <c:when test ="${nextvo.bno != null }">
       		<a href="noticeview.do?bno=${nextvo.bno }" class="btn_next">
           	<span class="next_wrap">
              <strong>다음글</strong><span>${nextvo.title }</span>
           	</span>
           	<i class="fa fa-angle-right"></i>
           	</a>
       	</c:when>
       	<c:otherwise>
       		<a class="btn_next">
           		<span class="next_wrap">
             		 <strong>다음글</strong><span>없음</span>
           		</span>
           <i class="fa fa-angle-right"></i></a>
       	</c:otherwise>    
        </c:choose>
      </div>
   </div>
 </div> 
      

		

  
   <script>
		$("#check").on("click",function(){
			var user = "<c:out value='${user.id}'/>" //로그인한 유저의 아이디
			var writerid = "<c:out value='${view.writer}'/>" //글쓴이
			
			if(user == writerid){
				return true;
			}else{
				alert("글쓰기한 본인만 수정,삭제가 가능합니다");
				return false;
			}
			
		})
	</script>
	
	<script>
		$("#checkdelete").on("click",function(){
			var user = "<c:out value='${user.id}'/>" //로그인한 유저의 아이디
			var writerid = "<c:out value='${view.writer}'/>" //글쓴이
			
			if(user == writerid){
				return true;
			}else{
				alert("글쓰기한 본인만 수정,삭제가 가능합니다");
				return false;
			}
			
		})
	</script>

<%@ include file="../footer.jsp"%>