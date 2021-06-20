<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Staff Blog</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">


<!-- CSS only -->
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <div id="header_menu">
                <nav class="navbar navbar-dark bg-dark navbar-expand-sm">
                    <a href="<c:url value='/' />" class="navbar-brand">Staff Blog</a>

                    <div class="navbar-nav">

                        <c:if test="${sessionScope.login_employee != null}">
                            <c:if test="${sessionScope.login_employee.admin_flag == 1}">
                                <a href="<c:url value='/employees/index' />"
                                    class="nav-item nav-link" aria-current="page">Staff</a>
                            </c:if>
                            <a href="<c:url value='/reports/index' />"
                                class="nav-item nav-link" aria-current="page">Blog</a>
                        </c:if>
                        <c:if test="${sessionScope.login_employee != null}">
                            <a href="<c:url value='/logout' />" class="nav-item nav-link">Logout</a>
                        </c:if>
                    </div>

                </nav>
            </div>

        </div>
        <div id="content">${param.content}</div>
    </div>
    <footer> </footer>
    <div id="footer">by Mihaya Suzuki.</div>
</body>
</html>