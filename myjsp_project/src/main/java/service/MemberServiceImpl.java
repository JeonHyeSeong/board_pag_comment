package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import repository.MemberDAO;
import repository.MemberDAOImpl;

public class MemberServiceImpl implements MemberService {
	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	private MemberDAO mdao;
	
	public MemberServiceImpl() {
		mdao = new MemberDAOImpl();
	}

	@Override
	public int register(MemberVO mvo) {
		log.info("register check 2");
		return mdao.register(mvo);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		log.info("login check 2");
		return mdao.login(mvo);
	}

	@Override
	public int logout(String id) {
		log.info("logout check 2");
		return mdao.logout(id);
	}

	@Override
	public List<MemberVO> getList() {
		log.info("list check 2");
		return mdao.list();
	}

	@Override
	public int edit(MemberVO mvo) {
		log.info("edit check 2");
		return mdao.edit(mvo);
	}

	@Override
	public int remove(String id) {
		log.info("remove check 2");
		return mdao.remove(id);
	}
}
