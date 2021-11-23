package com.study.firstproject.service;

import java.util.List;

import com.study.firstproject.model.Member;
import com.study.firstproject.repository.MemberMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {

    @Autowired
    MemberMapper memberMapper;

    public List<Member> getMemberList() {
        return memberMapper.getMemberList();
    }

    public Member getMember(int id) {
        return memberMapper.getMember(id);
    }

    public int createMember(Member member) {
        return memberMapper.createMember(member);
    }

    public int updateMember(Member member) {
        return memberMapper.updateMember(member);
    }

    public int deleteMember(int id) {
        return memberMapper.deleteMember(id);
    }

    public Member getSelectOne(Member member) {
		return memberMapper.selectMemberOne(member);
	}

    
}
