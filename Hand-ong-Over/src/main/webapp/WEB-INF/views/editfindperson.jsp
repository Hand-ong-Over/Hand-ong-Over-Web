<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>양도하는 글 수정</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/FileUpload.js"></script>
</head>
<body>
<header>
    <div class="navbar shadow-sm" style="background-color: dodgerblue">
        <div class="container">
            <a href="" class="navbar-brand d-flex align-items-center">
                <strong style="color: white">Hand-ong Over</strong>
            </a>
        </div>
    </div>
</header>
<div align="left" style="margin-left: 500px; margin-right: 500px">
    <form action="../editok" enctype="multipart/form-data" method="post">
        <input type="hidden" name="article_id" value="${findPersonVO.article_id}">
        <input type="hidden" name="writer" value="${findPersonVO.writer}">

        <br><label for="title" class="form-label">제목</label>
        <br><input type="text" id="title" name="title" value="${findPersonVO.title}">
        <br><br><label class="form-label">방 사진</label>
        <br><p class="text-secondary">사진은 다시 업로드해주세요... 어떻게 하는지 알아내긴 했는데...</p>
<%--        <c:set var="images" value="${findPersonVO.images.split(';')}" />--%>

        <div id="photos">
            <button type="button" id="add-photo-button" class="btn btn-primary" onclick="addPhoto()">사진 추가</button>
            <button type="button" id="remove-photo-button" class="btn btn-warning d-none" onclick="removePhoto()">사진 삭제</button>
<%--            <c:set var="i" value="0" />--%>
<%--            <c:forEach var="image" items="${images}">--%>
<%--                <br><img src="${pageContext.request.contextPath}/resources/upload/${image}" id="img${i}" width="100" height="100">--%>
<%--                <input type="file" accept="image/png image/jpeg" id="photo${i}" name="photo${i}" class="form-control photo-upload mt-1" value="${pageContext.request.contextPath}/resources/upload/${image}">--%>
<%--            </c:forEach>--%>
        </div>

        <br><br><label for="address" class="form-label">주소</label>
        <br><input type="text" id="address" name="address" value="${findPersonVO.address}">

        <br><br><label for="location_info" class="form-label">위치 안내</label>
        <br><input type="text" id="location_info" name="location_info" value="${findPersonVO.location_info}">

        <br><br><label for="inlineRadio1" class="form-label" style="width: 223px">방 유형</label>
        <label for="room_size" class="form-label">방 크기</label>
        <br><input type="radio" class="form-check-input" name="room_type" id="inlineRadio1" value="원룸"/>
        <label class="form-check-label" for="inlineRadio1" style="width: 40px">원룸</label>
        <input type="radio" class="form-check-input" name="room_type" id="inlineRadio2" value="미투"/>
        <label class="form-check-label" for="inlineRadio2" style="width: 40px">미투</label>
        <input type="radio" class="form-check-input" name="room_type" id="inlineRadio3" value="정투"/>
        <label class="form-check-label" for="inlineRadio3" style="width: 60px">정투</label>
        <input type="text" id="room_size" name="room_size" style="width: 226px" value="${findPersonVO.room_size}"/>

        <br><br><label for="price" class="form-label">월세</label>
        <br><input type="number" id="price" name="price" style="width: 50px" value="${findPersonVO.price}"/>
        <label class="form-label">만원</label>

        <br><br><label for="M" class="form-label" style="width: 223px">성별</label>
        <br><input type="radio" class="form-check-input" name="sex" id="M" value="1"/>
        <label class="form-check-label" for="M" style="width: 40px">남</label>
        <input type="radio" class="form-check-input" name="sex" id="F" value="0"/>
        <label class="form-check-label" for="F" style="width: 40px">여</label>

        <br><br><label for="num_of_people" class="form-label">인원</label>
        <br><input type="number" id="num_of_people" name="num_of_people" value="${findPersonVO.num_of_people}" />

        <br><br><label for="start_date" class="form-label">시작 일자</label>
        <br><input type="date" id="start_date" name="start_date" value="${findPersonVO.start_date}" />

        <br><br><label for="end_date" class="form-label">종료 일자</label>
        <br><input type="date" id="end_date" name="end_date" value="${findPersonVO.end_date}" />

        <br><br><label class="form-label" style="width: 223px">흡연여부</label>
        <br><input type="radio" class="form-check-input" name="smoke" id="SY" value="1" />
        <label class="form-check-label" for="SY" style="width: 40px">예</label>
        <input type="radio" class="form-check-input" name="smoke" id="SN" value="0" />
        <label class="form-check-label" for="SN" style="width: 40px">아니요</label>

        <br><br><label class="form-label" style="width: 223px">음주여부</label>
        <br><input type="radio" class="form-check-input" name="alcohol" id="AY" value="1" />
        <label class="form-check-label" for="AY" style="width: 40px">예</label>
        <input type="radio" class="form-check-input" name="alcohol" id="AN" value="0" />
        <label class="form-check-label" for="AN" style="width: 40px">아니요</label>

        <br><br><label class="form-label" style="width: 223px">애완동물 여부</label>
        <br><input type="radio" class="form-check-input" name="pet" id="PY" value="1" />
        <label class="form-check-label" for="PY" style="width: 40px">예</label>
        <input type="radio" class="form-check-input"  name="pet" id="PN" value="0" />
        <label class="form-check-label" for="PN" style="width: 40px">아니요</label>

        <br><br><label for="additional_info" class="form-label">기타사항</label>
        <br><textarea cols="50" rows="5" id="additional_info" name="additional_info">${findPersonVO.additional_info}</textarea>
        <br><br>

        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <button class="btn btn-outline-success me-md-2" type="submit" value="Edit">수정</button>
        <button class="btn btn-outline-secondary" type="button" onclick="history.back()">취소</button>
        </div>
    </form>
</div>
</body>
</html>
<script>
    $(function () {
        switch ("${findPersonVO.room_type}") {
            case "원룸":
                $("#inlineRadio1").attr("checked", true);
                break;
            case "미투":
                $("#inlineRadio2").attr("checked", true);
                break;
            case "정투":
                $("#inlineRadio3").attr("checked", true);
                break;
        }
        switch ("${findPersonVO.sex}") {
            case "1":
                $("#M").attr("checked", true);
                break;
            case "0":
                $("#F").attr("checked", true);
                break;
        }
        switch ("${findPersonVO.smoke}") {
            case "1":
                $("#SY").attr("checked", true);
                break;
            case "0":
                $("#SN").attr("checked", true);
                break;
        }
        switch ("${findPersonVO.alcohol}") {
            case "1":
                $("#AY").attr("checked", true);
                break;
            case "0":
                $("#AN").attr("checked", true);
                break;
        }
        switch ("${findPersonVO.pet}") {
            case "1":
                $("#PY").attr("checked", true);
                break;
            case "0":
                $("#PN").attr("checked", true);
                break;
        }
    });
</script>