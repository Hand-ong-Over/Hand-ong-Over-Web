<%--
  Created by IntelliJ IDEA.
  User: nuri
  Date: 2022/12/16
  Time: 4:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EditRoom Give</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<header>
    <div class="navbar shadow-sm" style="background-color: dodgerblue">
        <div class="container">
            <a href="listfindperson.jsp" class="navbar-brand d-flex align-items-center">
                <strong style="color: white">Hand-ong Over</strong>
            </a>
        </div>
    </div>
</header>
<div align="left" style="margin-left: 500px; margin-right: 500px">
    <form:form modelAttribute="FindPersonVO" method="POST" action="../editok">
        <form:hidden path="seq"/>
        <br><label class="form-label">제목</label>
        <br><form:input path="title" />

        <br><br><label class="form-label">방 사진</label>
        <br><form:file path="images" />

        <br><br><label class="form-label">주소</label>
        <br><form:input path="address" />

        <br><br><label class="form-label">위치 안내</label>
        <br><form:input path="location_info" />

        <br><br><label for="inlineRadio1" class="form-label" style="width: 223px">방 유형</label>
        <label for="room_size" class="form-label">방 크기</label>
        <br><input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
        <label class="form-check-label" for="inlineRadio1" style="width: 40px">원룸</label>
        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
        <label class="form-check-label" for="inlineRadio2" style="width: 40px">미투</label>
        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
        <label class="form-check-label" for="inlineRadio3" style="width: 60px">정투</label>
        <input type="text" id="room_size" name="room_size" style="width: 226px"/>

        <br><br><label class="form-label">월세</label>
        <br><form:input path="price" />
        <label class="form-label">만원</label>

        <br><br><label for="M" class="form-label" style="width: 223px">성별</label>
        <br><input class="form-check-input" type="radio" name="sex" id="M" value="option1">
        <label class="form-check-label" for="M" style="width: 40px">남</label>
        <input class="form-check-input" type="radio" name="sex" id="F" value="option2">
        <label class="form-check-label" for="F" style="width: 40px">여</label>

        <br><br><label for="num_of_people" class="form-label">인원</label>
        <br><form:input path="num_of_people" />

        <br><br><label class="form-label">시작 일자</label>
        <br><form:date path="start_date" />

        <br><br><label for="end_date" class="form-label">종료 일자</label>
        <br><form:date path="end_date" />

        <br><br><label for="SY" class="form-label" style="width: 223px">흡연여부</label>
        <br><input class="form-check-input" type="radio" name="smoke" id="SY" value="option1">
        <label class="form-check-label" for="SY" style="width: 40px">예</label>
        <input class="form-check-input" type="radio" name="smoke" id="SN" value="option2">
        <label class="form-check-label" for="SN" style="width: 40px">아니요</label>

        <br><br><label for="AY" class="form-label" style="width: 223px">성별</label>
        <br><input class="form-check-input" type="radio" name="alcohol" id="AY" value="option1">
        <label class="form-check-label" for="AY" style="width: 40px">예</label>
        <input class="form-check-input" type="radio" name="alcohol" id="AN" value="option2">
        <label class="form-check-label" for="AN" style="width: 40px">아니요</label>

        <br><br><label class="form-label">기타사항</label>
        <br><form:textarea cols="50" rows="5" path="additional_info" />
        <br><br>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button class="btn btn-outline-primary me-md-2" type="submit" value="Edit">수정</button>
            <button class="btn btn-outline-secondary" type="button"><a href="listfindperson.jsp" style="text-decoration: none; color: gray">취소</a></button>
        </div>
    </form>
</div>
</body>
</html>
