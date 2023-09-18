package repository;

import java.util.List;

import domain.CommentVO;

public interface CommentDAO {

	int insert(CommentVO cvo);

	List<CommentVO> getList(int bno);

	int update(CommentVO cvo);
	
	int remove(int cno);

	int deleteAll(int bno);



}
