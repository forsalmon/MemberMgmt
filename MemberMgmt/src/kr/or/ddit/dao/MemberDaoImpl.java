package kr.or.ddit.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MybatisUtil;
import kr.or.ddit.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	
	private static MemberDaoImpl dao;
	
	private MemberDaoImpl() { }
	
	public static MemberDaoImpl getInstance() {
		if (dao == null) dao = new MemberDaoImpl();
		return dao;
	};
	

	@Override
	public List<MemberVO> getAllList() {
		
		SqlSession session = null;
		List<MemberVO> memList = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			memList = session.selectList("member.getAllList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session != null ) session.close();
		}
		return memList;
	}

	@Override
	public int insertMember(MemberVO memVo) {
		
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("member.insertMember", memVo);
			if (cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		return cnt;
	}

	@Override
	public int idChk(String mem_id) {
		
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("member.idChk", mem_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		return cnt;
	}

	@Override
	public MemberVO memberDetail(String mem_id) {
		
		SqlSession session = null;
		MemberVO memVo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			memVo = session.selectOne("member.memberDetail", mem_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		return memVo;
	}

}
