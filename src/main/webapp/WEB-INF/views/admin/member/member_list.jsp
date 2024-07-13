<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- memberAll.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp"%>
<div align="center">
	<hr color="green" width="300">
	<h2>회 원 보 기</h2>
	<hr color="green" width="300">
	<table border="0" width="100%" class="outline">
		<tr>
			<th class="m3">번호</th>
			<th class="m3">이름</th>
			<th class="m3">아이디</th>
			<th class="m3">이메일</th>
			<th class="m3">전화번호</th>
			<th class="m3">가입일</th>
			<th class="m3">삭제</th>
		</tr>
	<c:if test="${empty listMember}">
		<tr>
			<td colspan="7">등록된(찾으시는) 회원이 없습니다.</td>		
		</tr>
	</c:if>
	<c:forEach var="dto" items="${listMember}">
		<tr>
			<td>${dto.no}</td>
			<td>${dto.name}</td>
			<td>${dto.id}</td>
			<td>${dto.email}</td>
			<td>${dto.allHp}</td>
			<td>${dto.joindate}</td>
			<td>
				<a href="member_delete.do?no=${dto.no}">삭제</a>
			</td>
		</tr>
	</c:forEach>	
</table>
	<form name="f" method="post" action="member_find.do">
		<select name="search">
			<option value="id">아이디</option>
			<option value="name">이름</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="찾기">
	</form>
</div>
<%@ include file="../bottom.jsp"%>