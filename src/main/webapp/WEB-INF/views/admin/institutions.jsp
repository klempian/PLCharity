<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Fundacje</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>

</head>
<body id="page-top">
<header>
    <%@include file="../../jspf/header.jspf" %>
</header>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Fundacje</h1>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="institutionTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Nazwa</th>
                        <th>Opis</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Nazwa</th>
                        <th>Opis</th>
                    </tr>
                    </tfoot>
                    <tbody>
                        <c:forEach items="${institutions}" var="institution">
                            <tr>
                                <td><c:out value="${institution.name}"/></td>
                                <td>
                                    <c:out value="${institution.description}"/>
                                    <div class="float-right">
                                        <a href="#" class="btn btn-warning btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-exclamation-triangle"></i>
                                        </span>
                                            <span class="text">Edytuj</span>
                                        </a>
                                        <a href="#" class="btn btn-danger btn-icon-split">
                                        <span class="icon text-white-50">
                                          <i class="fas fa-trash"></i>
                                        </span>
                                            <span class="text">Usuń</span>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>

<!-- Page level custom scripts -->
<script src="<c:url value="/resources/js/datatables.js"/>"></script>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
