<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.Arrays"%>
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
		String questionNum = request.getParameter("questionNum");

		//data, question의 모든 문장 가져와서 저장한후 [0]값이 qustionNum이랑 같은줄 삭제하고 다시 파일출력
	%>


	<%
		BufferedReader reader = null;
		String filePath;
		String str;
		String tmpText = "";
		String writeText1 = "";

		//question.txt파일 읽어오기
		try {
			filePath = application.getRealPath("/WEB-INF/question.txt");
			reader = new BufferedReader(new FileReader(filePath));

			while ((str = reader.readLine()) != null) {
				tmpText += str + System.lineSeparator();
			}
		} catch (Exception e) {
			out.print("오류가 발생하였습니다.");
		}

		//qustion.txt에 write할 Text구하기
		String[] questionArray1;
		String[] questionArray2;

		questionArray1 = tmpText.split(System.lineSeparator());

		for (int i = 0; i < questionArray1.length; i++) {
			questionArray2 = questionArray1[i].split("/");

			if (questionArray2[0].equals(questionNum)) {
				continue;
			}
			
			writeText1 += Arrays.toString(questionArray2).replace(", ", "/").replace("[", "").replace("]", "")
					.trim() + System.lineSeparator();
		}
		
		
		//data.txt파일 읽어오기
		
		tmpText = "";
		try {
			filePath = application.getRealPath("/WEB-INF/data.txt");
			reader = new BufferedReader(new FileReader(filePath));

			while ((str = reader.readLine()) != null) {
				tmpText += str + System.lineSeparator();
			}
		} catch (Exception e) {
			out.print("오류가 발생하였습니다.");
		}

		questionArray1= null;
		questionArray2 =null;
		//data.txt에 write할 Text구하기
		questionArray1 = tmpText.split(System.lineSeparator()); // 1/0/0/0      2/1/1/1/3
		
		String writeText2 = "";
		for (int i = 0; i < questionArray1.length; i++) {
			
			questionArray2 = questionArray1[i].split("/"); // 1 , 0 , 0 , 0 

			if (questionArray2[0].equals(questionNum)) {
				continue;
			}
		
			writeText2 += Arrays.toString(questionArray2).replace(", ", "/").replace("[", "").replace("]", "")
					.trim() + System.lineSeparator();
			
		}
		
		

		 //question.txt쓰기
		BufferedWriter writer = null;
		try {
			filePath = application.getRealPath("/WEB-INF/question.txt");

			writer = new BufferedWriter(new FileWriter(filePath, false));
			
			writer.write(writeText1);
		} catch (Exception e) {
			out.print("오류 발생");
		} finally {
			writer.close();
		}

		//data.txt쓰기

		try {
			filePath = application.getRealPath("/WEB-INF/data.txt");
			writer = new BufferedWriter(new FileWriter(filePath, false));
			
			writer.write(writeText2);
		} catch (Exception e) {
			out.print("오류 발생");
		} finally {
			writer.close();
		}  
	%>
	<jsp:forward page="deleteQuestion.jsp"></jsp:forward>
</body>
</html>