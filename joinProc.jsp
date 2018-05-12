<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="3; url=index.jsp">
<title>회원가입</title>

</head>
<body>


<%
request.setCharacterEncoding("UTF-8");
String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");


BufferedWriter writer = null;
try{
	String filePath = application.getRealPath("/WEB-INF/member.txt");
	/* System.out.println(filePath); */
	writer = new BufferedWriter(new FileWriter(filePath,true));
	writer.write( userID + "," + userPassword + System.lineSeparator());
}catch(Exception e){
	out.print("오류 발생");
}
finally{
	writer.close();
}
out.println("<script>alert('가입을 환영합니다.');</script>");

%>
<jsp:forward page="login.jsp"></jsp:forward>
</body>
</html>