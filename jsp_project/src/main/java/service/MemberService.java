package service;

import java.util.List;

import domain.MemberVO;

public interface MemberService {

	int register(MemberVO mvo);

	MemberVO login(MemberVO mvo);

	int logout(String id);

	List<MemberVO> getList();

	int edit(MemberVO mvo);

	int remove(String id);

}
