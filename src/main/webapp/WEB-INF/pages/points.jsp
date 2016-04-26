<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
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
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Point List</h1>

<c:if test="${!empty listPoints}">
  <table class="tg">
    <tr>
      <th width="80">ID</th>
      <th width="120">Name</th>
      <th width="320">Context</th>
      <th width="120">Close</th>
      <th width="60">Edit</th>
      <th width="60">Delete</th>
    </tr>
    <c:forEach items="${listPoints}" var="point">
      <tr>
        <td>${point.id}</td>
        <td><a href="/pointdata/${point.id}" target="_blank">${point.pointName}</a></td>
        <td>${point.pointContext}</td>
        <td>${point.pointClose}</td>
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
          <spring:message text="Name"/>
        </form:label>
      </td>
      <td>
        <form:input path="pointName"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="pointContext">
          <spring:message text="Context"/>
        </form:label>
      </td>
      <td>
        <form:input path="pointContext"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="pointClose">
          <spring:message text="Close"/>
        </form:label>
      </td>
      <td>
        <form:input path="pointClose"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <c:if test="${!empty point.pointName}">
          <input type="submit"
                 value="<spring:message text="Edit Point"/>"/>
        </c:if>
        <c:if test="${empty point.pointName}">
          <input type="submit"
                 value="<spring:message text="Add Point"/>"/>
        </c:if>
      </td>
    </tr>
  </table>
</form:form>
</body>
</html>
