<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->
<%@ include file="../top.jsp" %>
<c:if test="${mdto == null}">
	<script type="text/javascript">
		alert("�α����� ���� �� �ּ���!!")
		location.href="login.do"
	</script>
</c:if>
<c:if test="${mdto != null}">
	<script type="text/javascript">
		function check(){
			if (f.writer.value==""){
				alert("�̸��� �Է��� �ּ���!!")
				f.writer.focus()
				return false
			}
			if (f.subject.value==""){
				alert("������ �Է��� �ּ���!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("������ �Է��� �ּ���!!")
				f.content.focus()
				return false
			}
			if (f.passwd.value==""){
				alert("��й�ȣ�� �Է��� �ּ���!!")
				f.passwd.focus()
				return false
			}
			return true
		}
	</script>
	<div align="center">
	<form name="f" action="board2_write.do" 
				method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="${num}"/>
		<input type="hidden" name="re_step" value="${re_step}"/>
		<input type="hidden" name="re_level" value="${re_level}"/>
		<table border="1" width="600">
			<tr bgcolor="yellow">
				<td align="center" colspan="2">
					�� �� ��
				</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">�� ��</th>
				<td><input type="text" name="writer" value="${mdto.name}" readOnly></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">�� ��</th>
				<td><input type="text" name="subject" size="50"></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">Email</th>
				<td><input type="text" name="email" size="50"></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">�� ��</th>
				<td><textarea name="content" rows="13" cols="50"></textarea></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">��й�ȣ</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="�۾���">
					<input type="reset" value="�ٽ��ۼ�">
					<input type="button" value="��Ϻ���" 
							onclick="window.location='board_list.do'">
				</td>
			</tr>
		</table>
	</form>	
	</div>
</c:if>
<%@ include file="../bottom.jsp"%>