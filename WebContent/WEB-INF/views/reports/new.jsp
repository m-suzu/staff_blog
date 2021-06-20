<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2 class="modal-header">New Report</h2>
        <br>
        <div class="container body-container">
            <form method="POST" action="<c:url value='/reports/create' />">
                <c:import url="_form.jsp" />
            </form>
        </div>
        <p>
            <a href="<c:url value='/reports/index' />"
                class="btn btn-outline-success">Back List</a>
        </p>
    </c:param>
</c:import>