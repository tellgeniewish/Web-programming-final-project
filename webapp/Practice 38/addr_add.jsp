<!--응용화학과 20211689 김현진
이 과제는 크롬에 최적화되어 있습니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_add.jsp</title>
<style>
	body {
		text-align: center;
	}
</style>
</head>
<body>
<jsp:useBean id="addrbean" class="jspbook.pr32.AddrBean" scope="page" />
<jsp:setProperty name="addrbean" property="*" />  
<jsp:useBean id="addrmanager" class="jspbook.pr32.AddrManager" scope="application" />
<% addrmanager.add(addrbean); %>

<h1>등록내용</h1>
이름: <%= addrbean.getUsername() %>
<p>
전화번호: <%= addrbean.getTel() %>
<p>
이메일: <%= addrbean.getEmail() %>
<p>
성별: <%= addrbean.getGender() %>
<p>
그룹: <%= addrbean.getGroup() %>
<hr>
<a href="addr_form.jsp">주소 추가</a>
&nbsp;&nbsp;&nbsp;
<a href="addr_list.jsp">전체 목록 보기</a>
&nbsp;&nbsp;&nbsp;
<a href="addr_list_group.jsp">그룹별 목록 보기</a>
</body>
</html>