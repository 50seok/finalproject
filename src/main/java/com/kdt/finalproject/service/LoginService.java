package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.LoginMapper;
import com.kdt.finalproject.vo.MemVO;

@Service
public class LoginService {

    @Autowired
    private LoginMapper l_Mapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 비지니스 메서드(로직)
    public MemVO[] getList() {
        MemVO[] ar = null;

        List<MemVO> list = l_Mapper.getList();
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public MemVO login(MemVO mvo) { // 객체 안에 m_email, m_name, m_pw있음.

        MemVO vo = l_Mapper.login(mvo);

        if (vo != null) {
            if (passwordEncoder.matches(mvo.getM_pw(), vo.getM_pw())) {
                return vo;
            }
        }

        // Map<String, String> map = new HashMap<>();
        // map.put("m_email", m_email);
        // map.put("m_pw", m_pw);
        // map.put("m_class", m_class);

        return null;
    }

    // 회원가입
    public int add_mem(MemVO mvo) {

        StringBuffer sb = new StringBuffer();

        sb.append(mvo.getM_phone_part1()); // 010
        sb.append(mvo.getM_phone_part2()); // 1234
        sb.append(mvo.getM_phone_part3()); // 5678

        MemVO vo = new MemVO();
        vo.setM_email(mvo.getM_email());
        vo.setM_name(mvo.getM_name());
        vo.setM_class(mvo.getM_class());
        vo.setM_phone(sb.toString());

        vo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));

        return l_Mapper.add_mem(vo);
    }

    // 카카오
    public int add_kakao(MemVO mvo) {

        MemVO vo = new MemVO();
        vo.setM_email(mvo.getM_email());
        vo.setM_name(mvo.getM_name());
        vo.setM_pw(mvo.getM_pw());
        vo.setM_class(mvo.getM_class());
        vo.setM_atoken(mvo.getM_atoken());
        vo.setM_rtoken(mvo.getM_rtoken());

        return l_Mapper.add_kakao(vo);
    }

    public MemVO search_email(String m_email) {
        return l_Mapper.search_email(m_email);
    }

    public MemVO check_email(String m_email) {
        return l_Mapper.check_email(m_email);
    }

    public MemVO check_phone(String m_phone) {
        return l_Mapper.check_phone(m_phone);
    }

    // 비밀번호 변경 전, 현재비밀번호 검증
    public boolean check_current_pwd(MemVO vo, String pwd) { // 객체 안에 m_email, m_name, m_pw있음.
        boolean value = false;

        if (vo != null) {
            if (passwordEncoder.matches(pwd, vo.getM_pw())) {
                value = true;
            }
        }

        return value;
    }

}
