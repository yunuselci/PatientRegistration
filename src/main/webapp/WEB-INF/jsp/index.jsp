<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><s:message code="greeting"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="container my-5">
    <h1><s:message code="greeting"/></h1>
    <div class="card">
        <div class="card-body">
            <span><s:message code="lang.change"/></span>:
            <c:choose>
                <c:when test="${pageContext.request.queryString.contains('lang=en')}">
                    <a href="${pageContext.request.contextPath}/index.html/?lang=tr">
                        <img src="${pageContext.request.contextPath}/img/tr.png" width="40"/></a>
                </c:when>
                <c:when test="${pageContext.request.queryString.contains('lang=tr')}">
                    <a href="${pageContext.request.contextPath}/index.html/?lang=en">
                        <img src="${pageContext.request.contextPath}/img/us.png" width="40"/></a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/index.html/?lang=tr">
                        <img src="${pageContext.request.contextPath}/img/tr.png" width="40"/></a>
                </c:otherwise>
            </c:choose>
            <p class="my-5">
                <a href="${pageContext.request.contextPath}/display-form" class="btn btn-primary"><i
                        class="fas fa-user-plus ml-2"><s:message code="msg.addpatient"/></i></a>
                <a href="${pageContext.request.contextPath}/list.html" class="btn btn-primary"><i
                        class="fas fa-user ml-2"><s:message code="msg.patientlist"/></i></a>
            </p>
        </div>
    </div>
</div>
</body>
</html>