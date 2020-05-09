<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Moje zbiórki</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header>
    <%@include file="../../jspf/header.jspf" %>
</header>

<div class="container-fluid">
    <h2>
        Moje zbiórki
    </h2>
    <div class="card-body">
        <div class="table-responsive">
             <table class="table table-bordered" id="donationsTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Dla</th>
                        <th>Zawartość</th>
                        <th>Worki</th>
                        <th>Odbiór</th>
                        <th>Adres odbioru</th>
                    </tr>
                </thead>
                <tfoot>
                <th>Dla</th>
                <th>Zawartość</th>
                <th>Worki</th>
                <th>Odbiór</th>
                <th>Adres odbioru</th>
                </tfoot>
                <tbody>
                    <c:forEach items="${donations}" var="donation">
                        <tr>
                            <td>
                                <c:out value="${donation.institution.name}"/>
                            </td>
                            <td>
                                <c:forEach items="${donation.categoryList}" var="category" varStatus="loop">
                                    <c:out value="${category.name}"/>
                                    <c:if test="${!loop.last}"><br></c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <c:out value="${donation.quantity}"/>
                            </td>
                            <td>
                                <c:out value="${donation.pickUpDate}"/><br><c:out value="${donation.pickUpTime}"/>
                            </td>
                            <td>
                                <c:out value="${donation.street}"/><br><c:out value="${donation.zipCode} ${donation.city}"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
             </table>
        </div>
        <div class="d-flex justify-content-center">
            <a href="/donate" class="btn btn--large">Przekaż dary</a>
        </div>
    </div>
</div>

<footer>
    <%@include file="../../jspf/footer.jspf" %>
</footer>

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
