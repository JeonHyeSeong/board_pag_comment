package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import orm.DatabaseBulider;

public class MemberDAOImpl implements MemberDAO {
	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	private SqlSession sql;
	private final String NS = "MemberMapper.";
	
	public MemberDAOImpl() {
		new DatabaseBulider();
		sql = DatabaseBulider.getFactory().openSession();
	}

	@Override
	public int register(MemberVO mvo) {
		log.info("register check 3");
		int isOk = sql.insert(NS+"add",mvo);
		if(isOk > 0){
			sql.commit();
		}
		return isOk;
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		log.info("login check 3");
		return sql.selectOne(NS+"login",mvo);
	}

	@Override
	public int logout(String id) {
		log.info("logout check 3");
		int isOk = sql.update(NS+"logout",id);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<MemberVO> list() {
		log.info("list check 3");
		return sql.selectList(NS+"list");
	}

	@Override
	public int edit(MemberVO mvo) {
		log.info("edit check 3");
		int isOk = sql.update(NS+"up",mvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int remove(String id) {
		log.info("remove check 3");
		int isOk = sql.delete(NS+"del",id);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}
}
