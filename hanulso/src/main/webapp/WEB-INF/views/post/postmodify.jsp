<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>

<div class="sub_title">
	<h2>게시물</h2>
		<%@ include file = "../map.jsp" %>
</div>

<div class="container">
	<div class="write_wrap">
  		<h2 class="sr-only">포트폴리오 수정</h2>
	  		<form name="portfolio" method="post" enctype="multipart/form-data" action="modifypro" onsubmit="return check()">
			  <input type = "hidden" name="bno" value="${view.bno}" >
					<table class="bord_table">
						<caption class="sr-only">포트폴리오 입력 표</caption>
						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tbody>
							
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" value="${view.title }"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" >${view.content}</textarea></td>
							</tr>
							<tr>
								<th>첨부</th>
								<td><input type="file" name="upload" onchange="imgCheck(this)"
								style="height: 26.3px;  background:#fff;"></td>
							</tr>
						</tbody>
					</table>
			<div class="btn_wrap">
				<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;
				<input type="button" value="목록" class="btn_list" onClick="location.href='/post/list';">
			</div>
			</form>
 	</div>
</div>
<!-- end contents -->
<script>
	function imgCheck(obj){
		var fileKind = obj.value.lastIndexOf('.');
		var fileName = obj.value.substring(fileKind+1, obj.length)
		var fileType = fileName.toLowerCase();
		
		var CheckFileType = new Array();
		
		CheckFileType = ['jpg','gif','png','jpeg']
		if(CheckFileType.indexOf(fileType)==-1){
			alert("이미지파일만 첨부");
			post.imgurl.value='';
			return false;
		}
		
	}
</script>

<script>
	function check() {
		
		if(portfolio.title.value=="") {
			alert("제목을 입력");
			portfolio.title.focus();
			return false;
		}
		if(portfolio.content.value=="") {
			alert("내용을 입력");
			portfolio.contents.focus();
			return false;
		}
		return true;
	}
</script>

<%@ include file = "../footer.jsp" %>	