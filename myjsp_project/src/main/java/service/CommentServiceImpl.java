package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.CommentVO;
import repository.CommentDAO;
import repository.CommentDAOImpl;

public class CommentServiceImpl implements CommentService {
	private static final Logger log = LoggerFactory.getLogger(CommentServiceImpl.class);
	
	private CommentDAO cdao;
	
	public CommentServiceImpl() {
		cdao = new CommentDAOImpl();
	}

	@Override
	public int post(CommentVO cvo) {
		log.info("post check 2");
		return cdao.addComment(cvo);
	}

	@Override
	public List<CommentVO> getList(int bno) {
		log.info("commnet list check 2");
		return cdao.list(bno);
	}

	@Override
	public int modify(CommentVO cvo) {
		log.info("commnet modify check 2");
		return cdao.update(cvo);
	}

	@Override
	public int remove(int cno) {
		log.info("commnet remove check 2");
		return cdao.remove(cno);
	}

	public int commentCount(int bno) {
		
		return cdao.count(bno);
	}

	public int deleteAll(int bno) {
		
		return cdao.deleteAll(bno);
	}

}
