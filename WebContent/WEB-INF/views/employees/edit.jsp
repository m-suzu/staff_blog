<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${employee != null}">
                <h2 class="modal-header">id : ${employee.id} Staff Edit</h2>
                <br>
                <div class="container body-container">
                    <p>（パスワードは変更する場合のみ入力してください）</p>
                    <form method="POST" action="<c:url value='/employees/update' />">
                        <c:import url="_form.jsp" />
                    </form>
                    <br>
                    <p>
                        <a href="#" onclick="confirmDestroy();"
                            class="btn btn-outline-danger">Destroy</a>
                    </p>
                    <form method="POST" action="<c:url value='/employees/destroy' />">
                        <input type="hidden" name="_token" value="${_token}" />
                    </form>
                    <script>
                    function confirmDestroy() {
                        if(confirm("本当に削除してよろしいですか？")) {
                            document.forms[1].submit();
                        }
                    }
                </script>
                    <br>
                    <p>
                        <a href="<c:url value='/employees/index' />"
                            class="btn btn-outline-success">Back List</a>
                    </p>
                </div>

            </c:when>
            <c:otherwise>
                <h2>Not found</h2>
            </c:otherwise>

        </c:choose>
    </c:param>
</c:import>