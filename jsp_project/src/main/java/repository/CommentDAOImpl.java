package repository;

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
}
