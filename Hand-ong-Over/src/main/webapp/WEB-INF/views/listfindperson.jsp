<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="edu.handong.handongover.board.FindPersonDAO" %>
<%@ page import="edu.handong.handongover.board.FindPersonVO" %>
<%@ page import="java.util.List" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find Person</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }
        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }
    </style>
    <script>
        function delete_ok(id){
            var is_confirm = confirm("정말로 삭제하겠습니까?");
            if(is_confirm) location.href='findperson/deleteok/' + id;
        }
    </script>
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
<section class="py-5 text-center container">
    <div class="row py-lg-5">
        <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light" style="font-weight: bold">양도 해요</h1>
            <p class="lead text-muted">한동대 학생들이 방 양도를 쉽게 하기 위해 만든 웹서비스입니다.
                개발자들의 이야기가 궁금하다면 아래의 Github 링크를 클릭해 주세요! <br /> Thank you :)</p>
            <p>
                <a href="https://github.com/Hand-ong-Over/Hand-ong-Over-Web.git" target="_blank" class="btn btn-outline-primary my-2">github repository 이동</a>
                <a href="findperson/add" class="btn btn-outline-secondary my-2">글 추가하기</a>
                <button type="button" class="btn btn-primary" onclick="location.href='../login/logout'">로그아웃</button>
            </p>
        </div>
    </div>
</section>

<div class="album py-5 bg-light">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:forEach items="${findPersonList}" var="u">
                <div class="col">
                    <div class="card shadow-sm">
                        <c:choose>
                            <c:when test="${u.images == null}">
                                <img src="https://via.placeholder.com/225.png?text=No+Image" alt="No Image" width="100%" height="225">
                            </c:when>
                            <c:otherwise>
                                <c:set var="images" value="${u.images.split(';')}"/>
                                <img src="${pageContext.request.contextPath}/resources/upload/${images[0]}" alt="" width="100%" height="225">
                            </c:otherwise>
                        </c:choose>
                        <div class="card-body">
                            <h5>${u.title}</h5>
                            <p class="card-text" style="height: 70px; overflow: hidden;">${u.room_type}, ${u.price}만원, ${u.num_of_people}명, 기간 : ${u.start_date} ~ ${u.end_date}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group" style="border-radius: 3px;">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='findperson/${u.article_id}'" style="background-color: dodgerblue; color: white; border: none">상세보기</button>
                                    <c:if test="${u.writer eq user.userid}">
                                        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='findperson/editform/${u.article_id}'" style="border: none;">수정</button>|
                                        <button type="button" class="btn btn-sm btn-outline-secondary" style="color: black; font-weight: 800; border: none;" onClick="javascript:delete_ok('${u.article_id}')">삭제</button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<br/>
</body>
</html>
