<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>

<div class="sub_title">
	<h2>게시물</h2>
		<%@ include file = "../map.jsp" %>
</div>

<div class="container">
  	<div class="write_wrap">
  		<h2 class="sr-only">게시물 글쓰기</h2>
  			<form name="post" method="post" enctype="multipart/form-data" action="writepro" onsubmit="return check()">
				<table class="bord_table">
					<caption class="sr-only">게시물 표</caption>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr class="first">
							<th>글쓴이</th>
							<td><input type="text" name="writer" value="${user.id}" readonly></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content"></textarea></td>
						</tr>
						<tr>
							<th>첨부</th>
							<td><input type="file" name="upload" onchange="imgCheck(this)"
							style="height: 26.3px;"></td>
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
		function check() {
			
			if(post.title.value=="") {
				alert("제목을 입력");
				post.title.focus();
				return false;
			}
			if(post.content.value=="") {
				alert("내용을 입력");
				post.contents.focus();
				return false;
			}
			if(post.imgurl.value==""){
				alert("이미지 파일 첨부");
				post.imgurl.focus();
				return false;
			}
			return true;
		}
	</script>
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
<%@ include file = "../footer.jsp"%>