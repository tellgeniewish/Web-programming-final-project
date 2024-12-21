<!--응용화학과 20211689 김현진
이 과제는 크롬에 최적화되어 있습니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Practice 21</title>
<style>
   .tb1 { 
   		margin: auto;
   		font-weight: bold;   		
        width: 700px;
      }
   .tb2 {
         margin: auto;
         text-align: center;
         border-collapse: collapse;
         width: 700px;
         height: 270px;/**/
         
      }
</style>
</head>
<body>
<%!
public String parseDay(int cnt, String day) {
   String color;
   if (cnt == 1)
          color = "red";
    else if (cnt == 7)
          color = "blue";
    else
       color = "black";
   
   return "<td><font color='" + color + "'>" + day + "</font></td>";
       
}
%>
<%
Calendar cal = Calendar.getInstance();

int year = cal.get(Calendar.YEAR); // 년
int month = cal.get(Calendar.MONTH) + 1; // 월
int date = cal.get(Calendar.DATE); // 일

String sYear = request.getParameter("YEAR");
if (sYear != null) {
    year = Integer.parseInt(sYear);
}
String sMonth = request.getParameter("MONTH");
if (sMonth != null) {
    month = Integer.parseInt(sMonth);
}
cal.set(year, month-1, 1);
%>
<table class=tb1>
<tr>
<th style=text-align:left><%
out.print("<a href=\"calendar.jsp?YEAR="+(year-1));
out.println("&MONTH=" + month + "\">" + "◀ </a>");
out.println(year + "년");
out.print("<a href=\"calendar.jsp?YEAR="+(year+1));
out.println("&MONTH=" + month + "\">" + "▶ </a>");
%></th>
<th style=text-align:center><%
if (1 < month) {
    out.print("<a href=\"calendar.jsp?YEAR=" + year);
    out.println("&MONTH=" + (month - 1) + "\">" + "◀ </a>");
} else {
    out.print("◀ ");
}
out.println(month + "월");
if (month < 12) {
    out.print("<a href=\"calendar.jsp?YEAR=" + year);
    out.println("&MONTH=" + (month + 1) + "\">" + "▶ </a>");
} else {
    out.print(" ▶");
}
%></th>
<th style=text-align:right><%
Calendar today = Calendar.getInstance();
int today_year = today.get(Calendar.YEAR); // 년
int today_month = today.get(Calendar.MONTH) + 1; // 월
int today_date = today.get(Calendar.DATE); // 일
out.println(today_year + "-" + today_month + "-" + today_date);
%></th>
</tr>
</table>

<%
int start = cal.getMinimum(Calendar.DATE); // 현재 기준 월(月)의 시작하는 날 구하기
int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 현재 기준 월(月)의 마지막 날 구하기
int startDay = cal.get(Calendar.DAY_OF_WEEK);

int totalDaysInMonth = end - start + 1;
int remainingDays = totalDaysInMonth - (7 - startDay + 1);
int amountWeeks = 1;
amountWeeks += remainingDays / 7;
if (remainingDays % 7 != 0)
	amountWeeks++;
%>
<table border='1' class=tb2>
   <tr>
<%
    String[] WeekDay = { "", "일", "월", "화", "수", "목", "금", "토" };
    for (int i = 1; i <= 7; i++) {
      String day = WeekDay[i];
      String color = parseDay(i, day);
      out.println(color);
   }
%>
   </tr>
<%
int i = 1;
int spCount = 0;
for (int row = 0; row < amountWeeks; row++) {
   out.println("<tr>");
   for (int col = 1; col <= 7; col++) {
      if (row == 0 && col < startDay) {
         out.println("<td> &nbsp; </td>"); // 날짜 출력하기 전 빈칸 출력
      }
      else {
         if (end < i) { // 날짜 출력 끝나고 빈칸 출력
            int stop = (amountWeeks * 7) - spCount;
            for (int j = 0; j < stop; j++)
               out.println("<td> &nbsp; </td>");
            break;
         }
         String pd = i + ""; // 날짜 출력
         String color = parseDay(col, pd);
         out.println(color);
         i++;
      }
      spCount++;
   }
   out.println("</tr>");
}
%>
</table>
</body>
</html>