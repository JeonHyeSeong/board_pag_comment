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
	public int insert(CommentVO cvo) {
		log.info("post check 3");
		isOk = sql.insert(NS+"add",cvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<CommentVO> getList(int bno) {
		log.info("list check 3");
		return sql.selectList(NS+"list",bno);
	}

	@Override
	public int update(CommentVO cvo) {
		log.info("modify check 3");
		isOk = sql.update(NS+"up",cvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}
	
	@Override
	public int remove(int cno) {
		log.info("remove check 3");
		isOk = sql.delete(NS+"del",cno);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int deleteAll(int bno) {
		isOk = sql.delete(NS+"delete",bno);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

}
