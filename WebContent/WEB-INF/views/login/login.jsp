<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div class="flush_error">社員番号かパスワードが間違っています。</div>
        </c:if>
        <c:if test="${flush != null}">
            <div class="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <div id="login">
            <h3 class="text-center text-white pt-5">Login form</h3>
            <div class="container">
                <div id="login-row"
                    class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form method="POST" action="<c:url value='/login' />">
                                <h3 class="text-center login-text">Login</h3>
                                <div class="align-self-center">
                                    <div class="mb-3 row d-flex justify-content-center">

                                        <p class="ms-5"><label for="username" class="login-text">UserCode:</label></p>
                                        <div class="col-sm-10">
                                            <input type="text" name="code" id="code" class="form-control">
                                        </div>
                                    </div>
                                    <div class="mb-3 row d-flex justify-content-center">
                                        <p class="ms-5"><label for="password" class="login-text">Password:</label></p>
                                        <div class="col-sm-10">
                                            <input type="password" name="password" id="password"
                                                class="form-control"> <input type="hidden"
                                                name="_token" value="${_token}" />
                                        </div>
                                    </div>
                                    <div class="mb-3 row d-flex justify-content-center">
                                        <div class="col-sm-10">
                                            <input type="submit" name="Login" class="btn btn-success btn-md"
                                                value="Login">
                                        </div>
                                    </div>
                               </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </c:param>
</c:import>
