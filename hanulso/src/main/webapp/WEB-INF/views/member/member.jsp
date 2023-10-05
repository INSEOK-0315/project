<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>


<!-- sub contents -->
<div class="sub_title">
	<h2>회원가입</h2>
	<%@ include file = "../map.jsp" %>
</div>
<!-- container end -->


<form name="member" id="member" method="post" enctype="multipart/form-data" action="/member/memberinsert">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<div class="container">
		<div class="con_title">
	       <h1>내정보(개인회원)</h1>
	       <p>HOME / 마이페이지 / 내정보(개인회원)</p>
	       </div>
		<div class="join_write col_989">
		
		        <div class="list_con">
		            <ul class="icon_type1">
		                <li>회원정보는 개인정보 취급방침에 따라 안전하게 보호되며 회원님의 명백한 동의 없이 공개 또는 제3자에게 제공되지 않습니다.</li>
		            </ul>
		        </div>
		    
		    <table class="table_write02" summary="회원가입을 위한 이름, 아이디, 비밀번호, 비밀번호확인, 소속, 유선전화번호, 휴대전화번호, 이메일, 주소, 본인확인질문, 본인확인답, 주활용사이트, 알림여부 정보 입력">
		        <caption>회원가입을 위한 정보입력표</caption>
		        <colgroup>
		            <col width="160px">
		            <col width="auto">
		        </colgroup>
		        <tbody id="joinDataBody">
		            <tr>
		                <th><label for="name">이름</label></th>
		                <td>
		                    <input type="text" name="name" id="name" class="w300"><br>
		                    <span id="namemsg" style="color:#f00;"></span>
		                </td>
		            </tr>
		            <tr>
		                <th><label for="id">아이디<span class="must"><b>필수입력</b></span></label></th>
		                <td>
		                    <input type="text" name="id" id="id" class="w300"><br>
		                    <span id="idmsg" style="color:#f00;"></span>
		                </td>
		            </tr>
		            <tr>
		                <th><label for="nickname">닉네임<span class="must"><b></b></span></label></th>
		                <td>
		                    <input type="text" name="nickname" id="nickname" class="w300"><br>
		                    <span id="nicknamemsg" style="color:#f00;"></span>
		                </td>
		            </tr>
		            <tr>
		                <th><label for="pw1">비밀번호</label></th>
		                <td>
		                    <input type="password" name="pw" id="pw1" class="w300">
		                    <p class="guideTxt"><span class="tc_point">영문(대문자 구분), 숫자, 특수문자의 조합</span>으로 9~13자로 작성해 주십시오.</p><br>
		                    <span id="pwmsg" style="color:#f00;"></span>
		                </td>
		            </tr>
		            <tr>
		                <th><label for="pw2">비밀번호확인</label></th>
		                <td>
		                    <input type="password" name="pw2" id="pw2" class="w300">
		                    
		                    <span id="pwmsg" style="color:#f00;"></span>
		                   </td>
		               </tr>
					<tr>
		                   <th><label for="tel">전화번호<span class="must"><b>필수입력</b></span></label></th>
		                   <td>
		                       <input type="text" name="tel" id="tell" class="w300"><br>
		                       <span id="telmsg" style="color:#f00;"></span>
		                </td>
		            </tr>
		            <tr>
		                <th><label for="profileimg">이미지파일<span class="must"></span></label></th>
		                <td>
		                    <input type="file" name="upload" class="w300" onchange="imgCheck(this)"><br><!-- -->
		                </td>
		            </tr>
		            <tr>
		                <th><label for="email">이메일<span class="must"><b>필수입력</b></span></label></th>
		                <td>
		                    <input type="email" name="email" id="email" class="w300">
		                    <input type="button" id="btn_email" class="btn btn_gray" value="인증번호전송" style="width:25%;">
								<span id="emailmsg" style="color:#f00;"></span>      
		                </td>
		            </tr>
		            <tr>
		            	<th><label for="certinumber">인증번호<span class="must"><b>필수입력</b></span></label></th>
		            		<td>
		             		<input type="password" name="certinumber" class="w300" id="certinumber" placeholder="인증번호입력">
		                    	<input type="button" id="email_ok" class="btn btn_gray" value="인증번호" style="width:25%;">
		                    	<span id="certinumberemsg" style="color:#f00;"></span>
		            		</td>	
		            </tr>   
	    	</table>
	    <div class="btnArea Acenter pt60 pb100">
			<a href="javascript:history.go(-1);" class="btn_round btn_large btn_BlueGray w180"><b>취소</b></a>
			<a href="javascript:fn_save();" class="btn_round btn_large btn_pointColor w180"><b>확인</b></a>
		</div>	

	</div>
