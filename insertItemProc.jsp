<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.RandomAccessFile"%>
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
		String itemCount = request.getParameter("itemCount");
		int pk; // write할때 쓸 질문 번호 

		
		String filePath;
		
		filePath = application.getRealPath("/WEB-INF/data.txt");
		BufferedReader reader = new BufferedReader(new FileReader(filePath));
		
        
        String s;
        int cntForCount = 0;
        String lastLine = null;;
        String[] lastLineSplitArray;
	
        BufferedWriter writer = null;
        
		try {
			 while ((s = reader.readLine()) != null) {
				cntForCount++;
				lastLine = s;
		     }
			 
			if(cntForCount == 0){ 
				pk = 1; 
			}
			else {
				lastLineSplitArray = lastLine.split("/");
				pk = Integer.parseInt(lastLineSplitArray[0]) + 1;
			}
			
			//question.txt쓰는 작업
			String boxType = request.getParameter("boxType");
			String question = request.getParameter("question");
			String valueText = ""; //실제로 쓸 문장
			if (boxType.equals("radioBox")) {
				valueText += pk + "/N/" + question + "/";
			} 
			else {
				valueText += pk + "/Y/" + question + "/";
			}
			
			//질문에 대한 응답 모두 구하기
			List<String> itemValueList = new ArrayList<String>();
			int cnt = 0;
			int max = Integer.parseInt(itemCount)  -1;
			
			for (int i = 0; i < Integer.parseInt(itemCount); i++) {
				itemValueList.add("item" + i);
			}
			for (String item : itemValueList) {
				if (cnt != max) {
					valueText += request.getParameter(item) + "/";
				} else {
					valueText += request.getParameter(item) + System.lineSeparator();
				}
				cnt++;
			}
			
			
			filePath = application.getRealPath("/WEB-INF/question.txt");
			writer = new BufferedWriter(new FileWriter(filePath, true));
			writer.write(valueText);
			writer.close();
		
			//data.txt 쓰는 작업 
				filePath = application.getRealPath("/WEB-INF/data.txt");
				writer = new BufferedWriter(new FileWriter(filePath, true));
				
				writer.write(pk + "/");
				for(int i = 0; i < Integer.parseInt(itemCount); i++){
					writer.write("0/");
				}
			
				writer.write("0"+System.lineSeparator()); 

		} catch (Exception e) {
			out.print("오류 발생");
		} finally {
			writer.close();
		}
	%>
	 <jsp:forward page="management.jsp"></jsp:forward>
</body>
</html>

<!-- 	/*

  RandomAccessFile file = null;
		String lastData[];
			file = new RandomAccessFile(filePath, "r");
				long fileSize = file.length();
				long pos = fileSize - 2;
				
				file.seek(pos); //파일 라인 끝으로 이동
				*/

			/* if(intForCount > 1){
			while (true) {
				file.seek(pos); //파일 라인 끝으로 이동
				//만약 파일이 한줄이면 line은 뭐고 이런거 지정해줘야할듯

				if (file.readByte() == '\n') {
					System.out.println("들어옴");
					break;
				}
				pos--;

			}

			file.seek(pos + 1);
			String line = file.readLine();
			System.out.print("line = " + line);
			lastData = line.split("/");
			pk = Integer.parseInt(lastData[0]) + 1;
			}
			
			else if (intForCount == 0){
				pk = 1;
			}
			else{
				pk = 2;
			}
			
			System.out.println("pk = " + pk); */ -->