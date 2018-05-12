<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적어라</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
BufferedReader reader = null;
try {
	String filePath = application.getRealPath("/WEB-INF/question.txt");
	reader = new BufferedReader(new FileReader(filePath));
	String str;
	String tmpArray[];
	int cnt = 0; // n번쨰 문항입니다.

	while ((str = reader.readLine()) != null) {
		cnt++;
		tmpArray = str.split("/");
	}
}catch(Exception e){
	out.println("오류가 발생했습니다.");
}
%>

<%-- <jsp:forward page="endPage.jsp"></jsp:forward> --%>
</body>
</html>