<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>

<html>
<head>
  <title>PointData</title>

  <style type="text/css">
    .tg {
      border-collapse: collapse;
      border-spacing: 0;
      border-color: #ccc;
    }

    .tg td {
      font-family: Arial, sans-serif;
      font-size: 14px;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #fff;
    }

    .tg th {
      font-family: Arial, sans-serif;
      font-size: 14px;
      font-weight: normal;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #f0f0f0;
    }

    .tg .tg-4eph {
      background-color: #f9f9f9
    }
  </style>

</head>
<body>
<h1>Детали выбраной задачи</h1>

<table class="tg">
  <tr>
    <th width="80">ID</th>
    <th width="120">Имя</th>
    <th width="320">Что нужно сделать</th>
    <th width="80">Выполнена</th>
  </tr>
  <tr>
    <td>${point.id}</td>
    <td>${point.pointName}</td>
    <td>${point.pointContext}</td>
    <td><input type="checkbox" disabled
            <c:if test="${point.pointClose}"> checked </c:if> /> </td>
  </tr>
</table>
</body>
</html>