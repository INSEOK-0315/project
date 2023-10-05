<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file = "../header.jsp"%>

<div class="sub_title">
	<h2>회원정보</h2>
	<%@ include file = "../map.jsp" %>
</div>
<!-- container end -->

	  

<div class="member_list">
	<div class="container" style="width:390px;">
		<div class="subcontent-inner">
			<div class = "member_inner_img">	
				<div class="subimg">
					<img class="postimg" src="/upload/${view.profileimg }">
				</div>
			</div>	
			<div class="subcont">
				<div class="member_lnfo">
					<strong>${view.id } </strong>
				</div>
			</div>
		</div>

		<p class="btn_set">
        	<button type="button" class="btns btn_bdr2" onclick="location.href='/member/modify?bno=${view.bno}'">정보수정</button>
        	<button type="button" class="btns btn_bdr2" 
        		style="float:right; margin-left:5px;"
        		onclick="memberDelete()">회원탈퇴</button>
   	 	</p>
	</div>		
</div>

<script>
	function memberDelete(){
		if(confirm("탈퇴하시겠습니까?")){
			location.href="/member/delete?bno=${view.bno}";
			alert('탈퇴가 완료되었습니다!')
		}
	}
</script>		
	
<%@ include file = "../footer.jsp"%>