<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<html>
<head>
  <title>Points Page</title>

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
<a href="../../index.jsp">Вернуться на стартовую</a>

<br/>
<br/>

<h1>Список задач</h1>   отобрать <a href="<c:url value="/points/all"/>" target="_parent">все</a> |
<a href="<c:url value="/points/open"/>" target="_parent">невыполненые</a> |
<a href="<c:url value="/points/close"/>" target="_parent">выполненые</a>

<c:if test="${!empty listPoints}">
  <table class="tg">
    <tr>
      <th width="80">ID</th>
      <th width="120">Имя</th>
      <th width="320">Что нужно сделать</th>
      <th width="80">Выполнена</th>
      <th width="60">Edit</th>
      <th width="60">Delete</th>
    </tr>
    <c:forEach items="${listPoints}" var="point">
      <tr>
        <td>${point.id}</td>
        <td><a href="/pointdata/${point.id}" target="_blank">${point.pointName}</a></td>
        <td>${point.pointContext}</td>
        <td><input type="checkbox" disabled
                <c:if test="${point.pointClose}"> checked </c:if> /></td>
        <td><a href="<c:url value='/edit/${point.id}'/>">Edit</a></td>
        <td><a href="<c:url value='/remove/${point.id}'/>">Delete</a></td>
      </tr>
    </c:forEach>
  </table>
</c:if>


<h1>Add a Point</h1>

<c:url var="addAction" value="/points/add"/>

<form:form action="${addAction}" commandName="point">
  <table>
    <c:if test="${!empty point.pointName}">
      <tr>
        <td>
          <form:label path="id">
            <spring:message text="ID"/>
          </form:label>
        </td>
        <td>
          <form:input path="id" readonly="true" size="8" disabled="true"/>
          <form:hidden path="id"/>
        </td>
      </tr>
    </c:if>
    <tr>
      <td>
        <form:label path="pointName">
          <spring:message text="Имя"/>
        </form:label>
      </td>
      <td>
        <form:input path="pointName"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="pointContext">
          <spring:message text="Что нужно сделать"/>
        </form:label>
      </td>
      <td>
        <form:input path="pointContext" maxlength="255"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="pointClose">
          <spring:message text="Выполнена"/>
        </form:label>
      </td>
      <td>
        <form:checkbox path="pointClose"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <c:if test="${!empty point.pointName}">
          <input type="submit"
                 value="<spring:message text="Сохранить задачу"/>"/>
        </c:if>
        <c:if test="${empty point.pointName}">
          <input type="submit"
                 value="<spring:message text="Добавить задачу"/>"/>
        </c:if>
      </td>
    </tr>
  </table>
</form:form>
</body>
</html>
