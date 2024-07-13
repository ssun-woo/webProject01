<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>�α���</title>
	<link rel="stylesheet" type="text/css" href="resources/style.css">
	<script type="text/javascript">
		function checkMember(){
			window.open("memberSsn.do", "","width=640, height=400")
		}
		function loginCheck(){
			if (f.id.value==""){
				alert("���̵� �Է��� �ּ���!!")
				f.id.focus()
				return
			}
			if (f.passwd.value==""){
				alert("��й�ȣ�� �Է��� �ּ���!!")
				f.passwd.focus()
				return
			}
			document.f.submit()
		}
		function searchMember(mode){
			window.open("searchMember.do?mode="+mode, "", "width=640, height=400")
		}
	</script>
</head>
<body>
<!-- login.jsp-->
<div align="center">
<br>
<img src="resources/img/bottom.gif" width=470 height="40" border="0" alt="">
<br>
<p>
<img src="resources/img/tm_login.gif" width=100 height="13" border="0" 
	align=center alt="ȸ�� �α���">
<form name="f" action="login_ok.do" method="post">
	<table width="500" align="center" height="120">
		<tr>
			<td align="right" width="30%">
				<img src="resources/img/id01.gif" 
				width="28" height="11" border="0" alt="���̵�">&nbsp;&nbsp;
			</td>
			<td width="40%">
			<c:if test="${cookie.saveId == null}">
				<input type="text" name="id" tabindex="1">
			</c:if>
			<c:if test="${cookie.saveId != null}">
				<input type="text" name="id" tabindex="1" value="${cookie.saveId.value}">
			</c:if>	
			</td>
			<td rowspan="2" valign="middle" align="left" width="30%">
				<a href="javascript:loginCheck()">
					<img src="resources/img/bt_login.gif" border="0" alt="�α���"  tabindex="3">&nbsp;&nbsp;<br>
				</a>
				<nobr>
			<c:if test="${cookie.saveId == null}">	
					<input type="checkbox" name="saveId">
			</c:if>
			<c:if test="${cookie.saveId != null}">
					<input type="checkbox" name="saveId" checked>
			</c:if>				
					<font face="����" size="2">���̵� ����ϱ�</font>
				</nobr>
			</td>
		</tr>
		<tr>
			<td align="right">
				<img src="resources/img/pwd.gif" 
							width="37" height="11" alt="��й�ȣ">
			</td>
			<td>
				<input type="password" name="passwd"  tabindex="2">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<a href="javascript:checkMember()">
					<img src="resources/img/bt_join.gif" width="60" height="22" alt="ȸ������">
				</a>	
				<a href="javascript:searchMember('id')">
 					<img src="resources/img/bt_search_id.gif" width="60" height="22" alt="���̵� ã��">
				</a>
				<a href="javascript:searchMember('pw')"> 					
					<img src="resources/img/bt_search_pw.gif" width="60" height="22" alt="��й�ȣ ã��">
				</a>								
			</td>
		</tr>
	</table>
</form> 
</div>
</body>
</html>
