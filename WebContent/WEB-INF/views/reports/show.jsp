<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2 class="modal-header">Staff Blog Show</h2>

        <div class="container body-container">

            <c:choose>
                <c:when test="${report != null}">
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th>Title</th>
                                <td>
                                    <c:out value="${report.title}" />
                                </td>
                            </tr>
                            <tr>
                                <th>Date</th>
                                <td>
                                    <fmt:formatDate value="${report.report_date}"
                                        pattern="yyyy-MM-dd" />
                                </td>
                            </tr>
                            <tr>
                                <th>Reaction</th>
                                <td>
                                    <fmt:formatDate value="${reaction.type}" pattern="yyyy-MM-dd" />
                                    <span id="egao">
                                        <img src="<c:url value='/img/egao-min.jpg'/>" width="35px"
                                            height="35px">
                                        <span id="egao-count">
                                            <c:out value="${egaoCount}" />
                                        </span>
                                    </span>
                                    <span id="nakigao">
                                        <img src="<c:url value='/img/nakigao-min.jpg'/>" width="35px"
                                            height="35px">
                                        <span id="nakigao-count">
                                            <c:out value="${nakigaoCount}" />
                                        </span>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th>Content</th>
                                <td>
                                    <span>
                                        <c:out value="${report.content}" />
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th>Created Date</th>
                                <td>
                                    <fmt:formatDate value="${report.created_at}"
                                        pattern="yyyy-MM-dd HH:mm:ss" />
                                </td>
                            </tr>
                            <tr>
                                <th>Updated Date</th>
                                <td>
                                    <fmt:formatDate value="${report.updated_at}"
                                        pattern="yyyy-MM-dd HH:mm:ss" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" id="id" value="${report.id}" />
                    <c:if
                        test="${sessionScope.login_employee.id == report.employee.id}">
                        <p>
                            <a href="<c:url value="/reports/edit?id=${report.id}" />"
                                class="btn btn-outline-success">Edit</a>
                        </p>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <h2>Not found</h2>
                </c:otherwise>
            </c:choose>
            <br>
            <p>
                <a href="<c:url value="/reports/index" />"
                    class="btn btn-outline-success">Back List</a>
            </p>
        </div>
        <script>
        $(function() {
            $('#egao').on('click', function() {
                let egaoType = "1";
                let count = saveReaction(egaoType);
                if (count != null) {
                    console.log(count);
                    $('#egao-count').text(count);
                }
            });
            $('#nakigao').on('click', function() {

                let nakigaoType = "2";
                let count = saveReaction(nakigaoType);
                if (count != null) {
                    console.log(count);
                    $('#nakigao-count').text(count);
                }
            });
            function saveReaction(type){
                let request = {
                    report_id : $('#id').val(),
                    type : type
                };
                let count = null;
                //ajaxでservletにリクエストを送信
                $.ajax({
                  type    : "POST",
                  url     : "/staff_blog/saveReaction",
                  data    : request,
                  async   : false,
                  dataType: "json"
                }).done(function(data, status, xhr) {
                  //通信が成功した場合に受け取るメッセージ
                  count = data["count"];

                }).fail(function(xhr, status, error) {
                  // エラーの場合処理
                  alert("エラーが発生しました。");
                });
                return count;
            }
        });
       </script>
    </c:param>
</c:import>