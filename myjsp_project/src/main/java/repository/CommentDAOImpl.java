package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.CommentVO;
import orm.DatabaseBulider;

public class CommentDAOImpl implements CommentDAO {
	
	private static final Logger log = LoggerFactory.getLogger(CommentDAOImpl.class);
	
	private SqlSession sql;
	private final String NS = "CommentMapper.";
	private int isOk;
	
	public CommentDAOImpl() {
		new DatabaseBulider();
		sql = DatabaseBulider.getFactory().openSession();
	}

	@Override
	public int addComment(CommentVO cvo) {
		log.info("post check 3");
		isOk = sql.insert(NS+"add",cvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<CommentVO> list(int bno) {
		log.info("commnet list check 3");
		return sql.selectList(NS+"list",bno);
	}

	@Override
	public int update(CommentVO cvo) {
		log.info("commnet modify check 3");
		isOk = sql.update(NS+"up",cvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int remove(int cno) {
		log.info("commnet remove check 3");
		isOk = sql.delete(NS+"del",cno);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int count(int bno) {
		
		return sql.selectOne(NS+"cnt",bno);
	}

	@Override
	public int deleteAll(int bno) {
		isOk = sql.delete(NS+"delall",bno);
		if(isOk > 0){
			sql.commit();
		}
		return isOk;
	}
}
