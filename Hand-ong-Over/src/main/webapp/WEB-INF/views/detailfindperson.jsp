<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>양도해요 - ${findPerson.title}</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
        <h1 class="fw-light" style="font-weight: bold">상세 보기</h1>
    </div>
</section>
<div align="left" style="margin-left: 500px; margin-right: 500px">
    <form action="addok" enctype="multipart/form-data" method="post">
        <input type="hidden" id="writer" name="writer" value="${user.userid}">

        <br><label class="form-label">제목</label>
        <br><label class="form-label"> - ${findPerson.title}</label>

        <br></bt><br><label class="form-label">작성자</label>
        <br><label class="form-label"> - ${findPerson.writer}</label>

        <br><br><div id="files" style="margin-top: 10px">
        <p class="form-label">방 사진</p>
        <div>
            <c:choose>
                <c:when test="${findPerson.images == null}">
                    <img src="https://via.placeholder.com/225.png?text=No+Image" alt="No Image" width="100%" height="225">
                </c:when>
                <c:otherwise>
                    <c:set var="images" value="${findPerson.images.split(';')}"/>
                    <c:forEach var="image" items="${images}">
                        <img src="${pageContext.request.contextPath}/resources/upload/${image}" alt="" width="100%" height="225">
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        </div>

        <br><label class="form-label">주소</label>
        <br><label class="form-label"> - ${findPerson.address}</label>

        <br><br><label class="form-label">위치 안내</label>
        <br><label class="form-label"> - ${findPerson.location_info}</label>

        <br><br><label class="form-label" style="width: 225px">방 유형</label>
        <label class="form-label">방 크기</label>
        <br><label class="form-label" style="width: 225px;"> - ${findPerson.room_type}</label>
        <label class="form-label"> - ${findPerson.room_size}</label>

        <br><br><label class="form-label">월세</label>
        <br><label class="form-label" style="width: 50px;"> - ${findPerson.price}</label>
        <label class="form-label">만원</label>

        <br><br><label class="form-label" style="width: 223px">성별</label>
        <br><label class="form-label">
        <c:choose>
            <c:when test="${findPerson.sex eq 1}">
                - 남자
            </c:when>
            <c:otherwise>
                - 여자
            </c:otherwise>
        </c:choose>
        </label>

        <br><br><label class="form-label">인원</label>
        <br><label class="form-label"> - ${findPerson.num_of_people}</label>

        <br><br><label class="form-label">기간</label>
        <br><label class="form-label"> - ${findPerson.start_date} ~ ${findPerson.end_date}</label>

        <br><br><label class="form-label" style="width: 223px">흡연여부</label>
        <br><label class="form-label">
            <c:choose>
                <c:when test="${findPerson.smoke eq 1}">
                    예
                </c:when>
                <c:otherwise>
                    아니오
                </c:otherwise>
            </c:choose>
        </label>

        <br><br><label class="form-label" style="width: 223px">음주여부</label>
        <br><label class="form-label">
            <c:choose>
                <c:when test="${findPerson.alcohol eq 1}">
                    예
                </c:when>
                <c:otherwise>
                    아니오
                </c:otherwise>
            </c:choose>
        </label>

        <br><br><label class="form-label" style="width: 223px">애완동물 여부</label>
        <br><label class="form-label">
            <c:choose>
                <c:when test="${findPerson.pet eq 1}">
                    예
                </c:when>
                <c:otherwise>
                    아니오
                </c:otherwise>
            </c:choose>
        </label>

        <br><br><label class="form-label">기타사항</label>
        <br><label class="form-label"> - ${findPerson.additional_info}</label>
        <br><br>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button class="btn btn-outline-secondary" type="button"><a href="/findperson" style="text-decoration: none; color: gray">확인</a></button>
        </div>
    </form>
</div>
</body>
</html>
