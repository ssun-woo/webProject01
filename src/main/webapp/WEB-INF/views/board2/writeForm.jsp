<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->
<%@ include file="../top.jsp" %>
<c:if test="${mdto == null}">
	<script type="text/javascript">
		alert("로그인을 먼저 해 주세요!!")
		location.href="login.do"
	</script>
</c:if>
<c:if test="${mdto != null}">
	<script type="text/javascript">
		function check(){
			if (f.writer.value==""){
				alert("이름을 입력해 주세요!!")
				f.writer.focus()
				return false
			}
			if (f.subject.value==""){
				alert("제목을 입력해 주세요!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("내용을 입력해 주세요!!")
				f.content.focus()
				return false
			}
			if (f.passwd.value==""){
				alert("비밀번호을 입력해 주세요!!")
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
					글 쓰 기
				</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">이 름</th>
				<td><input type="text" name="writer" value="${mdto.name}" readOnly></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">제 목</th>
				<td><input type="text" name="subject" size="50"></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">Email</th>
				<td><input type="text" name="email" size="50"></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">내 용</th>
				<td><textarea name="content" rows="13" cols="50"></textarea></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">비밀번호</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" 
							onclick="window.location='board_list.do'">
				</td>
			</tr>
		</table>
	</form>	
	</div>
</c:if>
<%@ include file="../bottom.jsp"%>