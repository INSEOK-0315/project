<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>

<div class="sub_title">
	<h2>질문답변</h2>
	<%@ include file = "../map.jsp" %>
</div>

	<div class="container">
		<div class="board_view">
			<h2>[질문] ${view.title}</h2>
			<p class="info"><span class="user">${view.writer}</span> ${list.regdate}
			<i class="fa fa-eye"></i><fmt:formatDate value="${view.regdate }" pattern="yyyy-MM-dd"/></p>
			<c:if test="${view.state eq '1' }">
				<div class="board_body">
					<p>${view.content}</p>
					<p style="font-weight:bold">[답변]</p>
					<p>답변이 없습니다.</p>
				</div>
			</c:if>
			<c:if test="${view.state eq '2' }">
				<div class="board_body">
					<p>${view.content}</p>	
				</div>
				<div class="cm_list">
				
					<div>
						<p style="font-weight:bold; text-align:center; font-size:20px;">답변</p>
        				<p class = 'writer'>
        				<em>${aview.awriter }</em>
        				<span class = 'date'>${aview.aregdate }</span>
        				</p>
        				<div class = 'cont' style="padding: 0 0 0 40px;">
        				<div class ='txt_con'>${aview.acontent }</div>
        				</div>
        				<p class = 'func_btns'>
        				<button type='button' class='btn' id="ckanswer" onclick='openCommentUpdatePopup(${aview.rbno})'>
        				<span class ='icons icon_modify'>수정</span>
        				</button>
        				<button type='button' class='btn' id="ckdelete">
        					<span class ='icons icon_del'> 
        						<a href="/qa/replydelete?rbno=${aview.rbno}&qbno=${view.qbno}">삭제</a>
        					</span>
        					
        				</button>
        				</p>
       				</div>
       				
           		</div>
			</c:if>		
				<div style="padding:20px 0;">
					<form name ="reply" method="post" action = "/qa/qareply">
					<input type="hidden" name="qbno" value=${view.qbno }>
					<input type="hidden" name="awriter" value="${user.id}">
						<textarea name = "acontent"
						style = "width:89%; height:100px; vertical-align:top;padding:16px;"></textarea>
						<button type = "submit" style="width:10%;height:100px;">답변저장</button>	
					</form>
				</div>
			<div class="prev_next">
			<c:choose>
				<c:when test = "${prevo.qbno != null }">
					<a href="qaview?qbno=${prevo.qbno}" class="btn_prev">
					<i class="fa fa-angle-left"></i>
						<span class="prev_wrap">
							<strong>이전글</strong><span>${prevo.title }</span>
						</span>
					</a>
				</c:when>
				<c:otherwise>
					<a class="btn_prev">
					<i class="fa fa-angle-left"></i>
			            <span class="prev_wrap">
			               <strong>이전글</strong><span>없음</span>
			            </span>
		            </a>
				</c:otherwise>
			</c:choose>
				<div class="btn_3wrap">
					<a href="/qa/list?pageNum=${cri.pageNum }&amount=${cri.amount }">목록</a> 
					<a href="/qa/modify?qbno=${view.qbno}&pageNum=${cri.pageNum }&amount=${cri.amount }" id="check">수정</a> 
					<a href="/qa/delete?qbno=${view.qbno}" id="checkdelete" onClick="return confirm('삭제하시겠어요?')">삭제</a> 
				</div>	
			<c:choose>
				<c:when test = "${nextvo.qbno != null }">
					<a href="qaview?qbno=${nextvo.qbno}" class="btn_next">
					<i class="fa fa-angle-right"></i>
						<span class="prev_wrap">
							<strong>다음글</strong><span>${nextvo.title }</span>
						</span>
					</a>
				</c:when>
			<c:otherwise>
				<a class="btn_next">
				<i class="fa fa-angle-right"></i>
		            <span class="prev_wrap">
		               <strong>다음글</strong><span>없음</span>
		            </span>
	            </a>
			</c:otherwise>
			</c:choose>	
			</div>
		</div>
	</div>
	
	<!--/* 댓글 수정 popup */-->
	<div id="commentUpdatePopup" class="popLayer">
	    <h3>댓글 수정</h3>
	    <div class="pop_container">
	    <form id="answerReply" method="post" action="/qa/replymodifypro">
	    <input type="hidden" name="rbno" value="${aview.rbno }">
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
	                    <td><textarea id="modalContent" name="acontent" cols="90" rows="10" placeholder="수정할 내용을 입력해 주세요." style="border:none;"></textarea></td>
	                </tr>
	            </tbody>
	        </table>
	        <p class="btn_set">
	            <button type="submit" id="commentUpdateBtn">수정</button>
	            <button type="button" class="btns btn_bdr2" onclick="closeCommentUpdatePopup();">취소</button>
	        </p>
	     </form>   
	        
	    </div>
	    <button type="button" class="btn_close" onclick="closeCommentUpdatePopup();"><span><i class="far fa-times-circle"></i></span></button>
	</div>




<script>
	function openCommentUpdatePopup(rbno){
		
		var writer = "<c:out value='${aview.awriter}'/>"
		var acontent = "<c:out value='${aview.acontent}'/>"
               document.getElementById('modalWriter').value = writer;
               document.getElementById('modalContent').value = acontent;
               layerPop('commentUpdatePopup');

	}
	
	function closeCommentUpdatePopup() {
        document.querySelectorAll('.modalContent, .modalWriter');
        document.getElementById('commentUpdateBtn').removeAttribute('onclick');
        layerPopClose('commentUpdatePopup');
     }

</script>



<script>
	$("#check").on("click",function(){
		var user = "<c:out value='${user.id}'/>" //로그인한 유저의 아이디
		var writerid = "<c:out value='${view.writer}'/>" //글쓴이
		
		alert(user);
		alert(writerid);
		//자바스크립트변수에다 자바 변수userid를 담기.
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
		
		alert(user);
		alert(writerid);
		//자바스크립트변수에다 자바 변수userid를 담기.
		if(user == writerid){
			return true;
		}else{
			alert("글쓰기한 본인만 수정,삭제가 가능합니다");
			return false;
		}
		
	})
	
	$("#ckanswer").on("click",function(){
		var user = "<c:out value='${user.id}'/>" //로그인한 유저의 아이디
		var writerid = "<c:out value='${aview.awriter}'/>" //글쓴이
		
		alert(user);
		alert(writerid);
		//자바스크립트변수에다 자바 변수userid를 담기.
		if(user == writerid){
			return true;
		}else{
			alert("글쓰기한 본인만 수정,삭제가 가능합니다");
			return false;
		}
		
	})

	$("#ckdelete").on("click",function(){
		var user = "<c:out value='${user.id}'/>" //로그인한 유저의 아이디
		var writerid = "<c:out value='${aview.awriter}'/>" //글쓴이
		
		alert(user);
		alert(writerid);
		//자바스크립트변수에다 자바 변수userid를 담기.
		if(user == writerid){
			return true;
		}else{
			alert("글쓰기한 본인만 수정,삭제가 가능합니다");
			return false;
		}
		
	})
</script>

<%@ include file = "../footer.jsp" %>