<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>

<div class="sub_title">
	<h2>게시물</h2>
		<%@ include file = "../map.jsp" %>
</div>

<div class="container">
	<div class="board_view">
		<h2>${view.title}</h2>
		<p class="info">
			<span class="user">${view.writer }</span>
			<fmt:formatDate value="${view.regdate }" pattern="yyyy-MM-dd"/>	
		</p>
		<p class="info">
			<i class="fa fa-eye">${view.viewcount}</i>
		</p>	
		<div class="board_body">
			<img src="/upload/${view.imgurl }" alt="">
			${view.content }
		</div>
		<div class="prev_next">
      	<c:choose>
      		<c:when test = "${prevo.bno != null}">
      			<a href="view.do?bno=${prevo.bno }" class="btn_prev"><i class="fa fa-angle-left"></i>
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
				<a href="list?pageNum=${cri.pageNum }&amount=${cri.amount}">목록</a> 
				<a href="modify?bno=${view.bno}&pageNum=${cri.pageNum }&amount=${cri.amount}" id="check">수정</a> 
				<a href="delete?bno=${view.bno }" id='checkdelete' onClick="return confirm('삭제하시겠어요?')">삭제</a>
			</div>
		<c:choose> 
	        <c:when test ="${nextvo.bno != null }">
	       	<a href="view.do?bno=${nextvo.bno }" class="btn_next">
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
<!-- end contents -->
	<!--/* 댓글 작성 */-->
		<div class="container">	
         <div class="cm_write">
             <fieldset>
                 <legend class="skipinfo">댓글 입력</legend>
                 <div class="cm_input">
                     <p><textarea id="content" name="content" cols="90" rows="4" placeholder="댓글을 입력해 주세요."></textarea></p><!-- onkeyup="countingLength(this);"  -->
                     <span><button type="button" class="btns" onclick="saveComment();">등 록</button></span>
                 </div>
             </fieldset>
         </div>
         <!-- 댓글 랜더링 영역 -->
            <div class="cm_list">
              
            </div>
            <!-- 페이지네이션 렌더링 영역  -->
       	 <div class = "paging">
       	 
       	 </div>	
		 <!--/* .content */-->
         
        </div> 
         
        
	<!--/* 댓글 수정 popup */-->
	<div id="commentUpdatePopup" class="popLayer">
	    <h3>댓글 수정</h3>
	    <div class="pop_container">
	        <table class="tb tb_row tl">
	            <colgroup>
	                <col style="width:30%;" /><col style="width:70%;" />
	            </colgroup>
	            <tbody>
	                <tr>
	                    <th scope="row">작성자<span class="es">필수 입력</span></th>
	                    <td><input type="text" id="modalWriter" name="modalWriter" placeholder="작성자를 입력해 주세요." style="border:none;" readonly/></td>
	                </tr>
	                <tr>
	                    <th scope="row">내용<span class="es">필수 입력</span></th>
	                    <td><textarea id="modalContent" name="modalContent" cols="90" rows="10" placeholder="수정할 내용을 입력해 주세요." style="border:none;"></textarea></td>
	                </tr>
	            </tbody>
	        </table>
	        <p class="btn_set">
	            <button type="button" id="commentUpdateBtn" onclick="UpdateReply(rbno)">수정</button>
	            <button type="button" class="btns btn_bdr2" onclick="closeCommentUpdatePopup();">취소</button>
	        </p>
	    </div>
	    <button type="button" class="btn_close" onclick="closeCommentUpdatePopup();"><span><i class="far fa-times-circle"></i></span></button>
	</div>
	<!-- reply end -->
	<script>
		$(document).ready(function(){
			replylist();
		});
	</script>
	
	<script>
		
	</script>
	
	
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

	$("#checkdelete").on("click",function(){
		var user = "<c:out value='${user.id}'/>" //로그인한 유저의 아이디
		var writerid = "<c:out value='${view.writer}'/>" //글쓴이
		
		if(user == writerid){

			var fileName = document.getElementById('checkdelete');
			var imgurl = fileName.dataset.down;

			location.href="/post/delete?bno="+${view.bno}+"&imgurl="+encodeURIComponent(imgurl);
			
		}else{
			alert("글쓰기한 본인만 수정,삭제가 가능합니다");
			return false;
		}
		
	})

	$("#ckdelete").on("click",function(){
		var user = "<c:out value='${user.id}'/>" //로그인한 유저의 아이디
		var writerid = "<c:out value='${view.writer}'/>" //글쓴이
		var id = ('.cm_list > div .writer em').val()
		


		if(user == writerid){
	
			return true;
		}else{
			alert("글쓰기한 본인만 수정,삭제가 가능합니다");
			return false;
		}
		
	})
	
