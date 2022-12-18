<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
  <h1>제목: ${findPerson.title}</h1>
  <p>작성자: ${findPerson.writer}</p>
  <p>시작 일자: ${findPerson.start_date}</p>
  <p>종료 일자: ${findPerson.end_date}</p>
  <p>방 종류: ${findPerson.room_type}</p>
  <p>방 크기: ${findPerson.room_size}</p>
  <p>주소: ${findPerson.address}</p>
  <p>위치 정보: ${findPerson.location_info}</p>
  <p>월세: ${findPerson.price}</p>
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
  <p>인원: ${findPerson.num_of_people}</p>
  <p>성별:
    <c:choose>
      <c:when test="${findPerson.sex eq 1}">
        남자
      </c:when>
      <c:otherwise>
        여자
      </c:otherwise>
    </c:choose></p>
  <p>흡연 여부:
    <c:choose>
      <c:when test="${findPerson.smoke eq 1}">
        예
      </c:when>
      <c:otherwise>
        아니오
      </c:otherwise>
    </c:choose></p>
  <p>음주 여부:
    <c:choose>
      <c:when test="${findPerson.alcohol eq 1}">
        예
      </c:when>
      <c:otherwise>
        아니오
      </c:otherwise>
    </c:choose></p>
  <p>애완동물 여부:
    <c:choose>
      <c:when test="${findPerson.pet eq 1}">
        예
      </c:when>
      <c:otherwise>
        아니오
      </c:otherwise>
    </c:choose></p>
  <p>추가 정보: ${findPerson.additional_info}</p>
</body>
</html>
