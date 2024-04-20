package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	
	// 전체 회원목록 보기
	public List<MemberVO> getAllList();
	
	// 회원 추가
	public int insertMember(MemberVO memVo);
	
	// id 중복확인
	public int idChk(String mem_id);
	
	// 회원 상세정보 보기
	public MemberVO memberDetail(String mem_id);

}
