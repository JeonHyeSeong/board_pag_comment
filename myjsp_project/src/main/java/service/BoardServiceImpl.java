package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import repository.BoardDAO;
import repository.BoardDAOImpl;

public class BoardServiceImpl implements BoardService {
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	private BoardDAO bdao;
	
	public BoardServiceImpl() {
		bdao = new BoardDAOImpl();
	}

	@Override
	public int insert(BoardVO bvo) {
		log.info("insert check 2");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getList() {
		log.info("list check 2");
		return bdao.list();
	}

	@Override
	public BoardVO getDetail(int bno) {
		log.info("detail check 2");
		return bdao.detail(bno);
	}

	@Override
	public BoardVO countx(int bno) {
		
		return bdao.countx(bno);
	}
	
	@Override
	public int edit(BoardVO bvo) {
		log.info("edit check 2");
		return bdao.edit(bvo);
	}

	@Override
	public String getFileName(int bno) {
		log.info("getFile check");
		return bdao.getFileName(bno);
	}

	@Override
	public int remove(int bno) {
		log.info("remove check 2");
		CommentServiceImpl csv = new CommentServiceImpl();
		int cnt = csv.commentCount(bno);
		if(cnt>0) {
			int isOk = csv.deleteAll(bno);
		}
		return bdao.remove(bno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		log.info("totalcount check");
		return bdao.totalCount(pgvo);
	}

	@Override
	public List<BoardVO> getPageList(PagingVO pgvo) {
		log.info("pagelist check");
		return bdao.pageList(pgvo);
	}

}
