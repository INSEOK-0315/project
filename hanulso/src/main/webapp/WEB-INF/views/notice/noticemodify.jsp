<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<div class="sub_title">
	<h2>공지사항</h2>
	<%@ include file = "../map.jsp" %>
</div>

	<div class="container">
	  <div class="write_wrap">
	  <h2 class="sr-only">공지사항 수정하기</h2>
	  <form name="notice" method="post" action="modifypro" onsubmit="return check()">
	  <input type = "hidden" name="bno" value="${view.bno}" >
		<table class="bord_table">
			<caption class="sr-only">공지사항 입력 표</caption>
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr class="first">
					<th>글쓴이</th>
					<td><input type="text" name="writer" value="${view.writer }" readonly></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${view.title }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content">${view.content}</textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="btn_wrap">
			<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;
			<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;
			<input type="button" value="목록" class="btn_list" onClick="location.href='/notice/list?pageNum=${cri.pageNum }&amount=${cri.amount}'">
		</div>
	</form>
 </div>
	  
	</div>
	<!-- end contents -->
	<script>
		function check() {
			if(notice.writer.value=="") {
				alert("글쓴이 입력");
				notice.writer.focus();
				return false;
			}
			if(notice.title.value=="") {
				alert("제목을 입력");
				notice.title.focus();
				return false;
			}
			if(notice.content.value=="") {
				alert("내용을 입력");
				notice.contents.focus();
				return false;
			}
			return true;
		}
	</script>
<%@ include file = "../footer.jsp" %>