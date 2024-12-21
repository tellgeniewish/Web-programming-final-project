<!--응용화학과 20211689 김현진
이 과제는 크롬에 최적화되어 있습니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="jspbook.pr32.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_list_group.jsp</title>
<style>
	body {
		text-align: center;
	}
	table {
		margin: auto;
		text-align: center;
		width: 500px;
	}
</style>
</head>
<body>
<jsp:useBean id="addrmanager" class="jspbook.pr32.AddrManager" scope="application" />

    <h1>주소록(그룹별 보기)</h1>
    <hr>
    <br>
    <a href="addr_form.jsp">주소추가</a>
    &nbsp;&nbsp;&nbsp;
    <a href="addr_list.jsp">전체 목록 보기</a>
    <br>
    <br>
    <h1>그룹: 가족</h1>
    <br>
    <table border='1'>
        <tr>
            <td>이름</td>
            <td>전화번호</td>
            <td>이메일</td>
            <td>성별</td>
            <td>그룹</td>
        </tr>
        <%
			for (AddrBean addr : addrmanager.getAddrList()) {
				if(addr.getGroup().equalsIgnoreCase("가족")) {
		%>
        <tr>
            <td><%= addr.getUsername() %></td>
            <td><%= addr.getTel() %></td>
            <td><%= addr.getEmail() %></td>
            <td><%= addr.getGender() %></td>
            <td><%= addr.getGroup() %></td>
        </tr>
        <%
				}
            }
        %>
    </table>
    
    <br>
    <h1>그룹: 친구</h1>
    <br>
    <table border='1'>
        <tr>
            <td>이름</td>
            <td>전화번호</td>
            <td>이메일</td>
            <td>성별</td>
            <td>그룹</td>
        </tr>
        <%
			for (AddrBean addr : addrmanager.getAddrList()) {
				if(addr.getGroup().equalsIgnoreCase("친구")) {
		%>
        <tr>
            <td><%= addr.getUsername() %></td>
            <td><%= addr.getTel() %></td>
            <td><%= addr.getEmail() %></td>
            <td><%= addr.getGender() %></td>
            <td><%= addr.getGroup() %></td>
        </tr>
        <%
				}
            }
        %>
    </table>    
    <br>
    <h1>그룹: 직장</h1>
    <br>
    <table border='1'>
        <tr>
            <td>이름</td>
            <td>전화번호</td>
            <td>이메일</td>
            <td>성별</td>
            <td>그룹</td>
        </tr>
        <%
			for (AddrBean addr : addrmanager.getAddrList()) {
				if(addr.getGroup().equalsIgnoreCase("직장")) {
		%>
        <tr>
            <td><%= addr.getUsername() %></td>
            <td><%= addr.getTel() %></td>
            <td><%= addr.getEmail() %></td>
            <td><%= addr.getGender() %></td>
            <td><%= addr.getGroup() %></td>
        </tr>
        <%
				}
            }
        %>
    </table>
</body>
</html>