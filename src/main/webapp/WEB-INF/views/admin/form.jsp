<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Dodaj admina</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>

</head>
<body id="page-top">
<header>
    <%@include file="../../jspf/header.jspf" %>
</header>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Dodaj admina</h1>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="p-5 wide-form">
                <form:form modelAttribute="admin" method="post">

                    <div class="form-group col-md-6">
                        <form:input path="firstName" placeholder="Imię" class="form-control" required="true" oninvalid="InvalidMsg(this)" oninput="setCustomValidity('')" title="Podaj imię"/>
                    </div>
                    <div class="form-group col-md-6">
                        <form:input path="lastName" placeholder="Nazwisko" class="form-control" required="true" oninvalid="InvalidMsg(this)" oninput="setCustomValidity('')" title="Podaj nazwisko"/>
                    </div>
                    <div class="form-group col-md-6">
                        <form:input path="username" placeholder="Adres email" class="form-control" required="true" pattern="[a-zA-Z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,3}$" oninvalid="InvalidMsg(this)" oninput="InvalidMsg(this)" id="email" title="Podaj adres email"/>
                    </div>
                    <form:hidden path="id"/>
                    <form:hidden path="roles"/>

                    <c:choose>
                        <c:when test="${admin.id == null}">
                            <form:hidden path="enabled"/>
                            <div class="form-group col-md-6">
                                <form:input path="password" type="password" placeholder="hasło" class="form-control" id="password" required="true" oninvalid="InvalidMsg(this)" oninput="setCustomValidity('')" title="Podaj hasło"/>
                            </div>
                            <div class="form-group col-md-6">
                            </div>
                            <div class="form-group col-md-6">
                                <form:input path="retypePassword" type="password" placeholder="powtórz hasło" class="form-control" id="retype_password" required="true" oninput="setCustomValidity('')" title="Powtórz hasło"/>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-6">
                                <form:hidden path="password" id="password_hidden"/>
                                <form:hidden path="retypePassword" id="retype_password_hidden"/>
                                <input type="hidden" name="enabled" value="0"/>
                                <form:checkbox path="enabled" class="form-group--checkbox-large" value="1" id="checkboxEnable"/>
                                <label for="checkboxEnable" class="bigLabel">
                                    <span>Aktywny</span>
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <div class="form-group form-group--buttons">
                        <a href="/admins/" class="btn">
                                <span class="icon text-gray-600">
                                    <i class="fas fa-arrow-left"></i>&nbsp;
                                </span>
                                <span class="text">Wstecz</span>
                        </a>
                        <button class="btn btn-success" type="submit">
                            <span class="icon text-white-50">
                                <i class="fas fa-check"></i>&nbsp;
                            </span>
                            <span class="text">Zapisz</span>
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

</div>

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>

<!-- Page level plugins -->

<!-- Page level custom scripts -->
<script src="<c:url value="/resources/js/app.js"/>"></script>
<script src="<c:url value="/resources/js/user-form-validation.js"/>"></script>
</body>
</html>
