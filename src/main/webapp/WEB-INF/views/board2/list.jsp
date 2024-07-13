<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- list.jsp -->
<%@ include file="../top.jsp" %>
	<div align="center">
		<b>�� �� ��</b>
		<table border="0" width="800">
			<tr bgcolor="yellow">
				<td align="right">
					<a href="board2_write.do">�۾���</a>
				</td>
			</tr>
		</table>
		<table border="1" width="800">
			<tr bgcolor="green">
				<th>��ȣ</th>
				<th width="30%">����</th>
				<th>�ۼ���</th>
				<th>�ۼ���</th>
				<th>��ȸ��</th>
				<th>IP</th>
			</tr>
<%--		DB���� �ڷḦ ������ ��½�Ű�� --%>
		<c:if test="${empty listBoard}">
			<tr>
				<td colspan="6">��ϵ� �Խñ��� �����ϴ�</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${listBoard}">
			<tr>
				<td>${dto.num}</td>
				<td>
				<c:if test="${dto.re_level > 0}">
					<img src="resources/img/level.gif" width="${10*dto.re_level}"/>
					<img src="resources/img/re.gif">
				</c:if>
					<a href="board2_content.do?num=${dto.num}">
						${dto.subject}
					</a>
				<c:if test="${dto.readcount>10}">	
					<img src="resources/img/hot.gif">
				</c:if>		
				</td>
				<td>${dto.writer}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.readcount}</td>
				<td>${dto.ip}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
<%@ include file="../bottom.jsp" %>