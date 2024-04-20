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
	request.setCharacterEncoding("utf-8");

	// form으로 제출한 값 가져오기
	String id = request.getParameter("id");
	String pass = request.getParameter("pw");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	// String photo = request.getParameter("photo");
%>
</script>
<body>
<h3>회원 정보 상세보기</h3>
<hr>
<!-- 테이블 -->
<table class="table table-bordered">
	<tr><td colspan="2">프로필 사진</td></tr>
	<tr>
		<td>회원 ID</td>
		<td><p id="modi-user-id"><%= id%></p></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="modi-pw" id="modi-user-pw" placeholder="<%=pass%>" /></td>
	</tr>
	<tr>
		<td>회원이름</td>
		<td><input type="text" name="modi-nm" id="modi-user-nm" placeholder="<%=name%>" /></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="modi-tel" id="modi-user-tel" placeholder="<%=tel%>" /></td>
	</tr>
	<tr>
		<td>회원주소</td>
		<td><input type="text" name="modi-addr" id="modi-user-addr" placeholder="<%=addr%>" /></td>
	</tr>
	<tr>
		<td>프로필 사진</td>
		<td><input type="button" name="modi-photo" id="modi-user-photo" value="파일 선택" id="photo-update-btn"/>선택된 파일 없음</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" id="updSaveBtn" value="저장" />
			<input type="button" id="updCancelBtn" value="취소" />
			<input type="button" id="re-listBtn" value="회원목록" />
		</td>
	</tr>
</table>

<!-- hidden form -->
<form id="updateForm" action="<%= request.getContextPath()%>/detailUpdate.do" method="post">
	<input type="hidden" name="id" id="fm-user-id" />
	<input type="hidden" name="pw" id="fm-user-pw" />
	<input type="hidden" name="nm" id="fm-user-nm" />
	<input type="hidden" name="tel" id="fm-user-tel" />
	<input type="hidden" name="addr" id="fm-user-addr" />
	<input type="hidden" name="photo" id="fm-user-photo" />
</form>
</body>
<script>
$(function(){
	
	// 저장하기
	$('#updSaveBtn').on('click', function(){
		
		alert("성공 !");
		
		// 값 가져오기
		String id = $('#modi-user-id').text();
		String pw = $('#modi-user-pw').val();
		String nm = $('#modi-user-nm').val();
		String tel = $('#modi-user-tel').val();
		String addr = $('#modi-user-addr').val();
		String photo = $('#modi-user-photo').val();
		
		// hidden 폼에 저장하기
		$('#fm-user-id').val(id);
		$('#fm-user-pw').val(pw);
		$('#fm-user-nm').val(nm);
		$('#fm-user-tel').val(tel);
		$('#fm-user-addr').val(addr);
		$('#fm-user-photo').val(photo);
		
		// 제출하기
		$('#updateForm').submit();
		
	});
	
	// 취소
	$('#updCancelBtn').on('click', function(){
		
	});
	
	// 목록으로 돌아가기
	$('#re-listBtn').on('click', function(){
		
	});
	
	
}); //전체 펑션 끝

</script>
</html>