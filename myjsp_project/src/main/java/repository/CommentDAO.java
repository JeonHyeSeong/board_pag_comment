package repository;

import java.util.List;

import domain.CommentVO;

public interface CommentDAO {

	int addComment(CommentVO cvo);

	List<CommentVO> list(int bno);

	int update(CommentVO cvo);

	int remove(int cno);

	int count(int bno);

	int deleteAll(int bno);

}
