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
	private int isOk;
	
	public BoardDAOImpl() {
		new DatabaseBulider();
		sql = DatabaseBulider.getFactory().openSession();
	}

	@Override
	public int insert(BoardVO bvo) {
		log.info("insert check 3");
		isOk = sql.insert(NS+"add",bvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<BoardVO> list() {
		log.info("list check 3");
		return sql.selectList(NS+"list");
	}

	@Override
	public BoardVO detail(int bno) {
		log.info("detail check 3");
		sql.update(NS+"count",bno);
		sql.commit();
		return sql.selectOne(NS+"one",bno);
	}
	
	@Override
	public BoardVO countx(int bno) {
		
		return sql.selectOne(NS+"one",bno);
	}

	@Override
	public int edit(BoardVO bvo) {
		log.info("edit check 3");
		isOk = sql.update(NS+"up",bvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public String getFileName(int bno) {
		log.info("getFile check 2");
		return sql.selectOne(NS+"file",bno);
	}

	@Override
	public int remove(int bno) {
		log.info("remove check 3");
		isOk = sql.delete(NS+"del",bno);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int totalCount(PagingVO pgvo) {
		log.info("totalcount check 2");
		return sql.selectOne(NS+"tcnt",pgvo);
	}

	@Override
	public List<BoardVO> pageList(PagingVO pgvo) {
		log.info("pagelist check 2");
		return sql.selectList(NS+"pageList",pgvo);
	}

}
