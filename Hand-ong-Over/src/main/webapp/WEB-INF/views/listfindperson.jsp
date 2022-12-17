<%@ page import="edu.handong.handongover.board.FindPersonDAO" %>
<%@ page import="edu.handong.handongover.board.FindPersonVO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: nuri
  Date: 2022/12/16
  Time: 4:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>RoomList Give</title>
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
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deletepost.jsp?id=' + id;
        }
    </script>
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
<section class="py-5 text-center container">
    <div class="row py-lg-5">
        <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light" style="font-weight: bold">양도 해요</h1>
            <p class="lead text-muted">한동대 학생들이 방 양도를 쉽게 하기 위해 만든 웹서비스입니다.
                개발자들의 이야기가 궁금하다면 아래의 Github 링크를 클릭해 주세요! <br /> Thank you :)</p>
            <p>
                <a href="https://github.com/Hand-ong-Over/Hand-ong-Over-Web.git" target="_blank" class="btn btn-outline-primary my-2">github repository 이동</a>
                <a href="addfindperson.jsp" class="btn btn-outline-secondary my-2">글 추가하기</a>
            </p>
        </div>
    </div>
</section>
<%
    FindPersonDAO findPersonDAO = new FindPersonDAO();
    List<FindPersonVO> list = findPersonDAO.getFindPersonList();
    request.setAttribute("list",list);
%>

<div class="album py-5 bg-light">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:forEach items="${list}" var="u" varStatus="status">
                <div class="col">
                    <div class="card shadow-sm">
                        <img width="inherit" height="100%" src="${pageContext.request.contextPath}/upload/${u.getImages()}">
                        <div class="card-body">
                            <h5>${u.getTitle()}</h5>
                            <p class="card-text" style="height: 70px; overflow: hidden;">${u.getRoom_type()}, ${u.getPrice()}, ${u.getNum_of_people()}, 기간 : ${u.getStart_date()} ~ ${u.getEnd_date()}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group" style="border-radius: 3px;">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" style="background-color: dodgerblue; color: white; border: none"><a href="detailfindperson.jsp?id=${u.getSeq()}" target="_blank" style="text-decoration: none; color: white" >상세보기</a></button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary" style="border: none;"><a href="editform.jsp?id=${u.getSeq()}" style="color: dodgerblue; text-decoration: none; font-weight: 800;">수정</a></button>|
                                    <button type="button" class="btn btn-sm btn-outline-secondary" style="color: black; font-weight: 800; border: none;" onClick="javascript:delete_ok('${u.getSeq()}')">삭제</button>
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
