package repository;

import java.util.List;

import domain.BoardVO;
import domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> selectList();

	BoardVO selectOne(int bno);

	int update(BoardVO bvo);

	int remove(int bno);

	List<BoardVO> pageList(PagingVO pgvo);

	int count(PagingVO pgvo);

}
