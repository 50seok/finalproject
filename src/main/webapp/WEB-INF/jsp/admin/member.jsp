<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지 회원 관리</title>
<link href="../../../css/admin.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../../../css/admin_page.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container" style="margin-top: 100px;">
        <div class="m-5">
            <h1 style="text-align: center; font-weight: bold;">회원 관리</h1>
        </div>
        <form action="/admin/member" method="post">
            <div style="height: 60px; float: right;">
                
                <select name="m_class" class="form-select" aria-label="Default select example" style="width: 140px; display: inline-block;">
                    <c:if test="${m_class == 0}">
                        <option value="3">전체</option>
                        <option value="0" selected>개인 회원</option>
                        <option value="1">사업자 회원</option>
                        <option value="2">관리자</option>
                    </c:if>
                    <c:if test="${m_class == 1}">
                        <option value="3">전체</option>
                        <option value="0">개인 회원</option>
                        <option value="1" selected>사업자 회원</option>
                        <option value="2">관리자</option>
                    </c:if>
                    <c:if test="${m_class == 2}">
                        <option value="3">전체</option>
                        <option value="0">개인 회원</option>
                        <option value="1">사업자 회원</option>
                        <option value="2" selected>관리자</option>
                    </c:if>
                    <c:if test="${m_class == 3}">
                        <option value="3" selected>전체</option>
                        <option value="0">개인 회원</option>
                        <option value="1">사업자 회원</option>
                        <option value="2">관리자</option>
                    </c:if>
                    <c:if test="${m_class == null}">
                        <option value="3">전체</option>
                        <option value="0">개인 회원</option>
                        <option value="1">사업자 회원</option>
                        <option value="2">관리자</option>
                    </c:if>
                </select>

                <select name="searchType" class="form-select" aria-label="Default select example" style="width: 130px; display: inline-block;">
                <c:if test="${searchType == 0}">
                    <option value="0" selected>이름</option>
                    <option value="1">이메일</option>
                    <option value="2">전화번호</option>
                </c:if>
                <c:if test="${searchType == 1}">
                    <option value="0">이름</option>
                    <option value="1" selected>이메일</option>
                    <option value="2">전화번호</option>
                </c:if>
                <c:if test="${searchType == 2}">
                    <option value="0">이름</option>
                    <option value="1">이메일</option>
                    <option value="2" selected>전화번호</option>
                </c:if>
                <c:if test="${searchType == null}">
                    <option value="0">이름</option>
                    <option value="1">이메일</option>
                    <option value="2">전화번호</option>
                </c:if>
                </select>
                
                <input type="text" name="searchValue" value="${param.searchValue}" class="form-control" style="width: 200px; display: inline-block;">
                <button type="submit" class="btn btn-outline-warning">검색</button>
            </div>
        </form>

        <table class="table table-hover">
            <colgroup>
                <col width="100px">
                <col width="250px">
                <col width="400px">
                <col width="*">
                <col width="200px">
            </colgroup>
            <thead>
                <tr class="table-warning">
                    <th>회원 번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>회원 구분</th>
                    <th>회원 상태</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${ar == null}">
                    <tr>
                        <td colspan="5">검색 결과가 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach items="${ar}" var="vo">
                    <tr>
                        <td>${vo.m_idx}</td>
                        <td><a href="javascript:sub('${vo.m_idx}')">${vo.m_name}</a></td>
                        <td>${vo.m_email}</td>
                        <td>
                            <c:if test="${vo.m_class == 0}">
                                개인 회원
                            </c:if>
                            <c:if test="${vo.m_class == 1}">
                                사업자 회원
                            </c:if>
                            <c:if test="${vo.m_class == 2}">
                                관리자
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${vo.m_status == 0}">
                                활동 중
                            </c:if>
                            <c:if test="${vo.m_status == 1}">
                                탈퇴
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="height: 80px;" >
            ${pageCode}
        </div>
    </div>

    <form action="/admin/member_view" method="post" name="frm">
        <input type="hidden" name="m_idx">
        <input type="hidden" name="cPage" value="${nowPage}">
        <input type="hidden" name="searchType" value="${param.searchType}">
        <input type="hidden" name="searchValue" value="${param.searchValue}">
        <input type="hidden" name="m_class" value="${param.m_class}">
    </form>
</main>

<script>
    function sub(m_idx){
        document.frm.m_idx.value = m_idx;
        document.frm.submit();
    }
</script>
</body>
</html>