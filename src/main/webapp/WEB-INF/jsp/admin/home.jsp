<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../../../css/admin.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container" style="margin-top: 100px;">
        <h1>람쥐썬더 관리자 페이지</h1>
        <div class="container">
            <div class="row">
                <div class="col">
                    <label for="member"><a href="/admin/member">회원 현황</a></label>
                    <table id="member" class="table table-bordered">
                        <colgroup>
                            <col width="300px">
                            <col width="300px">
                            <col width="300px">
                            <col width="*">
                        </colgroup>
                        <thead>
                        <tr class="table-warning">
                            <th>개인 회원</th>
                            <th>사업자 회원</th>
                            <th>관리자</th>
                            <th>총 회원</th>
                        </tr>
                        </thead>
                        <tr>
                            <td><a href="/admin/member?searchType=0&searchValue=&m_class=0">${pr} 명</a></td>
                            <td><a href="/admin/member?searchType=0&searchValue=&m_class=1">${bz} 명</a></td>
                            <td><a href="/admin/member?searchType=0&searchValue=&m_class=2">${ad} 명</a></td>
                            <td style="background-color: rgb(255, 255, 229);"><a href="/admin/member">
                                ${pr+bz+ad} 명 
                                <c:if test="${tod > 0}">
                                <span style="color: red;" >( ${tod} ↑ )</span>
                                </c:if>
                                <c:if test="${tod == 0}">
                                ( - )
                                </c:if>
                                </a></td>
                        </tr>
                    </table>
                  </div>
                </div>
            <div class="row">
                <div class="col">
                <label for="notice"><a href="/admin/notice">최근 공지</a></label>
                <table id="notice" class="table table-bordered table-hover" style="table-layout:fixed">
                    <colgroup>
                        <col width="*">
                        <col width="80px">
                        <col width="210px">
                    </colgroup>
                    <thead>
                        <tr class="table-warning">
                            <th>제목</th>
                            <th>조회수</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                        <c:forEach var="bvo" items="${b_ar}">
                        <tr>
                            <td>
                                <c:if test="${bvo.b_val1 == 1}">
                                    <img src="../images/lock.png" style="width: 15px;">
                                </c:if>
                                <a href="/admin/notice_view?b_idx=${bvo.b_idx}&cPage=1">${bvo.b_title}</a>
                                <c:if test="${bvo.b_filename != null}">
                                    <img src="../images/link.png" style="width: 14px;">
                                </c:if>
                            </td>
                            <td>${bvo.b_hit}</td>
                            <td>${bvo.bbslog.bl_date}</td>
                        </tr>
                    </c:forEach>
                </table>
              </div>

              <div class="col">
                <label for="qna"><a href="/admin/qna">최근 문의</a></label>
                <table id="qna" class="table table-bordered table-hover">
                    <colgroup>
                        <col width="*">
                        <col width="80px">
                        <col width="210px">
                    </colgroup>
                    <thead>
                    <tr class="table-warning">
                        <th>제목</th>
                        <th>작성자</th>
                        <th>등록일</th>
                    </tr>
                    </thead>
                    <c:forEach var="qvo" items="${q_ar}">
                    <tr>
                        <td>
                            <c:if test="${qvo.b_val1 == 1}">
                                <img src="../images/lock.png" style="width: 15px;">
                            </c:if>
                            <a href="/admin/qna_view?b_idx=${qvo.b_idx}&cPage=1">${qvo.b_title}</a>
                            <c:if test="${qvo.b_filename != null}">
                                <img src="../images/link.png" style="width: 14px;">
                            </c:if>
                            <c:if test="${qvo.c_list.size() != 0}">
                                [${qvo.c_list.size()}]
                            </c:if>
                        </td>
                        <td><a href="/admin/member_view?m_idx=${qvo.bbslog.m_idx}&cPage=1">${qvo.bbslog.mvo.m_name}</a></td>
                        <td>${qvo.bbslog.bl_date}</td>
                    </tr>
                    </c:forEach>
                </table>
              </div>
              

            </div>
            <div class="row">
                
              <div class="col">
                <label for="service"><a href="/admin/review">최근 리뷰</a></label>
                <table id="service" class="table table-bordered table-hover">
                    <thead>
                    <tr class="table-warning">
                        <th>제목</th>
                        <th>등록일</th>
                    </tr>
                    </thead>
                    <tr>
                        <td>ㅇㅇㅇ</td>
                        <td>ㅇㅇㅇ</td>
                    </tr>
                </table>
              </div>
              <div class="col">
                <label for="service"><a href="/admin/service">서비스</a></label>
                <table id="service" class="table table-bordered table-hover">
                    <thead>
                    <tr class="table-warning">
                        <th>제목</th>
                        <th>등록일</th>
                    </tr>
                    </thead>
                    <tr>
                        <td>ㅇㅇㅇ</td>
                        <td>ㅇㅇㅇ</td>
                    </tr>
                </table>
              </div>
            </div>
          </div>
        
    </div>
</main>
</body>
</html>