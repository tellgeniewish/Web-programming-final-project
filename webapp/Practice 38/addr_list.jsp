<!--응용화학과 20211689 김현진
이 과제는 크롬에 최적화되어 있습니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jspbook.pr32.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_list.jsp</title>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="rpp" value="3" />
<% String sindex = request.getParameter("sindex"); %>
<c:set var="sindex" value="<%=sindex%>" />

<c:choose>
    <c:when test="${empty sindex}">
       <c:set var="currentPage" value="1" />
    </c:when>
    <c:otherwise>
       <c:set var="currentPage" value="${Integer.parseInt(sindex)}" />
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${addrmanager.getAddrList().size() == 0}">
       <c:set var="allpage" value="1" />
    </c:when>
    <c:when test="${addrmanager.getAddrList().size() % rpp == 0}">
       <c:set var="allpage" value="${addrmanager.getAddrList().size() / rpp}" />
    </c:when>
    <c:otherwise>
       <c:set var="allpage" value="${addrmanager.getAddrList().size() / rpp + 1}" />
    </c:otherwise>
</c:choose>

<c:set var="startIndex" value="${(currentPage - 1) * rpp}" />
<c:choose>
    <c:when test="${addrmanager.getAddrList().size() < startIndex + rpp}">
        <c:set var="lastIndex" value="${addrmanager.getAddrList().size() - 1}" />
    </c:when>
    <c:otherwise>
       <c:set var="lastIndex" value="${startIndex + rpp - 1}" />
    </c:otherwise>
</c:choose>

    <h1>주소록(전체보기)</h1>
    <hr>
    <br>
    <a href="addr_form.jsp">주소추가</a>
    &nbsp;&nbsp;&nbsp;
    <a href="addr_list_group.jsp">그룹별 목록 보기</a>
    <br>
    <br>
    <table border='1'>
        <tr>
            <td>이름</td>
            <td>전화번호</td>
            <td>이메일</td>
            <td>성별</td>
            <td>그룹</td>
        </tr> 
        <c:if test="${0 < addrmanager.getAddrList().size()}" var="bool">      
         <c:forEach var="i" begin="${startIndex}" end="${lastIndex}" >
              <tr>
                 <td>${addrmanager.getAddrList().get(i).getUsername()}</td>
                 <td>${addrmanager.getAddrList().get(i).getTel()}</td>
                 <td>${addrmanager.getAddrList().get(i).getEmail()}</td>
                 <td>${addrmanager.getAddrList().get(i).getGender()}</td>
                 <td>${addrmanager.getAddrList().get(i).getGroup()}</td>
              </tr>
           </c:forEach>
        </c:if>
        
    </table>
    <br>    
    <c:forEach var="i" begin="1" end="${allpage}" >
       <c:choose>       
          <c:when test="${i == currentPage}">
             ${i}
          </c:when>
          <c:otherwise>
             <a href="addr_list.jsp?sindex=${i}">${i}</a>
          </c:otherwise>          
       </c:choose>
       <c:if test="${i < allpage - 1}">
             	&nbsp;|&nbsp;
             </c:if>
    </c:forEach>
</body>
</html>