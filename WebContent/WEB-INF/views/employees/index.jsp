<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div class="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2 class="modal-header">Staff List</h2>
        <br>
        <div class="container body-container">
            <table id="employee_list" class="table table-striped">
                <tbody>
                    <tr>
                        <th>User Code</th>
                        <th>Full Name</th>
                        <th>Operation</th>
                    </tr>
                    <c:forEach var="employee" items="${employees}" varStatus="status">
                        <tr>
                            <td><c:out value="${employee.code}" /></td>
                            <td><c:out value="${employee.name}" /></td>
                            <td><c:choose>
                                    <c:when test="${employee.delete_flag == 1}">
                                    （deleted）
                                </c:when>
                                    <c:otherwise>
                                        <a href="<c:url value='/employees/show?id=${employee.id}' />"
                                            class="btn btn-outline-success">Show</a>
                                    </c:otherwise>
                                </c:choose></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div id="pagination">
                （Total ${employees_count}）<br />
                <c:forEach var="i" begin="1"
                    end="${((employees_count - 1) / 15) + 1}" step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                    </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/employees/index?page=${i}' />"><c:out
                                    value="${i}" /></a>&nbsp;
                    </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <br>
            <p>
                <a href="<c:url value='/employees/new' />" class="btn btn-outline-success">New Staff</a>
            </p>
        </div>
    </c:param>
</c:import>