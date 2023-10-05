<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%@ include file ="../header.jsp"%>

<!-- sub contents -->
<div class="sub_title">
	<h2>접속자 로그인</h2>
	<%@ include file = "../map.jsp" %>
</div>
<!-- container end -->

<div class="container">
	<div class="login_box">
       	<div class="login_form">
	        <form name="Login" id ="Login">
		         <div class="login_text">
		          	<input name="id" id="id" type="text" placeholder="ID">
		         </div>
		         <div class="login_text">
		          	<input name="pw" id="pw" type="password" placeholder="PassWord">
		         </div>  	
	        </form> 
       	</div>
       	<p class="btn_set">
        	<button type="button" class="btns btn_bdr2" onclick="fn_login()">로그인</button>
        	<button type="button" class="btns btn_bdr2" 
        		style="float:right; margin-left:5px;"
        		onclick="location.href='/member/member'">회원가입</button>
        	<c:if test = "${msg=='fail'}">
	    		<div style ='color:red'>
	    			아이디 또는 비밀 번호를 확인해주세요.
	    		</div>
	    	</c:if>
	    </p>   
   	</div>
</div>
<!-- end contents -->
	
	<script>
		function fn_login(){
			if(Login.id.value==""){
				alert("아이디를 입력 하세요");
				frmLogin.id.focus();
				return false;
			}
			if(Login.pw.value==""){
				alert("비밀번호를 입력하세요");
				frmLogin.pw.focus();
				return false;
			}
			
 			var form = document.Login;
			form.method="post";
			form.action="/login/loginpro";
			form.submit(); 
		}
	</script>
	

<%@ include file ="../footer.jsp"%>