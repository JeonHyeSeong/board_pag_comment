package repository;

import java.util.List;

import domain.MemberVO;

public interface MemberDAO {

	int register(MemberVO mvo);

	MemberVO login(MemberVO mvo);

	int logout(String id);

	List<MemberVO> list();

	int edit(MemberVO mvo);

	int remove(String id);

}
