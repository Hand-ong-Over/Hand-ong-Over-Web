<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>양도해요 추가</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/FileUpload.js"></script>
    <style>
        input{
            width: 450px;
        }
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb4fb90c9768b47c4b5c3238bf160dc8"></script>
</head>
<body>
<header>
    <div class="navbar shadow-sm" style="background-color: dodgerblue">
        <div class="container">
            <a href="${pageContext.request.contextPath}" class="navbar-brand d-flex align-items-center">
                <strong style="color: white">Hand-ong Over</strong>
            </a>
        </div>
    </div>
</header>
<section class="text-center container" style="margin-top: 30px">
    <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light" style="font-weight: bold">양도 해요</h1>
    </div>
</section>
<div align="left" style="margin-left: 500px; margin-right: 500px">
    <form action="addok" enctype="multipart/form-data" method="post">
        <input type="hidden" id="writer" name="writer" value="${user.userid}">

        <br><label for="title" class="form-label">제목</label>
        <br><input type="text" id="title" name="title"/>

        <br><div id="photos" style="margin-top: 10px">
            <p class="form-label">방 사진</p>
            <button type="button" id="add-photo-button" class="btn btn-primary" onclick="addPhoto()">사진 추가</button>
            <button type="button" id="remove-photo-button" class="btn btn-warning d-none" onclick="removePhoto()">사진 삭제</button>
        </div>

        <br><br><label for="address" class="form-label">주소</label>
        <br><input type="text" id="address" name="address"/>
        <div id="map" style="width:500px;height:400px;"></div>
        <input type="hidden" id="location_latitude">
        <input type="hidden" id="location_longitude">

        <br><br><label for="location_info" class="form-label">위치 안내</label>
        <br><input type="text" id="location_info" name="location_info"/>

        <br><br><label for="inlineRadio1" class="form-label" style="width: 223px">방 유형</label>
        <label for="room_size" class="form-label">방 크기</label>
        <br><input class="form-check-input" type="radio" name="room_type" id="inlineRadio1" value="원룸">
        <label class="form-check-label" for="inlineRadio1" style="width: 40px">원룸</label>
        <input class="form-check-input" type="radio" name="room_type" id="inlineRadio2" value="미투">
        <label class="form-check-label" for="inlineRadio2" style="width: 40px">미투</label>
        <input class="form-check-input" type="radio" name="room_type" id="inlineRadio3" value="정투">
        <label class="form-check-label" for="inlineRadio3" style="width: 60px">정투</label>
        <input type="number" id="room_size" name="room_size" style="width: 226px"/>

        <br><br><label for="price" class="form-label">월세</label>
        <br><input type="number" id="price" name="price" style="width: 50px"/>
        <label class="form-label">만원</label>

        <br><br><label for="M" class="form-label" style="width: 223px">성별</label>
        <br><input class="form-check-input" type="radio" name="sex" id="M" value="1">
        <label class="form-check-label" for="M" style="width: 40px">남</label>
        <input class="form-check-input" type="radio" name="sex" id="F" value="0">
        <label class="form-check-label" for="F" style="width: 40px">여</label>

        <br><br><label for="num_of_people" class="form-label">인원</label>
        <br><input type="number" id="num_of_people" name="num_of_people"/>

        <br><br><label for="start_date" class="form-label">시작 일자</label>
        <br><input type="date" id="start_date" name="start_date"/>

        <br><br><label for="end_date" class="form-label">종료 일자</label>
        <br><input type="date" id="end_date" name="end_date"/>

        <br><br><label for="SY" class="form-label" style="width: 223px">흡연여부</label>
        <br><input class="form-check-input" type="radio" name="smoke" id="SY" value="1">
        <label class="form-check-label" for="SY" style="width: 40px">예</label>
        <input class="form-check-input" type="radio" name="smoke" id="SN" value="0">
        <label class="form-check-label" for="SN" style="width: 40px">아니요</label>

        <br><br><label for="AY" class="form-label" style="width: 223px">음주여부</label>
        <br><input class="form-check-input" type="radio" name="alcohol" id="AY" value="1">
        <label class="form-check-label" for="AY" style="width: 40px">예</label>
        <input class="form-check-input" type="radio" name="alcohol" id="AN" value="0">
        <label class="form-check-label" for="AN" style="width: 40px">아니요</label>

        <br><br><label for="PY" class="form-label" style="width: 223px">애완동물 여부</label>
        <br><input class="form-check-input" type="radio" name="pet" id="PY" value="1">
        <label class="form-check-label" for="PY" style="width: 40px">예</label>
        <input class="form-check-input" type="radio" name="pet" id="PN" value="0">
        <label class="form-check-label" for="PN" style="width: 40px">아니요</label>

        <br><br><label for="additional_info" class="form-label">기타사항</label>
        <br><textarea cols="50" rows="5" id="additional_info" name="additional_info"></textarea>
        <br><br>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button class="btn btn-outline-primary me-md-2" type="submit" value="Add">추가</button>
            <button class="btn btn-outline-secondary" type="button"><a href="" style="text-decoration: none; color: gray">취소</a></button>
        </div>
    </form>
</div>
</body>
</html>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(36.103567, 129.388885), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
            infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

    // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);

    // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

                var content = '<div class="bAddr">' +
                        '<span class="title">법정동 주소정보</span>' +
                        detailAddr +
                        '</div>';

                // 마커를 클릭한 위치에 표시합니다
                marker.setPosition(mouseEvent.latLng);
                marker.setMap(map);

                document.getElementById('location_latitude').value = mouseEvent.latLng.getLat();
                document.getElementById('location_longitude').value = mouseEvent.latLng.getLng();

                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                infowindow.setContent(content);
                infowindow.open(map, marker);
            }
        });
    });

    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', function() {
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    });

    function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
    }

    function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청합니다
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }

    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
    function displayCenterInfo(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');

            for(var i = 0; i < result.length; i++) {
                // 행정동의 region_type 값은 'H' 이므로
                if (result[i].region_type === 'H') {
                    infoDiv.innerHTML = result[i].address_name;
                    break;
                }
            }
        }
    }
</script>