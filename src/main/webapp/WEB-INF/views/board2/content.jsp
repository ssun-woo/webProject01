<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- content.jsp -->
<%@ include file="../top.jsp" %>
<c:if test="${mdto == null}">
	<script type="text/javascript">
		alert("로그인을 먼저 해 주세요!!")
		location.href="login.do"
	</script>
</c:if>
<c:if test="${mdto != null}">
	<div align="center">
		<b>글내용 보기</b>
		<table border="1" width="600">
			<tr>
				<th bgcolor="yellow" width="20%">글번호</th>
				<td align="center">${getBoard.num}</td>
				<th bgcolor="yellow" width="20%">조회수</th>
				<td align="center">${getBoard.readcount}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">작성자</th>
				<td align="center">${getBoard.writer}</td>
				<th bgcolor="yellow" width="20%">작성일</th>
				<td align="center">${getBoard.reg_date}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">글제목</th>
				<td align="center" colspan="3">
					${getBoard.subject}
				</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">글내용</th>
				<td colspan="3">
					${getBoard.content}
				</td>
			</tr>
			<tr bgcolor="yellow">
				<td colspan="4" align="right">
				<c:if test="${mdto.name == 'admin'}">
					<input type="button" value="답글쓰기"
							onclick="window.location='board2_write.do?num=${getBoard.num}&re_step=${getBoard.re_step}&re_level=${getBoard.re_level}'">
				</c:if>		
				<c:if test="${mdto.name == getBoard.writer}">					
					<input type="button" value="글수정"
							onclick="window.location='board2_update.do?num=${getBoard.num}'">
					<input type="button" value="글삭제"
							onclick="window.location='board2_delete.do?num=${getBoard.num}'">
				</c:if>							
					<input type="button" value="글목록" 
								onclick="window.location='board2_list.do'">
				</td>
			</tr>
		</table>
	</div>
</c:if>	
<%@ include file="../bottom.jsp" %>







