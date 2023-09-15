package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import orm.DatabaseBulider;

public class BoardDAOImpl implements BoardDAO {
	private static final Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	private SqlSession sql;
	private final String NS = "BoardMapper.";
	
	public BoardDAOImpl() {
		new DatabaseBulider();
		sql = DatabaseBulider.getFactory().openSession();
	}

	@Override
	public int insert(BoardVO bvo) {
		log.info("insert check 3");
		int isOk = sql.insert(NS+"add",bvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<BoardVO> selectList() {
		log.info("list check 3");
		return sql.selectList(NS+"list");
	}

	@Override
	public BoardVO selectOne(int bno) {
		log.info("detail check 3");
		sql.update(NS+"rc", bno);
		sql.commit();
		return sql.selectOne(NS+"detail",bno);
	}

	@Override
	public int update(BoardVO bvo) {
		log.info("edit check 3");
		int isOk = sql.update(NS+"up",bvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int remove(int bno) {
		log.info("remove check 3");
		int isOk = sql.delete(NS+"del",bno);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<BoardVO> pageList(PagingVO pgvo) {
		log.info("pageList check 3");
		return sql.selectList(NS+"pagelist",pgvo);
	}

	@Override
	public int count(PagingVO pgvo) {
		log.info("count check 3");
		return sql.selectOne(NS+"count",pgvo);
	}
}
