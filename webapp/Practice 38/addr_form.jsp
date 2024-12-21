<!--응용화학과 20211689 김현진
이 과제는 크롬에 최적화되어 있습니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_form.jsp</title>
<style>
	body {
		text-align: center;
	}
	table { 
        margin:auto;
        text-align: left;
		width: 260px;
    }
</style>
</head>
<body>
<h1>주소록 등록</h1>
<hr>
<form name="addr_form" method="post" action="addr_add.jsp">
<table border=1>
	<tr>
		<td>이름</td>
		<td><input type="text" name="username"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="tel"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<select name="gender">
				<option value="남" selected>남</option>
                <option value="여">여</option>
            </select>
		</td>
	</tr>
	<tr>
		<td>그룹</td>
		<td>
			<select name="group">
				<option value="가족" selected>가족</option>
                <option value="친구">친구</option>
                <option value="직장">직장</option>
            </select>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" class="ask" value="확인">
            <input type="button" class="ask" value="취소">
		</td>
	</tr>
</table>
</form>
</body>
</html>