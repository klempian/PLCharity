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
    <title>Dodaj fundację</title>

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
    <h1 class="h3 mb-2 text-gray-800">Dodaj fundację</h1>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="p-5">
                <form:form modelAttribute="institution" method="post">
                    <div class="form-group form-group--inline">
                        <form:input path="name" placeholder="Podaj nazwę fundacji" class="form-control"/>
                    </div>
                    <div class="form-group form-group--inline">
                        <form:input path="description" placeholder="Cel i misja fundacji" class="form-control"/>
                    </div>
                    <form:hidden path="id"/>

                    <div class="form-group form-group--buttons">
                        <a href="/institutions/" class="btn">
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
</body>
</html>
