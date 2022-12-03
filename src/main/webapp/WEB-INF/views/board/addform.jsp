<%--
  Created by IntelliJ IDEA.
  User: jaeminjeong
  Date: 2022/12/02
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="addok" method="post">
  <table id = "edit">
    <tr><td>아이디</td><td><input type ='text' name="id"></td></tr>
    <tr><td>비밀번호</td><td><input type ='text' name="password"></td></tr>
    <tr><td>별명</td><td><input type ='text' name="nickname"></td></tr>
    <tr><td>나이</td><td><input type ='text' name="age"></td></tr>
    <tr><td>휴대폰 번호</td><td><input type ='text' name="phoneNum"></td></tr>
    <tr><td>이메일</td><td><input type ='text' name="email"></td></tr>
    <tr><td>주소</td><td><textarea cols="50" rows="5" name="address"></textarea></td></tr>
    <tr><td>성별</td><td><input type ='text' name="gender"></td></tr>
  </table>
  <button type="button" onclick="location.href='list'">목록보기</button>
  <button type="submit">등록하기</button>
</form>
</body>
</html>
