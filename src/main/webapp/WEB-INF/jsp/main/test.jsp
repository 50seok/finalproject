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
<style>
  .plus{ position: absolute;top:0px;right: 0px; width: 31px;height:31px; background-color: #eaeaea; cursor:pointer; z-index: 1; }
  .plus:before{ position:absolute; top: 50%; left: 50%; width: 16px; height: 2px; margin: -1px 0 0 -8px; background: #fff; content: ''; }
  .plus:after{position: absolute; top: 50%; left: 50%; width: 2px; height: 16px; margin: -8px 0 0 -1px; background: #fff; content: ''; }
  .ellipsis {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
  }
</style>
  </head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->
        <!--////////// Main start //////////////-->
        <main> 
          <div class="container-xxl mt-4">
              <div class="row">
                <div class="row row-cols-2">
                  <div class="col-8">
                      <!-- 점보트론-->
                      <div class="p-5 mb-4 bg-body-tertiary rounded-3" style="background-color: rgb(158, 157, 152);">
                          <div class="container-fluid py-5">
                              <div id="carouselExampleCaptions" class="carousel slide">
                                  <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                  </div>
                                  <div class="carousel-inner">
                                    <div class="carousel-item active" style="text-align: center;">
                                      <img src="../images/cafe.png" class="" alt="...">
                                      <div class="carousel-caption d-none d-md-block">
                                        <h5>커피한잔</h5>
                                        <p>여러가지 커피를 맛보세용.</p>
                                      </div>
                                    </div>
                                    <div class="carousel-item " style="text-align: center;">
                                      <img src="../images/car_icon.png" class="" alt="...">
                                      <div class="carousel-caption d-none d-md-block">
                                        <h5>자동차 충전</h5>
                                        <p>개꿀띠.</p>
                                      </div>
                                    </div>
                                    <div class="carousel-item" style="text-align: center;">
                                      <img src="../images/chargeicon.png" class="" alt="...">
                                      <div class="carousel-caption d-none d-md-block">
                                        <h5>블라블라</h5>
                                        <p>블라블라블라블라블라블라블라블라</p>
                                      </div>
                                    </div>
                                  </div>
                                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                  </button>
                                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                  </button>
                                </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-4 mb-4">
                    <div class="h-100 p-5 text-bg-dark rounded-3" style="background-color: #222; color: #fff;">
                      <h2 style="font-size: 24px; font-weight: bold;">람쥐썬더 충전소 서비스 소개</h2>
                      <p style="font-size: 16px;">
                        람쥐썬더 충전소는 편리하게 충전소 위치를 알려주는 서비스입니다. 이 서비스는 두 가지 옵션을 제공합니다: 탁송 서비스와 이동식 서비스입니다.
                      </p>
                        <ul style="font-size: 16px; margin-left: 20px;">
                          <li>탁송 서비스:
                            <ul>
                              <li>이 서비스를 이용하면 고객은 충전이 필요한 위치를 지정할 수 있습니다.</li>
                              <li>고객은 충전량을 설정하여 충전을 요청할 수 있습니다.</li>
                              <li>람쥐썬더 충전소는 충전이 완료된 후에 충전된 차량을 고객이 원하는 위치로 탁송해줍니다.</li>
                              <li>이를 통해 고객은 원하는 위치에서 편리하게 차량을 충전할 수 있습니다.</li>
                            </ul>
                          </li>
                        </ul>
                        <div class="area ellipsis">
                        <ul style="font-size: 16px; margin-left: 20px;">
                          <li>이동식 서비스:
                            <ul>
                              <li>이 서비스를 이용하면 고객은 원하는 위치에서 기다리면 됩니다.</li>
                              <li>고객이 특정 장소에서 기다리면 람쥐썬더 충전소의 기사가 충전차량을 운전하여 이동합니다.</li>
                              <li>충전차량이 고객의 위치로 이동하여 충전 서비스를 제공합니다.</li>
                              <li>이를 통해 고객은 이동하지 않고도 바로 차량을 충전할 수 있으며, 편의성이 크게 향상됩니다.</li>
                            </ul>
                          </li>
                        </ul>
                        <p style="font-size: 16px;">
                          람쥐썬더 충전소는 고객의 편의성을 높이기 위해 탁송 서비스와 이동식 서비스를 제공합니다. 이를 통해 고객은 원하는 위치에서 충전할 수 있으며, 이동이 필요한 경우에도 편리하게 충전 서비스를 이용할 수 있습니다.
                        </p>
                      </div>
                      <form id="introduceForm">
                        <button class="btn btn-outline-secondary" type="button" onclick="redirectToIntroduce()">더보기</button>
                      </form>
                    </div>
                  </div>
                </div>
                <div class="row row-cols-3">
                  <div class="col-4 mb-4">
                      <div class="h-100 p-5 bg-body-tertiary border rounded-3">
                          <h2>Add borders</h2>
                          <p>Or, keep it light and add a boe hood alignment and sizing of both column's content for equal-height.</p>
                          <button class="btn btn-outline-secondary" type="button">Example button</button>
                      </div>
                  </div>
                  <div class="col-4 mb-4">
                      <div class="h-100 p-5 text-bg-dark rounded-3">
                          <h2>Change the background</h2>
                          <p>Swap the background-color utility and add n, mix and match with additional component themes and more.</p>
                          <button class="btn btn-outline-light" type="button">Example button</button>
                      </div>
                  </div>
                  <div class="col-4 mb-4">
                      <div class="h-100 p-5 bg-body-tertiary border rounded-3">
                          <h2>Add borders</h2>
                          <p>Or, keep it light and add a borded the alignment and sizing of both column's content for equal-height.</p>
                          <button class="btn btn-outline-secondary" type="button">Example button</button>
                      </div>  
                  </div>
                </div>
                <div class="row row-cols-2">
                  <div class="col-4">
                      <div class="h-100 p-5 text-bg-dark rounded-3">
                          <h2>Change the background</h2>
                          <p>Swap the background-color utility  look. Then, mix and match with additional component themes and more.</p>
                          <button class="btn btn-outline-light" type="button">Example button</button>
                      </div>
                  </div>
                  <div class="col-8">
                      <div class="p-5 bg-body-tertiary rounded-3" style="background-color: rgb(158, 157, 152);">
                          <div class="container-fluid py-5">
                            <h1 class="display-5 fw-bold">Custom jumbotron</h1>
                            <p class="col-md-8 fs-4">Using a  the examples below for how you can remix and restyle it to your liking.</p>
                          </div>
                      </div>
                  </div>
                </div>
              </div>
          </div>
      </main>
        <!--////////// Main end //////////////-->
        <!--////////// Foter start //////////////-->
        <jsp:include page="mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->

        <script>
          function redirectToIntroduce() {
            window.location.href = "/infoma/";
          }
        </script>
</body>
</html>
