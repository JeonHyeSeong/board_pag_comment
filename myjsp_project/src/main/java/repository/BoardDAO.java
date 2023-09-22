package repository;

import java.util.List;

import domain.BoardVO;
import domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> list();

	BoardVO detail(int bno);

	BoardVO countx(int bno);
	
	int edit(BoardVO bvo);

	String getFileName(int bno);

	int remove(int bno);

	int totalCount(PagingVO pgvo);

	List<BoardVO> pageList(PagingVO pgvo);


}
