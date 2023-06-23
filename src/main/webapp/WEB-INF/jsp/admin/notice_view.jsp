<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">about:blank#blockede
<title>관리자페이지 글 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>
<main>
    <div class="container">
        <br>
        <br>
        <table class="table table-bordered">
            <colgroup>
                <col width="150px">
                <col width="*">
            </colgroup>
            <tbody>
                <tr>
                    <th>제목</th>
                    <td>${vo.b_title}</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                        <c:if test="${vo.b_filename != null }">
                            <a href="javascript:down('${vo.b_filename}')">${vo.b_filename}</a>
                        </c:if>
                        <c:if test="${vo.b_filename == null }"><span style="font-size: small; color: rgb(179, 179, 179);">첨부파일이 없습니다</span></c:if>
                    </td>
                </tr>
                <tr> 
                    <th style="height: 400px;">내용</th>
                    <td>${vo.b_content}</td>
                </tr>
            </table>
            <div style="height: 80px;" >
                <button type="button" class="btn btn-outline-info" onclick="javascript:sub()">목록</button>
                <button type="button" class="btn btn-outline-info" onclick="javascript:changeStatus()">
                    <c:if test="${vo.b_status == 0}">비공개</c:if>
                    <c:if test="${vo.b_status == 1}">공개</c:if>
                </button>
            </div>

        <form name="frm" method="get">
            <input type="hidden" name="fname"/>
            <input type="hidden" name="b_idx" value="${vo.b_idx}"/>
            <input type="hidden" name="cPage" value="${param.cPage}"/>
            <input type="hidden" name="searchType" value="${param.searchType}">
            <input type="hidden" name="searchValue" value="${param.searchValue}">
        </form>
    

    </body>
</div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>
<script>
    function down(fname) {
        // 인자로 사용자가 클릭한 파일명을 받는다. 이것을 현재 문서 안에 있는 frm이라는 폼객체에 이름이 fname이라는 hidden 요소의 값으로 지정해준다.
        document.frm.fname.value = fname;
        document.frm.action = "/download";
        document.frm.submit();
    }

    function changeStatus(){
        if('${vo.b_status}'== 0)
            document.frm.action = "/admin/notice_changeStatus1";
        else if('${vo.b_status}'== 1)
            document.frm.action = "/admin/notice_changeStatus0";

        document.frm.submit();
    }

    function sub(){
        document.frm.action = "/admin/notice";
        document.frm.submit();
    }
    
</script>

</body>
</html>