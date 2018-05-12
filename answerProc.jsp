<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Arrays"%>
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
String cnt = request.getParameter("cnt");

/* for(int i = 1; i <= Integer.parseInt(cnt); i++){
	//파일읽어와서 question i번째가 Y인지 N인이지에떄라 string or string [] 생성
	 */

	BufferedReader reader = null;
	String[] tmpArray;
	String[] CheckBoxQuestion;
	String RadioBoxQuestion;
	
	try {
		String filePath = application.getRealPath("/WEB-INF/question.txt");
		reader = new BufferedReader(new FileReader(filePath));
		while (true) {
			String str = reader.readLine();
			if (str == null)
				break;
			tmpArray = str.split("/"); 
			if(tmpArray[1].equals("Y")){ //중복정답가능한것		
				CheckBoxQuestion = request.getParameterValues("question" + tmpArray[0]);
			    out.println(Arrays.toString(CheckBoxQuestion));
			}
			else{
				RadioBoxQuestion = request.getParameter("question" + tmpArray[0]);
				out.print(RadioBoxQuestion + "<br>");
			}
		}
	} catch (Exception e) {
		out.println("지정된 파일을 읽을 수 없습니다.");
	} finally {
		reader.close();
	}
	
	
	
	
	
	
	
	
/* } */


%>

<%-- <jsp:forward page="endPage.jsp"></jsp:forward> --%>
</body>
</html>