</script>
	
	
	
<!-- 댓글 -->

<!-- 댓글 저장 -->
<script>
	function saveComment(){

		var user = "<c:out value='${user.id}'/>" //로그인한 유저의 아이디
		
		var bno = '${view.bno}'
		var content = $('textarea[name=content]').val()
		var writer = '${user.id}'
		

			if(user!=""){
				$.ajax({
					url:'/reply/replyinsert',
					dataType:'json',
					contentType:'application/json; charset=utf-8',
					type:'post',
					data:JSON.stringify({
						bno:bno,
						content:content,
						writer:writer,
					}),
					success:function(data){
						alert('댓글등록성공')
						replylist();
					},error:function(error){
						alert(error)
					}
				})
				
			}else{
				alert("로그인한 사람만 댓글 등록이 가능합니다.");
				return false;
			}
		
	}
	
</script>
	
<!-- 댓글 리스트 -->	
<script>
	function replylist(){
		
		var bno = '${view.bno}'
		
		$.ajax({
			url:"/reply/replylist/"+bno,
			type:"get",
			dataType:"json",
			success:function(data){
				var list = data.rlist;
				var result = "";
				
				if(!list.length){
					document.querySelector('.cm_list').innerHTML = 
						'<div class="cm_none"><p>등록된 댓글이 없습니다</p></div>';
						return false;
				}
				
				for(var i=0; i<list.length; i++){
					result += "<meta charset = 'utf-8'>" 
						+	"<div>"
        				+	"<p class = 'writer'>"
        				+	"<em>"+list[i].writer+"</em>"
        				+	"<span class = 'date'>"+list[i].regdate+"</span>"
        				+	"</p>"
        				+	"<div class = 'cont'>"
        				+	"<div class ='txt_con'>"+list[i].content+"</div>"
        				+	"</div>"
        				+	"<p class = 'func_btns'>"
        				+	"<button type='button' class='btn' id='ckanswer'onclick='openCommentUpdatePopup("+list[i].rbno+")'>"
        				+	"<span class ='icons icon_modify'>수정</span>"
        				+	"</button>"
        				+	"<button type='button' id='ckdelete' class='btn'>"
        				+	"<span class ='icons icon_del' onclick='deleteComment("+list[i].rbno+")'>삭제</span>"
        				+	"</button>"
        				+	"</p>"
        				+	"</div>";
 
				}
				$('.cm_list').html(result);
			},error:function(){
				alert('댓글을 가져올 수 없습니다.')
			}
		})
	}
	
</script>

<!-- 댓글 수정 모달창 -->
<script>
	function openCommentUpdatePopup(rbno){
		
		var user = "<c:out value='${user.id}'/>" //로그인한 유저의 아이디
			
       	$.ajax({
              url:'/reply/replyview/'+rbno,
              dataType:'json',
			  contentType:'application/json',
			  type:'get',
              success:function(response) {
            	 
            	  if(user == response.writer){
            		  document.getElementById('modalWriter').value = response.writer;
                      document.getElementById('modalContent').value = response.content;
                      document.getElementById('commentUpdateBtn').setAttribute('onclick','UpdateReply('+rbno+')');
                      layerPop('commentUpdatePopup');
                      
          		  }else{
          			alert("글쓰기한 본인만 수정,삭제가 가능합니다");
          			return false;
          		}   	  
                 
              },error:function(request,status,error) {
                 console.log(error);
              }
           })
          
	}
	
	function closeCommentUpdatePopup() {
        document.querySelectorAll('.modalContent, .modalWriter');
        document.getElementById('commentUpdateBtn').removeAttribute('onclick');
        layerPopClose('commentUpdatePopup');
     }

</script>

<!-- 댓글 수정 -->
<script>
	function UpdateReply(rbno){
		var bno = '${view.bno}' 
		var content = $('textarea[name=modalContent]').val()
		
			$.ajax({
				url:'/reply/replyupdatepro/'+rbno,
				dataType:'json',
				contentType:'application/json',
				type:'post',
				data:JSON.stringify({
					bno:bno,
					rbno:rbno,
					content:content,
					
				}),
				success:function(data){
					alert('댓글수정성공')
					closeCommentUpdatePopup();
					replylist();
				}
			})

	}
</script>


<!-- 댓글 삭제 -->
<script>
	function deleteComment(rbno){
			
			$.ajax({
				url:"/reply/replydelete/" + rbno,
				type:"post",
				dataType : "text",
				success : function(data){ 
					alert('댓글이 삭제 되었습니다');	
					replylist();
				},error : function(data){
					console.log(data);
				}
			})
			
			
		}

</script>





<%@ include file = "../footer.jsp"%>