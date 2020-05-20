<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><s:message code="msg.patients"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="../css/shards.min.css"> -->
</head>
<body>
<div class="container my-2">
    <div class="card">
        <div class="card-body">

            <h2><s:message code="msg.patients"/></h2>
            <c:choose>
                <c:when test="${fn:length(patients) > 0}">
                    <div class="col-md-10">
                        <table class="table table-striped table-responsive-md">
                            <thead>

                            <tr>
                                <th><s:message code="msg.id"/></th>
                                <th><s:message code="msg.firstname"/></th>
                                <th><s:message code="msg.lastname"/></th>
                                <th><s:message code="msg.dateOfBirth"/></th>
                                <th><s:message code="msg.age"/></th>
                                <th><s:message code="msg.email"/></th>
                                <th><s:message code="msg.phone"/></th>
                            </tr>
                            </thead>
                            <c:forEach items="${patients}" var="p">
                                <javatime:format value="${p.dateOfBirth}" pattern="dd-MM-yyyy" var="formattedDate"/>
                                <tbody>
                                <tr>

                                    <td>${p.id}</td>
                                    <td>${p.firstName}</td>
                                    <td>${p.lastName}</td>
                                    <td>${formattedDate}</td>
                                    <td>${p.age}</td>
                                    <td>${p.email}</td>
                                    <td>${p.phone}</td>
                                    <td><a href="/delete/${p.id}"class="btn btn-primary"><i class="fas fa-user-times ml-2"></i></a></td>
                                    <td><a href="/edit/${p.id}" class="btn btn-primary"><i class="fas fa-user-edit ml-2"></i></a> </td>

                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <p><s:message code="msg.nopatient"/></p>
                </c:otherwise>
            </c:choose>
            <p class="my-5">
                <a href="${pageContext.request.contextPath}/create.html" class="btn btn-primary"><i
                        class="fas fa-user-plus ml-2"></i><s:message code="msg.addpatient"/></a>
                <a href="${pageContext.request.contextPath}/index.html" class="btn btn-primary"><i
                        class="fas fa-home ml-2"><s:message code="msg.homepage" /></i></a>
            </p>
        </div>
    </div>
</div>
</body>
</html>