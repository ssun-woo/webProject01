<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- content.jsp -->
<%@ include file="../top.jsp" %>
<c:if test="${mdto == null}">
	<script type="text/javascript">
		alert("�α����� ���� �� �ּ���!!")
		location.href="login.do"
	</script>
</c:if>
<c:if test="${mdto != null}">
	<div align="center">
		<b>�۳��� ����</b>
		<table border="1" width="600">
			<tr>
				<th bgcolor="yellow" width="20%">�۹�ȣ</th>
				<td align="center">${getBoard.num}</td>
				<th bgcolor="yellow" width="20%">��ȸ��</th>
				<td align="center">${getBoard.readcount}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">�ۼ���</th>
				<td align="center">${getBoard.writer}</td>
				<th bgcolor="yellow" width="20%">�ۼ���</th>
				<td align="center">${getBoard.reg_date}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">������</th>
				<td align="center" colspan="3">
					${getBoard.subject}
				</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">�۳���</th>
				<td colspan="3">
					${getBoard.content}
				</td>
			</tr>
			<tr bgcolor="yellow">
				<td colspan="4" align="right">
				<c:if test="${mdto.name == 'admin'}">
					<input type="button" value="��۾���"
							onclick="window.location='board2_write.do?num=${getBoard.num}&re_step=${getBoard.re_step}&re_level=${getBoard.re_level}'">
				</c:if>		
				<c:if test="${mdto.name == getBoard.writer}">					
					<input type="button" value="�ۼ���"
							onclick="window.location='board2_update.do?num=${getBoard.num}'">
					<input type="button" value="�ۻ���"
							onclick="window.location='board2_delete.do?num=${getBoard.num}'">
				</c:if>							
					<input type="button" value="�۸��" 
								onclick="window.location='board2_list.do'">
				</td>
			</tr>
		</table>
	</div>
</c:if>	
<%@ include file="../bottom.jsp" %>







