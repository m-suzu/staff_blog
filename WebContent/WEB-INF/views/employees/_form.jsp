<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${errors != null}">
    <div class="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" />
            <br />
        </c:forEach>

    </div>
</c:if>
<table class="table table-bordered">
    <tr>
        <td><label for="code" class="form-label">User Code</label><br /></td>
        <td><input type="text" name="code" value="${employee.code}" class="form-control"/></td>
    </tr>
    <tr>
        <td><label for="name" class="form-label">Full Name</label></td>
        <td><input type="text" name="name" value="${employee.name}" class="form-control"/></td>
    </tr>
    <tr>
        <td><label for="password" class="form-label">Password</label></td>
        <td><input type="password" name="password" class="form-control"/></td>
    </tr>
    <tr>
        <td><label for="admin_flag" class="form-label">Authorization</label></td>
        <td>
            <select name="admin_flag" class="form-control">
                <option value="0"
                    <c:if test="${employee.admin_flag == 0}"> selected</c:if>>Member</option>
                <option value="1"
                    <c:if test="${employee.admin_flag == 1}"> selected</c:if>>Manager</option>
            </select>
        </td>
    </tr>
</table>
<input type="hidden" name="_token" value="${_token}" />
<button type="submit" class="btn btn-outline-success">Save</button>