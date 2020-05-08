<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Załóż konto</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header>
<%@include file="../jspf/header.jspf" %>
</header>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form modelAttribute="user">
        <div class="form-group">
            <form:input path="firstName" placeholder="Imię" />
        </div>
        <div class="form-group">
            <form:input path="lastName" placeholder="Nazwisko" />
        </div>
        <div class="form-group">
            <form:input type="email" path="username" placeholder="Email" />
        </div>
        <div class="form-group">
            <form:input type="password" path="password" placeholder="Hasło" />
        </div>
        <div class="form-group">
            <input type="password" name="password2" placeholder="Powtórz hasło" />
        </div>

        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>

<footer>
    <%@include file="../jspf/footer.jspf" %>
</footer>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
