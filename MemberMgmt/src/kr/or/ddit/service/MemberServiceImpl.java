package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.dao.IMemberDao;
import kr.or.ddit.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	private static IMemberDao dao;
	
	private static MemberServiceImpl service;
	
	private MemberServiceImpl() {  
		dao = MemberDaoImpl.getInstance();
	}
	
	public static MemberServiceImpl getInstance() {
		if (service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public List<MemberVO> getAllList() {
		return dao.getAllList();
	}

	@Override
	public int insertMember(MemberVO memVo) {
		return dao.insertMember(memVo);
	}

	@Override
	public int idChk(String mem_id) {
		return dao.idChk(mem_id);
	}

	@Override
	public MemberVO memberDetail(String mem_id) {
		return dao.memberDetail(mem_id);
	}

}
