package com.study.firstproject.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.study.firstproject.model.Member;

@Mapper
public interface MemberMapper {
    Member getMember(int id);

    List<Member> getMemberList();

    int createMember(Member member);

    int updateMember(Member member);

    int deleteMember(int id);

    Member selectMemberOne(Member member);

}
