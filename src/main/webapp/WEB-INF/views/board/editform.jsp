<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.BoardDAO, com.example.BoardVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
<%--    <link href="./css/style.css" rel="stylesheet">--%>
<%--    <style>--%>
<%--        .form-label{--%>
<%--            font-weight: 600 !important;--%>
<%--        }--%>
<%--    </style>--%>
    <meta charset="UTF-8">
    <title>Edit Form</title>
</head>

<body>
<form:form modelAttribute="boardVO" method="post" action="../editok">
    <form:hidden path="seq"/>
    <table id="edit">
        <tr><td>카테고리</td><td><form:input path="category"/></td></tr>
        <tr><td>제목</td><td><form:input path="title"/></td></tr>
        <tr><td>글쓴이</td><td><form:input path="writer"/></td></tr>
        <tr><td>내용</td><td><form:textarea cols="50" rows="5" path="content"/></td></tr>
    </table>
    <input type="submit" value="수정하기">
    <input type="button"value="취소하기" onclick="history">
</form:form>
</body>
</html>
