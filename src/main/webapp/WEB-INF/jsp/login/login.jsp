<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <style>


        /* 선택된 탭의 글씨 색상 */
        .nav-link.active#tab-personal {
            color: #ffffff !important;
        }

        /* 선택된 탭의 글씨 색상 */
        .nav-link.active#tab-business {
            color: #ffffff !important;
        }


        .register-link {
          font-size: 14px; /* 원하는 글씨 크기로 설정 */
          font-family: "Arial", sans-serif; /* 원하는 글꼴로 설정 */
        }

        
        #login-button {
            width: 310px; /* 원하는 버튼의 너비로 설정 */           
        }

        .btn-primary:focus {
            outline: none;
            box-shadow: 0 0 0 0.45rem rgba(20, 203, 216, 0.87);
          }

        .form-outline {
        position: relative;
        }

        .form-outline input {
            border: none;
            border-bottom: 1px solid #ced4da; /* 아래 밑줄 스타일을 설정 */
            border-radius: 13;
            padding: 7px 8px;
            width: 100%;
        }

        .form-outline input:focus {
            outline: none;
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .form-outline label {
            position: absolute;
            top: 0;
            left: 0;
            font-size: 0.875rem;
            transition: transform 0.2s ease-out, font-size 0.2s ease-out;
        }

        .form-outline input:focus + label,
        .form-outline input:not(:placeholder-shown) + label {
            transform: translateY(-35px) scale(0.85); /* 아래로 이동하여 축소되는 효과 적용 */
            color: #6c757d;
        }

        .divider {
        border-top: 1.7px solid #757571;
        margin: 10px;
        width: 300px;
    }



      </style>

</head>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="../main/mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->

        <!--////////// Main start //////////////-->
        <main>
            <div class="container">
                <article>
                    <header>
                        <!-- <h1>로그인</h1> -->
                    </header>
                    <div id="content"> 
                        <c:if test="${sessionScope.mvo eq null}"> <!--세션에 저장된 mvo가 없을때-->     
                            

                                <!--부트스트랩 추가-->
                                <div class="d-flex justify-content-center align-items-center mt-5"> <!-- 가운데 정렬을 위한 d-flex와 justify-content-center 클래스 추가 -->
                                <div class="card shadow p-4 mb-3 mt-3 bg-body rounded" style="width: 25rem;" >
                                    <div class="card-body">



                                    <!-- 개인 로그인과 사업자 로그인 탭 -->
                                    <ul class="nav nav-pills nav-justified mb-4" id="ex1" role="tablist">
                                        
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link active" id="tab-personal" data-mdb-toggle="pill" href="#pills-personal" role="tab"
                                            aria-controls="pills-personal" aria-selected="true" >개인 로그인</a>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link" id="tab-business" data-mdb-toggle="pill" href="#pills-business" role="tab"
                                            aria-controls="pills-business" aria-selected="false" >사업자 로그인</a>
                                        </li>
                                    </ul>

                    <div class="tab-content">
                           
                                <!-- 개인 로그인 내용 -->
                              <div class="tab-pane fade show active" id="pills-personal" role="tabpanel" aria-labelledby="tab-personal">
                                <form action="login" method="post" name="frm">
                                    <input type="hidden" value="0" name="m_class" id="m_class1"/>
                                    
                                    <!-- Email input -->

                                    <div class="form-outline  mb-4 form-floating mb-3">
                                        <!-- <label class="form-label" for="m_email">Email</label> -->
                                        <input type="text" id="m_email" name="m_email" class="form-control form-outline" placeholder="Email"/>
                                        <label for="m_email" class="form-label text-secondary fs-6">Email</label>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-4 form-floating mb-3">
                                        <!-- <label class="form-label" for="m_pw">Password</label> -->
                                        <input type="password" id="m_pw" name="m_pw" class="form-control form-outline" placeholder="Password"/>
                                        <label for="m_pw" class="form-label text-secondary fs-6">Password</label>
                                    </div>

                                    <!-- Login button -->
                                    <div class="text-center">
                                        <button type="button" class="btn btn-primary btn-block mb-4 text-center" id="login-button" onclick="exe(this.form)"> <i class="fa fa-sign-in me-2" aria-hidden="true"></i>로그인</button>
                                    </div>

                                        <!--회원가입-->
                                        <!-- <button type="button" class="btn btn-info btn-block mb-4 " onclick="location.href='join'" >회원가입</button>   -->
                                        <hr class="divider"/>
                                        
                                        <div class="text-center register-link">
                                            <p>계정이 없으신가요? <a href="join">회원가입</a></p>
                                        </div>
                                    
                                    <div class="text-center">        
                                    <p>
                                        <a id="kakao-login" href="https://kauth.kakao.com/oauth/authorize?client_id=45360f73f863670b5f6cfb33bf1fa775&redirect_uri=https://final-100.p-e.kr/kakao/login&response_type=code">
                                            <img src="../images/kakao_login_large.png" style="width: 190px; height: 45px;" />
                                        </a>
                                    </p>
                                    <p>
                                        <a id="naver-login" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=DEfYVqVL7Po51QB3sjNx&state=STATE_STRING&redirect_uri=http://localhost:8080/naver/login">
                                            <img src="../images/naver_login.png" style="width: 188px; height: 45px;"/>
                                        </a>
                                    </p>
                                    </div>

                                </form>
                                </div>


                        <!-- 사업자 로그인 내용 -->
                        <div class="tab-pane fade" id="pills-business" role="tabpanel" aria-labelledby="tab-business">
                            <form action="login" method="post" name="frm">
                                <input type="hidden" value="1" name="m_class" id="m_class2"/>
                            <!-- Email input -->
                            <div class="form-outline mb-4 form-floating mb-3">
                                <input type="text" id="m_email" name="m_email" class="form-control form-outline" placeholder="Email" />
                                <label for="m_email" class="form-label text-secondary fs-6">Email</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-4 form-floating mb-3">
                                <input type="password" id="m_pw" name="m_pw" class="form-control form-outline" placeholder="Password" />
                                <label for="m_pw" class="form-label text-secondary fs-6">Password</label>
                            </div>

                            <!-- Login button -->
                            <div class="text-center">
                                <button type="button" class="btn btn-primary btn-block mb-4 text-center"  id="login-button" onclick="exe(this.form)"><i class="fa fa-sign-in me-2" aria-hidden="true"></i>로그인</button>         

                            <hr class="divider">

                                <div class="text-center register-link">
                                    <p>계정이 없으신가요? <a href="join">회원가입</a></p>
                                </div>
                             </div>

                            
                            </p>
                        </form>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>

       
        </c:if>

        <div class="text-center" id="error-message"></div>


                  
            
                            <!--Jquery Plugins, main Jquery	-->
                            <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
                            <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

                           <script>

                                // $(function(){
                                //       //현재문서에서 id가 chk인 요소를 검색한다
                                //       let v1 = $("#chk").val();  
                                //     //  console.log(v1);
                                //     if(v1 != undefined){
                                //        // console.log(v1);
                                //        $( "#message" ).dialog();
                                //     }
                                // });
                                


                                function exe(frm) {
                                    if ($(frm.m_email).val() == "") {
                                    alert("이메일을 입력하세요");
                                    $(frm.m_email).focus();
                                    return;
                                    }

                                    if ($(frm.m_pw).val() == "") {
                                    alert("비밀번호를 입력하세요");
                                    $(frm.m_pw).focus();
                                    return;
                                    }

                                    $.ajax({
                                    type: "POST",
                                    url: "/reqLogin",
                                    data: $(frm).serialize(),
                                    datatype: "JSON",
                                    async: false
                                    })
                                    .done(function(response) {
                                    if (response.success == "1") {
                                        location.href = "/main/";
                                    } else {
                                        alert("로그인에 실패했습니다. 다시 시도해주세요.");
                                        location.href = "/login";
                                    }
                                    })
                                    .fail(function() {
                                    alert("로그인 중에 오류가 발생했습니다");
                                    });
                                }
               

                                $(document).ready(function() {
                                    //개인로그인 탭 눌려졌을때
                                    $("#tab-personal").on("click", function() { 

                                    $(this).addClass("active"); // 개인 로그인 탭을 활성화 상태로 설정
                                    $("#tab-business").removeClass("active"); // 사업자 로그인 탭의 활성화 상태 제거
                                    $("#pills-personal").addClass("show active"); // 개인 로그인 내용을 보여줌
                                    $("#pills-business").removeClass("show active"); // 사업자 로그인 내용을 숨김

                                    $("#m_class1").val("0"); // 개인 로그인 선택 시 m_class 값을 0으로 설정
                                    $("#kakao-login").show();
                                    $("#naver-login").show();

                                      // 엔터키 쳤을때 로그인 되게 하는 함수 추가
                                      handlePersonalLogin();

                                    });

                                    //사업자로그인 탭 눌려졌을때
                                    $("#tab-business").on("click", function() {

                                        $(this).addClass("active"); // 사업자 로그인 탭을 활성화 상태로 설정
                                        $("#tab-personal").removeClass("active"); // 개인 로그인 탭의 활성화 상태 제거
                                        $("#pills-business").addClass("show active"); // 사업자 로그인 내용을 보여줌
                                        $("#pills-personal").removeClass("show active"); // 개인 로그인 내용을 숨김

                                    $("#m_class2").val("1"); // 사업자 로그인 선택 시 m_class 값을 1으로 설정
                                    $("#kakao-login").hide();
                                    $("#naver-login").hide();

                                      // 엔터키 쳤을때 로그인 되게 하는 함수 추가
                                      handleBusinessLogin();

                                    });
                            });

                            // 엔터키 쳤을때 - 개인 로그인
                                function handlePersonalLogin() {
                                    $(this).addClass("active");
                                    $("#tab-business").removeClass("active");
                                    $("#pills-personal").addClass("show active");
                                    $("#pills-business").removeClass("show active");
                                    $("#m_class1").val("0");
                                    $("#kakao-login").show();
                                    $("#naver-login").show();
                                }

                                // 엔터키 쳤을때 - 사업자 로그인
                                function handleBusinessLogin() {
                                    $(this).addClass("active");
                                    $("#tab-personal").removeClass("active");
                                    $("#pills-business").addClass("show active");
                                    $("#pills-personal").removeClass("show active");
                                    $("#m_class2").val("1");
                                    $("#kakao-login").hide();
                                    $("#naver-login").hide();
                                }

                            </script>
                </article>
            </div>



        </main>
        <!--////////// Main end //////////////-->
        <!--////////// Foter start //////////////-->
        <jsp:include page="../main/mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
</html>
