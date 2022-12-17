<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        h1{font-size: 100px; color: dodgerblue; margin-top: 60px}
        label{display:inline-block; width:130px; font-size: 20px}
        button{background-color: dodgerblue; color: white; font-size: 15px}
    </style>
</head>
<body>
<div style="width: 100%; text-align: center; padding-top: 100px">
    <form method="post"action="loginOk">
        <h1>Hand-ong Over</h1>
        <br><div><label>User ID :</label><input type="text" name="userid" /></div>
        <br><div><label>Password :</label><input type="password" name="password" /></div>
        <br><button type="submit" class="btn btn-outline-secondary">Login</button>
    </form>
</div>
</body>
</html>
