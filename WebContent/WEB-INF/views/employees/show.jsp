<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${employee != null}">
                <h2 class="modal-header">id : ${employee.id} Staff Show</h2>
                <br>
                <div class="container body-container">
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th>User Code</th>
                                <td><c:out value="${employee.code}" /></td>
                            </tr>
                            <tr>
                                <th>Full Name</th>
                                <td><c:out value="${employee.name}" /></td>
                            </tr>
                            <tr>
                                <th>Authorization</th>
                                <td><c:choose>
                                        <c:when test="${employee.admin_flag == 1}">Manager</c:when>
                                        <c:otherwise>Member</c:otherwise>
                                    </c:choose></td>
                            </tr>
                            <tr>
                                <th>Created Date</th>
                                <td><fmt:formatDate value="${employee.created_at}"
                                        pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            </tr>
                            <tr>
                                <th>Updated Date</th>
                                <td><fmt:formatDate value="${employee.updated_at}"
                                        pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            </tr>
                        </tbody>
                    </table>

                    <p>
                        <a href="<c:url value='/employees/edit?id=${employee.id}' />"
                            class="btn btn-outline-success">Edit Staff</a>
                    </p>
                </div>
            </c:when>

            <c:otherwise>
                <h2>Not found</h2>
            </c:otherwise>
        </c:choose>

        <p>
            <a href="<c:url value='/employees/index' />" class="btn btn-outline-success">Back List</a>
        </p>
    </c:param>
</c:import>