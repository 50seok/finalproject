package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.BbsVO;

public interface SupportMapper {
    List<BbsVO> notice_all(int begin, int end, String searchType, String searchValue); // 사업자가 볼 수 있는 공지

    List<BbsVO> notice_user(int begin, int end, String searchType, String searchValue); // 개인이 볼 수 있는 공지 (조건)

    int support_notice_count1();

    int support_notice_count2();

    BbsVO notice_view(String b_idx); // 공지 상세보기

    int notice_hit(String b_idx); // 공지 조회수

    List<BbsVO> faq(); // 자주하는 질문

    List<BbsVO> qna(int begin, int end, String searchType, String searchValue);

    int support_qna_count(String searchType, String searchValue);
}
