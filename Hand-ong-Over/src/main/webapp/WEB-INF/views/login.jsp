<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        h1 {
            font-size: 100px;
            color: dodgerblue;
            margin-top: 60px
        }
        label {
            display:inline-block;
            font-size: 20px
        }
    </style>
</head>
<body>
<div style="width: 100%; text-align: center; padding-top: 100px">
    <form method="post" action="login/loginOk">
        <h1>Hand-ong Over</h1>
        <div class="d-flex justify-content-center my-5">
            <table>
                <tr>
                    <td><label class="text-start">User ID </label></td>
                    <td><input type="text" class="mx-1" name="userid" /></td>
                    <td rowspan="2"><button type="submit" class="btn btn-outline-primary btn-lg btn-block">Login</button></td>
                </tr>
                <tr>
                    <td><label class="text-start">Password </label></td>
                    <td><input type="password" class="mx-2" name="userpw" /></td>
                </tr>
            </table>
        </div>
        <button type="button" class="btn btn-outline-secondary" onclick="location.href='./'">Cancel</button>
    </form>
</div>
</body>
</html>
