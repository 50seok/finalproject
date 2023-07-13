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
  #wrap {border-radius: 5px; position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px; line-height: 1.5; background: #888;}
    #title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    #close {position: absolute;top: 10px;right: 10px;color: #000;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    #close:hover {cursor: pointer;}
    #body {position: relative;overflow: hidden;}
    #desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    #ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap; color: azure;}
    #jibun {font-size: 11px;color: #888;margin-top: -2px;}
    #img {border: 0px; position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 0px solid #ddd;color: #888;overflow: hidden;}
.box {
    width: 120px;
    height: 80px;
    padding: 10px;
    display: inline-block;
    flex-direction: column;
    align-items: center;
    text-align: center;
    background-color: #81F7F3;
}
.fff{
    font-family: 'GoryeongStrawberry';
    color: #333333;
}

.custom-btn {
    width: 40px;
    height: 40px;
    padding: 10px 25px;
    border: 2px solid #000;
    font-family: 'Lato', sans-serif;
    font-size: 15px;
    font-weight: 500;
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    display: inline-block;
  }
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
  .fff{
    font-family: 'GoryeongStrawberry';
    color: #333333;
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
                    <H2 class="fff">5km 범위 내의 충전소 현황</H2>
                      <!-- 점보트론-->
                      <div class="p-2 mb-4 bg-body-tertiary rounded-3" style="background-color: rgb(158, 157, 152);">
                        <div id="map" style="width: 100%; height: 620px;"></div>
                      </div>
                  </div>
                  <div class="col-4 mb-4 fff">
                    <div class="h-100 p-5 text-bg-dark rounded-3" style="background-color: #222; color: #fff;">
                      <h2 style="font-size: 24px; font-weight: bold;">람쥐썬더 충전소 서비스 소개</h2>
                      <p style="font-size: 16px;">
                        람쥐썬더 충전소는 편리하게 충전소 위치를 알려주는 서비스입니다. 이 서비스는 두 가지 옵션을 제공합니다<br/> 탁송 서비스와 이동식 서비스입니다.
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
                <div class="row row-cols-2">
                  <div class="col-4">
                      <div class="h-100 p-5 text-bg-dark rounded-3">
                          <h2>Change the background</h2>
                          <p>Swap the background-color utility  look. Then, mix and match with additional component themes and more.</p>
                          <button class="btn btn-outline-light" type="button">Example button</button>
                      </div>
                  </div>
                  <div class="col-8">
                      <div class="container mt-5">
                            <div class="d-flex justify-content-between align-items-center">
                                <h1 class="mr-auto">공지사항</h1>
                                <label for="notice" class="ml-auto"><a href="/support/notice">최근 공지>> </a></label>
                            </div>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">번호</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">날짜</th>
                                    </tr>
                                </thead
                                <tbody>
                                    <c:forEach var="bvo" items="${b_ar}" varStatus="status">
                                    <tr>
                                        <th scope="row">${status.index + 1}</th>
                                        <td><c:if test="${bvo.b_val1 == 1}">
                                            <img src="../images/lock.png" style="width: 15px;">
                                        </c:if>
                                        <a href="/support/notice_view?b_idx=${bvo.b_idx}&cPage=1">
                                            <c:if test="${bvo.b_to == 1}">
                                            <span style="font-size: small; color: rgb(179, 179, 179);">[사업자]</span>
                                            </c:if>${bvo.b_title}</a>
                                        </td>
                                        <td>관리자</td>
                                        <td></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eedecff808e53f9bd6b2000c4b6da49a&libraries=services"></script>
        <script>
          function redirectToIntroduce() {
            window.location.href = "/infoma/";
          }
            
            var markers =[];//마커 배열
            var markers2 =[];//내 주변 마커 배열
            var overlays = [];//커스텀오버레이 배열
            var overlays2 = [];//내 주변 커스텀오버레이 배열
            var container = document.getElementById('map');
            var imageSrc_ok = "../images/greenicon.png";//충전가능 상태
            var imageSrc_redicon = "../images/redicon.png";//고장 및 점검 상태
            var imageSrc_chargeicon = "../images/chargeicon.png";//충전중 상태

            var options = {
                center: new kakao.maps.LatLng(37.483782, 126.9003409),
                level: 7
            };
            var radius = 5000;

            
            var map = new kakao.maps.Map(container, options);
            var geocoder = new kakao.maps.services.Geocoder();
            // 원(Circle)의 옵션으로 넣어준 반지름
            
             // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
             if (navigator.geolocation) {
            
                // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                navigator.geolocation.getCurrentPosition(function(position) {
                    //위도경도를 불러온다.
                    var lati = position.coords.latitude, // 위도
                        lon = position.coords.longitude; // 경도 -->
                    //var lati = 35.1801639, // 위도
                    //    lon = 129.074660; // 경도 -->
                    //console.log(lati);
                    //console.log(lon);

                    var locPosition = new kakao.maps.LatLng(lati, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
                    
                    displayMarker(locPosition, message);//마커,인포 표시함수사용
                    //주소를 불러오는 함수 호출
                    getAddr(lati, lon);
                    //주소를 불러오는 함수
                    function getAddr(lati,lon){
                        let geocoder2 = new kakao.maps.services.Geocoder();

                        let coord = new kakao.maps.LatLng(lati, lon);

                        let callback = function(result, status) {

                            if (status === kakao.maps.services.Status.OK) {
                                //console.log(result[0].address.address_name);
                                var city = result[0].address.address_name;

                                //var city = "부산광역시 연제구 중앙대로 1001";
                                //console.log(city+"/////////////////////////////");

                                geocoder.addressSearch(result[0].address.address_name, function(result, status) {
                                      
                                    //정상적으로 검색이 완료됐다면.....
                                    if (status === kakao.maps.services.Status.OK) {
                                        var ind = 0;
                                        var mnd = 0;
                                        var type;
                                        <c:forEach items="${ar}" var="vo">
                                            <c:if test = "${vo.cpTp eq '1'}">
                                                type = 'B타입(5핀)';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '2'}">
                                                type = 'C타입(5핀)';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '3'}">
                                                type = 'BC타입(5핀)';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '4'}">
                                                type = 'BC타입(7핀)';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '5'}">
                                                type = 'DC차데모';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '6'}">
                                                type = 'AC3상';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '7'}">
                                                type = 'DC콤보';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '8'}">
                                                type = ' DC차데모+DC콤보';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '10'}">
                                                type = 'DC차데모+AC3상+DC콤보';
                                            </c:if>
                                            var imageSize = new kakao.maps.Size(24, 35);

                                            var pos = new kakao.maps.LatLng('${vo.lat}', '${vo.longi}');
                                            var overlayid = "idnum"+ ind++;
                                            var content = document.createElement('div');
                                            content.className = overlayid;
                                            content.style = 'display : none;';
                                            content.innerHTML = '<div id="wrap">' + 
                                            '       <div id="info">' + 
                                                '        <div id="title">' + 
                                            '            ${vo.csNm}' + 
                                            '            <span id="close" onClick="removeOverlay(\''+overlayid+'\')" title="닫기"></span>' + 
                                            '        </div>' + 
                                            '        <div id="body">' + 
                                                '            <div id="img">' +
                                            '                <img src="../images/chargestation.png" width="73" height="70"/>' +
                                            '           </div>' +  
                                            '            <div id="desc">' + 
                                            '                <div id="ellipsis">${vo.addr}<br/>'+type+'</div>' +   
                                            '            </div>' + 
                                            '        </div>' +    
                                            '    </div>' +    
                                            '</div>';
                                            
                                            // 마커 위에 커스텀오버레이를 표시합니다
                                            // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                                            <c:if test = "${vo.cpStat eq '1'}">
                                                var markerImage = new kakao.maps.MarkerImage(imageSrc_ok, imageSize);
                                            </c:if>
                                             <c:if test = "${vo.cpStat eq '2'}">
                                                    var markerImage = new kakao.maps.MarkerImage(imageSrc_chargeicon, imageSize); 
                                            </c:if>
                                            <c:if test = "${vo.cpStat eq '3'}">
                                                    var markerImage = new kakao.maps.MarkerImage(imageSrc_redicon, imageSize); 
                                            </c:if>
                                            var marker = new kakao.maps.Marker({
                                                position: pos,
                                                image: markerImage,
                                                title:overlayid
                                            });
                                            
                                            //marker.setMap(map);
                                            markers.push(marker);
                                            
                                            var overlay = new kakao.maps.CustomOverlay({
                                                content: content,
                                                position: marker.getPosition(),
                                                map: map
                                            });

                                            overlays.push(overlay);
                                            </c:forEach>

                                            //화면상단에 자신의 위치 표시
                                            let str2 ="";
                                            str2 += city;
                                            $("#myposition").html(str2);
                                            
                                            //범위지정되어 마커를 맵에 뿌림
                                            for(i=0; i<markers.length; i++){
                                                //console.log(markers[i]);
                                                var c1 = locPosition;
                                                var c2 = markers[i].getPosition();
                                                //console.log(c2);
                                                var poly = new daum.maps.Polyline({
                                                    // map: map, 을 하지 않아도 거리는 구할 수 있다.
                                                    path: [c1, c2]
                                                });
                                                //console.log(poly);
                                                var dist = poly.getLength(); // m 단위로 리턴
                                                //console.log(dist);
                                               //console.log(dist);
                                                if (dist < radius) {
                                                    markers[i].setMap(map);
                                                    overlays2.push(overlays[i]);
                                                    markers2.push(markers[i]);
                                                    //console.log('markers-' + i, markers[i]);
                                                } else {
                                                    markers[i].setMap(null);
                                                }
                                            }

                                            
                                        //오베레이즈2배열을 소트 함수를 이용해서 오름차순시킴
                                        overlays2.sort(function(a, b) {
                                        var c1 = locPosition;
                                        var c2a = a.getPosition();
                                        var c2b = b.getPosition();

                                        var polyA = new daum.maps.Polyline({
                                            path: [c1, c2a]
                                        });
                                        var polyB = new daum.maps.Polyline({
                                            path: [c1, c2b]
                                        });

                                        var distA = polyA.getLength();
                                        var distB = polyB.getLength();

                                        return distA - distB;

                                        });
                                        
                                        //console.log(overlays2[0].cc.innerText);
                                        
                                        //console.log(markers2[0].getPosition().Ma);
                                        //console.log(markers2[0].getPosition().La);
                                        
                                        let str ="";
                                        //화면왼쪽에 목록 표출
                                        var d = 1;
                                        for(a=0; a<overlays2.length; a++){
                                            str +='<li class="list-group-item">';
                                            str +='<a style="text-decoration: none;" class="tag-link" href="#" data-index="'+a+'">';
                                            str += d+'.' + overlays2[a].cc.innerText;
                                            str +='</a>';
                                            str +='</li>';
                                            d++;
                                        }
                                        $("#list1").html(str);
                                        //마커 클릭시 오버레이 커스텀 나타남
                                        for(i=0; i<markers.length; i++){
                                            kakao.maps.event.addListener(markers[i], 'click', function(){
                                                $('.'+this.Gb).css('display', 'block');
                                            })   
                                        }
                                        var polyline, startMarker;
                                        //비동기식 전송으로 경로를 불러옴
                                        $('.tag-link').click(function(event) {
                                            // 몇 번째 항목인지 가져옵니다.
                                            
                                            if (startMarker) {
                                                startMarker.setMap(null); // 마커 숨기기
                                                startMarker = null; // 변수 초기화
                                            }
                                            if (polyline) {
                                                polyline.setMap(null); // 마커 숨기기
                                                polyline = null; // 변수 초기화
                                            }
                                            var index = $(this).data("index");
                                            var lon2 = overlays2[index].getPosition().La;
                                            var lati2 = overlays2[index].getPosition().Ma;
                                            var lon3 = lon;
                                            var lati3 = lati;
                                            $.ajax({
                                            url: '/here',
                                            type: "POST",
                                            dataType: "json",
                                            data: { lati3: lati3, lon3: lon3, lati2: lati2, lon2: lon2 }
                                            }).done(function(data) {
                                            

                                            // 루트 그리기 위해 json에서 데이터를 꺼냄
                                            var route = data.key[0];
                                            var path = route.sections[0].roads;
                                            var linePath = [];
                                            for (var i = 0; i < path.length; i++) {
                                                var vertexes = path[i].vertexes;
                                                for (var j = 0; j < vertexes.length; j += 2) {
                                                var point = new kakao.maps.LatLng(vertexes[j + 1], vertexes[j]);
                                                linePath.push(point);
                                                }
                                            }
                                            polyline = new kakao.maps.Polyline({
                                                path: linePath,
                                                strokeWeight: 5,
                                                strokeColor: '#0080FF',
                                                strokeOpacity: 1,
                                                strokeStyle: 'solid'
                                            });

                                            polyline.setMap(map); // 경로를 맵에 추가
                                            
                                            // 출발지 마커
                                            startMarker = new kakao.maps.Marker({
                                                map: map,
                                                position: new kakao.maps.LatLng(route.summary.origin.y, route.summary.origin.x)
                                            });

                                            }).fail(function(err) {
                                            console.log(err + " Failed222222222222222222");
                                            });
                                        });
                                    }
                                });
                                
                            }
                        }
                            geocoder2.coord2Address(coord.getLng(), coord.getLat(), callback);
                        } 
                    });
            } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
                
                var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), 

                    message = 'geolocation을 사용할수 없어요..'
                    
                displayMarker(locPosition, message);
            }
            
            function displayMarker(locPosition, message) {
                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({  
                    map: map, 
                    position: locPosition
                }); 
                var iwContent = message, // 인포윈도우에 표시할 내용
                    iwRemoveable = true;


                // 인포윈도우를 생성합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content : iwContent,
                    removable : iwRemoveable
                });
                // 인포윈도우를 마커위에 표시합니다 
                infowindow.open(map, marker);
                // 지도 중심좌표를 접속위치로 변경합니다
                map.setCenter(locPosition);   
            }
            
            // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
            function removeOverlay(overlayid) {
                $('.'+overlayid).css('display', 'none');
            }

            // 지도 위에 표시되고 있는 마커를 모두 제거합니다
            function removeMarker() {
                for ( var i = 0; i < markers.length; i++ ) {
                    markers[i].setMap(null);
                }   
                markers = [];
            }

        </script>
</body>
</html>
