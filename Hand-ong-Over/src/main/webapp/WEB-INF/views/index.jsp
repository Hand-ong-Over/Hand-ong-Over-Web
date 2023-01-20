<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
  <title>Hand-ong Over</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div style="width: 100%; text-align: center; padding-top: 220px">
  <h1>Hello!! We are Hand-ong Over Developer.</h1>
  <p>If you would like to use our website please click the link below!!! Thank you</p>
  <p>
    <button type="button" class="btn btn-primary" onclick="location.href='findperson'">양도 해요</button>
    <button type="button" class="btn btn-primary" onclick="location.href='findroom'">양도 구해요</button>
    <c:choose>
      <c:when test="${empty user}">
        <button type="button" class="btn btn-outline-primary" onclick="location.href='login'">로그인</button>
      </c:when>
      <c:otherwise>
        <button type="button" class="btn btn-outline-secondary" onclick="location.href='logout'">로그아웃</button>
      </c:otherwise>
    </c:choose>
  </p>
</div>
</body>
</html>
