<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><s:message code="msg.updateperson"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="container my-5">
    <h3><s:message code="msg.updateperson"/></h3>
    <div class="card">
        <div class="card-body">
            <div class="col-md-8">
                <form:form method="post" action="/update/{id}(id=${person.id})" modelAttribute="person">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="firstName" class="col-form-label"><s:message code="msg.firstname"/></label>
                            <sf:input path="firstName" class="form-control" id="firstName"/>
                            <span class="text-danger"><form:errors path="firstName"/></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="lastName" class="col-form-label"><s:message code="msg.lastname"/></label>
                            <sf:input path="lastName" class="form-control" id="lastName"/>
                            <span class="text-danger"><form:errors path="lastName"/></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="dateOfBirth" class="col-form-label"><s:message code="msg.dateOfBirth"/></label>
                            <sf:input path="dateOfBirth" class="form-control" id="dateOfBirth"/>
                            <span class="text-danger"><form:errors path="dateOfBirth"/></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="age" class="col-form-label"><s:message code="msg.age"/></label>
                            <sf:input path="age" class="form-control" id="age"/>
                            <span class="text-danger"><form:errors path="age"/></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="email" class="col-form-label"><s:message code="msg.email"/></label>
                            <sf:input path="email" class="form-control" id="email"/>
                            <span class="text-danger"><form:errors path="email"/></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="phone" class="col-form-label"><s:message code="msg.phone"/></label>
                            <sf:input path="phone" class="form-control" id="phone"/>
                            <span class="text-danger"><form:errors path="phone"/></span>
                        </div>
                        <div class="form-group col-md-8">
                            <input type="submit" class="btn btn-primary" value="Submit">
                        </div>
                    </div>
                </form:form>
                <p>You can view a list of existing people <a href="/list.html">here</a>.</p>
            </div>
        </div>
    </div>
</div>

</body>
</html>

