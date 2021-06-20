<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${errors != null}">
    <div id="flush_error" class="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" />
            <br />
        </c:forEach>

    </div>
</c:if>
<br>
<table class="table table-bordered">
    <tr>
        <td><label for="report_date" class="form-label">Date</label></td>
        <td><input type="date" name="report_date" class="form-control"
            value="<fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' />" />
        </td>
    </tr>
    <tr>
        <td><label for="name"class="form-label">Full Name</label></td>
        <td><c:out value="${sessionScope.login_employee.name}" /></td>
    </tr>
    <tr>
        <td><label for="title" class="form-label">Title</label></td>
        <td><input type="text" name="title" value="${report.title}" class="form-control"/></td>
    </tr>

    <tr>
        <td><label for="content" class="form-label">Content</label></td>
        <td>
            <textarea name="content" rows="10" cols="50" class="form-control">${report.content}</textarea>
        </td>
    </tr>

</table>

<input type="hidden" name="_token" value="${_token}" />
<button type="submit" class="btn btn-outline-success">Save</button>