</div>
<!-- end contents -->

</form>

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
	
<script type = "text/javascript">
//json, jquery를 이용한 유효성 검사
	$(function(){
		
		//이름 유효성 검사
		$("#name").blur(function(){
			if(!$("#name").val()){
				$("#namemsg").html("이름을 입력하세요");
				$("#name").focus();
				return;
			}else{
				$("#namemsg").html("");
			}
		
		})
		
		//id 유효성검사
		$("#id").blur(function(){
			
			var id = $("#id").val();
			
			if(!$("#id").val()){
				$("#idmsg").html("아이디를 입력하세요");
				$("#id").focus();
				return;
			}else{
				$("#idmsg").html("");
			}
			//비동기식 아이디 중복확인 검사
			$.ajax({
				type:'post',
				url:'/member/idcheck',
				data:JSON.stringify({id:$("#id").val()}),
					dataType:'json',
				contentType:'application/json; charset=UTF-8',
				success:function(data){
					console.log(data);
					
					if(data==1){
						$("#idmsg").html("이미 사용중인 아이디 입니다.");
						return false;
					}else{
						$("#idmsg").html("사용가능한 아이디 입니다.");			
					}
				},error:function(xhr,status,error){
					alert("에러");
				}
			})
		})
		
		//비동기식 닉네임 중복검사
		$("#nickname").blur(function(){
			
			if(!$("#nickname").val()){
				$("#nickname").html("닉네임을 입력하세요");
				$("#nickname").focus();
				return;
			}else{
				$("#nicknamemsg").html("");
			}
			$.ajax({
				type:'post',
				url:'/member/nicknamecheck',
				data:JSON.stringify({nickname:$("#nickname").val()}),
				dataType:'json',
				contentType:'application/json; charset=UTF-8',
				success:function(data){
					console.log(data);
					
					if(data==1){
						$("#nicknamemsg").html("이미 사용중인 닉네임 입니다.");
						return false;
					}else{
						$("#nicknamemsg").html("사용 가능한 닉네임 입니다.");
					}
				},error:function(xhr,status,error){
						alert("에러");
					}
				})
			})	
		
		//비밀번호
		$("#pw2").blur(function(){
			if($("#pw1").val()=="" || $("#pw2").val()==""){
				$("#pwmsg").html("비밀번호를 입력하세요.");
				return;
			}else{
				$("#pwmsg").html("사용가능한 비밀번호 입니다.");
			}
			if($("#pw1").val()!=$("#pw2").val()){
				$("#pwmsg").html("비밀번호가 일치하지 않습니다.");
				return;
			}else{
				$("#pwmsg").html("비밀번호 확인이 완료되었습니다.");
			}
		})
		//이메일 인증번호 전송
		$("#btn_email").on("click",function(){
			var email = $("#email").val();
			if(email == ""){
				alert("이메일 주소를 입력 하세요.");
				$("#email").focus();
			}else{
				$.ajax({
					type:'post',
					url:'/member/sendemail',
					data:{'email':$("#email").val()},//보내는 데이터
					dataType:'json',
					success:function(data){
						alert(data.mssg);
						alert("인증메일을 발송했습니다. 메일함을 확인해주세요");
					},error:function(){//통신이 실패 했을 때
						alert("통신실패");
						return;
					}
				})
			}
		})
		
	})

	//이메일 확인
	$("#email_ok").on("click",function(){
		var certinumber = $("#certinumber").val();
		if(certinumber == ""){
			alert("인증번호를 입력 하세요");
			$("#certinumber").focus();
			return;
		}else{
			$.ajax({
				type:'post',
				data:{"certinumber":certinumber},
				url:"/member/certiNumberCheck",
				dataType:"json",
				success:function(data){
					if(data.check=="no"){
						alert(data.msg);
						
						return;
					}else{
						alert(data.msg);
						
					}
				},error:function(){
					alert("통신실패");
				}
			})
		}
	})
</script>
<script>
	function fn_save(){
		if($("#id").val()!="" && $("#name").val()!="" && $("#pw1").val()!="" && $("#pw2").val()!="" && $("certinumber").val()!="" ){
			$("#member").submit();
		}else{
			alert("회원가입 필수 요소는 반드시 입력해야 합니다.");
			return false;
		}
	}
</script>


<%@ include file = "../footer.jsp"%>