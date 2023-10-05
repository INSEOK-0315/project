<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>

<!-- sub contents -->
<div class="sub_title">
	<h2>자주하는 질문(FAQ)</h2>
	<%@ include file = "../map.jsp" %>
</div>

	<div class="container">
	  <div class="write_wrap">
	  <h2 class="sr-only">글쓰기</h2>
	  <form name="faq" method="post" action="/faq/writepro" onsubmit="return check()">
			<table class="bord_table">
				<caption class="sr-only">자주하는 질문 입력 표</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					
					<tr>
						<th>질문</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content"></textarea></td>
					</tr>
					
				</tbody>
			</table>
			<div class="btn_wrap">
				<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;
				<input type="button" value="목록" class="btn_list" onClick="location.href='/faq/list';">
			</div>
		</form>
	  </div>
	  
	</div>
	<!-- end contents -->
	

<%@ include file = "../footer.jsp"%>