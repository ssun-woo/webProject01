<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- cate_input.jsp -->
<%@ include file="../top.jsp"%>
<div align="center">
	<form name="insert" action="cate_input.do" method="post">
		<table border="1" width="300">
			<caption align="top"><b>ī�װ� ���</b></caption>
			<tr>
				<th bgcolor="yellow" width="40%">ī�װ��ڵ�</th>
				<td><input type="text" name="code"></td>
			</tr>
			<tr>
				<th bgcolor="yellow">ī�װ��̸�</th>
				<td><input type="text" name="cname"></td>
			</tr>
			<tr bgcolor="orange">
				<td colspan="2" align="center">
					<input type="submit" value="���">
					<input type="reset" value="���">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>