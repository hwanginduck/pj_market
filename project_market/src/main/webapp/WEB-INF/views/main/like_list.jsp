<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>
<section class="main">
	<div class="main-img">
		<div class="like-content">
			<form enctype="multipart/form-data">
				<div class="like-table">
					<table width="800px">
						<tr>
							<th colspan="4" id="like-table-th">${member_id}님의 찜 목록</th>
						</tr>
						<%
						String member_id = (String) session.getAttribute("member_id");
						%>
						<c:if test="${empty likelist}">
							<tr>
								<td colspan="5">데이터가 없습니다</td>
							</tr>
						</c:if>
						<!-- 반복문 시작 -->
						<c:forEach var="like" items="${likelist}">
							<tr>
								<td rowspan="2" height="150px" width="150px">
									${like.product_img }</td>
								<td align="left">${like.product_name }</td>
								<td align="left">${like.options_name }</td>
								<td>
									<button class="like-table-btn"
										onclick="location.href='likedelete.do?likes_num=${like.likes_num}'">
										<img class="like-btn"
											src="${pageContext.request.contextPath}/resources/img/like.png" />
									</button>
								</td>
							</tr>
							<tr>
								<td align="left"><fmt:formatNumber
										value='${like.product_price }' pattern='#,###' /></td>
								<td align="left"><fmt:formatNumber
										value='${like.options_price }' pattern='#,###' /></td>
								<td>
									<button type="button" class="like-table-btn"
										onClick="location.href='cart_list.do?likes_num=${like.likes_num}'">
										<img class="like-btn"
											src="${pageContext.request.contextPath}/resources/img/cart.png" />
									</button>
								</td>
							</tr>
							<tr>
								<td id="like-table-tr" colspan="4">
							</tr>

						</c:forEach>
						<!-- 반복문 끝 -->

					</table>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
