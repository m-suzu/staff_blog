<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${report != null}">
                <h2 class="modal-header">Edit Report</h2>
                <br>
                <div class="container body-container">
                    <form method="POST" action="<c:url value='/reports/update' />">
                        <c:import url="_form.jsp" />
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                <h2>Not found</h2>
            </c:otherwise>
        </c:choose>
        <br>
        <p>
            <a href="<c:url value='/reports/index' />"
                class="btn btn-outline-success">Back</a>
        </p>
    </c:param>
</c:import>