<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지 문의 관리</title>
<link href="../../../css/admin.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="../../../css/admin_page.css" rel="stylesheet">
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container" style="margin-top: 100px;">
        <div class="m-5">
            <h1 style="text-align: center; font-weight: bold;">문의 관리</h1>
        </div>
        <form action="/admin/qna" method="post">
            <div style="height: 60px; float: right;">
                <select name="searchType" class="form-select" aria-label="Default select example" style="width: 130px; display: inline-block;">
                    <c:if test="${param.searchType == 0}">
                        <option value="0" selected>제목</option>
                        <option value="1">내용</option>
                        <option value="2">제목+내용</option>
                        <option value="3">작성자</option>
                    </c:if>
                    <c:if test="${param.searchType == 1}">
                        <option value="0">제목</option>
                        <option value="1" selected>내용</option>
                        <option value="2">제목+내용</option>
                        <option value="3">작성자</option>
                    </c:if>
                    <c:if test="${param.searchType == 2}">
                        <option value="0">제목</option>
                        <option value="1">내용</option>
                        <option value="2" selected>제목+내용</option>
                        <option value="3">작성자</option>
                    </c:if>
                    <c:if test="${param.searchType == 3}">
                        <option value="0">제목</option>
                        <option value="1">내용</option>
                        <option value="2">제목+내용</option>
                        <option value="3" selected>작성자</option>
                    </c:if>
                    <c:if test="${param.searchType == 9 || param.searchValue == null}">
                        <option value="0">제목</option>
                        <option value="1">내용</option>
                        <option value="2">제목+내용</option>
                        <option value="3">작성자</option>
                    </c:if>
                </select>
                <c:if test="${param.searchType == 9}">
                    <input type="text" name="searchValue" class="form-control" style="width: 200px; display: inline-block;">
                </c:if>
                <c:if test="${param.searchType != 9}">
                    <input type="text" name="searchValue" value="${param.searchValue}" class="form-control" style="width: 200px; display: inline-block;">
                </c:if>
                <button type="submit" class="btn btn-outline-warning">검색</button>
            </div>
        </form>
        <table class="table table-hover" style="table-layout:fixed">
            <colgroup>
                <col width="100px">
                <col width="*">
                <col width="100px">
                <col width="250px">
                <col width="100px">
            </colgroup>
            <thead>
                <tr class="table-warning">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>문의작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${ar == null}">
                    <tr>
                        <td colspan="5">검색 결과가 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="vo" items="${ar}" varStatus="st">
                    <tr>
                        <td>${totalRecord - ((nowPage-1)*blockList+st.index) }</td>
                        <td>
                            <c:if test="${vo.b_val1 == 1}">
                                <img src="../images/lock.png" style="width: 15px;">
                            </c:if>
                            <a href="javascript:sub('${vo.b_idx}','${vo.bbslog.bl_date}','${vo.bbslog.mvo.m_name}')">${vo.b_title}</a>
                            <c:if test="${vo.b_filename != null}">
                                <img src="../images/link.png" style="width: 14px;">
                            </c:if>
                            <c:if test="${vo.c_list.size() != 0}">
                                [${vo.c_list.size()}]
                            </c:if>
                        </td>
                        <td><a href="/admin/member_view?m_idx=${vo.bbslog.mvo.m_idx}&cPage=1">${vo.bbslog.mvo.m_name}</a></td>
                        <td>${vo.bbslog.bl_date}</td>
                        <td>${vo.b_hit}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="height: 80px;" >
            ${pageCode}
        </div>

        <form action="/admin/qna_view" name="frm" method="post">
            <input type="hidden" name="b_idx">
            <input type="hidden" name="cPage" value="${nowPage}">
            <input type="hidden" name="searchType" value="${param.searchType}">
            <input type="hidden" name="searchValue" value="${param.searchValue}">
        </form>
        
    </div>
</main>

<script>
    function sub(b_idx){
        document.frm.b_idx.value = b_idx;
        document.frm.submit();
    }
</script>
</body>
</html>
