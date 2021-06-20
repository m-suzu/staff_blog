<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2 class="modal-header">My Blog</h2>
        <br>
        <div class="container body-container">
            <table id="report_list" class="table table-striped">
                <tbody>
                    <tr>
                        <th class="report_name">Full name</th>
                        <th class="report_date">Date</th>
                        <th class="report_title">Title</th>
                        <th class="report_action">Operater</th>
                    </tr>
                    <c:forEach var="report" items="${reports}" varStatus="status">
                        <tr>
                            <td class="report_name"><c:out
                                    value="${report.employee.name}" /></td>
                            <td class="report_date"><fmt:formatDate
                                    value='${report.report_date}' pattern='yyyy-MM-dd' /></td>
                            <td class="report_title">${report.title}</td>
                            <td class="report_action"><a
                                href="<c:url value='/reports/show?id=${report.id}' />"
                                class="btn btn-outline-success">Show</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div id="pagination">
                （Total ${reports_count} ）<br />
                <c:forEach var="i" begin="1" end="${((reports_count - 1) / 15) + 1}"
                    step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <p>
                <a href="<c:url value='/reports/new' />"
                    class="btn btn-outline-success">New Blog</a>
            </p>
        </div>
    </c:param>
</c:import>