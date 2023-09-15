package service;

import java.util.List;

import domain.BoardVO;
import domain.PagingVO;

public interface Service {

	int insert(BoardVO bvo);

	List<BoardVO> getList();

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo);

	int remove(int bno);

	List<BoardVO> getPageList(PagingVO pgvo);

	int getTotalCount(PagingVO pgvo);

}
