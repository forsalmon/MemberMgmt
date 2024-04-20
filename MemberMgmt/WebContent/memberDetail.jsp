<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
<%
	MemberVO memVo = (MemberVO)request.getAttribute("memberDetail");
%>
</script>
<style>
.detailInfo{
	width : 80%;
	margin-left : 20%;
	margin-right : 20%;
}
</style>
</head>
<body>
<h3>회원 정보 상세보기</h3>
<hr>
<!-- 테이블 -->
<div class="row detailInfo">
<table class="table table-bordered">
	<tr><td colspan="2">프로필 사진</td></tr>
	<tr>
		<td>회원 ID</td>
		<td><p id="detail-id"><%=memVo.getMem_id() %></p></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><p id="detail-pw"><%=memVo.getMem_pass() %></p></td>
	</tr>
	<tr>
		<td>회원이름</td>
		<td><p id="detail-nm"><%=memVo.getMem_name() %></p></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><p id="detail-tel"><%=memVo.getMem_tel() %></p></td>
	</tr>
	<tr>
		<td>회원주소</td>
		<td><p id="detail-addr"><%=memVo.getMem_addr() %></p></td>
	</tr>
	<tr>
		<td>
			<input type="button" id="updBtn" value="수정" />
			<input type="button" id="delBtn" value="삭제" />
			<input type="button" id="listBtn" value="회원목록" />
		</td>
	</tr>
</table>
</div>

<!-- 값 전달할 hidden Form -->
<form id="detailInfo-form" action="<%=request.getContextPath()%>/detailUpdate.jsp" method="post">
	<input type="hidden" name="id" id="detailId" />
	<input type="hidden" name="pw" id="detailPw" />
	<input type="hidden" name="name" id="detailNm" />
	<input type="hidden" name="tel" id="detailTel"/>
	<input type="hidden" name="addr" id="detailAddr"/>
	<input type="hidden" name="photo" id="detailPhoto"/>
</form>

</body>
<script>
$(function(){
	
	// 수정 버튼 클릭 이벤트
	$('#updBtn').on('click', function(){
		
		let id = $('#detail-id').text();
		let pw = $('#detail-pw').text();
		let nm = $('#detail-nm').text();
		let tel = $('#detail-tel').text();
		let addr = $('#detail-addr').text();
		// photo는 아직...
		
		$('#detailId').val(id);
		$('#detailPw').val(pw);
		$('#detailNm').val(nm);
		$('#detailTel').val(tel);
		$('#detailAddr').val(addr);
		// photo는 아직...
		
		$('#detailInfo-form').submit();
		
	});
	
	// 삭제 버튼 클릭 이벤트
	$('#delBtn').on('click', function(){
		alert("성공");
	});
	
	// 회원목록 버튼 클릭 이벤트
	$('#listBtn').on('click', function(){
		alert("성공");
	});
	
	
}); // 전체 펑션 끝
</script>
</html>