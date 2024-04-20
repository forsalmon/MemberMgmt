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
.memberTable{
	border : 1px solid blue;
}
tr, td{
	border : 1px solid blue;
}
</style>
</head>
<body>
<h3>회원 목록 보기</h3>
<hr>
<div id="allMemberList"></div>
</body>
<script>
$(function(){
	
	// ID 클릭 이벤트
	// 회원 정보 상세 보기 이벤트
	$(document).on('click', '#mem-id', function(){
		
		let userId = $(this).data("memid");
		location.href="<%=request.getContextPath()%>/memberDetail.do?userId="+userId;

	});
	
	
	// 회원 추가 버튼 클릭 이벤트
	$(document).on('click', '#addMemBtn', function(){
		
		location.href="<%=request.getContextPath()%>/insertMember.jsp";
			
	}); // 회원추가 버튼 클릭 이벤트 끝

	
	// 전체 회원 목록
	$.ajax({
		
		url : "<%= request.getContextPath()%>/memberList.do",
		type : "get",
		dataType : "json",
		success : function(result){
			//alert("성공");
				code = `<table class="memberTable">
						  <tr><td colspan='5'><input type='button' id='addMemBtn' value='회원추가'></td></tr>
						  <tr><td>ID</td><td>비밀번호</td><td>이름</td><td>전화번호</td><td>주소</td></tr>`; 
		
				$.each(result, function(i, v){
				
				code += `<tr>
						   <td id="mem-id" data-memid="${v.mem_id}">${v.mem_id}</td>
						   <td>${v.mem_pass}</td>
						   <td>${v.mem_name}</td>
						   <td>${v.mem_tel}</td>
						   <td>${v.mem_addr}</td>
						 </tr>`;
			});
				code += `</table>`;
				$('#allMemberList').html(code);
		}, 
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	}); // ajax 끝
	
}); // 전체 펑션 끝
</script>
</html>