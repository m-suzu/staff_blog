<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2 class="modal-header">Staff New</h2>
        <br>
        <div class="container body-container">
            <form method="POST" action="<c:url value='/employees/create' />">
                <c:import url="_form.jsp" />
            </form>
            <br>
        </div>
            <p>
                <a href="<c:url value='/employees/index' />" class="btn btn-outline-success">Back List</a>
            </p>

    </c:param>
</c:import>