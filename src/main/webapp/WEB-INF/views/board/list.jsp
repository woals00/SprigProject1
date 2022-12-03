<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jaeminjeong
  Date: 2022/12/02
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
<%--    <link rel="stylesheet" href="${path}/css/style.css">--%>
    <script>
        function delete_ok(id) {
            var a = confirm("정말로 삭제하시겠습니까?");
            if (a) location.href = 'deleteok/' + id;
        }
    </script>
</head>

<body>
<h1>
    회원 관리 시스템
</h1>
<table id="list" width="90%">
    <tr>
        <th>Seq</th>
        <th>ID</th>
        <th>Password</th>
        <th>Nickname</th>
        <th>Age</th>
        <th>Phone-Number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Gender</th>
        <th>Regdate</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.seq}</td>
            <td>${u.id}</td>
            <td>${u.password}</td>
            <td>${u.nickname}</td>
            <td>${u.age}</td>
            <td>${u.phoneNum}</td>
            <td>${u.email}</td>
            <td>${u.address}</td>
            <td>${u.gender}</td>
            <td>${u.regdate}</td>
            <td><a href="editform/${u.seq}">글수정</a></td>
            <td><a href="javascript:delete_ok('${u.seq}')">글삭제</a></td>
        </tr>
    </c:forEach>
</table>

<br/><a href="add">Add New Post</a>
</body>
</html>
