<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/MemberMgmt/js/jquery-3.7.1.min.js"></script>
<style>
table{
	border : 1px solid blue;
}
</style>
</head>
<body>
<h3>회원 정보 입력 폼</h3>
<hr>
	<table>
		<tr>
			<td>회원 ID</td>
			<td><input type="text" name="memId" id="mem-id"></td>
			<td><input type="button" value="중복확인" id="idChkBtn"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="memPass" id="mem-pass"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="text" name="memPass2" id="mem-pass2"></td>
		</tr>
		<tr>
			<td>회원 이름</td>
			<td><input type="text" name="memName" id="mem-name"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="memTel" id="mem-tel"></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="memAddr" id="mem-addr"></td>
		</tr>
		<tr>
			<td>프로필 사진</td>
			<td><input type="button" value="파일선택" id="photoSelBtn"></td>
		</tr>
		<tr>
			<td>
			<input type="button" value="저장" id="insertSaveBtn">
			<input type="button" value="취소" id="insertCancelBtn">
			<input type="button" value="회원목록" id="listBtn">
			</td>
		</tr>
	
	</table>
</body>
<script>
$(function(){
	
	// 비밀번호 확인
	
	// 회원ID 중복확인 버튼 클릭 이벤트
	$('#idChkBtn').on('click', function(){
	    
		let memId = $('#mem-id').val(); // 입력 필드에서 ID 값을 가져옵니다.
		
		$.ajax({
	        url : '<%= request.getContextPath() %>/idChk.do',
	        data : { "memId" : memId }, // 가져온 값을 데이터 객체에 포함시킵니다.
	        type : 'get',
	        success : function(result){
	            //alert(result);
	            if (result === 1) {
	            	alert("사용 불가");
	            }else{
	            	alert("사용 가능");
	            }
	        },
	        error : function(xhr){
	            alert("상태 : " + xhr.status);
	        },
	        dataType : 'json'
	    });
	
	});

	// 자료 입력 후 저장버튼 클릭 이벤트
	$('#insertSaveBtn').on('click', function(){
		
		
	});
	


}); // 전체 펑션 끝
</script>
</html>