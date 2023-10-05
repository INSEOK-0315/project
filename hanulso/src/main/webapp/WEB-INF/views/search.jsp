<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<input type="hidden" name="pageNum" 
value="<c:out value="${pvo.cri.pageNum }"/>">
<input type="hidden" name="amount" 
	value="<c:out value="${pvo.cri.amount }"/>">
<select name="type" class="select">
	<option value=""
		<c:out value="${pvo.cri.type == null?'selected':'' }"/>
	>선택</option>
<option value="T"
	<c:out value="${pvo.cri.type eq 'T'?'selected':'' }"/>
	>제목</option>
<option value="C"
	<c:out value="${pvo.cri.type eq 'C'?'selected':'' }"/>
	>내용</option>
<option value="W"
	<c:out value="${pvo.cri.type eq 'W'?'selected':'' }"/>
		>작성자</option>
</select>
	<input type="text" name="keyword" class="search_word" value="<c:out value="${pvo.cri.keyword }"/>">
<button class="btn_search" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
</body>
</html>